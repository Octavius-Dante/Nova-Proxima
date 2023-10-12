CLASS zcl_znwd_so_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_so_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_SO  ****************************

    DATA : it_ZNWD_SO TYPE TABLE OF znwd_so.

*   fill internal table (itab)
    it_ZNWD_SO = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_so.
*   insert the new table entries
    INSERT znwd_so FROM TABLE @it_znwd_so.

*   check the result
    SELECT * FROM znwd_so INTO TABLE @it_ZNWD_SO.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_SO table !' ).

* END OF DATA FILL FOR ZNWD_SO ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
