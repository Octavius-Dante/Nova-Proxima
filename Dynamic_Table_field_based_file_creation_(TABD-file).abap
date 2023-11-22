*&---------------------------------------------------------------------*
*& Report ZTABLE_DATA_EXTR_FIELD_SEL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztable_data_extr_field_sel.

* Functionality overview : 

* select the fields of the given table name 
* based on the selected fields data will be selcted from table (dynamic select) 
* Tab delimited file will be preapred 

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
*  fkexi(1),                             " Flag for existence
*  mod(1),                               " Modification Id
*  actf(1),                              " Active Flag
*  switch_id       TYPE sfw_switch_id,   " Id of a Switch in Switch Framework
  END OF t_fld,

* Type for the table header
  BEGIN OF ty_str_hdr,
    field_name TYPE char20,
  END OF ty_str_hdr.

*---------------------------------------------------------------------*
*  DATA                                                               *
*---------------------------------------------------------------------*
DATA:

  lv_localfile       TYPE string,
  git_header_text    TYPE STANDARD TABLE OF ty_str_hdr, " Header Text
  gs_field_list      TYPE string, " SELECT Field List
  gref_struct_result TYPE REF TO cl_abap_structdescr, " Structure
  gref_table_result  TYPE REF TO cl_abap_tabledescr,  " Table
  gs_components      TYPE STANDARD TABLE OF abap_componentdescr
                     WITH KEY name. " Components
*---------------------------------------------------------------------*
*  FIELD-SYMBOLS                                                               *
*---------------------------------------------------------------------*
FIELD-SYMBOLS: <fs_dynamic_tab> TYPE INDEX TABLE. " Final Table

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
    ls_components LIKE LINE OF gs_components,
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
    APPEND ls_components TO gs_components.

    APPEND ls_fields-scrtext_m TO git_header_text.

  ENDLOOP.

  TRY .
      lr_struct_result = cl_abap_structdescr=>create( p_components = gs_components ).
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

  DATA: lrt_table  TYPE REF TO data,
        lrs_struct TYPE REF TO data.

  FIELD-SYMBOLS:
        <lfs_struct> TYPE any.

  CREATE DATA: lrt_table  TYPE HANDLE lr_table_result.
*               lrs_struct TYPE HANDLE lr_struct_result.

  ASSIGN lrt_table->* TO <fs_dynamic_tab>.
*  ASSIGN lrs_struct->* TO <lfs_struct>.

  IF <fs_dynamic_tab> IS  ASSIGNED.
*   This is the Dynamic Select
    SELECT (gs_field_list) FROM (p_tab) INTO CORRESPONDING FIELDS OF TABLE <fs_dynamic_tab>.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SUB_DOWNLOAD_FILE
*&---------------------------------------------------------------------*
*       Download File
*----------------------------------------------------------------------*
FORM sub_download_file  USING  p_p_file TYPE STRING.

  DATA: lv_file      TYPE string.

* Moving to a type compatible variable
  CONCATENATE p_p_file '\' p_tab '.txt' INTO LV_FILE.

  CALL METHOD cl_gui_frontend_services=>gui_download
    EXPORTING
      filename                = lv_file
      filetype                = 'DAT'
      write_field_separator   = 'X'
*      fieldnames              = git_header_text
    CHANGING
      data_tab                = <fs_dynamic_tab>
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
