CLASS zcl_znwd_extensions_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_extensions_fill IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_EXTENSIONS  ****************************

    DATA : it_ZNWD_EXTENSIONS TYPE TABLE OF ZNWD_EXTENSIONS.

*   fill internal table (itab)
    it_ZNWD_EXTENSIONS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_EXTENSIONS.
*   insert the new table entries
    INSERT ZNWD_EXTENSIONS FROM TABLE @IT_ZNWD_EXTENSIONS.

*   check the result
    SELECT * FROM ZNWD_EXTENSIONS INTO TABLE @it_ZNWD_EXTENSIONS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_EXTENSIONS table !' ).

* END OF DATA FILL FOR ZNWD_EXTENSIONS ************************
************************************************************************

ENDMETHOD.
ENDCLASS.
