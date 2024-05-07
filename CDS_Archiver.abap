*&---------------------------------------------------------------------*
*& Report ZDTP_CDS_DOWNLOAD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdtp_cds_download NO STANDARD PAGE HEADING.

"structure for DDDDLSCR

TYPES: BEGIN OF ty_ddddlsrc,
         ddlname  TYPE ddddlsrc-ddlname,
         as4user  TYPE ddddlsrc-as4user,
         source   TYPE ddddlsrc-source,
         devclass TYPE tadir-devclass,
       END OF ty_ddddlsrc,

       BEGIN OF ty_dd,
         source TYPE ddddlsrc-source,
       END OF ty_dd.

DATA: it_ddddlsrc TYPE STANDARD TABLE OF ty_ddddlsrc,
      it_dd       TYPE STANDARD TABLE OF ty_dd,
      wa          TYPE ty_ddddlsrc,
      wa_dd       TYPE ty_dd.

DATA: gv_filename TYPE string,
      gv_filetype TYPE char10,
      gd_path     TYPE string.

*&---------------------------------------------------------------------*
""""Selection Screen
*&---------------------------------------------------------------------*

DATA : gv_dir  TYPE tadir-devclass,
       gv_ddln TYPE ddddlsrc-ddlname.


SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE header1.
** Category  1 - With package name
  SELECTION-SCREEN BEGIN OF LINE.
    PARAMETERS : rad1 RADIOBUTTON GROUP r1 DEFAULT 'X' USER-COMMAND aa.
    SELECTION-SCREEN COMMENT 5(63) name1.
  SELECTION-SCREEN END OF LINE.

** Category  2 - With CDS name
  SELECTION-SCREEN BEGIN OF LINE.
    PARAMETERS :  rad2 RADIOBUTTON GROUP r1.
    SELECTION-SCREEN COMMENT 5(63) name2.
  SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN SKIP.

SELECTION-SCREEN BEGIN OF BLOCK bl2 WITH FRAME TITLE header2.
  SELECT-OPTIONS : s_dev  FOR gv_dir  NO INTERVALS MODIF ID aa,
                   s_ddln FOR gv_ddln NO INTERVALS MODIF ID bb.
SELECTION-SCREEN END OF BLOCK bl2.

PARAMETERS : p_path TYPE rlgrap-filename OBLIGATORY.

AT SELECTION-SCREEN OUTPUT.

  header1 = 'Select the nput type'.
  header2 = 'Fill the necessary input'.
  name1   = 'Package Name'.
  name2   = 'CDS Name'.
*  name3   = 'Deleting file from Application server'.

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
    ENDLOOP.

  ELSEIF rad2 = 'X'.

    LOOP AT SCREEN.
      IF screen-group1 = 'AA'.
        screen-active = '0'.
*        screen-input = '1'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'BB'.
        screen-active = '1'.
*        screen-input = '0'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.

  ENDIF.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_path.

  CALL METHOD cl_gui_frontend_services=>directory_browse
    EXPORTING
      window_title    = 'File Directory'
      initial_folder  = 'C:'
    CHANGING
      selected_folder = gd_path.
  CALL METHOD cl_gui_cfw=>flush.

  CONCATENATE gd_path '' INTO p_path.

  DATA : src TYPE ddddlsrc,
         dir TYPE tadir.

*&---------------------------------------------------------------------*
  """"Start of selection
*&---------------------------------------------------------------------*
START-OF-SELECTION.

  IF s_dev IS NOT INITIAL
    AND rad1 EQ abap_true.

    SELECT  d~ddlname
            d~as4user
            d~source
            t~devclass
            FROM tadir AS t JOIN  ddddlsrc AS d
            ON   t~obj_name = d~ddlname
            INTO TABLE it_ddddlsrc
            WHERE t~pgmid = 'R3TR'
            AND   t~object = 'DDLS'
            AND t~devclass IN s_dev.

  ELSEIF s_ddln IS NOT INITIAL
    AND rad2 EQ abap_true..

    SELECT  d~ddlname
            d~as4user
            d~source
            t~devclass
            FROM tadir AS t JOIN  ddddlsrc AS d
            ON   t~obj_name = d~ddlname
            INTO TABLE it_ddddlsrc
            WHERE t~pgmid = 'R3TR'
            AND   t~object = 'DDLS'
            AND d~ddlname IN s_ddln.

  ENDIF.

  IF sy-subrc = 0.
    WRITE ' File downloaded successfully'.
  ENDIF.

*&---------------------------------------------------------------------*
  """"End of selection
*&---------------------------------------------------------------------*
END-OF-SELECTION.

  LOOP AT it_ddddlsrc INTO wa.

    REPLACE ALL OCCURRENCES OF '/' IN wa-devclass WITH '-'.
    REPLACE ALL OCCURRENCES OF '/' IN wa-ddlname WITH '_'.

* Package directories automatically created - enter only master directory name in screen

    CONCATENATE p_path '\' wa-devclass '\' wa-ddlname '.txt' INTO gv_filename.

    wa_dd-source = wa-source.
    APPEND wa_dd TO it_dd.
    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename              = gv_filename
        filetype              = 'ASC'
        write_field_separator = 'X'
      TABLES
        data_tab              = it_dd.

    CLEAR :  gv_filename, it_dd, wa.

  ENDLOOP.

  MESSAGE 'ALL THE FILES DOWNLOADED' TYPE 'I'.
