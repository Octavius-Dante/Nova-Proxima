*&---------------------------------------------------------------------*
*& Report ZTABLE_DATA_EXTRACVT_BTP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztable_data_extracvt_btp.


* Program to extract data from table and prepare a file with field name
* Format patter (field name = value) just a convenient utility
* To copy paste from file to class method for BTP - data insert to table

* Actions and Activities

* Input table name
* Dynamic internal table prepared using the table name
* Table field list is retrieved using table name
* Respective field data is formatted and pushed to file

TYPES : BEGIN OF gty_det,
          tabname   TYPE tabname,
          fieldname TYPE fieldname,
          index     TYPE i,
        END OF gty_det,

        BEGIN OF gty_text,
          text(2500) TYPE c,
        END OF gty_text.

DATA : lt_table_filds      TYPE TABLE OF dfies,
       lt_dref             TYPE REF TO data,
       ls_dref             TYPE REF TO data,
       lt_dd30l            TYPE STANDARD TABLE OF dd03l,
       ls_dd30l            TYPE dd03l,
       lt_tbl_fld          TYPE STANDARD TABLE OF gty_det,
       ls_tbl_fld          TYPE gty_det,
       lv_variable_1       TYPE char100,
       lv_variable_2(2500) TYPE c,
       lv_field            TYPE char30,
       lt_text             TYPE STANDARD TABLE OF gty_text,
       ls_text             TYPE gty_text.

*** --- Field Symbols
FIELD-SYMBOLS : <fld_value> TYPE any.
FIELD-SYMBOLS : <fs_table> TYPE any.
FIELD-SYMBOLS : <ft_table> TYPE STANDARD TABLE.
FIELD-SYMBOLS : <dyn_field>.

PARAMETERS p_table TYPE tabname16.

START-OF-SELECTION.
* Create OBJECT lr_descr.

*** --- Assigning fields symbols for Tables
  CREATE DATA lt_dref TYPE TABLE OF (p_table).
  CREATE DATA ls_dref TYPE (p_table).

*** --- Assign field symbol with table type of DDIC
  ASSIGN lt_dref->* TO <ft_table>.

*** --- Assign field symbol with Structure type of DDIC
  ASSIGN ls_dref->* TO <fs_table>.

  SELECT *
  FROM (p_table)
  INTO TABLE <ft_table>.

  IF sy-subrc EQ 0.

    SELECT tabname, fieldname, position FROM dd03l
    INTO TABLE @DATA(lt_dd03l) WHERE tabname EQ @p_table.

    SORT lt_dd03l BY position ASCENDING. "Field order in the table

    DELETE lt_dd03l WHERE fieldname = '.INCLU--AP' " append structure
                       OR fieldname = '.INCLUDE'.  " include structure

    LOOP AT lt_dd03l ASSIGNING FIELD-SYMBOL(<lfs_dd03l>).
      <lfs_dd03l>-position = sy-tabix.
    ENDLOOP.

    BREAK-POINT.

  ENDIF.

  DESCRIBE TABLE lt_dd03l LINES DATA(lv_lines).

  LOOP AT <ft_table> ASSIGNING <fs_table>.

    DO lv_lines TIMES.
      READ TABLE lt_dd03l INTO DATA(ls_fld) WITH KEY position = sy-index.
      lv_field = ls_fld-fieldname.
      ASSIGN COMPONENT lv_field OF STRUCTURE <fs_table> TO <fld_value>.

* DURING FIRST FIELD ASSIGNMENT
      IF sy-index EQ 1.

        lv_variable_1 = |(| & | | & |{ ls_fld-fieldname }| & | | & |=| & | | & |'| & |{ <fld_value> }| & |'|.

      ENDIF.

* DURING OTHER MIDDLE FIELDS ASSIGNMENT
      IF sy-index > 1.

        lv_variable_1 = |{ ls_fld-fieldname }| & | | & |=| & | | & |'| & |{ <fld_value> }| & |'|.

      ENDIF.

* DURING LAST FIELD ASSIGNMENT
      IF sy-index EQ lv_lines.

        CLEAR lv_variable_1.
        lv_variable_1 = |{ ls_fld-fieldname }| & | | & |=| & | | & |'| & |{ <fld_value> }| & |'| & | | & |)|.

      ENDIF.

      CONCATENATE lv_variable_2 lv_variable_1 INTO lv_variable_2 SEPARATED BY space.

      CLEAR : ls_fld, lv_field, lv_variable_1.
    ENDDO.

* FINAL TABLE PREPARED
    ls_text-text = lv_variable_2.
    APPEND ls_text TO lt_text.

    CLEAR : ls_text, lv_variable_2.
  ENDLOOP.

  BREAK-POINT.


* FINAL FILE PREPARATION TEXT FORMAT FOR DOWNLOAD
  DATA : lv_filename  TYPE string,
         lv_file      TYPE string,
         lv_path      TYPE string,
         lv_file_name TYPE string.

  lv_filename = p_table.

  CALL METHOD cl_gui_frontend_services=>file_save_dialog
    EXPORTING
      window_title              = 'Save Form'
      default_extension         = 'txt'
      default_file_name         = lv_filename
      prompt_on_overwrite       = 'X'
    CHANGING
      filename                  = lv_file_name
      path                      = lv_path
      fullpath                  = lv_file
    EXCEPTIONS
      cntl_error                = 1
      error_no_gui              = 2
      not_supported_by_gui      = 3
      invalid_default_file_name = 4
      OTHERS                    = 5.
  IF sy-subrc <> 0.
* Implement suitable error handling here
    MESSAGE 'File Process Error' TYPE 'E'.
  ENDIF.

  CALL FUNCTION 'GUI_DOWNLOAD'
    EXPORTING
      filename                = lv_file
      filetype                = 'ASC'
*     write_field_separator   = 'X'
    TABLES
      data_tab                = lt_text
    EXCEPTIONS
      file_write_error        = 1
      no_batch                = 2
      gui_refuse_filetransfer = 3
      invalid_type            = 4
      no_authority            = 5
      unknown_error           = 6
      header_not_allowed      = 7
      separator_not_allowed   = 8
      filesize_not_allowed    = 9
      header_too_long         = 10
      dp_error_create         = 11
      dp_error_send           = 12
      dp_error_write          = 13
      unknown_dp_error        = 14
      access_denied           = 15
      dp_out_of_memory        = 16
      disk_full               = 17
      dp_timeout              = 18
      file_not_found          = 19
      dataprovider_exception  = 20
      control_flush_error     = 21
      not_supported_by_gui    = 22
      error_no_gui            = 23
      OTHERS                  = 24.
  IF sy-subrc IS NOT INITIAL.
* Implement suitable error handling here
    MESSAGE 'File Process Error' TYPE 'E'.
  ENDIF.