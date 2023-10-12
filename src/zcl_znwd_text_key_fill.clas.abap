CLASS zcl_znwd_text_key_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_text_key_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_TEXT_KEY  ****************************

    DATA : it_ZNWD_TEXT_KEY TYPE TABLE OF znwd_text_key.

*   fill internal table (itab)
    it_ZNWD_TEXT_KEY = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_text_key.
*   insert the new table entries
    INSERT znwd_text_key FROM TABLE @it_znwd_text_key.

*   check the result
    SELECT * FROM znwd_text_key INTO TABLE @it_ZNWD_TEXT_KEY.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_TEXT_KEY table !' ).

* END OF DATA FILL FOR ZNWD_TEXT_KEY ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
