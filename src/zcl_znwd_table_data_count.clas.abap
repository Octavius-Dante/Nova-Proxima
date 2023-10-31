CLASS zcl_znwd_table_data_count DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_table_data_count IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT  * FROM znwd_ad INTO TABLE @DATA(lt_znwd_ad).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_AD TABLE RECORDS :' ).
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_attachments INTO TABLE @DATA(lt_znwd_attachments).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_ATTACHMENTS TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_bpa INTO TABLE @DATA(lt_znwd_bpa).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_BPA TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_bpa_contact INTO TABLE @DATA(lt_znwd_bpa_contact).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_BPA_CONTACT TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_company INTO TABLE @DATA(lt_znwd_company).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_COMPANY TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_dg_results INTO TABLE @DATA(lt_znwd_dg_results).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_DG_RESULTS TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_employees INTO TABLE @DATA(lt_znwd_employees).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_EMPLOYEES TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_extensions INTO TABLE @DATA(lt_znwd_extensions).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_EXTENSIONS TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_gi_head INTO TABLE @DATA(lt_znwd_gi_head).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_GI_HEAD TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_gi_i INTO TABLE @DATA(lt_znwd_gi_i).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_GI_I TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_gr_head INTO TABLE @DATA(lt_znwd_gr_head).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_GR_HEAD TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_gr_i INTO TABLE @DATA(lt_znwd_gr_i).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_GR_I TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_itelo_depts INTO TABLE @DATA(lt_znwd_itelo_depts).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_ITELO_DEPTS TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_lr_header INTO TABLE @DATA(lt_znwd_lr_header).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_LR_HEADER TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_lr_item INTO TABLE @DATA(lt_znwd_lr_item).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_LR_ITEM TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_pd INTO TABLE @DATA(lt_znwd_pd).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PD TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_pd_catgos INTO TABLE @DATA(lt_znwd_pd_catgos).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PD_CATGOS TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_pd_cf INTO TABLE @DATA(lt_znwd_pd_cf).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PD_CF TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_po INTO TABLE @DATA(lt_znwd_po).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PO TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_po_inv_head INTO TABLE @DATA(lt_znwd_po_inv_head).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PO_INV_HEAD TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_po_inv_item INTO TABLE @DATA(lt_znwd_po_inv_item).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PO_INV_ITEM TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_po_i INTO TABLE @DATA(lt_znwd_po_i).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PO_I TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_po_sl INTO TABLE @DATA(lt_znwd_po_sl).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PO_SL TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_rev_head INTO TABLE @DATA(lt_znwd_rev_head).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_REV_HEAD TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_rev_item INTO TABLE @DATA(lt_znwd_rev_item).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_REV_ITEM TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_rev_rating INTO TABLE @DATA(lt_znwd_rev_rating).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_REV_RATING TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_settings INTO TABLE @DATA(lt_znwd_settings).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SETTINGS TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_so INTO TABLE @DATA(lt_znwd_so).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SO TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_so_inv_head INTO TABLE @DATA(lt_znwd_so_inv_head).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SO_INV_HEAD TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_so_inv_item INTO TABLE @DATA(lt_znwd_so_inv_item).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SO_INV_ITEM TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_so_i INTO TABLE @DATA(lt_znwd_so_i).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SO_I TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_so_sl INTO TABLE @DATA(lt_znwd_so_sl).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SO_SL TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_staffing INTO TABLE @DATA(lt_znwd_staffing).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_STAFFING TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_stock INTO TABLE @DATA(lt_znwd_stock).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_STOCK TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_texts INTO TABLE @DATA(lt_znwd_texts).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_TEXTS TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_text_key INTO TABLE @DATA(lt_znwd_text_key).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_TEXT_KEY TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
