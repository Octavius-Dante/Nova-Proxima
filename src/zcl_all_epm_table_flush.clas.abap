CLASS zcl_all_epm_table_flush DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_all_epm_table_flush IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


    DELETE FROM znwd_ad.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for ZNWD_AD table !' ).
    ENDIF.

    DELETE FROM znwd_attachments.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_attachments table !' ).
    ENDIF.

    DELETE FROM znwd_bpa.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_bpa table !' ).
    ENDIF.

    DELETE FROM znwd_bpa_contact.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_bpa_contact table !' ).
    ENDIF.

    DELETE FROM znwd_company.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_company table !' ).
    ENDIF.

    DELETE FROM znwd_dg_params.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_dg_params table !' ).
    ENDIF.

    DELETE FROM znwd_dg_results.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_dg_results table !' ).
    ENDIF.

    DELETE FROM znwd_ecma.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_ecma table !' ).
    ENDIF.

    DELETE FROM znwd_employees.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_employees table !' ).
    ENDIF.

*    DELETE FROM znwd_epm_indx.
*    IF sy-dbcnt NE 0.
*      Out->write( sy-dbcnt ).
*      Out->write( 'Data deleted successfully for znwd_epm_indx table !' ).
*    ENDIF.

*    DELETE FROM znwd_epm_snaps.
*    IF sy-dbcnt NE 0.
*      Out->write( sy-dbcnt ).
*      Out->write( 'Data deleted successfully for znwd_epm_snaps table !' ).
*    ENDIF.

    DELETE FROM znwd_extensions.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_extensions table !' ).
    ENDIF.

    DELETE FROM znwd_gi_head.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_gi_head table !' ).
    ENDIF.

    DELETE FROM znwd_gi_i.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_gi_i table !' ).
    ENDIF.

    DELETE FROM znwd_gr_head.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_gr_head table !' ).
    ENDIF.

    DELETE FROM znwd_gr_i.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_gr_i table !' ).
    ENDIF.

    DELETE FROM znwd_itelo_depts.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_itelo_depts table !' ).
    ENDIF.

    DELETE FROM znwd_local_users.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_local_users table !' ).
    ENDIF.

    DELETE FROM znwd_lr_header.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_lr_header table !' ).
    ENDIF.

    DELETE FROM znwd_lr_item.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_lr_item table !' ).
    ENDIF.

    DELETE FROM znwd_pd.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_pd table !' ).
    ENDIF.

    DELETE FROM znwd_pd_catgos.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_pd_catgos table !' ).
    ENDIF.

    DELETE FROM znwd_pd_cf.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_pd_cf table !' ).
    ENDIF.

    DELETE FROM znwd_po.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_po table !' ).
    ENDIF.

    DELETE FROM znwd_po_i.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_po_i table !' ).
    ENDIF.

    DELETE FROM znwd_po_inv_head.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_po_inv_head table !' ).
    ENDIF.

    DELETE FROM znwd_po_inv_item.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_po_inv_item table !' ).
    ENDIF.

    DELETE FROM znwd_po_sl.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_po_sl table !' ).
    ENDIF.

    DELETE FROM znwd_rev_head.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_rev_head table !' ).
    ENDIF.

    DELETE FROM znwd_rev_item.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_rev_item table !' ).
    ENDIF.

    DELETE FROM znwd_rev_mark.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_rev_mark table !' ).
    ENDIF.

    DELETE FROM znwd_rev_rating.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_rev_rating table !' ).
    ENDIF.

    DELETE FROM znwd_settings.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_settings table !' ).
    ENDIF.

    DELETE FROM znwd_so.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_so table !' ).
    ENDIF.

    DELETE FROM znwd_so_i.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_so_i table !' ).
    ENDIF.

    DELETE FROM znwd_so_inv_head.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_so_inv_head table !' ).
    ENDIF.

    DELETE FROM znwd_so_inv_item.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_so_inv_item table !' ).
    ENDIF.

    DELETE FROM znwd_so_sl.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_so_sl table !' ).
    ENDIF.

    DELETE FROM znwd_staffing.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_staffing table !' ).
    ENDIF.

    DELETE FROM znwd_stock.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_stock table !' ).
    ENDIF.

    DELETE FROM znwd_texts.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_texts table !' ).
    ENDIF.

    DELETE FROM znwd_text_key.
    IF sy-dbcnt NE 0.
      Out->write( sy-dbcnt ).
      Out->write( 'Data deleted successfully for znwd_text_key table !' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
