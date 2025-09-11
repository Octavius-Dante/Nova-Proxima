*&---------------------------------------------------------------------*
*& Report Z_DAYSHIFT_LOAN
*&---------------------------------------------------------------------*

REPORT z_dayshift_loan.

TYPES : BEGIN OF gty_ranl,
          value TYPE ranl,
        END OF gty_ranl,

        BEGIN OF GTY_log,
          ranl         TYPE ranl,
          icon         TYPE c,  " Add field to hold traffic light value
          msgid        TYPE syst_msgid,
          msgno        TYPE syst_msgno,
          msgtxt(1000) TYPE c,
        END OF GTY_log.

*-------------------------------
* ICON - TRAFFIC LIGHTS
* INDEX   COLOUR    STATUS
* 1        RED      ERROR
* 2        YELLOW   WARNING
* 3        GREEN    SUCCESS
*--------------------------------

DATA: ls_vdarl_key TYPE vdarl_key,
      lv_error     TYPE flag,
      gv_ranl      TYPE vdarl-ranl,
*      gt_ranl      TYPE STANDARD TABLE OF gty_ranl,
*      gs_ranl      TYPE gty_ranl,
      gt_log       TYPE STANDARD TABLE OF gty_log,
      gs_log       TYPE gty_log,
      gv_row       TYPE char5.

DATA: gt_fieldcat TYPE slis_t_fieldcat_alv,
      gs_fieldcat TYPE slis_fieldcat_alv,
      is_layout   TYPE slis_layout_alv,
      g_repid     TYPE sy-repid.

DATA : et_return TYPE STANDARD TABLE OF  bapiret2.
*  e_error    TYPE xfeld.
*  et_vdgpo   TYPE STANDARD TABLE OF  trty_vdgpo,
*  es_vzzkoko TYPE vzzkoko,
*  et_vzzkopo TYPE STANDARD TABLE OF  trty_vzzkopo,
*  es_vdarl   TYPE vdarl.

CONSTANTS : gv_bukrs TYPE bukrs VALUE '1000'.


* SELECTION SCREEN ITEMS

SELECT-OPTIONS : s_ranl FOR gv_ranl NO INTERVALS.

*parameters: p_ranl  type vdarl-ranl,
*            p_bukrs type vdarl-bukrs default '1000'.

*ls_vdarl_key-ranl = p_ranl.
*ls_vdarl_key-bukrs = p_bukrs.

START-OF-SELECTION.

  LOOP AT s_ranl INTO DATA(gs_ranl)." INTO gs_ranl.

    ls_vdarl_key-ranl  = gs_ranl-low.
    ls_vdarl_key-bukrs = gv_bukrs.

*    CALL FUNCTION 'Z_LOAN_DAYSHIFT'
*      EXPORTING
*        is_vdarl_key  = ls_vdarl_key
*        iv_start_date = '20210101'
*      IMPORTING
*        e_error       = lv_error.

    CALL FUNCTION 'Z_LOAN_DAYSHIFT'
      EXPORTING
        is_vdarl_key  = ls_vdarl_key
        iv_start_date = '20210101'
      IMPORTING
        et_return     = et_return
        e_error       = LV_error
      EXCEPTIONS
        not_found     = 1
        OTHERS        = 2.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.


    IF sy-subrc <> 0 OR lv_error = 'X'.
      CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.

*      MESSAGE 'Loan could not be edited. Requires manual shifting' TYPE 'E'.

      IF LV_error EQ abap_true.

        gs_log-ranl = ls_vdarl_key-ranl.
        gs_log-icon = '1'.
        gs_log-msgtxt = 'Loan could not be edited. Requires manual shifting'.

        APPEND gs_log TO gt_log.
        CLEAR : gs_log.

        LOOP AT et_return INTO DATA(es_return).

          gs_log-icon = '1'.
          gs_log-msgid = es_return-id.
          gs_log-msgno = es_return-number.

          gv_row = es_return-row.

          CONCATENATE es_return-message
          es_return-log_no
          es_return-log_msg_no
          es_return-message_v1
          es_return-message_v2
          es_return-message_v3
          es_return-message_v4
          es_return-parameter
          gv_row
          es_return-field
          es_return-system INTO gs_log-msgtxt SEPARATED BY space.

          APPEND gs_log TO gt_log.
          CLEAR : gs_log , es_return, gv_row.
        ENDLOOP.

      ENDIF.
    ELSE.
      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'.
*      MESSAGE 'Loan has been edited successfully' TYPE 'S'.

      gs_log-ranl = ls_vdarl_key-ranl.
      gs_log-icon = '3'.
      gs_log-msgtxt = 'Loan has been edited successfully'.

      APPEND gs_log TO gt_log.
    ENDIF.

    CLEAR : gs_ranl, gs_log, es_return, LV_error.
  ENDLOOP.


* FIELD CATALOG.
  CLEAR : gs_fieldcat, gt_fieldcat.

  gs_fieldcat-fieldname  = 'RANL'.
  gs_fieldcat-seltext_m  = 'CONTRACT NUMBER'.
  gs_fieldcat-outputlen  = '15'.
  APPEND gs_fieldcat TO gt_fieldcat.
  CLEAR gs_fieldcat.

  gs_fieldcat-fieldname  = 'ICON'.
  gs_fieldcat-seltext_m  = 'STATUS'.
  APPEND gs_fieldcat TO gt_fieldcat.
  CLEAR gs_fieldcat.

  gs_fieldcat-fieldname  = 'MSGID'.
  gs_fieldcat-seltext_m  = 'MESSAGE_ID'.
  gs_fieldcat-outputlen  = '10'.
  APPEND gs_fieldcat TO gt_fieldcat.
  CLEAR gs_fieldcat.

  gs_fieldcat-fieldname  = 'MSGNO'.
  gs_fieldcat-seltext_m  = 'MESSAGE_NO'.
  gs_fieldcat-outputlen  = '10'.
  APPEND gs_fieldcat TO gt_fieldcat.
  CLEAR gs_fieldcat.

  gs_fieldcat-fieldname  = 'MSGTXT'.
  gs_fieldcat-seltext_m  = 'MESSAGE_TEXT'.
  gs_fieldcat-outputlen  = '100'.
  APPEND gs_fieldcat TO gt_fieldcat.
  CLEAR gs_fieldcat.

**Fill layout info.
**Fill traffic lights field name in the ALV layout
  is_layout-lights_fieldname = 'ICON'.
*
**Pass data and field catalog to ALV function module to display ALV list
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = g_repid
      is_layout          = is_layout
      it_fieldcat        = gt_fieldcat
    TABLES
      t_outtab           = gt_log
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.
