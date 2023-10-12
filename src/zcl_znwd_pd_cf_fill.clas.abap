CLASS zcl_znwd_pd_cf_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_pd_cf_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* data fill for znwd_pd_cf  ****************************

    DATA : it_ZNWD_PD_CF TYPE TABLE OF znwd_pd_cf.

*   fill internal table (itab)
    it_ZNWD_PD_CF = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_pd_cf.
*   insert the new table entries
    INSERT znwd_pd_cf FROM TABLE @it_znwd_pd_cf.

*   check the result
    SELECT * FROM znwd_pd_cf INTO TABLE @it_ZNWD_PD_CF.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PD_CF table !' ).

* END OF DATA FILL FOR ZNWD_PD_CF ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
