*&---------------------------------------------------------------------*
*& Report ZTEST_ADOBE_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_adobe_1.


* Sample program for adobe forms using SFLIGHT and SBOOK table data with header and line items
DATA: gd_path TYPE string.

DATA : gt_header TYPE STANDARD TABLE OF ztst_adb_1_s_hdr,
       gt_item   TYPE STANDARD TABLE OF ztst_adb_2_s_line,
       gs_header TYPE ztst_adb_1_s_hdr,
       gs_item   TYPE ztst_adb_2_s_line.

DATA : gv_conn TYPE rfcdest.

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

INITIALIZATION.

  gv_conn = 'ADS'.
  MOVE cl_fp=>get_ads_connection( ) TO gv_conn.

START-OF-SELECTION.


END-OF-SELECTION.
* COSTANTS DECLARATION
*  CONSTANTS : lc_form_name TYPE fpname VALUE 'ZTEST_ADOBE_SAMPLE'.
  CONSTANTS : lc_form_name TYPE fpname VALUE 'ZTEST_ADOBE_1'.

*  /1BCDWB/SM00000266 " -- ztest_adobe_1

* OUTPUT PRINTER SETTINGS
  ls_outputparams-dest     = 'LP01'. "Depends on user settings

* No Pop up dialog but print preview
  ls_outputparams-nodialog = abap_true.
  ls_outputparams-preview = abap_true.
  ls_outputparams-device = 'PRINTER'.
  ls_outputparams-dest = 'LP01'. " 'LOCL'.

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
      header             = gt_header
      lines              = gt_item
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
