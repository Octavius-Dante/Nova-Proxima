*&---------------------------------------------------------------------*
*& Report ZTEST_CDS_DOWNLOADS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcds_backup NO STANDARD PAGE HEADING.
"structure for DDDDLSCR

TYPES: BEGIN OF ty_ddddlsrc,
         ddlname TYPE ddddlsrc-ddlname,
         as4user TYPE ddddlsrc-as4user,
         source  TYPE ddddlsrc-source,
         devclass TYPE tadir-devclass,
       END OF ty_ddddlsrc,

       BEGIN OF ty_dd,
         source TYPE ddddlsrc-source,
       END OF ty_dd.

DATA: it_ddddlsrc TYPE STANDARD TABLE OF ty_ddddlsrc,
      it_dd       TYPE STANDARD TABLE OF ty_dd,
      wa          TYPE ty_ddddlsrc,
      wa_dd       TYPE ty_dd.

DATA: gv_filename     TYPE string,
      gv_filetype     TYPE char10,
      gd_path         TYPE string.

*&---------------------------------------------------------------------*
""""Selection Screen
*&---------------------------------------------------------------------*

DATA : gv_dir TYPE tadir-devclass.

SELECT-OPTIONS s_dev FOR gv_dir NO INTERVALS.

PARAMETERS : "p_dev  TYPE tadir-devclass,
             p_path TYPE rlgrap-filename OBLIGATORY MODIF ID ccc.

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
*          AND   t~devclass = p_dev.

  IF sy-subrc = 0.
    WRITE ' File downloaded successfully'.
  ENDIF.

*&---------------------------------------------------------------------*
  """"End of selection
*&---------------------------------------------------------------------*
END-OF-SELECTION.

  LOOP AT it_ddddlsrc INTO wa.

    REPLACE ALL OCCURRENCES OF '/' in wa-devclass with '-'.
    REPLACE ALL OCCURRENCES OF '/' in wa-ddlname with '_'.

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
