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
    DELETE FROM znwd_attachments.
    DELETE FROM znwd_bpa.
    DELETE FROM znwd_bpa_contact.
    DELETE FROM znwd_company.
    DELETE FROM znwd_dg_params.
    DELETE FROM znwd_dg_results.
    DELETE FROM znwd_ecma.
    DELETE FROM znwd_employees.
    DELETE FROM znwd_epm_indx.
    DELETE FROM znwd_epm_snaps.
    DELETE FROM znwd_extensions.
    DELETE FROM znwd_gi_head.
    DELETE FROM znwd_gi_i.
    DELETE FROM znwd_gr_head.
    DELETE FROM znwd_gr_i.
    DELETE FROM znwd_itelo_depts.
    DELETE FROM znwd_local_users.
    DELETE FROM znwd_lr_header.
    DELETE FROM znwd_lr_item.
    DELETE FROM znwd_pd.
    DELETE FROM znwd_pd_catgos.
    DELETE FROM znwd_pd_cf.
    DELETE FROM znwd_po.
    DELETE FROM znwd_po_i.
    DELETE FROM znwd_po_inv_head.
    DELETE FROM znwd_po_inv_item.
    DELETE FROM znwd_po_sl.
    DELETE FROM znwd_rev_head.
    DELETE FROM znwd_rev_item.
    DELETE FROM znwd_rev_mark.
    DELETE FROM znwd_rev_rating.
    DELETE FROM znwd_settings.
    DELETE FROM znwd_so.
    DELETE FROM znwd_so_i.
    DELETE FROM znwd_so_inv_head.
    DELETE FROM znwd_so_inv_item.
    DELETE FROM znwd_so_sl.
    DELETE FROM znwd_staffing.
    DELETE FROM znwd_stock.
    DELETE FROM znwd_texts.
    DELETE FROM znwd_text_key.


  ENDMETHOD.
ENDCLASS.
