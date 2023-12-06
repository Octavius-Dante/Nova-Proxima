*&---------------------------------------------------------------------*
*& Report ZTEST_ADOBE_SAMPLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_adobe_sample.


DATA: gd_path TYPE string.

DATA : gt_header TYPE STANDARD TABLE OF ztest_adobe_sample_s,
       gt_item   TYPE STANDARD TABLE OF ztest_adobe_sample_s2,
       gs_header TYPE ztest_adobe_sample_s,
       gs_item   TYPE ztest_adobe_sample_s2.

DATA : gv_conn TYPE rfcdest.

*PARAMETERS : p_carr TYPE s_carr_id OBLIGATORY.


SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

PARAMETERS :
  " ADOBE FORM PREVIEW
  rad1   RADIOBUTTON GROUP r1 DEFAULT 'X' USER-COMMAND ccc,

  " SAVE DIALOG DIRECTORY POPUP
  rad2   RADIOBUTTON GROUP r1,

  " ENTER DIRECOTRY IN SELECTION SCREEN TO SAVE PDF FILES TO THE DIRECTORY
  rad3   RADIOBUTTON GROUP r1,

  p_path TYPE rlgrap-filename OBLIGATORY MODIF ID ccc.
SELECTION-SCREEN: END OF BLOCK b1.


AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_path.

  CALL METHOD cl_gui_frontend_services=>directory_browse
    EXPORTING
      window_title    = 'File Directory'
      initial_folder  = 'C:'
    CHANGING
      selected_folder = gd_path.
  CALL METHOD cl_gui_cfw=>flush.

  CONCATENATE gd_path '' INTO p_path.

AT SELECTION-SCREEN OUTPUT.

  IF rad1 = 'X'.
    LOOP AT SCREEN.
      IF screen-group1 = 'CCC'.
        screen-active = '0'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.

  ELSEIF rad2 = 'X'.
    LOOP AT SCREEN.
      IF screen-group1 = 'CCC'.
        screen-active = '0'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.

  ELSEIF rad3 = 'X'.
    LOOP AT SCREEN.
      IF screen-group1 = 'CCC'.
        screen-active = '1'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.


INITIALIZATION.

  gv_conn = 'ADS'.
  MOVE cl_fp=>get_ads_connection( ) TO gv_conn.

START-OF-SELECTION.

  SELECT * FROM sflight INTO TABLE @DATA(lt_flight)
    WHERE carrid EQ 'AA'. "@p_carr'.
  IF sy-subrc EQ 0.

    DESCRIBE TABLE lt_flight LINES DATA(lv_lines).
    IF lv_lines GT 1.
      DELETE ADJACENT DUPLICATES FROM lt_flight COMPARING carrid.
    ENDIF.

    SELECT * FROM sbook INTO TABLE @DATA(lt_book)
      FOR ALL ENTRIES IN @lt_flight WHERE carrid EQ @lt_flight-carrid.
  ENDIF.

  BREAK-POINT.

  IF lt_book IS NOT INITIAL.

    LOOP AT lt_book INTO DATA(ls_book).
      MOVE-CORRESPONDING ls_book TO gs_item.
      APPEND gs_item TO gt_item.
      CLEAR : gs_item.
    ENDLOOP.

    READ TABLE lt_flight INTO DATA(ls_flight) INDEX 1.
    IF sy-subrc EQ 0.
      MOVE-CORRESPONDING ls_flight TO gs_header.
      gs_header-items = gt_item.
      APPEND gs_header TO gt_header.
    ENDIF.

  ENDIF.

  BREAK-POINT.


****** ADOBE FORM processing
* VARIABLES declaration

  DATA: lv_fmname       TYPE fpname,
        lv_sign         TYPE xstring,
        ls_outputparams TYPE sfpoutputparams,
        ls_docparams    TYPE sfpdocparams,
        ls_pdf          TYPE fpformoutput  ##NEEDED.

  DATA:lt_data            TYPE STANDARD TABLE OF tabl1024,
       lo_pdf_merger      TYPE REF TO cl_rspo_pdf_merge,
       lt_pdf_table       TYPE tfpcontent,
       lv_file            TYPE string,
       lv_path            TYPE string,
       lv_file_name       TYPE string,
       lv_merged_document TYPE xstring,
       lv_len             TYPE i,
       lv_rc              TYPE i VALUE 0,
       result             TYPE sfpjoboutput,
       l_spoolid          TYPE rspoid,
       lv_filename        TYPE string VALUE 'ADOBE_SAMPLE'.


* COSTANTS DECLARATION
  CONSTANTS : lc_form_name TYPE fpname VALUE 'ZTEST_ADOBE_SAMPLE'.

* OUTPUT PRINTER SETTINGS
  ls_outputparams-dest     = 'LP01'. "Depends on user settings

  IF rad1 NE abap_true.
    ls_outputparams-nodialog = abap_true.
    ls_outputparams-getpdf   = 'M'.
    ls_outputparams-assemble = 'S'.
    ls_outputparams-bumode   = 'M'.
    ls_outputparams-reqnew   = abap_true.
  ENDIF.

  DATA(lt_fin) = lt_pdf_table.
  CLEAR lt_fin.

  TRY.
      CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'   " Form Processing Generation
        EXPORTING
          i_name     = lc_form_name
        IMPORTING
          e_funcname = lv_fmname.
    CATCH  cx_fp_api_usage ##NO_HANDLER .
    CATCH  cx_fp_api_repository ##NO_HANDLER .
    CATCH  cx_fp_api_internal ##NO_HANDLER .
  ENDTRY.


  ls_outputparams-connection = gv_conn.
* Form Processing: Call Form
  CALL FUNCTION 'FP_JOB_OPEN'
    CHANGING
      ie_outputparams = ls_outputparams
    EXCEPTIONS
      cancel          = 1
      usage_error     = 2
      system_error    = 3
      internal_error  = 4
      OTHERS          = 5.
  IF sy-subrc <> 0.
    CLEAR ls_outputparams.
  ENDIF.

  ls_docparams-langu   = 'D'.
  ls_docparams-country = 'DE'.

  CALL FUNCTION lv_fmname
    EXPORTING
      /1bcdwb/docparams  = ls_docparams
*     iv_sign            = lv_sign
      header_data        = gt_header
    IMPORTING
      /1bcdwb/formoutput = ls_pdf
    EXCEPTIONS
      usage_error        = 1
      system_error       = 2
      internal_error     = 3
      OTHERS             = 4.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


*&---- Close the spool job
  CALL FUNCTION 'FP_JOB_CLOSE'
    IMPORTING
      e_result       = result
    EXCEPTIONS
      usage_error    = 1
      system_error   = 2
      internal_error = 3
      OTHERS         = 4.
  IF sy-subrc <> 0.
    CLEAR ls_pdf.
  ENDIF.


  IF rad1 EQ abap_true.
* Check the result.
    IF result-userexit IS INITIAL.
      IF result-spoolids IS INITIAL.
        MESSAGE ID 'PO' TYPE 'E' NUMBER '475'.
      ELSE.
        READ TABLE result-spoolids INDEX 1 INTO l_spoolid.
        MESSAGE ID 'PO' TYPE 'S' NUMBER '622' WITH l_spoolid.
      ENDIF.
    ENDIF.

  ENDIF.


  IF rad2 EQ abap_true OR
     rad3 EQ abap_true .

    CALL FUNCTION 'FP_GET_PDF_TABLE'
      IMPORTING
        e_pdf_table = lt_pdf_table.

*&&-- Merging different pdf files into one
    CREATE OBJECT lo_pdf_merger.

    APPEND LINES OF lt_pdf_table TO lt_fin.

* Add documents to attribute table of PDF merger
    LOOP AT lt_fin INTO DATA(lwa_form).
      lo_pdf_merger->add_document( lwa_form ).
    ENDLOOP.

* Call kernel method to do the merge of the specified files.
    lo_pdf_merger->merge_documents( IMPORTING merged_document = lv_merged_document
                                                           rc = lv_rc ).

    CALL FUNCTION 'SCMS_XSTRING_TO_BINARY'
      EXPORTING
        buffer        = lv_merged_document
      IMPORTING
        output_length = lv_len
      TABLES
        binary_tab    = lt_data.

  ENDIF.


  IF rad2 EQ abap_true.

    lv_filename = lv_filename && '_' && sy-datum && '_' && sy-uzeit.
    CALL METHOD cl_gui_frontend_services=>file_save_dialog
      EXPORTING
        window_title              = 'Save Form'
        default_extension         = 'pdf'
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
      MESSAGE 'PDF Process Error' TYPE 'E'.
    ENDIF.

  ENDIF.


  IF rad2 EQ abap_true OR
     rad3 EQ abap_true .


    IF rad3 EQ abap_true.
      lv_filename = lv_filename && '_' && sy-datum && '_' && sy-timlo.
      CONCATENATE p_path '\' lv_filename '.pdf' INTO lv_file.
    ENDIF.

    CALL METHOD cl_gui_frontend_services=>gui_download
      EXPORTING
        bin_filesize            = lv_len
        filename                = lv_file
        filetype                = 'BIN'
      CHANGING
        data_tab                = lt_data
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
      MESSAGE 'PDF Process Error' TYPE 'E'.
    ENDIF.

    CLEAR:lv_file,lv_len,lv_path,
          lv_file_name,lt_data, lt_fin.

  ENDIF.