*&---------------------------------------------------------------------*
*& Report ZTEST_SCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTEST_SCREEN.


* transferring file from application to presentation server (path_1 , path_2)
* transferring file from one directory to another in application server (path_1 , path_2)

** Application server path and presentation server path variables
DATA : gv_file TYPE saepfad,
       gv_file_2 TYPE saepfad,
       gv_path TYPE string.

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
PARAMETERS : p_aspath TYPE rlgrap-filename MODIF ID aa, " Appliciation server dir with file selection
             p_pspath TYPE rlgrap-filename MODIF ID aa, " Presentation server directoyr selection alone
             p_apath1 TYPE rlgrap-filename MODIF ID bb, " Application server dir with file selection
             p_apath2 TYPE rlgrap-filename MODIF ID bb, " Application server dir selection alone
             p_delete TYPE rlgrap-filename MODIF ID cc. " Application server dir with file selection
SELECTION-SCREEN END OF BLOCK bl2.

AT SELECTION-SCREEN OUTPUT.

  header1 = 'Application server and Presentation server File paths'.
  header2 = 'File Operations'.
  name1 = 'Application server to Presentation server file transfer'.
  name2 = 'Moving file within Application server'.
  name3 = 'Deleting file from Application server'.
*  name4 = 'test'.

  IF rad1 = 'X'.

    LOOP AT SCREEN.
      IF screen-group1 = 'AA'.
        screen-active = '1'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'BB'.
        screen-active = '0'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'CC'.
        screen-active = '0'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.

  ELSEIF rad2 = 'X'.

    LOOP AT SCREEN.
      IF screen-group1 = 'AA'.
        screen-active = '0'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'BB'.
        screen-active = '1'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'CC'.
        screen-active = '0'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.

  ELSEIF rad3 = 'X'.

    LOOP AT SCREEN.
      IF screen-group1 = 'AA'.
        screen-active = '0'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'BB'.
        screen-active = '0'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'CC'.
        screen-active = '1'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.

  ENDIF.
*
*************************************************************************
****AT Selection-Screen*******
*************************************************************************
*AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_aspath.
****Function  module for F4 help from Application server to select files
*  CALL FUNCTION '/SAPDMC/LSM_F4_SERVER_FILE'
*    IMPORTING
*      serverfile       = p_aspath
*    EXCEPTIONS
*      canceled_by_user = 1
*      OTHERS           = 2.
*  IF sy-subrc = 0.
*    MESSAGE 'Successful'  TYPE 'I'.
*  ENDIF.
*
*  IF p_aspath IS NOT INITIAL.
*    gv_file = p_aspath.
*  ENDIF.
*
*AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_pspath.
** Presentation server directory selection
*  CALL METHOD cl_gui_frontend_services=>directory_browse
*    EXPORTING
*      window_title    = 'File Directory'
*      initial_folder  = 'C:'
*    CHANGING
*      selected_folder = gv_path.
*  CALL METHOD cl_gui_cfw=>flush.
*
*  CONCATENATE gv_path '' INTO p_pspath.
*
*  IF p_pspath IS NOT INITIAL.
*    gv_file_2 = p_pspath.
*  ENDIF.
*
*************************************************************************
****START-OF-SELECTION*******
*************************************************************************
*START-OF-SELECTION.
*
*  BREAK-POINT.
*
*  IF gv_file IS NOT INITIAL
*   AND gv_file_2 IS NOT INITIAL.
*
** Need to derive a logic to get the file name alone from ASpath variable
*
** Downloading files from application server to client (any file type applicable for excel also)
*    CALL FUNCTION 'ARCHIVFILE_SERVER_TO_CLIENT'
*      EXPORTING
*        path             = gv_file    " Application server path + file name
*        targetpath       = gv_file_2  " Presentation server path + file name
*      EXCEPTIONS
*        error_file       = 1
*        no_authorization = 2
*        OTHERS           = 3.
*    IF sy-subrc <> 0.
*      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*    ENDIF.
*  ENDIF.
*
*  BREAK-POINT.
