CLASS zcl_znwd_texts_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_texts_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_TEXTS  ****************************

    DATA : it_ZNWD_TEXTS TYPE TABLE OF znwd_texts.

*   fill internal table (itab)
    it_ZNWD_TEXTS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_texts.
*   insert the new table entries
    INSERT znwd_texts FROM TABLE @it_znwd_texts.

*   check the result
    SELECT * FROM znwd_texts INTO TABLE @it_ZNWD_TEXTS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_TEXTS table !' ).

* END OF DATA FILL FOR ZNWD_TEXTS ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
