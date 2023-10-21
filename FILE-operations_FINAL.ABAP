*&---------------------------------------------------------------------*
*& Report ZTEST_SAMPLE_DV3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTEST_SAMPLE_DV3.


* transferring file from application to presentation server (path_1 , path_2)
* transferring file from one directory to another in application server (path_1 , path_2)

** Application server path and presentation server path variables
DATA : gv_file      TYPE saepfad, " Temporary variable for directory with file name source
       gv_file_2    TYPE saepfad, " Temporary variable for directory with file name for target
* Deletion variables
       gv_file_name TYPE epsfilnam, " File name variable substring extraction from file path and file name
       gv_dir_name  TYPE epsdirnam, " directory extraction from file path and file name
       gv_path      TYPE string. " file path variable temporary usage

**gv_file = '/tmp/test_sample_XLS.xls'.
**gv_file_2 = 'C:\Users\wb609879\OneDrive - WBG\Desktop\test_sample.xlsx'.

SELECTION-SCREEN: BEGIN OF BLOCK bl1 WITH FRAME TITLE header1.
** Category  1 - Copying from Application server to Presentation server
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : rad1 RADIOBUTTON GROUP r1 DEFAULT 'X' USER-COMMAND aa.
SELECTION-SCREEN COMMENT 5(63) name1.
SELECTION-SCREEN END OF LINE.

** Category  2 - Moving file within Application server directory
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS :  rad2 RADIOBUTTON GROUP r1.
SELECTION-SCREEN COMMENT 5(63) name2.
SELECTION-SCREEN END OF LINE.

** Category  3 - Delete File in Application server directory
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : rad3 RADIOBUTTON GROUP r1.
SELECTION-SCREEN COMMENT 5(63) name3.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK bl1. "bl3.
SELECTION-SCREEN SKIP.

SELECTION-SCREEN BEGIN OF BLOCK bl2 WITH FRAME TITLE header2.
SELECTION-SCREEN SKIP.
PARAMETERS : p_aspath TYPE rlgrap-filename MODIF ID cc , " Appliciation server dir with file selection
             p_pspath TYPE rlgrap-filename MODIF ID aa , " Presentation server directoyr selection alone
             p_apath2 TYPE rlgrap-filename MODIF ID bb . " Application server dir selection alone
SELECTION-SCREEN END OF BLOCK bl2.


************************************************************************
***AT Selection-Screen OUTPUT*******
************************************************************************
AT SELECTION-SCREEN OUTPUT.

  header1 = 'Select the activity'.
  header2 = 'File path selection server (or) local'.
  name1   = 'Download to local system'.
  name2   = 'Moving file within Application server'.
  name3   = 'Deleting file from Application server'.

  IF rad1 = 'X'.

    LOOP AT SCREEN.
      IF screen-group1 = 'AA'.
        screen-active = '1'.
*        screen-input = '1'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'BB'.
        screen-active = '0'.
*        screen-input = '0'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'CC'.
        screen-active = '1'.
*        screen-input = '1'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.

  ELSEIF rad2 = 'X'.

    LOOP AT SCREEN.
      IF screen-group1 = 'AA'.
        screen-active = '0'.
*        screen-input = '0'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'BB'.
        screen-active = '1'.
*        screen-input = '1'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'CC'.
        screen-active = '1'.
*        screen-input = '0'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.

  ELSEIF rad3 = 'X'.

    LOOP AT SCREEN.
      IF screen-group1 = 'AA'.
        screen-active = '0'.
*        screen-input = '0'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'BB'.
        screen-active = '0'.
*        screen-input = '0'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'CC'.
        screen-active = '1'.
*        screen-input = '1'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.

  ENDIF.

************************************************************************
***AT Selection-Screen ON *******
************************************************************************
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_aspath.
* Application server directory selection with file name
  PERFORM get_server_directory CHANGING p_aspath.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_pspath.
* Presentation server directory selection
  CALL METHOD cl_gui_frontend_services=>directory_browse
    EXPORTING
      window_title    = 'File Directory'
      initial_folder  = 'C:'
    CHANGING
      selected_folder = gv_path.
  CALL METHOD cl_gui_cfw=>flush.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_apath2.
* Application server directory selection
  PERFORM get_server_directory CHANGING p_apath2.

************************************************************************
***START-OF-SELECTION*******
************************************************************************
START-OF-SELECTION.

************************************************************************
* FUNCTION 1 - Downloading file from server to local
************************************************************************

  IF p_aspath IS NOT INITIAL.
    gv_file = p_aspath.
  ELSE.
    MESSAGE 'Source server directory is empty' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.

  IF rad1 EQ abap_true.

    IF p_pspath IS NOT INITIAL.
      gv_file_2 = p_pspath.
    ELSE.
      MESSAGE 'Local system directory is empty' TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.

    IF gv_file IS NOT INITIAL
     AND gv_file_2 IS NOT INITIAL.

* Deriving File name with directory for Target path
      PERFORM get_filename USING gv_file CHANGING gv_file_name gv_file_2 gv_dir_name.

* Downloading files from application server to client (any file type applicable)
      CALL FUNCTION 'ARCHIVFILE_SERVER_TO_CLIENT'
        EXPORTING
          path             = gv_file    " Application server path + file name
          targetpath       = gv_file_2  " Presentation server path + file name
        EXCEPTIONS
          error_file       = 1
          no_authorization = 2
          OTHERS           = 3.
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.

      IF sy-subrc EQ 0.
        MESSAGE 'File downloaded to local system successfully' TYPE 'I'.
      ENDIF.

    ENDIF.
  ENDIF.

************************************************************************
* FUNCTION 2 - Moving file within server directories
************************************************************************

  IF rad2 EQ abap_true.

    IF p_apath2 IS NOT INITIAL.
      gv_file_2 = p_apath2.
    ELSE.
      MESSAGE 'Target server directory is empty' TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.

    IF gv_file IS NOT INITIAL
     AND gv_file_2 IS NOT INITIAL.

* Deriving File name with directory for Target path
      PERFORM get_filename USING gv_file CHANGING gv_file_name gv_file_2 gv_dir_name.

      CALL FUNCTION 'ARCHIVFILE_SERVER_TO_SERVER'
        EXPORTING
          sourcepath       = gv_file
          targetpath       = gv_file_2
        EXCEPTIONS
          error_file       = 1
          no_authorization = 2
          OTHERS           = 3.
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.

* Delete a specific file from applciation server
      PERFORM delete_server_file USING gv_file_name gv_dir_name.

    ENDIF.
  ENDIF.

************************************************************************
* FUNCTION 3 - Delete a file from server directory
************************************************************************

* Delete a specific file from applciation server based on user input
  IF rad3 EQ abap_true.

    IF gv_file IS NOT INITIAL.
* Deriving File name with directory for Target path
      PERFORM get_filename USING gv_file CHANGING gv_file_name gv_file_2 gv_dir_name.

* Delete a specific file from applciation server
      PERFORM delete_server_file USING gv_file_name gv_dir_name.

    ELSE.
      MESSAGE 'File is not selected' TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.
  ENDIF.

*&---------------------------------------------------------------------*
*&      Form  GET_FILENAME
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->p_FILE  text
*      <--c_FILE_NAME text
*      <--c_FILE_2    text
*      <--c_DIR_NAME  text
*----------------------------------------------------------------------*
FORM get_filename  USING    p_file TYPE saepfad
                   CHANGING c_file_name TYPE epsfilnam
                            c_file_2 TYPE saepfad
                            c_dir_name TYPE epsdirnam.

  DATA : lv_reverse   TYPE char70,
         lv_filename  TYPE char25,
         lv_directory TYPE char50.

* Obtaining the file name from the variable - string reversing operation
  CALL FUNCTION 'STRING_REVERSE'
    EXPORTING
      string  = p_file
      lang    = 'E'
    IMPORTING
      rstring = lv_reverse.

* reversed string is split with '\' slash value and file name is obtained in reverse
  SPLIT lv_reverse AT '/' INTO lv_filename lv_directory.

* value obtained till slash is reversed again to get correct file name
  CALL FUNCTION 'STRING_REVERSE'
    EXPORTING
      string  = lv_filename
      lang    = 'E'
    IMPORTING
      rstring = lv_reverse.

  c_file_name = lv_filename = lv_reverse.

  IF rad1 EQ abap_true.
* File name is included with directory for presenetaion server
    CONCATENATE c_file_2 '\' lv_filename INTO c_file_2.
  ELSEIF rad2 EQ abap_true.
* File name is included with directory for application server
    CONCATENATE c_file_2 '/' lv_filename INTO c_file_2.
  ENDIF.

* Deriving only the directory name
  c_dir_name = p_file. " assigning file name with directory
  CONCATENATE '/' lv_filename INTO lv_filename.
  REPLACE lv_filename WITH '' INTO c_dir_name. " replacing the file name with blank in the end

ENDFORM.                    " GET_FILENAME
*&---------------------------------------------------------------------*
*&      Form  GET_SERVER_DIRECTORY
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_server_directory CHANGING p_path TYPE rlgrap-filename.

***Function  module for F4 help from Application server to select files
  CALL FUNCTION '/SAPDMC/LSM_F4_SERVER_FILE'
    IMPORTING
      serverfile       = p_path
    EXCEPTIONS
      canceled_by_user = 1
      OTHERS           = 2.
  IF sy-subrc = 0.
    IF p_path IS INITIAL.
      MESSAGE 'File and directory not selected' TYPE 'S' DISPLAY LIKE 'E'.
    ELSE.
      MESSAGE 'Successful'  TYPE 'I'.
    ENDIF.
  ENDIF.

ENDFORM.                    " GET_SERVER_DIRECTORY
*&---------------------------------------------------------------------*
*&      Form  DELETE_SERVER_FILE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_GV_FILE_NAME  text
*      -->P_GV_DIR_NAME  text
*----------------------------------------------------------------------*
FORM delete_server_file  USING  p_file_name TYPE epsfilnam
                                p_dir_name TYPE epsdirnam.

  DATA lv_file_path TYPE epspath.

  CALL FUNCTION 'EPS_DELETE_FILE'
    EXPORTING
      file_name              = p_file_name
      dir_name               = p_dir_name
    IMPORTING
      file_path              = lv_file_path
    EXCEPTIONS
      invalid_eps_subdir     = 1
      sapgparam_failed       = 2
      build_directory_failed = 3
      no_authorization       = 4
      build_path_failed      = 5
      delete_failed          = 6
      OTHERS                 = 7.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
  IF sy-subrc EQ 0.
    IF rad3 EQ abap_true.
      MESSAGE 'File deleted successfully' TYPE 'I'.
    ELSEIF rad2 EQ abap_true.
      MESSAGE 'File moved successfully' TYPE 'I'.
    ENDIF.
  ENDIF.

ENDFORM.                    " DELETE_SERVER_FILE