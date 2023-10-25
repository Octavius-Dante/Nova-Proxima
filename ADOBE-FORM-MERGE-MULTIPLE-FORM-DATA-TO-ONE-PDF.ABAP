*################################################################################
**
**  Not a complete program ONLY ESSENTIAL Code block presneted here for reference
**
** ADOBE PDF file preparation from multiple output spool collection 
** 
*################################################################################


*-----------------------------------------------------------------------
* Following output parameters should be assigned to FP_JOB_OPEN
*-----------------------------------------------------------------------	
	
  ls_sfpoutparams-dest = 'LP01'. " CUSTOM PRINTER SETTINGS
  ls_sfpoutparams-nodialog = abap_true.
  ls_sfpoutparams-getpdf   = 'M'.
  ls_sfpoutparams-assemble = 'S'.
  ls_sfpoutparams-bumode   = 'M'.
  ls_sfpoutparams-reqnew   = abap_true.

*  Call FP_JOB_OPEN
    CALL FUNCTION 'FP_JOB_OPEN'
      CHANGING
        ie_outputparams = ls_sfpoutparams
      EXCEPTIONS
        cancel          = 1
        usage_error     = 2
        system_error    = 3
        internal_error  = 4
        OTHERS          = 5.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
	
*-----------------------------------------------------------------------	

*&&----- USE THE BELOW CODE AFTER FP_JOB_CLOSE FM IN THE PROGRAM-------

  DATA:lt_data            TYPE STANDARD TABLE OF tabl1024,
       lo_pdf_merger      TYPE REF TO cl_rspo_pdf_merge,
       lt_pdf_table       TYPE tfpcontent,
       lv_file            TYPE string,
       lv_path            TYPE string,
       lv_file_name       TYPE string,
       lv_merged_document TYPE xstring,
       lv_len             TYPE i,
       lv_rc              TYPE i VALUE 0,
       lv_filename        TYPE string VALUE 'Your File Name'.



* This should be before loop start
*------------------------------------------------------------------------------
    DATA(lt_fin) = lt_pdf_table.
    CLEAR lt_fin.
*------------------------------------------------------------------------------



*following codes should be inside loop after SFP_JOB_CLOSE
*------------------------------------------------------------------------------
*&&-- Merging different pdf files into one
  CREATE OBJECT lo_pdf_merger.

  CALL FUNCTION 'FP_GET_PDF_TABLE'
    IMPORTING
      e_pdf_table = lt_pdf_table.

* BECAUSE OF THIS ASSIGNMENT MULTIPLE PDF PAGES CAN BE MERGED TO SINGLE FILE
   APPEND LINES OF lt_pdf_table TO lt_fin.

* Add documents to attribute table of PDF merger
        LOOP AT lt_fin INTO DATA(lwa_form).
          lo_pdf_merger->add_document( lwa_form ).
        ENDLOOP.

* Call kernel method to do the merge of the specified files.
  lo_pdf_merger->merge_documents( IMPORTING merged_document = lv_merged_document
                                                   rc = lv_rc ).
												   
*------------------------------------------------------------------------------




* fOLLOWING CODE SHOULD BE OUTSIDE LOOP
*------------------------------------------------------------------------------
												   
  CALL FUNCTION 'SCMS_XSTRING_TO_BINARY'
    EXPORTING
      buffer        = lv_merged_document
    IMPORTING
      output_length = lv_len
    TABLES
      binary_tab    = lt_data.


  lv_filename = lv_filename && '_' && sy-datum.
  
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
* Implement suitable error handling here
        MESSAGE 'PDF Process Error' TYPE 'E'.  
  ENDIF.

  CLEAR:lv_file,lv_len,lv_path,lv_file_name,lt_data, LT_FIN.
  
  *------------------------------------------------------------------------------
