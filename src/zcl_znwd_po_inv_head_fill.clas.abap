CLASS zcl_znwd_po_inv_head_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_po_inv_head_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_PO_INV_HEAD  ****************************

    DATA : it_ZNWD_PO_INV_HEAD TYPE TABLE OF znwd_po_inv_head.

*   fill internal table (itab)
    it_ZNWD_PO_INV_HEAD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_po_inv_head.
*   insert the new table entries
    INSERT znwd_po_inv_head FROM TABLE @it_znwd_po_inv_head.

*   check the result
    SELECT * FROM znwd_po_inv_head INTO TABLE @it_ZNWD_PO_INV_HEAD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PO_INV_HEAD table !' ).

* END OF DATA FILL FOR ZNWD_PO_INV_HEAD ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
