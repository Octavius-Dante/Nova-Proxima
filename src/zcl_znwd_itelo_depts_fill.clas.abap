CLASS zcl_znwd_itelo_depts_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_itelo_depts_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_ITELO_DEPTS  ****************************

    DATA : it_ZNWD_ITELO_DEPTS TYPE TABLE OF znwd_itelo_depts.

*   fill internal table (itab)
    it_ZNWD_ITELO_DEPTS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_itelo_depts.
*   insert the new table entries
    INSERT znwd_itelo_depts FROM TABLE @it_znwd_itelo_depts.

*   check the result
    SELECT * FROM znwd_itelo_depts INTO TABLE @it_ZNWD_ITELO_DEPTS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_ITELO_DEPTS table !' ).

* END OF DATA FILL FOR ZNWD_ITELO_DEPTS ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
