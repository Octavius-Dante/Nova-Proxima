CLASS zcl_znwd_company_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_company_fill IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_COMPANY  ****************************

    DATA : it_ZNWD_COMPANY TYPE TABLE OF ZNWD_COMPANY.

*   fill internal table (itab)
    it_ZNWD_COMPANY = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_COMPANY.
*   insert the new table entries
    INSERT ZNWD_COMPANY FROM TABLE @IT_ZNWD_COMPANY.

*   check the result
    SELECT * FROM ZNWD_COMPANY INTO TABLE @it_ZNWD_COMPANY.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_COMPANY table !' ).

* END OF DATA FILL FOR ZNWD_COMPANY ************************
************************************************************************

ENDMETHOD.
ENDCLASS.
