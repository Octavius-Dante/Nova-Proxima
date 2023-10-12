CLASS zcl_znwd_gr_i_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_gr_i_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_GR_I  ****************************

    DATA : it_ZNWD_GR_I TYPE TABLE OF znwd_gr_i.

*   fill internal table (itab)
    it_ZNWD_GR_I = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_gr_i.
*   insert the new table entries
    INSERT znwd_gr_i FROM TABLE @it_znwd_gr_i.

*   check the result
    SELECT * FROM znwd_gr_i INTO TABLE @it_ZNWD_GR_I.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_GR_I table !' ).

* END OF DATA FILL FOR ZNWD_GR_I ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.



