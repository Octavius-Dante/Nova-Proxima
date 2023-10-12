CLASS zcl_znwd_gi_i_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_gi_i_fill IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_GI_I  ****************************

    DATA : it_ZNWD_GI_I TYPE TABLE OF ZNWD_GI_I.

*   fill internal table (itab)
    it_ZNWD_GI_I = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_GI_I.
*   insert the new table entries
    INSERT ZNWD_GI_I FROM TABLE @IT_ZNWD_GI_I.

*   check the result
    SELECT * FROM ZNWD_GI_I INTO TABLE @it_ZNWD_GI_I.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_GI_I table !' ).

* END OF DATA FILL FOR ZNWD_GI_I ************************
************************************************************************

ENDMETHOD.
ENDCLASS.
