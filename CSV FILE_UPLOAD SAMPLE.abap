**&---------------------------------------------------------------------*
**& Report ZOTCD_REDEMPTION_ADD
**&---------------------------------------------------------------------*
**&
**&---------------------------------------------------------------------*
REPORT zotcd_redemption_add.


TYPES : BEGIN OF gty_data,
          old_security TYPE ranl,
          new_security TYPE ranl,
        END OF gty_data.

DATA : gv_file        TYPE string,
       gv_rc          TYPE i,
       gt_file_table  TYPE filetable,
       gwa_file_table TYPE file_table,
       lt_raw_data    TYPE truxs_t_text_data.

DATA : gt_datax TYPE STANDARD TABLE OF gty_data,
       gs_datax TYPE gty_data.

CONSTANTS : gc_delimiter       TYPE char1 VALUE '"',
            gc_field_separator TYPE char1 VALUE ','.

DATA : gt_tab TYPE esp1_message_tab_type,
       gs_tab TYPE esp1_message_wa_type.

* FIRST BAPI VARIEABLES
DATA : gs_redemption_set     TYPE bapi1074_set,
       gt_schedules          TYPE STANDARD TABLE OF bapi1074_schedule,
       gt_redemptions        TYPE STANDARD TABLE OF bapi1074_redemption,
       gt_redemption_cond    TYPE STANDARD TABLE OF bapi1074_red_cond,
       gt_interest_cond      TYPE STANDARD TABLE OF bapi1074_int_cond,
       gt_interest_cond_form TYPE STANDARD TABLE OF bapi1074_int_cond_form,
       gt_return             TYPE STANDARD TABLE OF bapiret2,

* SECOND BAPI_VARIABLES.
       gt_red_create         TYPE STANDARD TABLE OF bapi1074_redemption_create,
       gt_red_cond_create    TYPE STANDARD TABLE OF bapi1074_red_cond_create,
       gt_int_cond_create    TYPE STANDARD TABLE OF bapi1074_int_cond_create,
       gt_int_cond_form      TYPE STANDARD TABLE OF bapi1074_int_cond_form_create,
       gs_schedule_create    TYPE bapi1074_schedule_create.


SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-003.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN POSITION 1.
    SELECTION-SCREEN COMMENT 1(79) TEXT-001.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN SKIP 1.
  PARAMETERS : p_file_i TYPE ibipparms-path OBLIGATORY.
SELECTION-SCREEN END OF BLOCK a2.

**----------------------------------------------------------------------*
**     AT SELECTION-SCREEN ON VALUE-REQUEST
**----------------------------------------------------------------------*
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file_i.

* Selecting an input file
  CALL METHOD cl_gui_frontend_services=>file_open_dialog
    EXPORTING
      window_title = 'Select a file'
    CHANGING
      file_table   = gt_file_table
      rc           = gv_rc.
  IF sy-subrc = 0.
    READ TABLE gt_file_table INTO gwa_file_table INDEX 1.
    p_file_i = gwa_file_table-filename.
  ENDIF.

  gv_file = p_file_i.

* getting input file data in raw format
  CALL METHOD cl_gui_frontend_services=>gui_upload
    EXPORTING
      filename            = gv_file
      has_field_separator = 'X'
    CHANGING
      data_tab            = lt_raw_data.

  CALL METHOD cl_gui_cfw=>flush
    EXCEPTIONS
      cntl_system_error = 1
      cntl_error        = 2.

* Object creation cannot be done in this program so this method is called to c reate object for using this class
  DATA(lo_csv_converter) = cl_rsda_csv_converter=>create( i_delimiter = gc_delimiter
                                                          i_separator = gc_field_separator ).

* All csv file records are brought to internal table
  LOOP AT lt_raw_data INTO DATA(ls_csv_line).

    CALL METHOD lo_csv_converter->csv_to_structure
      EXPORTING
        i_data   = ls_csv_line
      IMPORTING
        e_s_data = gs_datax.

    INSERT gs_datax INTO TABLE gt_datax.

  ENDLOOP.

****************************************************************
*
* EVENT -- START OF SELECTION
*
****************************************************************
START-OF-SELECTION.

  DATA(gt_return_2) = gt_return.
  DATA(gt_return_final) = gt_return.

  IF gt_datax IS NOT INITIAL.

    LOOP AT gt_datax INTO gs_datax.

      CALL FUNCTION 'BAPI_RSS_GET_DETAIL'
        EXPORTING
          securitynumber             = gs_datax-old_security
          setname                    = '  '
*         noredemptions              = ' '
*         unfixedschedule            = ' '
          latestschedule             = 'X'
        IMPORTING
          redemptionset              = gs_redemption_set
        TABLES
          schedules                  = gt_schedules
          redemptions                = gt_redemptions
          redemptionconditions       = gt_redemption_cond
          interestconditions         = gt_interest_cond
          interestconditionsformvars = gt_interest_cond_form
          return                     = gt_return.

* Refreshing the BAPI framework buffers filled earlier
      CALL FUNCTION 'BUFFER_REFRESH_ALL'.

* logic to assign old security details to redemption schedule creation objects for new security
      IF gt_schedules IS NOT INITIAL.
        READ TABLE gt_schedules INTO DATA(gs_schedules) INDEX 1.
        IF sy-subrc EQ 0.
          MOVE-CORRESPONDING gs_schedules TO gs_schedule_create.
        ENDIF.
      ENDIF.

      IF gt_int_cond_form IS NOT INITIAL.
        MOVE-CORRESPONDING gt_redemptions TO gt_red_create.
      ENDIF.

      IF gt_redemption_cond IS NOT INITIAL.
        MOVE-CORRESPONDING gt_redemption_cond TO gt_red_cond_create.
      ENDIF.

      IF gt_interest_cond IS NOT INITIAL.
        MOVE-CORRESPONDING gt_interest_cond TO gt_int_cond_create.
      ENDIF.

      IF gt_int_cond_form IS NOT INITIAL.
        MOVE-CORRESPONDING gt_int_cond_form TO gt_int_cond_form.
      ENDIF.

* Rdemption schedule creation for existing security
      CALL FUNCTION 'BAPI_RSS_ADD_SCHEDULE'
        EXPORTING
          securitynumber            = gs_datax-new_security
*         SETNAME                   =
          schedule                  = gs_schedule_create
*         TESTRUN                   =
        TABLES
          redemptions               = gt_red_create
          redemptionconditions      = gt_red_cond_create
          interestconditions        = gt_int_cond_create
          interestconditionformulas = gt_int_cond_form
          return                    = gt_return_2.

      IF gt_return_2 IS NOT INITIAL.
        APPEND LINES OF gt_return_2 TO gt_return_final.
      ENDIF.

      CLEAR : gt_red_create, gt_red_cond_create, gt_int_cond_create,
              gt_int_cond_form, gt_int_cond_form, gt_return_2, gt_return,
              gs_redemption_set, gt_schedules, gt_redemptions, gt_redemption_cond,
              gt_interest_cond, gt_interest_cond_form.

    ENDLOOP.

    CLEAR gs_datax.
  ENDIF.

END-OF-SELECTION.

  IF gt_return_final IS NOT INITIAL.

    LOOP AT gt_return_final INTO DATA(ls_return).
* log message table preparation
      gs_tab-msgty  = ls_return-type.
      gs_tab-msgid  = ls_return-id.
      gs_tab-msgno  = ls_return-number.
      gs_tab-msgv1  = ls_return-message+0(50).
      gs_tab-msgv2  = ls_return-message+50(50).
      gs_tab-msgv3  = ls_return-message+100(50).
      gs_tab-msgv4  = ls_return-message+150(50).
      gs_tab-lineno = sy-tabix.
      APPEND gs_tab TO gt_tab.

      CLEAR : ls_return, gs_tab.
    ENDLOOP.

  ENDIF.

  CALL FUNCTION 'C14Z_MESSAGES_SHOW_AS_POPUP'
    TABLES
      i_message_tab = gt_tab.