CLASS zcl_znwd_ad_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_ad_fill IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_AD  ****************************

    DATA : it_ZNWD_AD TYPE TABLE OF ZNWD_AD.

*   fill internal table (itab)
    it_ZNWD_AD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_AD.
*   insert the new table entries
    INSERT ZNWD_AD FROM TABLE @IT_ZNWD_AD.

*   check the result
    SELECT * FROM ZNWD_AD INTO TABLE @it_ZNWD_AD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_AD table !' ).

* END OF DATA FILL FOR ZNWD_AD ************************
*************************************************************************
ENDMETHOD.
ENDCLASS.
