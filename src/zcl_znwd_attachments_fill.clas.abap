CLASS zcl_znwd_attachments_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_attachments_fill IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_ATTACHMENTS  ****************************

    DATA : it_ZNWD_ATTACHMENTS TYPE TABLE OF ZNWD_ATTACHMENTS.

*   fill internal table (itab)
    it_ZNWD_ATTACHMENTS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_ATTACHMENTS.
*   insert the new table entries
    INSERT ZNWD_ATTACHMENTS FROM TABLE @IT_ZNWD_ATTACHMENTS.

*   check the result
    SELECT * FROM ZNWD_ATTACHMENTS INTO TABLE @it_ZNWD_ATTACHMENTS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_ATTACHMENTS table !' ).

* END OF DATA FILL FOR ZNWD_ATTACHMENTS ************************
************************************************************************
ENDMETHOD.
ENDCLASS.
