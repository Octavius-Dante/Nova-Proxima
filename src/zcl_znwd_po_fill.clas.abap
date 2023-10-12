CLASS zcl_znwd_po_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_po_fill IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_PO  ****************************

    DATA : it_ZNWD_PO TYPE TABLE OF ZNWD_PO.

*   fill internal table (itab)
    it_ZNWD_PO = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_PO.
*   insert the new table entries
    INSERT ZNWD_PO FROM TABLE @IT_ZNWD_PO.

*   check the result
    SELECT * FROM ZNWD_PO INTO TABLE @it_ZNWD_PO.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PO table !' ).

* END OF DATA FILL FOR ZNWD_PO ************************
************************************************************************
ENDMETHOD.
ENDCLASS.
