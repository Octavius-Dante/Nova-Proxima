REPORT zr_read_app_download_to_pre NO STANDARD PAGE HEADING.
*// Types declaration
TYPES:BEGIN OF ty_final,
        var1 TYPE string,
      END OF ty_final.

*// Data declaration
DATA:lt_final           TYPE TABLE OF ty_final,
     lt_final1          TYPE TABLE OF string,
     ls_final           TYPE ty_final,
     lv_file            TYPE rlgrap-filename,
     lv_data            TYPE string,
     lv_path            TYPE string,
     lv_sel_fol         TYPE string,
     lv_selected_folder TYPE char100,
     directory(30).

*// Selection screen design
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
PARAMETERS:p_app_s TYPE rlgrap-filename.
SELECTION-SCREEN END OF BLOCK b1.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_app_s.

*// DIRECTORY NAME
  directory = '/'.

*// Fm for Application Server F4 help
  CALL FUNCTION '/SAPDMC/LSM_F4_SERVER_FILE'
    EXPORTING
      directory        = directory
    IMPORTING
      serverfile       = p_app_s
    EXCEPTIONS
      canceled_by_user = 1
      OTHERS           = 2.

*// Fm for selecting folder in Presentation server
  CALL FUNCTION 'TMP_GUI_BROWSE_FOR_FOLDER'
    IMPORTING
      selected_folder = lv_selected_folder
    EXCEPTIONS
      cntl_error      = 1
      OTHERS          = 2.

  lv_file = p_app_s.

*// Start of selection
START-OF-SELECTION .

*// Open dataset, From application server get the data
  OPEN DATASET lv_file FOR INPUT IN TEXT MODE ENCODING DEFAULT.
  IF sy-subrc NE 0.
    MESSAGE 'unable to open the file' TYPE 'I'.
  ELSE.
*// Read the data from app server and put into variable
    DO.
      READ DATASET lv_file INTO lv_data.
      IF sy-subrc EQ 0.
        ls_final-var1 = lv_data.
*// Append workarea to internal table
        APPEND ls_final TO lt_final.
        CLEAR ls_final.
      ELSE.
        EXIT.
      ENDIF.
    ENDDO.
  ENDIF.

*// Split file name and put in to internal table
  SPLIT lv_file AT '/' INTO TABLE lt_final1.

*// Count how many records in internal table
  DATA(lv_count) = lines( lt_final1 ).

*// Read itab into workarea index lv_count
  READ TABLE lt_final1 INTO DATA(ls_final1) INDEX lv_count.

*// close the path
  CLOSE DATASET lv_file.
*// Concatinate the presenation folder and application filename
  CONCATENATE lv_selected_folder '\'  ls_final1 INTO lv_sel_fol.

  lv_path = lv_sel_fol.

*// Fm for download the file into presenation server
  CALL FUNCTION 'GUI_DOWNLOAD'
    EXPORTING
      filename                = lv_path
      filetype                = 'ASC'
      write_field_separator   = 'X'
    TABLES
      data_tab                = lt_final
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
      OTHERS                  = 22.

  IF sy-subrc EQ 0.
    MESSAGE: 'Application server file has been downloaded to Presentation server' TYPE 'I'.
  ELSE.
    MESSAGE: 'The data has not downloaded' TYPE 'I'.
  ENDIF.