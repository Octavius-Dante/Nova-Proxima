CLASS zcl_znwd_lr_header_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_lr_header_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
* data fill for znwd_lr_header  ****************************

      data : it_ZNWD_LR_HEADER type table of znwd_lr_header.

*   fill internal table (itab)
    it_ZNWD_LR_HEADER = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_lr_header.
*   insert the new table entries
    INSERT znwd_lr_header FROM TABLE @it_znwd_lr_header.

*   check the result
    SELECT * FROM znwd_lr_header INTO TABLE @it_ZNWD_LR_HEADER.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_LR_HEADER table !' ).

* END OF DATA FILL FOR ZNWD_LR_HEADER ************************
************************************************************************
  ENDMETHOD.
ENDCLASS.
