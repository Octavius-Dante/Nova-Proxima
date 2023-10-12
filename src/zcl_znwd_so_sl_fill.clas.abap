CLASS zcl_znwd_so_sl_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_so_sl_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_SO_SL  ****************************

    DATA : it_ZNWD_SO_SL TYPE TABLE OF ZNWD_SO_SL.

*   fill internal table (itab)
    it_ZNWD_SO_SL = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_SO_SL.
*   insert the new table entries
    INSERT ZNWD_SO_SL FROM TABLE @IT_ZNWD_SO_SL.

*   check the result
    SELECT * FROM ZNWD_SO_SL INTO TABLE @it_ZNWD_SO_SL.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_SO_SL table !' ).

* END OF DATA FILL FOR ZNWD_SO_SL ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
