CLASS zcl_znwd_bpa_contact_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_bpa_contact_fill IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_BPA_CONTACT  ****************************

    DATA : it_ZNWD_BPA_CONTACT TYPE TABLE OF ZNWD_BPA_CONTACT.

*   fill internal table (itab)
    it_ZNWD_BPA_CONTACT = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_BPA_CONTACT.
*   insert the new table entries
    INSERT ZNWD_BPA_CONTACT FROM TABLE @IT_ZNWD_BPA_CONTACT.

*   check the result
    SELECT * FROM ZNWD_BPA_CONTACT INTO TABLE @it_ZNWD_BPA_CONTACT.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_BPA_CONTACT table !' ).

* END OF DATA FILL FOR ZNWD_BPA_CONTACT ************************
************************************************************************

ENDMETHOD.
ENDCLASS.
