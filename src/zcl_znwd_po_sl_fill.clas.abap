CLASS zcl_znwd_po_sl_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_po_sl_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_PO_SL  ****************************

    DATA : it_ZNWD_PO_SL TYPE TABLE OF znwd_po_sl.

*   fill internal table (itab)
    it_ZNWD_PO_SL = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_po_sl.
*   insert the new table entries
    INSERT znwd_po_sl FROM TABLE @it_znwd_po_sl.

*   check the result
    SELECT * FROM znwd_po_sl INTO TABLE @it_ZNWD_PO_SL.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PO_SL table !' ).

* END OF DATA FILL FOR ZNWD_PO_SL ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
