CLASS zcl_t_table_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_t_table_fill IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

    DATA : it_zt000 TYPE TABLE OF zt000.

* Read current time stamp
    GET TIME STAMP FIELD DATA(zv_tsl).

*   fill internal table (itab)
    it_zt000 = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zt000.
*   insert the new table entries
    INSERT zt000 FROM TABLE @it_zt000.

*   check the result
    SELECT * FROM zt000 INTO TABLE @it_zt000.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully for ZT000!' ).

ENDMETHOD.

ENDCLASS.
