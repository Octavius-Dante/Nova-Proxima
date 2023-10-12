CLASS zcl_znwd_rev_head_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_rev_head_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* data fill for znwd_rev_head  ****************************

      data : it_ZNWD_REV_HEAD type table of znwd_rev_head.

*   fill internal table (itab)
    it_ZNWD_REV_HEAD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_rev_head.
*   insert the new table entries
    INSERT znwd_rev_head FROM TABLE @it_znwd_rev_head.

*   check the result
    SELECT * FROM znwd_rev_head INTO TABLE @it_ZNWD_REV_HEAD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_REV_HEAD table !' ).

* END OF DATA FILL FOR ZNWD_REV_HEAD ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
