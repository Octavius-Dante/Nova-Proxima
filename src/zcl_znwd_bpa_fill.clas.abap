CLASS zcl_znwd_bpa_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_bpa_fill IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_BPA  ****************************

    DATA : it_ZNWD_BPA TYPE TABLE OF ZNWD_BPA.

*   fill internal table (itab)
    it_ZNWD_BPA = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_BPA.
*   insert the new table entries
    INSERT ZNWD_BPA FROM TABLE @IT_ZNWD_BPA.

*   check the result
    SELECT * FROM ZNWD_BPA INTO TABLE @it_ZNWD_BPA.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_BPA table !' ).

* END OF DATA FILL FOR ZNWD_BPA ************************
************************************************************************

ENDMETHOD.
ENDCLASS.
