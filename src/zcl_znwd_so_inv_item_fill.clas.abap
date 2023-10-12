CLASS zcl_znwd_so_inv_item_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_so_inv_item_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_SO_INV_ITEM  ****************************

    DATA : it_ZNWD_SO_INV_ITEM TYPE TABLE OF ZNWD_SO_INV_ITEM.

*   fill internal table (itab)
    it_ZNWD_SO_INV_ITEM = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_SO_INV_ITEM.
*   insert the new table entries
    INSERT ZNWD_SO_INV_ITEM FROM TABLE @IT_ZNWD_SO_INV_ITEM.

*   check the result
    SELECT * FROM ZNWD_SO_INV_ITEM INTO TABLE @it_ZNWD_SO_INV_ITEM.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_SO_INV_ITEM table !' ).

* END OF DATA FILL FOR ZNWD_SO_INV_ITEM ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
