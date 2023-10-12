CLASS zcl_znwd_rev_rating_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_rev_rating_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_REV_RATING  ****************************

    DATA : it_ZNWD_REV_RATING TYPE TABLE OF znwd_rev_rating.

*   fill internal table (itab)
    it_ZNWD_REV_RATING = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_rev_rating.
*   insert the new table entries
    INSERT znwd_rev_rating FROM TABLE @it_znwd_rev_rating.

*   check the result
    SELECT * FROM znwd_rev_rating INTO TABLE @it_ZNWD_REV_RATING.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_REV_RATING table !' ).

* END OF DATA FILL FOR ZNWD_REV_RATING ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
