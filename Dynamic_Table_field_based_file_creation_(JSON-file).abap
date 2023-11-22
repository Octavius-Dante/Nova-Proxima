*&---------------------------------------------------------------------*
*& Report ZTABLE_DATA_EXTR_FIELD_SEL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztable_data_extr_field_sel.

*---------------------------------------------------------------------*
* TYPES
*---------------------------------------------------------------------*
TYPES:
* Type for the table along with Marker Flag
  BEGIN OF t_fld.
    INCLUDE STRUCTURE dd03p AS dd03p.       " Dictonary Attributes
  TYPES:
    mark      LIKE rsdxx-mark,      " Entry marked
    type_icon TYPE dd02d-datatype,  " Type Icon
  END OF t_fld,

  BEGIN OF gty_text,
    text(2500) TYPE c,
  END OF gty_text,

* Type for the table header
  BEGIN OF ty_str_hdr,
    field_name TYPE char20,
  END OF ty_str_hdr,

  BEGIN OF gty_where_clause,
    line TYPE char72,
  END OF gty_where_clause.

*---------------------------------------------------------------------*
*  DATA                                                               *
*---------------------------------------------------------------------*
DATA:

  lv_variable_1(500)   TYPE c, "char100,
  lv_variable_2(2500)  TYPE c,
  lv_field             TYPE char30,
  lv_localfile         TYPE string,
  git_header_text      TYPE STANDARD TABLE OF ty_str_hdr, " Header Text
  lt_text              TYPE STANDARD TABLE OF gty_text,
  ls_text              TYPE gty_text,
  gs_field_list        TYPE string, " SELECT Field List
  gref_struct_result   TYPE REF TO cl_abap_structdescr, " Structure
  gref_table_result    TYPE REF TO cl_abap_tabledescr,  " Table
  gt_components        TYPE STANDARD TABLE OF abap_componentdescr
                       WITH KEY name, " Components
  gt_where_clause      TYPE STANDARD TABLE OF gty_where_clause,
  gs_where_clause      TYPE gty_where_clause,

* Dynamic variables
  lt_dref              TYPE REF TO data,
  ls_dref              TYPE REF TO data,

* Some needed values
  lv_set_bracket_open  TYPE char1 VALUE '{',
  lv_set_bracket_close TYPE char1 VALUE '}'.
*---------------------------------------------------------------------*
*  FIELD-SYMBOLS                                                               *
*---------------------------------------------------------------------*
*FIELD-SYMBOLS: <fs_dynamic_tab> TYPE INDEX TABLE. " Final Table
FIELD-SYMBOLS : <fld_value> TYPE any.
FIELD-SYMBOLS : <fs_table> TYPE any.
FIELD-SYMBOLS : <ft_table> TYPE STANDARD TABLE.
FIELD-SYMBOLS : <dyn_field>.

*---------------------------------------------------------------------*
* SELECTION SCREEN                                                    *
*---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
PARAMETERS:
  p_tab  TYPE tabname OBLIGATORY,
  p_file TYPE string OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.
*---------------------------------------------------------------------*
* AT SELECTION-SCREEN ON VALUE-REQUEST.
*---------------------------------------------------------------------*
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
* F4 Help for File
  PERFORM sub_f4_for_file CHANGING p_file.

*---------------------------------------------------------------------*
* START-OF-SELECTION.                                                 *
*---------------------------------------------------------------------*
START-OF-SELECTION.
* Option to Select Which Field to download
  PERFORM sub_pop_up_to_select USING p_tab
                            CHANGING gref_table_result
                                     gref_struct_result.

*---------------------------------------------------------------------*
* END-OF-SELECTION.                                                   *
*---------------------------------------------------------------------*
END-OF-SELECTION.
* Do the Dynamic Select from Any Table
  PERFORM sub_dynamic_select USING    gref_table_result
                                      gref_struct_result.

* Download the Tab Delimited Text File to the Local Machine
  PERFORM sub_download_file USING p_file.

*---------------------------------------------------------------------*
* SUB ROUTINES                                                        *
*---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Form  SUB_F4_FOR_FILE
*&---------------------------------------------------------------------*
*       F4 Help
*----------------------------------------------------------------------*
FORM sub_f4_for_file  CHANGING p_p_file TYPE string.

  CALL METHOD cl_gui_frontend_services=>directory_browse
    EXPORTING
      window_title         = 'Select Directory'
      initial_folder       = 'c:\'
    CHANGING
      selected_folder      = p_p_file
    EXCEPTIONS
      cntl_error           = 1
      error_no_gui         = 2
      not_supported_by_gui = 3
      OTHERS               = 4.
  IF sy-subrc <> 0.
* Implement suitable error handling here
    MESSAGE 'Directory selection Error' TYPE 'E'.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SUB_POP_UP_TO_SELECT
*&---------------------------------------------------------------------*
*       Select Fields for Output
*----------------------------------------------------------------------*
FORM sub_pop_up_to_select  USING    p_p_tab TYPE tabname
      CHANGING    lr_table_result  TYPE REF TO  cl_abap_tabledescr
                                  lr_struct_result TYPE REF TO cl_abap_structdescr..

  DATA:
    lv_get_state  TYPE dctablget,
    li_fld_copy   TYPE TABLE OF t_fld,
    li_dd03p      TYPE TABLE OF dd03p,
    ls_components LIKE LINE OF gt_components,
    ls_header     TYPE ty_str_hdr.

  lv_get_state-tabd = lv_get_state-tabt = 'A'.

* Get table metadata
  CALL FUNCTION 'DD_TABL_GET'
    EXPORTING
      get_state    = lv_get_state
      prid         = -2
      tabl_name    = p_p_tab
      withtext     = 'X'
      add_typeinfo = 'X'
    TABLES
      dd03p_tab_a  = li_dd03p
    EXCEPTIONS
      OTHERS       = 2.

* Adding extra fields
* Field MARK is used for now to idendify the selected field(s)
  li_fld_copy = li_dd03p.

  CALL FUNCTION 'DD_LIST_TABFIELDS'
    EXPORTING
      eutype       = 'V'
      p_with_type  = 'X'
    TABLES
      fieldtab     = li_fld_copy
    EXCEPTIONS
      not_executed = 1
      OTHERS       = 2.

* .INCLUDE, .APPEND and other attributes should be deleted
* They have INTTYPE as blank
  DELETE li_fld_copy WHERE inttype IS INITIAL.

* Remove what the user did not choose
  DELETE li_fld_copy WHERE mark IS INITIAL.

  LOOP AT li_fld_copy INTO DATA(ls_fields).

*   Make the list of fields to be used in SELECT Statement
    CONCATENATE ls_fields-fieldname gs_field_list INTO gs_field_list SEPARATED BY space.

**   Header Line (Medium Text) for the Spreadsheet
*    CONCATENATE ls_fields-scrtext_m gs_header_text INTO gs_header_text SEPARATED BY cl_abap_char_utilities=>horizontal_tab.

    ls_components-name = ls_fields-fieldname.
    ls_components-type ?= cl_abap_elemdescr=>describe_by_name( ls_fields-rollname ) .
    APPEND ls_components TO gt_components.

    APPEND ls_fields-scrtext_m TO git_header_text.

  ENDLOOP.

  TRY .
      lr_struct_result = cl_abap_structdescr=>create( p_components = gt_components ).
      lr_table_result =  cl_abap_tabledescr=>create( p_line_type  = lr_struct_result ).
    CATCH cx_sy_struct_creation.    "
    CATCH cx_sy_table_creation.

  ENDTRY.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SUB_DYNAMIC_SELECT
*&---------------------------------------------------------------------*
*       Dynamically Select from Any Table
*----------------------------------------------------------------------*
FORM sub_dynamic_select  USING    lr_table_result  TYPE REF TO cl_abap_tabledescr
                                  lr_struct_result TYPE REF TO cl_abap_structdescr.

  FIELD-SYMBOLS:
        <lfs_struct> TYPE any.

*** --- Assigning fields symbols for Tables
  CREATE DATA lt_dref TYPE TABLE OF (p_tab).
  CREATE DATA ls_dref TYPE (p_tab).

*** --- Assign field symbol with table type of DDIC
  ASSIGN lt_dref->* TO <ft_table>.
*** --- Assign field symbol with Structure type of DDIC
  ASSIGN ls_dref->* TO <fs_table>.

  IF <ft_table> IS  ASSIGNED.
*   This is the Dynamic Select
    SELECT (gs_field_list) FROM (p_tab) INTO CORRESPONDING FIELDS OF TABLE <ft_table>.
  ENDIF.

  IF <ft_table> IS NOT INITIAL.

    DESCRIBE TABLE gt_components LINES DATA(lv_line).

    CLEAR gt_where_clause.

    LOOP AT gt_components INTO DATA(ls_compo).
      IF sy-tabix EQ 1.
* Table name
        CONCATENATE `TABNAME EQ '` p_tab `'` INTO gs_where_clause-line.
        APPEND gs_where_clause TO gt_where_clause.
* Field name
        CONCATENATE `AND ( FIELDNAME EQ '` ls_compo-name `'` INTO gs_where_clause-line.
        APPEND gs_where_clause TO gt_where_clause.
      ELSEIF sy-tabix EQ lv_line.
* Field name
        CONCATENATE `OR FIELDNAME EQ '` ls_compo-name `'` INTO gs_where_clause-line.
        APPEND gs_where_clause TO gt_where_clause.
      ELSE.
* Field name
        CONCATENATE `OR FIELDNAME EQ '` ls_compo-name `'` INTO gs_where_clause-line.
        APPEND gs_where_clause TO gt_where_clause.
      ENDIF.
      CLEAR : ls_compo, gs_where_clause.
    ENDLOOP.
* Adding closing bracket to where clause
    gs_where_clause-line = `)`.
    APPEND gs_where_clause TO gt_where_clause.
    CLEAR : gs_where_clause, lv_line.

    BREAK-POINT.
* Dynamic json format field and data assignment for selected records
    SELECT tabname, fieldname, position, datatype, leng, decimals FROM dd03l
    INTO TABLE @DATA(lt_dd03l) WHERE (gt_where_clause).

    SORT lt_dd03l BY position ASCENDING. "Field order in the table

* Just in case if this structure block gets selected in screen
    DELETE lt_dd03l WHERE fieldname = '.INCLU--AP' " append structure
                       OR fieldname = '.INCLUDE'.  " include structure

    LOOP AT lt_dd03l ASSIGNING FIELD-SYMBOL(<lfs_dd03l>).
      <lfs_dd03l>-position = sy-tabix.
    ENDLOOP.

    DESCRIBE TABLE lt_dd03l LINES DATA(lv_lines).

* Table Strcture building in HTML file for download



    LOOP AT <ft_table> ASSIGNING <fs_table>.

      IF sy-tabix EQ 1.
* create new statement for record insert block
        ls_text-text =  |[|.
        APPEND ls_text TO lt_text.
        CLEAR : ls_text.
      ENDIF.

      DO lv_lines TIMES.
        READ TABLE lt_dd03l INTO DATA(ls_fld) WITH KEY position = sy-index.
        lv_field = ls_fld-fieldname.
        ASSIGN COMPONENT lv_field OF STRUCTURE <fs_table> TO <fld_value>.

* ############################################################################
* IF it is a Text field containing Double quotes " it needs to be changed
* or json file wont work during data load in abap cloud BTP class

*** IF Table field is a text type containing Double quotes "
        IF ls_fld-datatype EQ 'CHAR'
          AND ls_fld-leng GT 10.
          REPLACE ALL OCCURRENCES OF '"' IN <fld_value> WITH 'change text'.
        ENDIF.

* implement your suitable replacement text for double quotes
* ############################################################################

* DURING FIRST FIELD ASSIGNMENT
        IF sy-index EQ 1.

          lv_variable_1 = |{ lv_set_bracket_open }| & |"| & |{ ls_fld-fieldname }| & |"| & |:| & |"| & |{ <fld_value> }| & |",|.

        ENDIF.

* DURING OTHER MIDDLE FIELDS ASSIGNMENT
        IF sy-index > 1.

          lv_variable_1 = |"| & |{ ls_fld-fieldname }| & |"| & |:| & |"| & |{ <fld_value> }| & |",|.

        ENDIF.

* DURING LAST FIELD ASSIGNMENT
        IF sy-index EQ lv_lines.

          CLEAR lv_variable_1.
          lv_variable_1 = |"| & |{ ls_fld-fieldname }| & |"| & |:| & |"| & |{ <fld_value> }| & |"| & |{ lv_set_bracket_close }|.

        ENDIF.

        CONCATENATE lv_variable_2 lv_variable_1 INTO lv_variable_2 ."SEPARATED BY space.

        CLEAR : ls_fld, lv_field, lv_variable_1.
      ENDDO.

      ls_text-text = lv_variable_2.
      APPEND ls_text TO lt_text.
      CLEAR : lv_variable_2, ls_text.

      ls_text-text = ','.
      APPEND ls_text TO lt_text.
      CLEAR ls_text.

      CLEAR : ls_text, lv_variable_2.
    ENDLOOP.

* RECORD INSERT BLOCK STATEMENT CLOSE
    ls_text-text =  |]|.
    APPEND ls_text TO lt_text.
    CLEAR ls_text.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SUB_DOWNLOAD_FILE
*&---------------------------------------------------------------------*
*       Download File
*----------------------------------------------------------------------*
FORM sub_download_file  USING  p_p_file TYPE string.

  DATA: lv_file      TYPE string.

* Moving to a type compatible variable
  CONCATENATE p_p_file '\' p_tab '.json' INTO lv_file.

  CALL METHOD cl_gui_frontend_services=>gui_download
    EXPORTING
      filename                = lv_file
      filetype                = 'ASC'
      codepage                = '4310'
    CHANGING
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
  IF sy-subrc = 0.
    WRITE:/ 'File downloaded successfully' COLOR COL_POSITIVE.
  ENDIF.
ENDFORM.
