CLASS zcl_znwd_lr_item_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_lr_item_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_LR_ITEM  ****************************

    DATA : it_ZNWD_LR_ITEM TYPE TABLE OF znwd_lr_item.

*   fill internal table (itab)
    it_ZNWD_LR_ITEM = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_lr_item.
*   insert the new table entries
    INSERT znwd_lr_item FROM TABLE @it_znwd_lr_item.

*   check the result
    SELECT * FROM znwd_lr_item INTO TABLE @it_ZNWD_LR_ITEM.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_LR_ITEM table !' ).

* END OF DATA FILL FOR ZNWD_LR_ITEM ************************
************************************************************************
  ENDMETHOD.

ENDCLASS.
