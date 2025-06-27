*&---------------------------------------------------------------------*
*& Report ZYA_TRANSPORTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYA_TRANSPORTS LINE-SIZE 200 LINE-COUNT 64 NO STANDARD PAGE HEADING..

*&================================================================
*& DESCRIPTION... Transport tracking program across Productive and
*&                Project systems.
*&
*& USED BY....... < Functionals and Developers. (Basis ??) >
*&================================================================
*& MODIFICATION HISTORY
*& Change ID           :   XXXX (ex. 0001)
*& Date                :   DD/MM/YYYY
*& Changed By          :   <change author>
*& Transport No.       :
*& Incident/Defect ID# :
*&================================================================
*& Description         :
*& Purpose: Simple display of status of selected transports across the
*& development stream, assuming a three tier architecure.
*& Helpful when applying LCPs, HRSPs and during Upgrades to
*& see how far transports have been moved.
*& *
*& Audience: Basis/Development/Support team members.
*& Also to save the trouble with Security mind sets
*
*-----------------------------------------------------------------------
* Constant Declaration
*-----------------------------------------------------------------------
* ------------- First Transport stream (regular development stream)
CONSTANTS:
  c_dev    TYPE tr_target VALUE 'AD2',
  c_qas    TYPE tr_target VALUE 'AQ2',
  c_ppd    TYPE tr_target VALUE 'AR1',   "PreProd
  c_prd    TYPE tr_target VALUE 'AP1',
  c_trkorr TYPE trkorr    VALUE 'AD2K*',
* ------------- Second Transport stream (usually during upgrades)
*
  n_dev    TYPE tr_target VALUE 'AD1',
  n_qas    TYPE tr_target VALUE 'AQ1',
  n_prd    TYPE tr_target VALUE 'AP2',   "Alt Prod
  n_trkorr TYPE trkorr    VALUE 'AD1K*'.
* ------------- DB Table declarations
TABLES: e070, usr01.
*----------------------------------------------------------------------
* T Y P E P O O L S
*----------------------------------------------------------------------
TYPE-POOLS: ctslg,
icon,
slis.
*----------------------------------------------------------------------
* T Y P E S
*----------------------------------------------------------------------
* Data to be displayed
* ------------- Infernal Table - Data declarations
TYPES:
BEGIN OF gtyp_req_info.
*
        INCLUDE TYPE e070.     " Std Transport Info
*
TYPES:
  as4text     TYPE as4text,     " Transport Description
  name_text   TYPE ad_namtext,  " User fullname
  tr_typtext  TYPE val_text,    " Transport Type Text
  tr_stattext TYPE val_text,    " Transport Status Text
*
  dsys       TYPE flag,
  rc1        TYPE trretcode,
  id1        TYPE icon_d,
  qsys       TYPE flag,
  rc2        TYPE trretcode,
  id2        TYPE icon_d,
  pprd       TYPE flag,
  rc6        TYPE trretcode,
  id6        TYPE icon_d,
  psys       TYPE flag,
  rc3        TYPE trretcode,
  id3        TYPE icon_d,
*
  dsys2      TYPE flag,
  rc4        TYPE trretcode,
  id4        TYPE icon_d,
  qsys2      TYPE flag,
  rc5        TYPE trretcode,
  id5        TYPE icon_d,
  psys2      TYPE flag,
  rc7        TYPE trretcode,
  id7        TYPE icon_d,
*
  dev1_4date TYPE as4date, "Dev/Supp Landscape
  dev1_4time TYPE as4time,

  qas1_4date TYPE as4date,
  qas1_4time TYPE as4time,

  pprd_4date TYPE as4date,
  pprd_4time TYPE as4time,

  prd1_4date TYPE as4date,
  prd1_4time TYPE as4time,
*
  dev2_4date TYPE as4date, "Project landscape usually
  dev2_4time TYPE as4time,

  qas2_4date TYPE as4date,
  qas2_4time TYPE as4time,

  prd2_4date TYPE as4date,
  prd2_4time TYPE as4time,
*
  crea_4date TYPE as4date,  "Only populated pre-release step
  crea_4time TYPE as4time,  "Only populated pre-release step
  END OF gtyp_req_info.
*
* Contents of cofiles
TYPES BEGIN OF gv_tran_info.
TYPES trkorr TYPE trkorr.
        INCLUDE TYPE tstrfcofil.
TYPES: as4text TYPE as4text,
       as4user TYPE as4user.
TYPES END OF gv_tran_info.
*-----------------------------------------------------------------------
*  Global Data Declarations.
*-----------------------------------------------------------------------
DATA: t_req_info  TYPE STANDARD TABLE OF gtyp_req_info INITIAL SIZE 25, "#EC NEEDED
      t_tran_info TYPE TABLE OF gv_tran_info,               "#EC NEEDED
      gt_tr_log   TYPE STANDARD TABLE OF gv_tran_info,      "#EC NEEDED
      gt_comm_sys TYPE tmscsyslst_typ,                      "#EC NEEDED
      gt_fieldcat TYPE slis_t_fieldcat_alv,                 "#EC NEEDED
      gv_variant  TYPE disvariant.                          "#EC NEEDED
*
*&--------------------------------------------------------------------&*

*&---------------------------------------------------------------------*
*& Top of Page - N/A with ALV.
*&---------------------------------------------------------------------*
*
*&---------------------------------------------------------------------*
*& end of Page - N/A with ALV.
*&---------------------------------------------------------------------*
*
*&---------------------------------------------------------------------*
*&  Selection Screen
*&---------------------------------------------------------------------*
*&  start primary selection screen
*&--------------------------------------------------------------------&*
* text-001 = Selections
* da_Date = Selection Date(s)
SELECTION-SCREEN: BEGIN OF BLOCK da1 WITH FRAME TITLE text-001.
SELECT-OPTIONS da_date FOR e070-as4date.
SELECT-OPTIONS: st_user FOR usr01-bname MATCHCODE OBJECT user_comp,
st_tran FOR e070-trkorr.
SELECTION-SCREEN ULINE.
SELECT-OPTIONS: st_stat FOR e070-trstatus NO INTERVALS,
                st_func FOR e070-trfunction NO INTERVALS.
SELECTION-SCREEN: END OF BLOCK da1.
* text-003 = Report Options
SELECTION-SCREEN: BEGIN OF BLOCK oth WITH FRAME TITLE text-003.
* text-004 = Show only those not in Prod
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(32) text-004 FOR FIELD st_filt.
SELECTION-SCREEN POSITION POS_LOW.
PARAMETERS: st_filt AS CHECKBOX DEFAULT ' '.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN ULINE.
* text-005 = Sort by Release Date/Time
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(32) text-005 FOR FIELD st_srt1.
SELECTION-SCREEN POSITION POS_LOW.
PARAMETERS: st_srt1 RADIOBUTTON GROUP srts DEFAULT 'X'.
SELECTION-SCREEN END OF LINE.
* text-006 = Sort by Transport Number
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(32) text-006 FOR FIELD st_srt2.
SELECTION-SCREEN POSITION POS_LOW.
PARAMETERS: st_srt2 RADIOBUTTON GROUP srts.
SELECTION-SCREEN END OF LINE.
* text-007 = Format for Spreadsheet
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(32) text-007 FOR FIELD st_form.
SELECTION-SCREEN POSITION POS_LOW.
PARAMETERS: st_form AS CHECKBOX DEFAULT 'X'.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN ULINE.
* text-008 = Show Process log
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(32) text-008 FOR FIELD st_show.
SELECTION-SCREEN POSITION POS_LOW.
PARAMETERS: st_show AS CHECKBOX DEFAULT ' '.
SELECTION-SCREEN END OF LINE.
* text-047 = grab User name
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(32) text-tna FOR FIELD st_name.
SELECTION-SCREEN POSITION POS_LOW.
PARAMETERS: st_name AS CHECKBOX DEFAULT 'X'.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN ULINE.
SELECTION-SCREEN PUSHBUTTON /24(12) text-sys
USER-COMMAND sys_set
VISIBLE LENGTH 10.
SELECTION-SCREEN END OF BLOCK oth.
*
SELECTION-SCREEN BEGIN OF BLOCK b_var WITH FRAME TITLE text-var. "Variant
PARAMETERS: p_varnh TYPE disvariant-variant.
SELECTION-SCREEN END OF BLOCK b_var.
* end of Main selection screen
*
*&---------------------------------------------------------------------*
*&  start Settings selection screen
*&--------------------------------------------------------------------&*
SELECTION-SCREEN BEGIN OF SCREEN 0500 TITLE text-sys AS WINDOW.
* ------------- First Transport stream (regular development stream)
SELECTION-SCREEN: BEGIN OF BLOCK set1 WITH FRAME TITLE text-ops.
PARAMETERS: p_dev1 TYPE tr_target,
            p_qas1 TYPE tr_target,
            p_pprd TYPE tr_target,
            p_prd1 TYPE tr_target,
            p_trk1 TYPE trkorr,
            p_chk1 TYPE flag AS CHECKBOX DEFAULT 'X'.
SELECTION-SCREEN PUSHBUTTON /24(12) text-cl1
USER-COMMAND clr_one
VISIBLE LENGTH 10.
SELECTION-SCREEN PUSHBUTTON /24(12) text-se1
USER-COMMAND set_one
VISIBLE LENGTH 10.
SELECTION-SCREEN: END OF BLOCK set1.
*
* ------------- Second Transport stream (usually during Upgrades or Projects)
SELECTION-SCREEN: BEGIN OF BLOCK set2 WITH FRAME TITLE text-prj.
PARAMETERS: p_dev2 TYPE tr_target,
            p_qas2 TYPE tr_target,
            p_prd2 TYPE tr_target,
            p_trk2 TYPE trkorr,
            p_chk2 TYPE flag AS CHECKBOX DEFAULT space.
SELECTION-SCREEN PUSHBUTTON /24(12) text-cl2
USER-COMMAND clr_two
VISIBLE LENGTH 10.
SELECTION-SCREEN PUSHBUTTON /24(12) text-se2
USER-COMMAND set_two
VISIBLE LENGTH 10.
SELECTION-SCREEN: END OF BLOCK set2.

SELECTION-SCREEN END OF SCREEN 0500.
* end of selection screens

*&---------------------------------------------------------------------*
*& Initialization
*&---------------------------------------------------------------------*
*
INITIALIZATION.
*
  DATA: lv_da_date LIKE LINE OF da_date,                    "#EC NEEDED
        lv_st_stat LIKE LINE OF st_stat,
        lv_st_func LIKE LINE OF st_func.
*
  lv_da_date-low = sy-datum.
  lv_da_date-low+6(2) = '01'.   "First of month
  lv_da_date-high = sy-datum.   "To today.
  APPEND lv_da_date TO da_date.
*
  lv_st_stat-option = 'EQ'.
  lv_st_stat-sign = 'I'.
  lv_st_stat-low = 'O'.         "Release Started
  APPEND lv_st_stat TO st_stat.
  lv_st_stat-low = 'R'.         "Released
  APPEND lv_st_stat TO st_stat.
  lv_st_stat-low = 'N'.         "Released (with Import Protection for Repaired Objects)
  APPEND lv_st_stat TO st_stat.
*
  lv_st_func-option = 'EQ'.
  lv_st_func-sign = 'I'.
  lv_st_func-low = 'K'.         "Workbench Request
  APPEND lv_st_func TO st_func.
  lv_st_func-option = 'EQ'.
  lv_st_func-sign = 'I'.
  lv_st_func-low = 'W'.         "Customizing Request
  APPEND lv_st_func TO st_func.
  lv_st_func-option = 'EQ'.
  lv_st_func-sign = 'I'.
  lv_st_func-low = 'T'.         "Transport of Copies
  APPEND lv_st_func TO st_func.
  lv_st_func-option = 'EQ'.
  lv_st_func-sign = 'I'.
  lv_st_func-low = 'S'.         "Development/Correction
  APPEND lv_st_func TO st_func.
  lv_st_func-option = 'EQ'.
  lv_st_func-sign = 'I'.
  lv_st_func-low = 'R'.         "Repair Request
  APPEND lv_st_func TO st_func.
*
  PERFORM set_prime. "Dev Stream*
*
  gv_variant-report = sy-repid.
*
*&---------------------------------------------------------------------*
*& At selection-screen
*&---------------------------------------------------------------------*
* Items to help with Selection
*------------------------------------------------------
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_varnh.
  PERFORM f4_display_variant USING p_varnh gv_variant.
*
AT SELECTION-SCREEN.
  PERFORM validate_variant USING p_varnh 'P_VARNH' gv_variant.
*
  CASE sy-ucomm.
    WHEN 'SYS_SET' .
      CALL SELECTION-SCREEN '0500'.
    WHEN 'CLR_ONE' .
      DELETE st_tran WHERE low = c_trkorr.
      CLEAR: p_dev1, p_qas1, p_pprd, p_prd1, p_trk1, p_chk1.
    WHEN 'CLR_TWO' .
      DELETE st_tran WHERE low = n_trkorr.
      CLEAR: p_dev2, p_qas2, p_prd2, p_trk2, p_chk2.
    WHEN 'SET_ONE' .
      PERFORM set_prime.
    WHEN 'SET_TWO' .
      PERFORM set_second.
    WHEN OTHERS.
*     Do Nothing...
  ENDCASE.
*
*&---------------------------------------------------------------------*
*& Start of Selection
*&---------------------------------------------------------------------*
*
START-OF-SELECTION.
*
  CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
    EXPORTING
      percentage = 0
      text       = 'Reading data...'(rdt).
*
* Grab data for specified user(s)
  IF NOT ( st_user-low IS INITIAL ).
    SELECT * FROM e070 APPENDING CORRESPONDING FIELDS OF TABLE t_req_info
    WHERE trkorr   IN st_tran
      AND trfunction IN st_func
      AND trstatus  IN st_stat
      AND tarsystem NE space
      AND as4user   IN st_user
      AND as4date   IN da_date ##TOO_MANY_ITAB_FIELDS  .
* Grab data for ALL valid users
  ELSE.
    SELECT * FROM e070 APPENDING CORRESPONDING FIELDS OF TABLE t_req_info
    WHERE trkorr   IN st_tran
      AND trfunction IN st_func
      AND trstatus  IN st_stat
      AND tarsystem NE space
      AND as4date   IN da_date    ##TOO_MANY_ITAB_FIELDS.
  ENDIF.
*
*&---------------------------------------------------------------------*
*& End of selection
*&---------------------------------------------------------------------*
*
END-OF-SELECTION.
*
  PERFORM load_sys_set.
*
  PERFORM proc_itab.
*
  CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
    EXPORTING
      percentage = 0
      text       = 'Processing completed.'(pct).
*  MESSAGE s526(kj) WITH ''.       "Processing completed
*
  PERFORM disp_alv.
*
  IF st_show = 'X'.
    PERFORM write_log.
  ENDIF.
*
*---------------------------------------------------------------------*
* End of actual Program Logic
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*
*& Forms
*---------------------------------------------------------------------*
*
*&---------------------------------------------------------------------*
*& Form GET_DET
*&---------------------------------------------------------------------*
* Grab the Transport details from the system
*----------------------------------------------------------------------*
FORM get_det
       USING lt_set_sys TYPE sysnames
       CHANGING p_req_info TYPE gtyp_req_info
  . "LIKE l_req_info.
*
* Contents of cofiles
  DATA lt_tran_info TYPE STANDARD TABLE OF gv_tran_info INITIAL SIZE 15.
*
  DATA: ls_user      TYPE e070-as4user,
        ls_system    TYPE ctslg_system,
        ls_step      TYPE ctslg_step,
        ls_action    TYPE ctslg_action,
        ls_settings  TYPE ctslg_settings,
        ls_line_no   TYPE ddposition,
        ls_switch    TYPE flag VALUE space,
*
        lv_tran_info TYPE gv_tran_info, "TYPE tstrfcofil,
*        lv_set_sys  TYPE trsysname,
*        lv_comm_sys TYPE tmscsyslst,
*
        lt_cofiles   TYPE ctslg_cofile,
        lt_systems   TYPE ctslg_systems,
        lt_steps     TYPE ctslg_steps,
        lt_actions   TYPE ctslg_actions.
*        lt_set_sys TYPE sysnames.
*------------------------------------------
  CLEAR:
  lt_tran_info, p_req_info-rc1, p_req_info-rc2, p_req_info-rc3,
  p_req_info-rc4, p_req_info-rc5, p_req_info-rc6, p_req_info-rc7.
*
  REFRESH lt_tran_info.
*------------------------------------------
  CLEAR ls_settings-error_level.
*  LOOP AT gt_comm_sys INTO lv_comm_sys.
*    lv_set_sys-name = lv_comm_sys-sysnam.
*    APPEND lv_set_sys TO lt_set_sys.
*  ENDLOOP.
*
  ls_settings-point_to_missing_steps = 'X'.
  ls_settings-detailed_depiction = 'X'.
  ls_settings-systems = lt_set_sys.
*
  CALL FUNCTION 'TR_READ_GLOBAL_INFO_OF_REQUEST'
    EXPORTING
      iv_trkorr       = p_req_info-trkorr
      iv_dir_type     = 'T'
      is_settings     = ls_settings
*     IV_SUPPRESS_DELETED_STEPS = ' '
      it_comm_systems = gt_comm_sys
    IMPORTING
      es_cofile       = lt_cofiles
      ev_user         = ls_user.
*
  IF lt_cofiles-exists <> 'X'.
    RETURN.
  ENDIF.
*
  lt_systems = lt_cofiles-systems.
  CLEAR ls_line_no.
*
  LOOP AT lt_systems INTO ls_system.
    lt_steps = ls_system-steps.
    LOOP AT lt_steps INTO ls_step.
      lt_actions = ls_step-actions.
      LOOP AT lt_actions INTO ls_action.
        CLEAR lv_tran_info.
        ADD 1 TO ls_line_no.
        lv_tran_info-trkorr = p_req_info-trkorr.
        lv_tran_info-tarsystem = ls_system-systemid.
        lv_tran_info-tarclient = ls_step-clientid.
        lv_tran_info-function = ls_step-stepid.
        lv_tran_info-retcode = ls_action-rc.
        lv_tran_info-trdate = ls_action-date.
        lv_tran_info-trtime = ls_action-time.
        lv_tran_info-osuser = ls_user.
        lv_tran_info-host = sy-host.
        lv_tran_info-lineoffile = ls_line_no.
        APPEND lv_tran_info TO lt_tran_info.
      ENDLOOP.
    ENDLOOP.
  ENDLOOP.
*
  SORT lt_tran_info BY tarsystem trdate trtime.
*
  SET LOCALE LANGUAGE sy-langu.
  LOOP AT lt_tran_info INTO lv_tran_info.
* TRANSLATE gv_tran_info-function TO UPPER CASE.
* Ignore selection for Import step(s).
    IF lv_tran_info-function = 'r' OR
    lv_tran_info-function = '<' OR
    lv_tran_info-function = 'P' OR
    lv_tran_info-function = 'f'.
      ls_switch = space.
    ELSE.
      ls_switch = 'X'.
    ENDIF.
    IF ls_switch = 'X'.
* Process othe codes...
      CASE lv_tran_info-tarsystem.
        WHEN p_dev1.
          p_req_info-dsys = 'X'.
          MOVE lv_tran_info-retcode TO p_req_info-rc1.
          IF lv_tran_info-function = 'E'. "Export
            MOVE lv_tran_info-trdate TO p_req_info-as4date.
            MOVE lv_tran_info-trtime TO p_req_info-as4time.
            MOVE lv_tran_info-trdate TO p_req_info-dev1_4date.
            MOVE lv_tran_info-trtime TO p_req_info-dev1_4time.
          ENDIF.

        WHEN p_dev2.
          p_req_info-dsys2 = 'X'.
          MOVE lv_tran_info-retcode TO p_req_info-rc4.
          IF ( lv_tran_info-function = 'E' or lv_tran_info-function = 'I' ) and p_req_info-dev2_4date is initial. "Export
            MOVE lv_tran_info-trdate TO p_req_info-dev2_4date.
            MOVE lv_tran_info-trtime TO p_req_info-dev2_4time.
          ENDIF.
*
        WHEN p_qas1.
          p_req_info-qsys = 'X'.
          MOVE lv_tran_info-retcode TO p_req_info-rc2.
          IF lv_tran_info-function = 'I'.
            MOVE lv_tran_info-trdate TO p_req_info-qas1_4date.
            MOVE lv_tran_info-trtime TO p_req_info-qas1_4time.
          ENDIF.
        WHEN p_qas2.
          p_req_info-qsys2 = 'X'.
          MOVE lv_tran_info-retcode TO p_req_info-rc5.
          IF lv_tran_info-function = 'I'.
            MOVE lv_tran_info-trdate TO p_req_info-qas2_4date.
            MOVE lv_tran_info-trtime TO p_req_info-qas2_4time.
          ENDIF.
*
        WHEN p_pprd.
          p_req_info-pprd = 'X'.
          MOVE lv_tran_info-retcode TO p_req_info-rc6.
          IF lv_tran_info-function = 'I'.
            MOVE lv_tran_info-trdate TO p_req_info-pprd_4date.
            MOVE lv_tran_info-trtime TO p_req_info-pprd_4time.
          ENDIF.
*
        WHEN p_prd1.
          p_req_info-psys = 'X'.
          MOVE lv_tran_info-retcode TO p_req_info-rc3.
          IF lv_tran_info-function = 'I'.
            MOVE lv_tran_info-trdate TO p_req_info-prd1_4date.
            MOVE lv_tran_info-trtime TO p_req_info-prd1_4time.
          ENDIF.
        WHEN p_prd2.
          p_req_info-psys2 = 'X'.
          MOVE lv_tran_info-retcode TO p_req_info-rc7.
          IF lv_tran_info-function = 'I'.
            MOVE lv_tran_info-trdate TO p_req_info-prd2_4date.
            MOVE lv_tran_info-trtime TO p_req_info-prd2_4time.
          ENDIF.
        WHEN OTHERS.
          " Do noting...
      ENDCASE.
* modify gt_req_info from p_req_info.
    ENDIF.
*
  ENDLOOP.
*
  APPEND LINES OF lt_tran_info TO t_tran_info.
*
ENDFORM. " GET_DET
**&---------------------------------------------------------------------*
**& Form ALV_TOP_OF_PAGE
**&---------------------------------------------------------------------*
** text
**----------------------------------------------------------------------*
** --> p1 text
** <-- p2 text
**----------------------------------------------------------------------*
*
*FORM alv_top_of_page.
**
* DATA: lt_header TYPE TABLE OF slis_listheader,
* ls_header TYPE slis_listheader,
* ld_lines TYPE i,
* ld_clines TYPE char10,
* ld_text TYPE char50,
* ld_cdate1 TYPE char10,
* ld_cdate2 TYPE char10.
*
** Title
* CLEAR ls_header.
* ls_header-typ = 'H'.
* ls_header-info = sy-title. "'Transports'. "Update Mode
* APPEND ls_header TO lt_header.
*
** Date range.
* CLEAR ls_header.
* ls_header-typ = 'S'.
* WRITE da_date-low TO ld_cdate1.
* WRITE da_date-high TO ld_cdate2.
* CONCATENATE ld_cdate1 ' - ' ld_cdate2 INTO ls_header-info.
* APPEND ls_header TO lt_header.
*
** Get a count of how many transport objects were processed
* DESCRIBE TABLE t_req_info LINES ld_lines.
* ld_clines = ld_lines. "Char conversion
* CONCATENATE 'CRs Read' space ld_clines INTO ld_text.
** Total records processed
* CLEAR ls_header.
* ls_header-typ = 'S'.
* ls_header-info = ld_text.
* APPEND ls_header TO lt_header.
*
** Write the header
* CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
* EXPORTING
* it_list_commentary = lt_header.
**
*ENDFORM. "ALV_TOP_OF_PAGE
*&---------------------------------------------------------------------*
*& Form set_layout
*&---------------------------------------------------------------------*
* text
*----------------------------------------------------------------------*
FORM set_layout
    CHANGING lv_layout TYPE slis_layout_alv
             lv_print TYPE slis_print_alv.
* Eingabebereit
*
* Set layout options
  lv_layout-colwidth_optimize = 'X'.
* lv_layout-box_fieldname = ''.
  lv_layout-detail_popup = 'X'.
  lv_layout-confirmation_prompt = ' '.
  lv_layout-detail_titlebar = 'Detail'(det).
  lv_layout-zebra = 'X'.
  lv_layout-edit = ''.
  lv_layout-edit_mode = ''.
  lv_layout-no_input = 'X'.
  lv_layout-get_selinfos = 'X'.
  lv_layout-window_titlebar = sy-title.
*
* set print controls.
  lv_print-print = ''. "Send directly to printing
  lv_print-prnt_title = 'X'.
  lv_print-footline = ''.
  lv_print-prnt_info = ''.
  lv_print-no_print_selinfos = 'X'.
  lv_print-no_coverpage = ''.
  lv_print-no_new_page = ''.
  lv_print-reserve_lines = ''.
  lv_print-no_print_listinfos = 'X'.
  lv_print-no_change_print_params = ''.
  lv_print-no_print_hierseq_item = ''.
*
ENDFORM. " set_layout
*&---------------------------------------------------------------------*
*& Form f4_display_variant
*&---------------------------------------------------------------------*
* text
*----------------------------------------------------------------------*
FORM f4_display_variant USING p_var TYPE disvariant-variant
p_variant TYPE disvariant.
  DATA: l_exit    TYPE c,
        l_variant TYPE disvariant.

  CALL FUNCTION 'REUSE_ALV_VARIANT_F4'
    EXPORTING
      is_variant = p_variant
      i_save     = 'A'
    IMPORTING
      e_exit     = l_exit
      es_variant = l_variant
    EXCEPTIONS
      not_found  = 2.
  IF sy-subrc = 2.
    MESSAGE s010(oq_e) WITH l_variant-variant.
* ALV Display Variant & does not exist
  ELSE.
    IF l_exit = space.
      p_var = l_variant-variant.
    ENDIF.
  ENDIF.

ENDFORM. " F4_Display_VARIANT
*&---------------------------------------------------------------------*
*& Form init_var
*&---------------------------------------------------------------------*
* Initalize Variant parameter values
*----------------------------------------------------------------------*
FORM init_var USING p_var TYPE disvariant-variant.
*
  IF NOT ( p_var IS INITIAL ).
    gv_variant-variant = p_var.
  ENDIF.
*
ENDFORM. "init_var
*&---------------------------------------------------------------------*
*& Form Validate_variant
*&---------------------------------------------------------------------*
* text
*----------------------------------------------------------------------*
FORM validate_variant USING p_var TYPE disvariant-variant
p_field TYPE char8
p_variant TYPE disvariant.
  IF NOT p_var IS INITIAL.
    SET CURSOR FIELD p_field.
    MOVE p_var TO p_variant-variant.

    CALL FUNCTION 'REUSE_ALV_VARIANT_EXISTENCE'
      EXPORTING
        i_save     = 'A'
      CHANGING
        cs_variant = p_variant.
  ENDIF.
ENDFORM. "Validate_variant
*&---------------------------------------------------------------------*
*& Form set_field_catalog
*&---------------------------------------------------------------------*
* load the layout components of the ALV display
*----------------------------------------------------------------------*
FORM set_field_catalog.
*
  DATA:
    l_tabname   TYPE slis_tabname VALUE 'T_REQ_INFO',
    l_longtext  TYPE scrtext_l,
    l_txtdate   TYPE scrtext_l,
    l_txttime   TYPE scrtext_l,
    lc_date     TYPE c LENGTH 4 VALUE 'Date',               "#EC NOTEXT
    lc_time     TYPE c LENGTH 4  VALUE 'Time',              "#EC NOTEXT
    lv_fieldcat TYPE slis_fieldcat_alv.
*
* PERFORM set_fieldcat_table USING l_desc l_table l_field lv_pos l_row l_leng l_switch l_tabname.
  PERFORM set_fieldcat_table
  USING:
    'Rel. Date' 'E070' 'AS4DATE' '' '1' '1' '10' 'K' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'Transport' 'E070' 'TRKORR' '' '2' '1' '20' 'L' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'Rel. Time' 'E070' 'AS4TIME' '' '3' '1' '8' '' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'TR. Func' 'E070' 'TRFUNCTION' '' '4' '1' '1' '' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'TR. Stat' 'E070' 'TRSTATUS' '' '5' '1' '1' '' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'TR. Sys' 'E070' 'TARSYSTEM' '' '6' '1' '10' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'Korr.Dev' 'E070' 'KORRDEV' '' '7' '1' '4' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'Higher Req.' 'E070' 'STRKORR' '' '8' '1' '20' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'Description' 'E07T' 'AS4TEXT' '' '9' '1' '60' '' l_tabname CHANGING lv_fieldcat. "#EC NOTEXT
*
  IF st_name = 'X'.
    PERFORM set_fieldcat_table
    USING:
      'TR. User' 'E070' 'AS4USER' '' '10' '1' '12' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
      'User' 'ADRP' 'NAME_TEXT' '' '11' '1' '20' '' l_tabname CHANGING lv_fieldcat. "#EC NOTEXT
  ELSE.
    PERFORM set_fieldcat_table
    USING:
      'TR. User' 'E070' 'AS4USER' '' '10' '1' '12' '' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
      'User' 'ADRP' 'NAME_TEXT' '' '11' '1' '20' 'I' l_tabname CHANGING lv_fieldcat. "#EC NOTEXT
  ENDIF.
*
* Sustainment path Systems
*
* Prime Development System
  MOVE p_dev1 TO l_longtext.  CONDENSE l_longtext.
  CONCATENATE p_dev1 lc_date INTO l_txtdate. CONDENSE l_txtdate.
  CONCATENATE p_dev1 lc_time INTO l_txttime. CONDENSE l_txttime.
  PERFORM set_fieldcat_table
  USING: 'Dev1' 'E071' 'DSYS' 'LOCKFLAG' '12' '1' '2' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
  'Dev RC' 'STMSIQREQ' 'RC1' 'MAXRC' '13' '1' '4' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
  l_longtext 'ICON' 'ID1' 'ID' '14' '1' '5' 'X' l_tabname CHANGING lv_fieldcat,
  l_txtdate 'E070' 'DEV1_4DATE' 'AS4DATE' '33' '1' '10' 'I' l_tabname CHANGING lv_fieldcat,
  l_txttime 'E070' 'DEV1_4TIME' 'AS4TIME' '34' '1' '8' 'I' l_tabname CHANGING lv_fieldcat.
*
* Prime Quality Assurance System
  MOVE p_qas1 TO l_longtext.  CONDENSE l_longtext.
  CONCATENATE p_qas1 lc_date INTO l_txtdate. CONDENSE l_txtdate.
  CONCATENATE p_qas1 lc_time INTO l_txttime. CONDENSE l_txttime.
  PERFORM set_fieldcat_table
  USING: 'QA' 'E071' 'QSYS' 'LOCKFLAG' '15' '1' '2' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
  'QA RC' 'STMSIQREQ' 'RC2' 'MAXRC' '16' '1' '4' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
  l_longtext 'ICON' 'ID2' 'ID' '17' '1' '5' 'X' l_tabname CHANGING lv_fieldcat,
  l_txtdate 'E070' 'QAS1_4DATE' 'AS4DATE' '35' '1' '10' 'N' l_tabname CHANGING lv_fieldcat,
  l_txttime 'E070' 'QAS1_4TIME' 'AS4TIME' '36' '1' '8' 'N' l_tabname CHANGING lv_fieldcat.
*
* Pre-Productive System
  IF p_pprd = space OR p_pprd IS INITIAL.
    PERFORM set_fieldcat_table
    USING: 'PPD' 'E071' 'PPRD' 'LOCKFLAG' '18' '1' '2' 'I' l_tabname CHANGING lv_fieldcat,
    'PPRD' 'STMSIQREQ' 'RC6' 'MAXRC' '19' '1' '4' 'I' l_tabname CHANGING lv_fieldcat,
    'PPRD RC' 'ICON' 'ID6' 'ID' '20' '1' '4' 'I' l_tabname CHANGING lv_fieldcat,
    'PPRD Date' 'E070' 'pprd_4DATE' 'AS4DATE' '37' '1' '10' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'PPRD Time' 'E070' 'pprd_4TIME' 'AS4TIME' '38' '1' '8' 'I' l_tabname CHANGING lv_fieldcat. "#EC NOTEXT
  ELSE.
    MOVE p_pprd TO l_longtext.  CONDENSE l_longtext.
    CONCATENATE p_pprd lc_date INTO l_txtdate. CONDENSE l_txtdate.
    CONCATENATE p_pprd lc_time INTO l_txttime. CONDENSE l_txttime.
    PERFORM set_fieldcat_table
    USING: 'PPD' 'E071' 'PPRD' 'LOCKFLAG' '18' '1' '2' 'I' l_tabname CHANGING lv_fieldcat,
    'PPRD RC' 'STMSIQREQ' 'RC6' 'MAXRC' '19' '1' '4' 'I' l_tabname CHANGING lv_fieldcat,
    l_longtext 'ICON' 'ID6' 'ID' '20' '1' '4' 'X' l_tabname CHANGING lv_fieldcat,
    l_txtdate 'E070' 'pprd_4DATE' 'AS4DATE' '37' '1' '10' 'N' l_tabname CHANGING lv_fieldcat,
    l_txttime 'E070' 'pprd_4TIME' 'AS4TIME' '38' '1' '8' 'N' l_tabname CHANGING lv_fieldcat.
  ENDIF.
*
* Productive System
  MOVE p_prd1 TO l_longtext.  CONDENSE l_longtext.
  CONCATENATE p_prd1 lc_date INTO l_txtdate. CONDENSE l_txtdate.
  CONCATENATE p_prd1 lc_time INTO l_txttime. CONDENSE l_txttime.
  PERFORM set_fieldcat_table
  USING: 'Prd' 'E071' 'PSYS' 'LOCKFLAG' '21' '1' '2' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
  'PRD RC' 'STMSIQREQ' 'RC3' 'MAXRC' '22' '1' '4' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
  l_longtext 'ICON' 'ID3' 'ID' '23' '1' '5' 'X' l_tabname CHANGING lv_fieldcat,
  l_txtdate 'E070' 'PRD1_4DATE' 'AS4DATE' '39' '1' '10' 'N' l_tabname CHANGING lv_fieldcat,
  l_txttime 'E070' 'PRD1_4TIME' 'AS4TIME' '40' '1' '8' 'N' l_tabname CHANGING lv_fieldcat.
*
*
* Project path Systems
  IF p_dev2 = space OR p_dev2 IS INITIAL.
    PERFORM set_fieldcat_table
    USING: 'Dev2' 'E071' 'DSYS2' 'LOCKFLAG' '24' '1' '2' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'D2RT' 'STMSIQREQ' 'RC4' 'MAXRC' '25' '1' '4' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'Dev2 RC' 'ICON' 'ID4' 'ID' '26' '1' '5' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'Dev2Date' 'E070' 'DEV2_4DATE' 'AS4DATE' '41' '1' '10' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'Dev2Time' 'E070' 'DEV2_4TIME' 'AS4TIME' '42' '1' '8' 'I' l_tabname CHANGING lv_fieldcat. "#EC NOTEXT
  ELSE.
    MOVE p_dev2 TO l_longtext.  CONDENSE l_longtext.
    CONCATENATE p_dev2 lc_date INTO l_txtdate. CONDENSE l_txtdate.
    CONCATENATE p_dev2 lc_time INTO l_txttime. CONDENSE l_txttime.
    PERFORM set_fieldcat_table
    USING: 'Dev2' 'E071' 'DSYS2' 'LOCKFLAG' '24' '1' '2' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'Dev2 RC' 'STMSIQREQ' 'RC4' 'MAXRC' '25' '1' '4' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    l_longtext 'ICON' 'ID4' 'ID' '26' '1' '5' 'X' l_tabname CHANGING lv_fieldcat,
    l_txtdate 'E070' 'DEV2_4DATE' 'AS4DATE' '41' '1' '10' 'N' l_tabname CHANGING lv_fieldcat,
    l_txttime 'E070' 'DEV2_4TIME' 'AS4TIME' '42' '1' '8' 'N' l_tabname CHANGING lv_fieldcat.
  ENDIF.
*
  IF p_qas2 = space OR p_qas2 IS INITIAL.
    PERFORM set_fieldcat_table
    USING: 'QA2' 'E071' 'QSYS2' 'LOCKFLAG' '27' '1' '2' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'Q2RT' 'STMSIQREQ' 'RC5' 'MAXRC' '28' '1' '4' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'QA2 RC' 'ICON' 'ID5' 'ID' '29' '1' '5' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'QA2 Date' 'E070' 'QAS2_4DATE' 'AS4DATE' '43' '1' '10' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'QA2 Time' 'E070' 'QAS2_4TIME' 'AS4TIME' '44' '1' '8' 'I' l_tabname CHANGING lv_fieldcat. "#EC NOTEXT
  ELSE.
    MOVE p_qas2 TO l_longtext.  CONDENSE l_longtext.
    CONCATENATE p_qas2 lc_date INTO l_txtdate. CONDENSE l_txtdate.
    CONCATENATE p_qas2 lc_time INTO l_txttime. CONDENSE l_txttime.
    PERFORM set_fieldcat_table
    USING: 'QA2' 'E071' 'QSYS2' 'LOCKFLAG' '27' '1' '2' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'QA2 RC' 'STMSIQREQ' 'RC5' 'MAXRC' '28' '1' '4' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    l_longtext 'ICON' 'ID5' 'ID' '29' '1' '5' 'X' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    l_txtdate 'E070' 'QAS2_4DATE' 'AS4DATE' '43' '1' '10' 'N' l_tabname CHANGING lv_fieldcat,
    l_txttime 'E070' 'QAS2_4TIME' 'AS4TIME' '44' '1' '8' 'N' l_tabname CHANGING lv_fieldcat.
  ENDIF.
*
  IF p_prd2 = space OR p_prd2 IS INITIAL.
    PERFORM set_fieldcat_table
    USING: 'Prd2' 'E071' 'PSYS2' 'LOCKFLAG' '30' '1' '2' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'P2RT' 'STMSIQREQ' 'RC7' 'MAXRC' '31' '1' '4' 'I' l_tabname CHANGING lv_fieldcat,
    'PRD2 RC' 'ICON' 'ID7' 'ID' '32' '1' '5' 'I' l_tabname CHANGING lv_fieldcat,
    'PRD2 Date' 'E070' 'PRD2_4DATE' 'AS4DATE' '45' '1' '10' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'PRD2 Time' 'E070' 'PRD2_4TIME' 'AS4TIME' '46' '1' '8' 'I' l_tabname CHANGING lv_fieldcat. "#EC NOTEXT
  ELSE.
    MOVE p_prd2 TO l_longtext.  CONDENSE l_longtext.
    CONCATENATE p_prd2 lc_date INTO l_txtdate. CONDENSE l_txtdate.
    CONCATENATE p_prd2 lc_time INTO l_txttime. CONDENSE l_txttime.
    PERFORM set_fieldcat_table
    USING: 'Prd2' 'E071' 'PSYS2' 'LOCKFLAG' '30' '1' '2' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
    'PRD2 RC' 'STMSIQREQ' 'RC7' 'MAXRC' '31' '1' '4' 'I' l_tabname CHANGING lv_fieldcat,
    l_longtext 'ICON' 'ID7' 'ID' '32' '1' '5' 'X' l_tabname CHANGING lv_fieldcat,
    l_txtdate 'E070' 'PRD2_4DATE' 'AS4DATE' '45' '1' '10' 'N' l_tabname CHANGING lv_fieldcat,
    l_txttime 'E070' 'PRD2_4TIME' 'AS4TIME' '46' '1' '8' 'N' l_tabname CHANGING lv_fieldcat.
  ENDIF.
*
* Transport Create Date & Time - Only available on unreleased transports
  PERFORM set_fieldcat_table
  USING: 'Create_Date' 'E070' 'CREA_4DATE' 'AS4DATE' '47' '1' '10' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
  'Create_Time' 'E070' 'CREA_4TIME' 'AS4TIME' '48' '1' '8' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT
  'TR Type' 'DD07T' 'TR_TYPTEXT' 'DDTEXT' '49' '1' '20' 'I' l_tabname CHANGING lv_fieldcat, "#EC NOTEXT    "* Set the Text for tr Type & Status
  'TR Stat' 'DD07T' 'TR_STATTEXT' 'DDTEXT' '50' '1' '20' 'I' l_tabname CHANGING lv_fieldcat. "#EC NOTEXT

  SORT gt_fieldcat BY row_pos col_pos.
*
ENDFORM. "set_field_catalog
*&---------------------------------------------------------------------*
*& Form set_fieldcat_table
*&---------------------------------------------------------------------*
* form that actually loads field layout for ALV to use
*----------------------------------------------------------------------*
FORM set_fieldcat_table USING
      p_longtext TYPE scrtext_l
      p_ref_name TYPE tabname
      p_fieldname TYPE fieldname
      p_ref_field TYPE fieldname
      p_column TYPE tabfdpos
      p_row TYPE sycurow
      p_len TYPE ddleng
      p_switch TYPE c
      p_tabname TYPE slis_tabname
      CHANGING pv_fieldcat TYPE slis_fieldcat_alv.
*
  DATA: "gv_fieldcat TYPE slis_fieldcat_alv,
    l_fieldname TYPE fieldname,
*    l_ref_field TYPE fieldname,
    l_switch    TYPE c.
*
  CLEAR pv_fieldcat.
*
  l_fieldname = p_fieldname.
  l_switch = p_switch.
*
  SET LOCALE LANGUAGE sy-langu.
  TRANSLATE: l_fieldname TO UPPER CASE, " must be caps.
  l_switch TO UPPER CASE.
*
* Reference Table Name
  IF NOT p_ref_name IS INITIAL.
    pv_fieldcat-ref_tabname = p_ref_name.
  ENDIF.
* Reference Field Name
  IF NOT p_ref_field IS INITIAL.
    pv_fieldcat-ref_fieldname = p_ref_field.
  ELSE.
    pv_fieldcat-ref_fieldname = l_fieldname.
  ENDIF.
*
*Reference type/field name
  pv_fieldcat-fieldname = l_fieldname.
  pv_fieldcat-col_pos = p_column.
  pv_fieldcat-row_pos = p_row.
* Display length over-ride
  IF p_len > 0.
    pv_fieldcat-outputlen = p_len.
  ENDIF.
* Text label over-ride
  IF NOT p_longtext IS INITIAL.
    pv_fieldcat-seltext_l = p_longtext.
    if p_ref_field = 'ID'.
      pv_fieldcat-ddictxt = 'L'.
    else.
      clear pv_fieldcat-ddictxt.
    endif.
  ENDIF.
* Output Table Name
  pv_fieldcat-tabname = p_tabname.
* Special Switches
  CASE l_switch.
    WHEN 'C'.
      pv_fieldcat-checkbox = 'X'.
    WHEN 'F'. " Fixed Key
      pv_fieldcat-key = 'X'.
      pv_fieldcat-fix_column = 'X'.
    WHEN 'H'. "Hotspot/Link
      pv_fieldcat-hotspot = 'X'.
    WHEN 'I'. "Hidden - Invisible
      pv_fieldcat-no_out = 'X'.
    WHEN 'K'. "Key
      pv_fieldcat-key = 'X'.
    WHEN 'L'. "Link & Key
      pv_fieldcat-key = 'X'.
      pv_fieldcat-hotspot = 'X'.
    WHEN 'N'.
      pv_fieldcat-no_zero = 'X'.
    WHEN 'R'. " Right Just
      pv_fieldcat-just = 'R'.
    WHEN 'S'. " Summarize
      pv_fieldcat-do_sum = 'X'.
    WHEN 'X'. "Display as icon
      pv_fieldcat-icon = 'X'.
      pv_fieldcat-intlen = 3.
    WHEN 'Y'. "Display as symbol
      pv_fieldcat-symbol = 'X'.
    WHEN 'Z'. " Leading Zeros
      pv_fieldcat-lzero = 'X'.
    WHEN OTHERS.
* Do nothing
  ENDCASE.
* Make sure all fields are display only
  pv_fieldcat-input = ' '.
  pv_fieldcat-edit = ' '.
*
  APPEND pv_fieldcat TO gt_fieldcat.
*
ENDFORM. " set_fieldcat_table
*----------------------------------------------------------------------
*&---------------------------------------------------------------------*
*& Form user_command
*&---------------------------------------------------------------------*
* Respond to user commands - from the ALV
*----------------------------------------------------------------------*
FORM user_command
  USING r_ucomm LIKE sy-ucomm
        rs_selfield TYPE slis_selfield.                     "#EC CALLED
*
  DATA: l_req_info TYPE gtyp_req_info.
*
* Correction number, for submitting to other report
  DATA lv_korr LIKE e070-trkorr.
*
  READ TABLE t_req_info INDEX rs_selfield-tabindex INTO l_req_info.
*
  CASE r_ucomm.
* a Hotspot has been clicked.
    WHEN '&IC1'.
      CASE rs_selfield-fieldname.
        WHEN 'TRKORR'.
          CLEAR lv_korr.
          lv_korr = l_req_info-trkorr.
          IF l_req_info-trstatus = 'O' OR
             l_req_info-trstatus = 'R' OR
             l_req_info-trstatus = 'N'.
            SUBMIT rddprott
               AND RETURN
              WITH pv_korr = lv_korr.
          ELSE.
            SUBMIT rswbossr
               AND RETURN
              WITH p_korr = lv_korr   "P_KORR-LOW = lv_korr
              WITH p_chan = 'X'
              with p_types = '*'.
          ENDIF.
        WHEN 'AS4TEXT'.
          PERFORM log_detail USING l_req_info.
        WHEN OTHERS.
* do nothing
      ENDCASE.
    WHEN OTHERS.
* do nothing
  ENDCASE.
*
ENDFORM. "user_command
*&--------------------------------------------------------------------*
*& Form LOG_DETAIL
*&--------------------------------------------------------------------*
* text
*---------------------------------------------------------------------*
* -->P_L_REQ_INFO_TRKORR text
*---------------------------------------------------------------------*
FORM log_detail USING p_req_info TYPE gtyp_req_info. "LIKE l_req_info.
*
  DATA: l_call_prog  TYPE  syrepid, " Callback program.
        l_stcol      TYPE  sycucol VALUE 5,
        l_strow      TYPE  sycurow VALUE 5,
        l_encol      TYPE  sycucol VALUE 110,
        l_enrow      TYPE  sycurow VALUE 15,
        l_lines      TYPE i,
        lv_tran_info TYPE gv_tran_info.
*
  CLEAR: lv_tran_info.
  REFRESH gt_tr_log.
  l_call_prog = sy-repid. "This program
*
  LOOP AT t_tran_info INTO lv_tran_info WHERE trkorr = p_req_info-trkorr.
    IF sy-subrc = 0.
      lv_tran_info-as4text = p_req_info-as4text.
      lv_tran_info-as4user = p_req_info-as4user.
      APPEND lv_tran_info TO gt_tr_log.
    ENDIF.
  ENDLOOP.
*
  DESCRIBE TABLE gt_tr_log LINES l_lines.
*
  IF l_lines = 0.
    MESSAGE s016(pn) WITH 'No' 'Logs found' 'for Transport:' p_req_info-trkorr. "#EC NOTEXT
*   & & & &
    RETURN.
  ENDIF.
*
  SORT gt_tr_log BY LINEOFFILE tarsystem trdate trtime.
*
  CALL FUNCTION 'BKK_POPUP_DISPLAY_LIST'
    EXPORTING
      i_callback_program      = l_call_prog
      i_callback_write_form   = 'LOG_DUMP'
      i_title                 = 'Transports Logs'                               "#EC NOTEXT
      i_start_column          = l_stcol
      i_start_row             = l_strow
      i_end_column            = l_encol
      i_end_row               = l_enrow
      i_display_ok_button     = 'X'
      i_display_cancel_button = 'X'
* IMPORTING
*     ANSWER                  =
* TABLES
*     USER_BUTTONS            =
    .
*
ENDFORM. " LOG_DETAIL
*---------------------------------------------------------------------*
* Called within the above Function Module's routine.
FORM log_dump.                                              "#EC CALLED
*
  DATA:
    ls_descrip   TYPE seu_text,
    lv_tran_info TYPE gv_tran_info.
*
  SORT gt_tr_log BY tarsystem lineoffile trdate trtime.
*
  READ TABLE gt_tr_log INTO lv_tran_info INDEX 1.
  FORMAT COLOR COL_HEADING.
  WRITE: / lv_tran_info-trkorr, lv_tran_info-as4text, lv_tran_info-as4user.
  FORMAT COLOR COL_BACKGROUND.
*
  LOOP AT gt_tr_log INTO lv_tran_info.
*
    AT NEW tarsystem.
      SKIP.
    ENDAT.
    WRITE: / lv_tran_info-tarsystem,
             lv_tran_info-tarclient. " not in 3X instances
    CASE lv_tran_info-retcode.
      WHEN '0' OR '1' OR '2' OR '3'.
        WRITE lv_tran_info-retcode.
      WHEN '4' OR '5' OR '6' OR '7'.
        FORMAT COLOR 2 INTENSIFIED OFF.
        WRITE lv_tran_info-retcode.
      WHEN OTHERS.
        FORMAT COLOR 6 INTENSIFIED OFF.
        WRITE lv_tran_info-retcode.
    ENDCASE.
*
    PERFORM write_step_description
      USING lv_tran_info-function
      CHANGING ls_descrip.
*
    IF lv_tran_info-function = '>'.  "Delete from buffer
      FORMAT COLOR 6 INTENSIFIED OFF.
    ENDIF.
*
    WRITE:
    lv_tran_info-function,
    ls_descrip+0(40).
    FORMAT COLOR COL_BACKGROUND.
    WRITE:
    lv_tran_info-trdate,
    lv_tran_info-trtime,
    lv_tran_info-lineoffile, " not in 3X instances.
    lv_tran_info-host+0(14).
*
  ENDLOOP.
*
ENDFORM. "LOG_DUMP
*&---------------------------------------------------------------------*
*& Form WRITE_STEP_DESCRIPTION
*& from Include: LTR_LOG_OVERVIEWF02
*&---------------------------------------------------------------------*
FORM write_step_description
USING pv_cofiles_step TYPE ctslg_step-stepid
CHANGING pv_text TYPE snodetext-text.
* pv_icon TYPE snodetext-text
* lv_hotspot TYPE snodetext-hotspot.

* Since access to text buffer is pretty expensive, we buffer the
* texts internally
  STATICS: first_time        TYPE c VALUE 'X',
           sv_text_a         LIKE pv_text,
           sv_text_b         LIKE pv_text,
           sv_text_c         LIKE pv_text,
           sv_text_d         LIKE pv_text,
           sv_text_e         LIKE pv_text,
           sv_text_ee        LIKE pv_text,
           sv_text_f         LIKE pv_text,
           sv_text_ff        LIKE pv_text,
           sv_text_g         LIKE pv_text,
           sv_text_h         LIKE pv_text,
           sv_text_i         LIKE pv_text,
           sv_text_k         LIKE pv_text,
           sv_text_l         LIKE pv_text,
           sv_text_m         LIKE pv_text,
           sv_text_mm        LIKE pv_text,
           sv_text_o         LIKE pv_text,
           sv_text_p         LIKE pv_text,
           sv_text_pp        LIKE pv_text,
           sv_text_q         LIKE pv_text,
           sv_text_qq        LIKE pv_text,
           sv_text_r         LIKE pv_text,
           sv_text_rr        LIKE pv_text,
           sv_text_t         LIKE pv_text,
           sv_text_tt        like pv_text,
           sv_text_v         LIKE pv_text,
           sv_text_vv        LIKE pv_text,
           sv_text_w         LIKE pv_text,
           sv_text_ww        LIKE pv_text,
           sv_text_x         LIKE pv_text,
           sv_text_y         LIKE pv_text,
           sv_text_7         like pv_text,
           sv_text_zz        LIKE pv_text,
           sv_text_bigger    LIKE pv_text,
           sv_text_less      LIKE pv_text,
           sv_text_vertical  LIKE pv_text,
           sv_text_copy_from LIKE pv_text,
           sv_text_copy_to   LIKE pv_text,
           sv_text_goto_dom  LIKE pv_text,
           sv_ado_codepage   LIKE pv_text,
           sv_text_excl       LIKE pv_text,
           sv_text_ccts       LIKE pv_text. "Note_2003329
*
  IF first_time = 'X'.
    first_time = ' '.
    "max. 40 Zeichen (Beschränkung durch eigenes Layout)
    sv_text_a = 'Dictionary activation '(023).
    sv_text_b = 'Inactive import '(024).
    sv_text_c = 'C-Korrektur-Freigabe '(025).
    sv_text_d = 'Import of application-defined objects '(026).
    sv_text_e = 'Export '(027).
    sv_text_ee = 'Export pretreatment '(028).
    sv_text_f = 'C-Transport-Freigabe '(029).
    sv_text_ff = 'Validations at operating system level '(030).
    sv_text_g = 'Generation of programs and Dynpros '(031).
    sv_text_h = 'Import der Dictionary Objekte '(032).
    sv_text_i = 'Import '(033).
    sv_text_k = 'R3trans Schattenimport '(034).
    sv_text_l = 'Import der Auftragsstückliste '(035).
    sv_text_m = 'Matchcode- and enqueue activation '(036).
    sv_text_mm = 'Produce that transportation info file '(037).
    sv_text_o = 'Trace Patch Manager '(038).
    sv_text_p = 'Testimport '(039).
    sv_text_pp = 'Order is waiting for QA approval '(040).
    sv_text_qq = 'QA-Permission was granted '(041).
    sv_text_r = 'Method execution '(042).
    sv_text_rr = 'File transfer to other transport group '(043).
    sv_text_t = 'Deployment '(044).
    sv_text_v = 'Version Checking '(045).
    sv_text_vv = 'Versioning after import '(046).  "#EC TEXT_DIFF
    sv_text_w = 'forwarding '(047).                   "#EC TEXT_DIFF
    sv_text_ww = 'Versioning before import '(048).   "#EC TEXT_DIFF
    sv_text_x = 'Export of application-defined objects '(049).
    sv_text_y = 'Onward transport with merge order '(050).
    sv_text_7 = 'Methodenausführung Nachbearbeitung      '(059).
    sv_text_tt   = 'Überprüfen des Deploystatus'(074).
    sv_text_excl = 'Import beendet'(075).

    sv_text_bigger = 'Deleted from buffer'(051).
    sv_text_less = 'Selection for import '(052).
    sv_text_vertical = 'Import nicht genehmigt '(053).
    sv_text_copy_from = 'Transferring system '(054).     "#EC TEXT_DIFF
    sv_text_copy_to = '-> Continuation: other transport group '(055).
    sv_text_goto_dom = '-> Other domain '(056).
    sv_text_zz = 'Unknown step'(057). " 'Unbekannter Schritt '(057).
    sv_ado_codepage = 'Change the ADO code page'(058). "'Wechsel der ADO Codepage '(058).
  ENDIF.

  CASE pv_cofiles_step.
    WHEN 'A'. pv_text = sv_text_a.
    WHEN 'B'. pv_text = sv_text_b.
    WHEN 'C'. pv_text = sv_text_c.
    WHEN 'D'. pv_text = sv_text_d.
    WHEN 'E'. pv_text = sv_text_e.
    WHEN 'e'. pv_text = sv_text_ee.
    WHEN 'F'. pv_text = sv_text_f.
    WHEN 'f'. pv_text = sv_text_ff.
    WHEN 'G'. pv_text = sv_text_g.
    WHEN 'H'. pv_text = sv_text_h.
    WHEN 'I'. pv_text = sv_text_i.
    WHEN 'K'. pv_text = sv_text_k.
    WHEN 'L'. pv_text = sv_text_l.
    WHEN 'M'. pv_text = sv_text_m.
    WHEN 'm'. pv_text = sv_text_mm.
    WHEN 'O'. pv_text = sv_text_o.
    WHEN 'P'. pv_text = sv_text_p.
    WHEN 'p'. pv_text = sv_text_pp.
    WHEN 'Q'. pv_text = sv_text_q.
    WHEN 'q'. pv_text = sv_text_qq.
    WHEN 'R'. pv_text = sv_text_r.
    WHEN 'r'. pv_text = sv_text_rr.
    WHEN 'T'. pv_text = sv_text_t.
    when 't'. pv_text = sv_text_tt.
    WHEN 'V'. pv_text = sv_text_v.
    WHEN 'v'. pv_text = sv_text_vv.
    WHEN 'W'. pv_text = sv_text_w.
    WHEN 'w'. pv_text = sv_text_ww.
    WHEN 'X'. pv_text = sv_text_x.
    WHEN 'Y'. pv_text = sv_text_y.
    when '7'. pv_text = sv_text_7.
    WHEN '>'. pv_text = sv_text_bigger.
    WHEN '<'. pv_text = sv_text_less.
    WHEN '|'. pv_text = sv_text_vertical.
    WHEN ')'. pv_text = sv_text_copy_from.
    WHEN '('. pv_text = sv_text_copy_to.
    WHEN ':'. pv_text = sv_text_goto_dom.
    WHEN '#'. pv_text = sv_ado_codepage.
    when '!'.    pv_text = sv_text_excl.
    WHEN '@'.    pv_text = sv_text_ccts. "Note_2003329

    WHEN OTHERS. pv_text = sv_text_zz.
  ENDCASE.
ENDFORM. " WRITE_STEP_DESCRIPTION
*&---------------------------------------------------------------------*
*& Form SET_ICON
*----------------------------------------------------------------------*
* Set the Icon for the release status (Return Code) from each system
*----------------------------------------------------------------------*
FORM set_icon USING p_rc TYPE trretcode
CHANGING p_id TYPE trretcode.
*
  DATA l_rc TYPE trretcode.
*
  l_rc = p_rc.
  CONDENSE l_rc.
*
  CASE l_rc.
    WHEN space.
      MOVE icon_led_inactive TO p_id.
    WHEN '0'.
      MOVE icon_led_green TO p_id. "ICON_GREEN_LIGHT
    when '1' or '2' or '3'.
      move ICON_MESSAGE_WARNING_SMALL to p_id.
    WHEN '4'.
      MOVE icon_led_yellow TO p_id. "ICON_YELLOW_LIGHT
    when '5' or '6' or '7'.
      move ICON_RED_SLASH to p_id.
    WHEN '8' or '12'.
      MOVE icon_led_red TO p_id. "ICON_RED_LIGHT
    when '9' or '10' or '11'.
      move ICON_RED_XCIRCLE to p_id.
    when others.
      move ICON_MESSAGE_ERROR_SMALL  TO p_id. "ICON_ERROR
  ENDCASE.
*
ENDFORM. " SET_ICON
*---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form SET_PRIME
*&---------------------------------------------------------------------*
* text
*----------------------------------------------------------------------*
FORM set_prime .

  DATA: lv_st_tran LIKE LINE OF st_tran.

  p_dev1 = c_dev.
  p_qas1 = c_qas.
  p_pprd = c_ppd.
  p_prd1 = c_prd.
  p_trk1 = c_trkorr.
  p_chk1 = 'X'.
  lv_st_tran-low = c_trkorr. "* RHDK*
  lv_st_tran-sign = 'I'.
  lv_st_tran-option = 'CP'.
  APPEND lv_st_tran TO st_tran.

ENDFORM. " SET_PRIME
*&---------------------------------------------------------------------*
*& Form SET_SECOND
*&---------------------------------------------------------------------*
* text
*----------------------------------------------------------------------*
* --> p1 text
* <-- p2 text
*----------------------------------------------------------------------*
FORM set_second .
*
  DATA: lv_st_tran LIKE LINE OF st_tran.

  p_dev2 = n_dev.
  p_qas2 = n_qas.
  p_prd2 = n_prd.
  p_trk2 = n_trkorr.
  p_chk2 = 'X'.
  lv_st_tran-low = n_trkorr. "* R3DK*
  lv_st_tran-sign = 'I'.
  lv_st_tran-option = 'CP'.
  APPEND lv_st_tran TO st_tran.
*
ENDFORM. " SET_SECOND
*&---------------------------------------------------------------------*
*&      Form  PROC_ITAB
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM proc_itab .
*
  DATA: l_req_info    TYPE gtyp_req_info,
        l_recs        TYPE sytfill,
        l_rec         TYPE sytabix,
        l_perc        TYPE f,
        l_mod         TYPE i,
        l_mess        TYPE char30,
        l_crec        TYPE char15,
        l_crecs       TYPE char15,
        l_char        TYPE char1 VALUE '1',
        lv_userfn     TYPE name1,
        lv_userln     TYPE name2,
        lv_as4text    TYPE as4text,
        lv_e070create TYPE e070create.

  DATA: lv_comm_sys TYPE tmscsyslst,
        lv_set_sys  TYPE trsysname,
        lt_set_sys  TYPE sysnames.

*        lv_filt TYPE slis_filter_alv.
*
  SET PARAMETER ID 'SIN' FIELD l_char.    " For the progress Indicator
*
  DESCRIBE TABLE t_req_info LINES l_recs.
*
* Populate the text and return codes
  LOOP AT t_req_info INTO l_req_info.
*
    CLEAR: l_req_info-as4text, l_req_info-name_text, l_mod, l_perc,
    l_req_info-dsys, l_req_info-qsys, l_req_info-psys,
    l_req_info-rc1, l_req_info-rc2, l_req_info-rc3,
    l_req_info-rc4, l_req_info-rc5, l_req_info-rc6, l_req_info-rc7,
    l_req_info-id1, l_req_info-id2, l_req_info-id3,
    l_req_info-id4, l_req_info-id5, l_req_info-id6, l_req_info-id7,
    l_req_info-crea_4date, l_req_info-crea_4time.
*
    ADD 1 TO l_rec.
* Grab the transport description
    SELECT SINGLE as4text FROM e07t INTO lv_as4text
    WHERE trkorr = l_req_info-trkorr
    AND langu = sy-langu.
    IF sy-subrc = 0.
      MOVE lv_as4text TO l_req_info-as4text.
    ENDIF.
*   DD07T * TRFUNCTION  * TRSTATUS
    SELECT ddtext INTO l_req_info-tr_typtext  FROM  dd07t UP TO 1 ROWS
           WHERE  domname     = 'TRFUNCTION'
           AND    ddlanguage  = sy-langu
           AND    as4local    = 'A'
*           AND    valpos      = ___
*           AND    as4vers     = ___
           AND    domvalue_l      = l_req_info-trfunction.
    ENDSELECT.
*
    SELECT ddtext INTO l_req_info-tr_stattext  FROM  dd07t UP TO 1 ROWS
           WHERE  domname     = 'TRSTATUS'
           AND    ddlanguage  = sy-langu
           AND    as4local    = 'A'
*           AND    valpos      = ___
*           AND    as4vers     = ___
           AND    domvalue_l      = l_req_info-trstatus.
    ENDSELECT.

*
*  Grab the Transport Creation date. Only populated before release
    SELECT SINGLE * INTO lv_e070create
      FROM e070create
      WHERE trkorr = l_req_info-trkorr.
    IF sy-subrc = 0.
      MOVE lv_e070create-cre_date TO l_req_info-crea_4date.
      MOVE lv_e070create-cre_time TO l_req_info-crea_4time.
    ENDIF.
*
* Just grab the transport owner's System ID.
    MOVE l_req_info-as4user TO l_req_info-name_text.
    IF st_name = 'X'.
* Grab the transport owner's full name - (not always maintained)
      SELECT name_first name_last INTO (lv_userfn,lv_userln)
      FROM v_usr_name UP TO 1 ROWS
      WHERE bname = l_req_info-as4user.
      ENDSELECT.
      IF sy-subrc = 0.
        CONDENSE: lv_userfn, lv_userln.
        CONCATENATE lv_userfn lv_userln INTO l_req_info-name_text SEPARATED BY space.
      ENDIF.
    ENDIF.
*
*   Prepare the Progress graphic.
    l_mod = l_rec MOD 10.
    IF l_mod = 0. " Calulate/Update every 10 records
*
      l_perc = ( l_rec / l_recs ) * 100.
      l_crec = l_rec.
      l_crecs = l_recs.
      CONDENSE: l_crec, l_crecs.
      CONCATENATE l_crec '/' l_crecs 'Records'(t05) INTO l_mess SEPARATED BY space.
      CONDENSE l_mess.
      CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
        EXPORTING
          percentage = l_perc
          text       = l_mess.
*
    ENDIF.
*
    IF lt_set_sys IS INITIAL.  " Build list of systems
      LOOP AT gt_comm_sys INTO lv_comm_sys.
        lv_set_sys-name = lv_comm_sys-sysnam.
        APPEND lv_set_sys TO lt_set_sys.
      ENDLOOP.
    ENDIF.
* check/get the transport's progress through the systems
    PERFORM get_det USING lt_set_sys CHANGING l_req_info.

* Set the Icon for each system's return code.
    PERFORM set_icon USING l_req_info-rc1 CHANGING l_req_info-id1.
    PERFORM set_icon USING l_req_info-rc2 CHANGING l_req_info-id2.
    PERFORM set_icon USING l_req_info-rc6 CHANGING l_req_info-id6.    "PreProd
    PERFORM set_icon USING l_req_info-rc3 CHANGING l_req_info-id3.
*
    PERFORM set_icon USING l_req_info-rc4 CHANGING l_req_info-id4.
    PERFORM set_icon USING l_req_info-rc5 CHANGING l_req_info-id5.
    PERFORM set_icon USING l_req_info-rc7 CHANGING l_req_info-id7.
*
    MODIFY t_req_info FROM l_req_info.
*
  ENDLOOP.
**
*  IF st_filt = 'X'.
*    lv_filt-fieldname = 'PRD1_4DATE'.
*    lv_filt-tabname = 'T_REQ_INFO'.
*    lv_filt-inttype = 'D'.
*    lv_filt-seltext = 'PRD. Date'.                          "#EC NOTEXT
*    lv_filt-valuf_int = '00000000'.
*    lv_filt-sign0 = 'I'.
*    lv_filt-optio = 'EQ'.
*    lv_filt-ddic_outputlen = '9'.
*    APPEND lv_filt TO gt_filt.
** delete t_req_info where not ( prd1_4date is INITIAL ). "Delete where a prod log was found.
*  ENDIF.
*
  IF st_srt1 = 'X'.
    SORT t_req_info BY as4date as4time trkorr strkorr .
    DELETE ADJACENT DUPLICATES FROM t_req_info COMPARING as4date trkorr.
  ELSE.
    SORT t_req_info BY trkorr strkorr .
    DELETE ADJACENT DUPLICATES FROM t_req_info COMPARING trkorr.
  ENDIF.
*
ENDFORM.                    " PROC_ITAB
*&---------------------------------------------------------------------*
*&      Form  LOAD_SYS_SET
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM load_sys_set .
* Load List of Systems to check
  DATA: lv_comm_sys TYPE tmscsyslst.
*
  IF p_chk1 = 'X'.
    lv_comm_sys-sysnam = p_dev1. "Operate systems
    APPEND lv_comm_sys TO gt_comm_sys.
    lv_comm_sys-sysnam = p_qas1.
    APPEND lv_comm_sys TO gt_comm_sys.
    lv_comm_sys-sysnam = p_pprd.
    APPEND lv_comm_sys TO gt_comm_sys.
    lv_comm_sys-sysnam = p_prd1.
    APPEND lv_comm_sys TO gt_comm_sys.
  ENDIF.
*
  IF p_chk2 = 'X'.
    lv_comm_sys-sysnam = p_dev2. "Project systems
    APPEND lv_comm_sys TO gt_comm_sys.
    lv_comm_sys-sysnam = p_qas2.
    APPEND lv_comm_sys TO gt_comm_sys.
    lv_comm_sys-sysnam = p_prd2.
    APPEND lv_comm_sys TO gt_comm_sys.
  ENDIF.
  DELETE gt_comm_sys WHERE sysnam EQ space.
*
ENDFORM.                    " LOAD_SYS_SET
*--------------------------------------------
*&---------------------------------------------------------------------*
*&      Form  WRITE_LOG
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM write_log .
*
  DATA lv_tran_info TYPE gv_tran_info.
*
  SORT t_tran_info BY trkorr lineoffile.
*
  LOOP AT t_tran_info INTO lv_tran_info.
    AT NEW trkorr.
      SKIP.
      WRITE: / lv_tran_info-trkorr.
    ENDAT.
    WRITE: / lv_tran_info-tarsystem,
           lv_tran_info-tarclient,
           lv_tran_info-function.
*
    CASE lv_tran_info-retcode.
      WHEN '0' OR '1' OR '2' OR '3'.
        WRITE lv_tran_info-retcode COLOR COL_BACKGROUND.        "Normal
      WHEN '4' OR '5' OR '6' OR '7'.
        WRITE lv_tran_info-retcode COLOR 2  INTENSIFIED OFF.    "Warning
      WHEN OTHERS.
        WRITE lv_tran_info-retcode COLOR 6  INTENSIFIED OFF.    "Error
    ENDCASE.
*
    WRITE:
           lv_tran_info-trdate,
           lv_tran_info-trtime,
           lv_tran_info-lineoffile,
           lv_tran_info-host,
           lv_tran_info-osuser,
           lv_tran_info-delflag.
  ENDLOOP.
*
ENDFORM.                    " WRITE_LOG
*&---------------------------------------------------------------------*
*&      Form  DISP_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM disp_alv .
*
* ALV related variables
  DATA: "gt_fieldcat TYPE slis_t_fieldcat_alv,                "#EC NEEDED
    lv_layout TYPE slis_layout_alv,
    lv_print  TYPE slis_print_alv,
    lt_sort   TYPE slis_t_sortinfo_alv,
    lt_filt   TYPE slis_t_filter_alv,
    l_recs    TYPE i.
*
  DESCRIBE TABLE t_req_info LINES l_recs.
  MESSAGE s000(kj) WITH 'Records'(T05) 'to' 'display:'(dis) l_recs.
*
  PERFORM init_var USING p_varnh.
*
  PERFORM set_field_catalog.
*
  PERFORM set_sort CHANGING lt_sort.
*
  PERFORM set_filt CHANGING lt_filt.
*
  PERFORM set_layout CHANGING lv_layout lv_print.
*
* Call ABAP Grid Viewer (ALV)
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program      = gv_variant-report
      i_callback_user_command = 'USER_COMMAND'
*     i_callback_top_of_page  = 'ALV_TOP_OF_PAGE'
*     i_structure_name        = ''
*     i_grid_title            = sy-title
      is_layout               = lv_layout
      it_fieldcat             = gt_fieldcat
      it_sort                 = lt_sort
      it_filter               = lt_filt
      i_save                  = 'A'
      is_variant              = gv_variant
      is_print                = lv_print
    TABLES
      t_outtab                = t_req_info.
*
ENDFORM.                    " DISP_ALV
*&---------------------------------------------------------------------*
*&      Form  SET_SORT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--P_LT_SORT  text
*----------------------------------------------------------------------*
FORM set_sort  CHANGING lt_sort  TYPE slis_t_sortinfo_alv.
*
  DATA: l_table TYPE tabname VALUE 'T_REQ_INFO',
        l_sort  TYPE slis_sortinfo_alv.

* -- -- -- -- *
  IF st_srt1 = 'X'.
*   Sort by Dev Release Date/Time
    clear: l_sort-up, l_sort-down.
    l_sort-spos = '1'.
    l_sort-fieldname = 'AS4DATE'.
    l_sort-tabname = l_table.
    "l_sort-up = 'X'.
    l_sort-down = 'X'.
    APPEND l_sort TO lt_sort.
*
    clear: l_sort-up, l_sort-down.
    l_sort-spos = '2'.
    l_sort-fieldname = 'AS4TIME'.
    l_sort-tabname = l_table.
    "l_sort-up = 'X'.
    l_sort-down = 'X'.
    APPEND l_sort TO lt_sort.
*
    clear: l_sort-up, l_sort-down.
    l_sort-spos = '3'.
    l_sort-fieldname = 'TRKORR'.
    l_sort-tabname = l_table.
    l_sort-up = 'X'.
    APPEND l_sort TO lt_sort.
*
  ELSE.
*   Sort by Transport Number
    clear: l_sort-up, l_sort-down.
    l_sort-spos = '1'.
    l_sort-fieldname = 'TRKORR'.
    l_sort-tabname = l_table.
    l_sort-up = 'X'.
    APPEND l_sort TO lt_sort.
*
  ENDIF.
*
ENDFORM.                    " SET_SORT
*&---------------------------------------------------------------------*
*&      Form  SET_FILT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--P_LT_FILT  text
*----------------------------------------------------------------------*
FORM set_filt  CHANGING lt_filt TYPE slis_t_filter_alv.
*
  DATA: lv_filt TYPE slis_filter_alv.
*
  IF st_filt = 'X'.
    lv_filt-fieldname = 'PRD1_4DATE'.
    lv_filt-tabname = 'T_REQ_INFO'.
    lv_filt-inttype = 'D'.
    lv_filt-seltext = 'PRD. Date'.                          "#EC NOTEXT
    lv_filt-valuf_int = '00000000'.
    lv_filt-sign0 = 'I'.
    lv_filt-optio = 'EQ'.
    lv_filt-ddic_outputlen = '9'.
    APPEND lv_filt TO lt_filt.
* delete t_req_info where not ( prd1_4date is INITIAL ). "Delete where a prod log was found.
  ENDIF.
*
ENDFORM.                    " SET_FILT
