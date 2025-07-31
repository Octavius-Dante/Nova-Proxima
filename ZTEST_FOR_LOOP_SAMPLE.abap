*&---------------------------------------------------------------------*
*& Report ZTEST_VALUE_FOR_LOOP_FILTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_value_for_loop_filter.

BREAK-POINT.

SELECT * FROM afih INTO TABLE @DATA(gt_afih).
IF sy-subrc EQ 0.
  SELECT * FROM zeam_insp_conf INTO TABLE @DATA(gt_conf)
    FOR ALL ENTRIES IN @gt_afih
    WHERE aufnr EQ @gt_afih-aufnr.
  IF sy-subrc EQ 0.

    DATA(lt_afih) = gt_afih.
    CLEAR lt_afih.

    DATA(lt_conf) = gt_conf.
    CLEAR lt_conf.

    DATA(gt_conf_bkup) = gt_conf.

    DATA(lt_conf_2) = gt_conf.
    CLEAR lt_conf_2.

** For loop sample # 1
**##########################################################################################
    lt_afih = VALUE #( FOR ls_wa IN gt_afih
    WHERE ( ilart EQ 'REG' ) ( ls_wa ) ).

**##########################################################################################

* FILTERING gt_conf records into another lt_conf records
    BREAK-POINT.

    SORT lt_afih BY aufnr.
    SORT gt_afih BY aufnr.
    SORT gt_conf BY aufnr.

    DELETE ADJACENT DUPLICATES FROM gt_conf COMPARING aufnr.

    LOOP AT lt_afih INTO DATA(ls_afih_jbi).

      READ TABLE gt_conf ASSIGNING FIELD-SYMBOL(<lfs_conf>)
      WITH KEY aufnr = ls_afih_jbi-aufnr BINARY SEARCH.
      IF sy-subrc EQ 0.
        APPEND <lfs_conf> TO lt_conf.
        CLEAR <lfs_conf>. " removing the JBI records from GT_CONF (a blank record will be formed)
      ENDIF.

      CLEAR ls_afih_jbi.
    ENDLOOP.

    BREAK-POINT.

* Removing the blank records formed from JBI filtering.
    DELETE gt_conf WHERE aufnr EQ space.
    SORT lt_conf BY aufnr vornr start_point.

    BREAK-POINT.

    SORT gt_conf_bkup BY aufnr.
    DELETE ADJACENT DUPLICATES FROM gt_conf_bkup COMPARING aufnr.

** For loop sample # 2
* Multiple FOR loop Value # filter
**##########################################################################################
    lt_conf_2 = VALUE #( FOR ls_afih IN gt_afih WHERE ( ilart = 'REG')
                         FOR ls_conf IN gt_conf_bkup WHERE ( aufnr = ls_afih-aufnr AND
                                                             linear_flg = abap_true )
                       ( ls_conf ) ).

**##########################################################################################

    LOOP AT lt_conf_2 INTO DATA(ls_conf_2).
      DELETE gt_conf_bkup WHERE aufnr = ls_conf_2-aufnr.
    ENDLOOP.

    BREAK-POINT.

  ENDIF.
ENDIF.


TYPES : BEGIN OF ty_flight,
          seq_num TYPE i,
          carrier TYPE s_carrname,
          connect TYPE s_conn_id,
          fldate  TYPE s_date,
        END OF ty_flight.

DATA : lt_new_flights   TYPE STANDARD TABLE OF ty_flight,
       lt_new_flights_2 TYPE STANDARD TABLE OF ty_flight,
       lt_new_flights_3 TYPE STANDARD TABLE OF ty_flight.

SELECT * FROM sflight INTO TABLE @DATA(lt_flights).
IF sy-subrc EQ 0.
  SELECT * FROM scarr INTO TABLE @DATA(lt_scarr).

ENDIF.

** For loop sample # 3
**##########################################################################################
"FOR Iteration
lt_new_flights = VALUE #( FOR ls_flight IN lt_flights INDEX INTO lv_index
                          WHERE ( carrid = 'AA' AND
                                 connid = '0017' )

    LET lv_carrname = lt_scarr[ carrid = ls_flight-carrid ]-carrname
    IN  carrier = lv_carrname
      (
        seq_num = lv_index
        connect = ls_flight-connid
        fldate  = ls_flight-fldate
      ) ).


lt_new_flights_2 = VALUE #( FOR ls_flight IN lt_flights INDEX INTO lv_index
                            WHERE ( carrid = 'AA' AND
                                    connid = '0017' )

    LET lv_carrname = lt_scarr[ carrid = ls_flight-carrid ]-carrname
*    IN  carrier = lv_carrname
      IN
      (
        carrier = lv_carrname
        seq_num = lv_index
        connect = ls_flight-connid
        fldate  = ls_flight-fldate
      ) ).

lt_new_flights_3 = VALUE #( FOR ls_flight IN lt_flights INDEX INTO lv_index
                            WHERE ( carrid = 'AA' AND
                                    connid = '0017' )

                     FOR ls_scarr IN lt_scarr WHERE ( carrid = ls_flight-carrid )

                   ( carrier = ls_scarr-carrname
                     seq_num = lv_index
                     connect = ls_flight-connid
                     fldate  = ls_flight-fldate
                     ) ).

**##########################################################################################

BREAK-POINT.
