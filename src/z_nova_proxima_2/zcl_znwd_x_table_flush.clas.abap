CLASS zcl_znwd_x_table_flush DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_x_table_flush IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DELETE FROM znwd_adx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_ADX ! ' ).
    ENDIF.

    DELETE FROM znwd_attachx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_ATTACHX ! ' ).
    ENDIF.

    DELETE FROM znwd_bpax.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_BPAX ! ' ).
    ENDIF.

    DELETE FROM znwd_bpa_conx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_BPA_CONX ! ' ).
    ENDIF.

    DELETE FROM znwd_companyx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_COMPANYX ! ' ).
    ENDIF.

    DELETE FROM znwd_dg_paramsx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_DG_PARAMSX ! ' ).
    ENDIF.

    DELETE FROM znwd_dg_resultsx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_DG_RESULTSX ! ' ).
    ENDIF.

    DELETE FROM znwd_ecmax.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_ECMAX ! ' ).
    ENDIF.

    DELETE FROM znwd_employeesx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_EMPLOYEESX ! ' ).
    ENDIF.

    DELETE FROM znwd_extensionsx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_EXTENSIONSX ! ' ).
    ENDIF.

    DELETE FROM znwd_gi_headx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_GI_HEADX ! ' ).
    ENDIF.

    DELETE FROM znwd_gi_ix.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_GI_IX ! ' ).
    ENDIF.

    DELETE FROM znwd_gr_headx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_GR_HEADX ! ' ).
    ENDIF.

    DELETE FROM znwd_gr_ix.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_GR_IX ! ' ).
    ENDIF.

    DELETE FROM znwd_itelo_deptx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_ITELO_DEPTX ! ' ).
    ENDIF.

    DELETE FROM znwd_local_usrx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_LOCAL_USRX ! ' ).
    ENDIF.

    DELETE FROM znwd_lr_headerx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_LR_HEADERX ! ' ).
    ENDIF.

    DELETE FROM znwd_lr_itemx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_LR_ITEMX ! ' ).
    ENDIF.

    DELETE FROM znwd_pdx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_PDX ! ' ).
    ENDIF.

    DELETE FROM znwd_pd_catgosx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_PD_CATGOSX ! ' ).
    ENDIF.

    DELETE FROM znwd_pd_cfx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_PD_CFX ! ' ).
    ENDIF.

    DELETE FROM znwd_poix.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_POIX ! ' ).
    ENDIF.

    DELETE FROM znwd_pox.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_POX ! ' ).
    ENDIF.

    DELETE FROM znwd_po_inv_hdx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_PO_INV_HDX ! ' ).
    ENDIF.

    DELETE FROM znwd_po_inv_itmx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_PO_INV_ITMX ! ' ).
    ENDIF.

    DELETE FROM znwd_po_slx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_PO_SLX ! ' ).
    ENDIF.

    DELETE FROM znwd_rev_headx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_REV_HEADX ! ' ).
    ENDIF.

    DELETE FROM znwd_rev_itemx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_REV_ITEMX ! ' ).
    ENDIF.

    DELETE FROM znwd_rev_marx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_REV_MARX ! ' ).
    ENDIF.

    DELETE FROM znwd_rev_ratingx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_REV_RATINGX ! ' ).
    ENDIF.

    DELETE FROM znwd_settingsx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_SETTINGSX ! ' ).
    ENDIF.

    DELETE FROM znwd_sox.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_SOX ! ' ).
    ENDIF.

    DELETE FROM znwd_so_inv_hdx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_SO_INV_HDX ! ' ).
    ENDIF.

    DELETE FROM znwd_so_inv_itmx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_SO_INV_ITMX ! ' ).
    ENDIF.

    DELETE FROM znwd_so_ix.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_SO_IX ! ' ).
    ENDIF.

    DELETE FROM znwd_so_slx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_SO_SLX ! ' ).
    ENDIF.

    DELETE FROM znwd_staffx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_STAFFX ! ' ).
    ENDIF.

    DELETE FROM znwd_stocx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_STOCX ! ' ).
    ENDIF.

    DELETE FROM znwd_textx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_TEXTX ! ' ).
    ENDIF.

    DELETE FROM znwd_text_keyx.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for  ZNWD_TEXT_KEYX ! ' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
