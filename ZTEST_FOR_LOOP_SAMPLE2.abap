*&---------------------------------------------------------------------*
*& Report ZTEST_VALUE_FILTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_value_filter.


*  DATA(lt_message_ar) = VALUE zya_common_event_type_even_tab(
*    FOR <ls_msg> IN input-common_event_type-event
*    WHERE ( event_code = zifm_ya_constants=>gc_if_event_code-ar ) ( <ls_msg> ) ) .

SELECT * FROM ztya_dealer
  INTO TABLE @DATA(lt_ztya_dealer).
IF sy-subrc EQ 0.

  BREAK-POINT.

**** WORKS - TYPE 1 
*****################################################################
  DATA(lt_message_ar) = lt_ztya_dealer.
  CLEAR lt_message_ar.

  lt_message_ar = VALUE #( FOR ls_msg IN lt_ztya_dealer
  WHERE ( shipper_id = 'BMW' ) ( ls_msg ) ).

*****################################################################

**** WORKS - TYPE 2
*****################################################################
**** EXPECTS TABLE TYPE DECLARED IN SE11 TO WORK PROPERLY
**** THIS TABLE TYPE IS FROM SE11 ZTYA_DEALER_TT_TEST - SAME AS ztya_dealer
  DATA(lt_message_ar2) = VALUE ZTYA_DEALER_TT_TEST( FOR <ls_msg> IN lt_ztya_dealer
  WHERE ( shipper_id = 'BMW' ) ( <ls_msg> ) ).

*****################################################################


**** DONT WORK - TYPE 3
*****################################################################
types : ZTYA_DEALER_TT type ztya_dealer.
**** Local tructure declaration of table type dont WORK
*  DATA(lt_message_ar3) = VALUE ZTYA_DEALER_TT( FOR <ls_msg1> IN lt_ztya_dealer
*  WHERE ( shipper_id = 'BMW' ) ( <ls_msg1> ) ).

*****################################################################

ENDIF.
