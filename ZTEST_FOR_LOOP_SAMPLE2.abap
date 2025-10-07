FUNCTION ZYA_FORD_PROXY_EDI.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IT_DATA_INB) TYPE  ZYA_COMMON_EVENT_ENH2025_TT
*"----------------------------------------------------------------------


  DATA: lt_bapiret_all TYPE bapirettab.

  IF IT_DATA_INB IS INITIAL.
    RETURN.
  ENDIF.

***AR message processing**********************************************
*
  "get AR messages among other event codes
*** OLD LOGIC
*  DATA(lt_message_ar) = VALUE zya_common_event_type_even_tab(
*    FOR <ls_msg> IN input-common_event_type-event
*    WHERE ( event_code = zifm_ya_constants=>gc_if_event_code-ar ) ( <ls_msg> ) ) .

*** NEW LOGIC
  DATA(lt_message_ar) = VALUE ZYA_COMMON_EVENT_ENH2025_TT(
    FOR <ls_msg> IN IT_DATA_INB
    WHERE ( event_code = zifm_ya_constants=>gc_if_event_code-ar ) ( <ls_msg> ) ) .


*  IF lt_message_ar IS NOT INITIAL.
*    "run ASN processing in background
*    zcl_ya_asn_helper=>process_ar_by_compound_and_tu( it_message = lt_message_ar ).
*  ENDIF.
  "AR log messages are not returned by background function and saved inside
***********************************************************************
*
****RR message processing**********************************************
*  "get RR messages among other event codes
*  DATA(lt_message_rr) = VALUE zya_common_event_type_even_tab(
*    FOR <ls_msg> IN input-common_event_type-event WHERE ( event_code = zifm_ya_constants=>gc_if_event_code-rr ) ( <ls_msg> ) ) .
*
*  IF lt_message_rr IS NOT INITIAL.
*    "Message: &1 RR messages processed.
*    DATA(lv_lines) = lines( lt_message_rr ).
*    MESSAGE s006(zya_asn) WITH lv_lines INTO /sapyl/cl_api_message=>sv_message_text.
*    /sapyl/cl_helper_base=>add_symsg2bapi(
*        CHANGING
*          ct_message = lt_bapiret_all ).
*
*    zcl_ya_inbound=>process_rr_by_comp_tu_date( it_message = lt_message_rr ).
*
*  ENDIF.
***********************************************************************
*
****WBN message processing**********************************************
*  "get WBN messages among other event codes
*  DATA(lt_message_wbn) = VALUE zya_common_event_type_even_tab(
*
*    FOR <ls_msg> IN input-common_event_type-event WHERE ( event_code = zifm_ya_constants=>gc_if_event_code-wbn ) ( <ls_msg> ) ) .
*
*  IF lt_message_wbn IS NOT INITIAL.
*    "Message: &1 WBN messages processed.
*    lv_lines = lines( lt_message_wbn ).
*    MESSAGE s007(zya_asn) WITH lv_lines INTO /sapyl/cl_api_message=>sv_message_text.
*    /sapyl/cl_helper_base=>add_symsg2bapi(
*        CHANGING
*          ct_message = lt_bapiret_all ).
*
*    DATA(lt_bapiret) = zcl_ya_inbound=>get_instance( )->process_wbn_message( lt_message_wbn ).
*
*    APPEND LINES OF lt_bapiret TO lt_bapiret_all.
*
*  ENDIF.
***********************************************************************
*
*  " log save
*  IF lt_bapiret_all IS NOT INITIAL.
*    zcl_ya_helper_base=>create_save_log(
*      EXPORTING
*        it_message          = lt_bapiret_all
*        iv_func_external_id = zifm_ya_constants=>gc_s_log_extnumber-zya_interfaces ).
*  ENDIF.



ENDFUNCTION.
