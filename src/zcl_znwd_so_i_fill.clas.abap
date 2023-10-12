CLASS zcl_znwd_so_i_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_so_i_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_SO_I  ****************************

    DATA : it_ZNWD_SO_I TYPE TABLE OF znwd_so_i.

*   fill internal table (itab)
    it_ZNWD_SO_I = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_so_i.
*   insert the new table entries
    INSERT znwd_so_i FROM TABLE @it_znwd_so_i.

*   check the result
    SELECT * FROM znwd_so_i INTO TABLE @it_ZNWD_SO_I.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_SO_I table !' ).

* END OF DATA FILL FOR ZNWD_SO_I ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
