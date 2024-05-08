*&---------------------------------------------------------------------*
*& Report ZDTP_CDS_DOWNLOAD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdtp_cds_download NO STANDARD PAGE HEADING.

"structure for DDDDLSCR

TYPES: BEGIN OF ty_ddddlsrc,
         ddlname     TYPE ddddlsrc-ddlname,
         as4user     TYPE ddddlsrc-as4user,
         ddls_source TYPE ddddlsrc-source,
         devclass    TYPE tadir-devclass,
         object      TYPE tadir-object,
       END OF ty_ddddlsrc,

       BEGIN OF ty_bdef_1,
         obj_name TYPE tadir-obj_name,
         devclass TYPE tadir-devclass,
         object   TYPE tadir-object,
       END OF ty_bdef_1,

       BEGIN OF ty_bdef_2,
         progname TYPE reposrc-progname,
         obj_name TYPE tadir-obj_name,
         devclass TYPE tadir-devclass,
       END OF ty_bdef_2,

       BEGIN OF ty_ddlx,
         ddlxname   TYPE ddlxsrc_src-ddlxname,
         mdx_source TYPE ddlxsrc_src-source,
         devclass   TYPE tadir-devclass,
         object     TYPE tadir-object,
       END OF ty_ddlx,

       BEGIN OF ty_srvd,
         srvdname    TYPE srvdsrc_src-srvdname,
         srvd_source TYPE srvdsrc_src-source,
         devclass    TYPE tadir-devclass,
         object      TYPE tadir-object,
       END OF ty_srvd,

       BEGIN OF ty_final,
         object_name   TYPE char40,
         object_source TYPE srvdsrc_src-source,
         devclass      TYPE tadir-devclass,
         object        TYPE tadir-object,
       END OF ty_final,

       BEGIN OF ty_dd,
         source TYPE ddddlsrc-source,
       END OF ty_dd.

DATA: it_ddddlsrc TYPE STANDARD TABLE OF ty_ddddlsrc,
      wa_ddddlsrc TYPE ty_ddddlsrc,

      it_bdef_1   TYPE STANDARD TABLE OF ty_bdef_1,
      wa_bdef_1   TYPE ty_bdef_1,

      it_bdef_2   TYPE STANDARD TABLE OF ty_bdef_2,
      wa_bdef_2   TYPE ty_bdef_2,

      it_srvd     TYPE STANDARD TABLE OF ty_srvd,
      wa_srvd     TYPE ty_srvd,

      it_ddlx     TYPE STANDARD TABLE OF ty_ddlx,
      wa_ddlx     TYPE ty_ddlx,

      it_dd       TYPE STANDARD TABLE OF ty_dd,
      wa_dd       TYPE ty_dd,

      it_final    TYPE STANDARD TABLE OF ty_final,
      wa_final    TYPE ty_final.

DATA: gv_filename TYPE string,
      gv_filetype TYPE char10,
      gd_path     TYPE string,
      gv_word_len TYPE i.

DATA: itab TYPE TABLE OF string,
      wa   TYPE string.

*&---------------------------------------------------------------------*
""""Selection Screen
*&---------------------------------------------------------------------*

DATA : gv_dir  TYPE tadir-devclass.

SELECT-OPTIONS : s_dev  FOR gv_dir NO INTERVALS.
PARAMETERS : p_path TYPE rlgrap-filename OBLIGATORY.

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
  """" Start of selection
*&---------------------------------------------------------------------*
START-OF-SELECTION.

* Retrieve sources of
* - Behaviour definition
* - Data definition
* - Service definition
* - Metadata extension

  SELECT  d~ddlname,
          d~as4user,
          d~source,
          t~devclass,
          t~object
          FROM tadir AS t
          JOIN ddddlsrc AS d ON d~ddlname = t~obj_name
          INTO TABLE @it_ddddlsrc
          WHERE t~pgmid EQ 'R3TR'
            AND t~object EQ 'DDLS'
            AND t~devclass IN @s_dev.
  IF sy-subrc EQ 0.
    LOOP AT it_ddddlsrc INTO wa_ddddlsrc.
      wa_final-object_name   = wa_ddddlsrc-ddlname.
      wa_final-object_source = wa_ddddlsrc-ddls_source.
      wa_final-devclass      = wa_ddddlsrc-devclass.
      wa_final-object        = wa_ddddlsrc-object.
      APPEND wa_final TO it_final.
      CLEAR : wa_final, wa_ddddlsrc.
    ENDLOOP.
  ENDIF.

  SELECT  x~ddlxname,
          x~source,
          t~devclass,
          t~object
          FROM tadir AS t
          JOIN ddlxsrc_src AS x ON x~ddlxname = t~obj_name
          INTO TABLE @it_ddlx
          WHERE t~pgmid EQ 'R3TR'
            AND t~object EQ 'DDLX'
            AND t~devclass IN @s_dev.
  IF sy-subrc EQ 0.
    LOOP AT it_ddlx INTO wa_ddlx.
      wa_final-object_name   = wa_ddlx-ddlxname.
      wa_final-object_source = wa_ddlx-mdx_source.
      wa_final-devclass      = wa_ddlx-devclass.
      wa_final-object        = wa_ddlx-object.
      APPEND wa_final TO it_final.
      CLEAR : wa_final, wa_ddddlsrc.
    ENDLOOP.
  ENDIF.

  SELECT  s~srvdname,
          s~source,
          t~devclass,
          t~object
          FROM tadir AS t
          JOIN srvdsrc_src AS s ON s~srvdname = t~obj_name
          INTO TABLE @it_srvd
          WHERE t~pgmid EQ 'R3TR'
            AND t~object EQ 'SRVD'
            AND t~devclass IN @s_dev.
  IF sy-subrc EQ 0.
    LOOP AT it_ddddlsrc INTO wa_ddddlsrc.
      wa_final-object_name   = wa_ddddlsrc-ddlname.
      wa_final-object_source = wa_ddddlsrc-ddls_source.
      wa_final-devclass      = wa_ddddlsrc-devclass.
      wa_final-object        = wa_ddddlsrc-object.
      APPEND wa_final TO it_final.
      CLEAR : wa_final, wa_ddddlsrc.
    ENDLOOP.
  ENDIF.

  SELECT  obj_name,
          devclass,
          object
          FROM tadir AS t
          INTO TABLE @it_bdef_1
          WHERE pgmid EQ 'R3TR'
            AND object EQ 'BDEF'
            AND devclass IN @s_dev.
  IF sy-subrc EQ 0.

    LOOP AT it_bdef_1 INTO wa_bdef_1.
      wa_bdef_2-obj_name = wa_bdef_1-obj_name.
      wa_bdef_2-devclass = wa_bdef_1-devclass.

      gv_word_len = strlen( wa_bdef_1-obj_name ).
      DATA(gv_word_differ) = 30 - gv_word_len.
      DATA(gv_word_total) = 32.

      DO gv_word_differ TIMES.
        IF sy-index EQ 1.
          CONCATENATE wa_bdef_1-obj_name '=' INTO wa_bdef_2-progname.
        ELSEIF sy-index GT 1.
          CONCATENATE wa_bdef_2-progname '=' INTO wa_bdef_2-progname.
        ENDIF.
      ENDDO.

      CONCATENATE wa_bdef_2-progname 'BD' INTO wa_bdef_2-progname.

      APPEND wa_bdef_2 TO it_bdef_2.
      CLEAR : wa_bdef_1, wa_bdef_2.
    ENDLOOP.
  ENDIF.

*&---------------------------------------------------------------------*
  """"End of selection
*&---------------------------------------------------------------------*
END-OF-SELECTION.

  LOOP AT it_final INTO wa_final.

    REPLACE ALL OCCURRENCES OF '/' IN wa_final-devclass WITH '-'.
    REPLACE ALL OCCURRENCES OF '/' IN wa_final-object_name WITH '_'.

* Package directories automatically created - enter only master directory name in screen
    IF wa_final-object EQ 'DDLS'.
      CONCATENATE p_path '\' wa_final-devclass '\CDS_DDL\' wa_final-object_name '.txt' INTO gv_filename.
    ENDIF.

    IF wa_final-object EQ 'DDLX'.
      CONCATENATE p_path '\' wa_final-devclass '\MET_EXT\' wa_final-object_name '.txt' INTO gv_filename.
    ENDIF.

    IF wa_final-object EQ 'SRVD'.
      CONCATENATE p_path '\' wa_final-devclass '\SRV_DEF\' wa_final-object_name '.txt' INTO gv_filename.
    ENDIF.

    wa_dd-source = wa_final-object_source.
    APPEND wa_dd TO it_dd.

    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename              = gv_filename
        filetype              = 'ASC'
        write_field_separator = 'X'
      TABLES
        data_tab              = it_dd.

    CLEAR : gv_filename, it_dd, wa_final.

  ENDLOOP.

* behaviour definition - sepearate logic
  LOOP AT it_bdef_2 INTO wa_bdef_2.

    CONCATENATE p_path '\' wa_bdef_2-devclass '\BEH_DEF\' wa_bdef_2-obj_name '.txt' INTO gv_filename.
    READ REPORT wa_bdef_2-progname INTO itab.

    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename              = gv_filename
        filetype              = 'ASC'
        write_field_separator = 'X'
      TABLES
        data_tab              = itab.

    CLEAR : gv_filename, itab, wa_bdef_2.
  ENDLOOP.

  MESSAGE 'ALL THE FILES DOWNLOADED' TYPE 'I'.
  WRITE 'File downloaded successfully'.