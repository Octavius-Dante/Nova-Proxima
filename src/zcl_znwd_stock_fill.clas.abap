CLASS zcl_znwd_stock_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_stock_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* data fill for znwd_stock  ****************************

    DATA : it_ZNWD_STOCK TYPE TABLE OF znwd_stock.

*   fill internal table (itab)
    it_ZNWD_STOCK = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_stock.
*   insert the new table entries
    INSERT znwd_stock FROM TABLE @it_znwd_stock.

*   check the result
    SELECT * FROM znwd_stock INTO TABLE @it_ZNWD_STOCK.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_STOCK table !' ).

* END OF DATA FILL FOR ZNWD_STOCK ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
