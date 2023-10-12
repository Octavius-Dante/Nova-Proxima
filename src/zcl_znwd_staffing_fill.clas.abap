CLASS zcl_znwd_staffing_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_staffing_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_STAFFING  ****************************

    DATA : it_ZNWD_STAFFING TYPE TABLE OF znwd_staffing.

*   fill internal table (itab)
    it_ZNWD_STAFFING = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_staffing.
*   insert the new table entries
    INSERT znwd_staffing FROM TABLE @it_znwd_staffing.

*   check the result
    SELECT * FROM znwd_staffing INTO TABLE @it_ZNWD_STAFFING.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_STAFFING table !' ).

* END OF DATA FILL FOR ZNWD_STAFFING ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
