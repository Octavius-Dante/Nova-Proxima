CLASS zcl_znwd_x_table_data_count DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_x_table_data_count IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT  * FROM znwd_adx INTO TABLE @DATA(lt_znwd_adx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_ADX TABLE RECORDS :' ).
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_attachx INTO TABLE @DATA(lt_znwd_attachx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_ATTACHX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_bpax INTO TABLE @DATA(lt_znwd_bpax).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_BPAX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_bpa_conx INTO TABLE @DATA(lt_znwd_bpa_conx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_BPA_CONX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_companyx INTO TABLE @DATA(lt_znwd_companyx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_COMPANYX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_dg_resultsx INTO TABLE @DATA(lt_znwd_dg_resultsx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_DG_RESULTSX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_employeesx INTO TABLE @DATA(lt_znwd_employeesx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_EMPLOYEESX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_extensionsx INTO TABLE @DATA(lt_znwd_extensionsx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_EXTENSIONSX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_gi_headx INTO TABLE @DATA(lt_znwd_gi_headx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_GI_HEADX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_gi_ix INTO TABLE @DATA(lt_znwd_gi_ix).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_GI_IX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_gr_headx INTO TABLE @DATA(lt_znwd_gr_headx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_GR_HEADX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_gr_ix INTO TABLE @DATA(lt_znwd_gr_ix).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_GR_IX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_itelo_deptx INTO TABLE @DATA(lt_znwd_itelo_deptx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_ITELO_DEPTX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_lr_headerx INTO TABLE @DATA(lt_znwd_lr_headerx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_LR_HEADERX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_lr_itemx INTO TABLE @DATA(lt_znwd_lr_itemx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_LR_ITEMX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_pdx INTO TABLE @DATA(lt_znwd_pdx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PDX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_pd_catgosx INTO TABLE @DATA(lt_znwd_pd_catgosx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PD_CATGOSX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_pd_cfx INTO TABLE @DATA(lt_znwd_pd_cfx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PD_CFX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_pox INTO TABLE @DATA(lt_znwd_pox).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_POX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_po_inv_hdx INTO TABLE @DATA(lt_znwd_po_inv_hdx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PO_INV_HDX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_po_inv_itmx INTO TABLE @DATA(lt_znwd_po_inv_itmx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PO_INV_ITMX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_po_ix INTO TABLE @DATA(lt_znwd_po_ix).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PO_IX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_po_slx INTO TABLE @DATA(lt_znwd_po_slx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_PO_SLX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_rev_headx INTO TABLE @DATA(lt_znwd_rev_headx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_REV_HEADX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_rev_itemx INTO TABLE @DATA(lt_znwd_rev_itemx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_REV_ITEMX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_rev_ratingx INTO TABLE @DATA(lt_znwd_rev_ratingx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_REV_RATINGX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_settingsx INTO TABLE @DATA(lt_znwd_settingsx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SETTINGSX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_sox INTO TABLE @DATA(lt_znwd_sox).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SOX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_so_inv_hdx INTO TABLE @DATA(lt_znwd_so_inv_hdx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SO_INV_HDX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_so_inv_itmx INTO TABLE @DATA(lt_znwd_so_inv_itmx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SO_INV_ITMX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_so_ix INTO TABLE @DATA(lt_znwd_so_ix).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SO_IX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_so_slx INTO TABLE @DATA(lt_znwd_so_slx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_SO_SLX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_staffx INTO TABLE @DATA(lt_znwd_staffx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_STAFFX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_stocx INTO TABLE @DATA(lt_znwd_stocx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_STOCX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_textx INTO TABLE @DATA(lt_znwd_textx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_TEXTX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.

    SELECT  * FROM znwd_text_keyx INTO TABLE @DATA(lt_znwd_text_keyx).
    IF sy-subrc EQ 0.
      Out->write( 'ZNWD_TEXT_KEYX TABLE RECORDS :').
      Out->write( sy-dbcnt ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
