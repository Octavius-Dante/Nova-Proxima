CLASS zcl_znwd_gi_head_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_gi_head_fill IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_GI_HEAD  ****************************

    DATA : it_ZNWD_GI_HEAD TYPE TABLE OF ZNWD_GI_HEAD.

*   fill internal table (itab)
    it_ZNWD_GI_HEAD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_GI_HEAD.
*   insert the new table entries
    INSERT ZNWD_GI_HEAD FROM TABLE @IT_ZNWD_GI_HEAD.

*   check the result
    SELECT * FROM ZNWD_GI_HEAD INTO TABLE @it_ZNWD_GI_HEAD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_GI_HEAD table !' ).

* END OF DATA FILL FOR ZNWD_GI_HEAD ************************
************************************************************************

ENDMETHOD.
ENDCLASS.
