CLASS zcl_znwd_po_i_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_po_i_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_PO_I  ****************************

    DATA : it_ZNWD_PO_I TYPE TABLE OF znwd_po_i.

*   fill internal table (itab)
    it_ZNWD_PO_I = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_po_i.
*   insert the new table entries
    INSERT znwd_po_i FROM TABLE @it_znwd_po_i.

*   check the result
    SELECT * FROM znwd_po_i INTO TABLE @it_ZNWD_PO_I.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PO_I table !' ).

* END OF DATA FILL FOR ZNWD_PO_I ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
