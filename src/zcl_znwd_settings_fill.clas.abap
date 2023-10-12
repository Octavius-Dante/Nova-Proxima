CLASS zcl_znwd_settings_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_settings_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_SETTINGS  ****************************

    DATA : it_ZNWD_SETTINGS TYPE TABLE OF znwd_settings.

*   fill internal table (itab)
    it_ZNWD_SETTINGS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_settings.
*   insert the new table entries
    INSERT znwd_settings FROM TABLE @it_znwd_settings.

*   check the result
    SELECT * FROM znwd_settings INTO TABLE @it_ZNWD_SETTINGS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_SETTINGS table !' ).

* END OF DATA FILL FOR ZNWD_SETTINGS ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
