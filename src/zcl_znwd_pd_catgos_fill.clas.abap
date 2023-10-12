CLASS zcl_znwd_pd_catgos_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_pd_catgos_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_PD_CATGOS  ****************************

    DATA : it_ZNWD_PD_CATGOS TYPE TABLE OF znwd_pd_catgos.

*   fill internal table (itab)
    it_ZNWD_PD_CATGOS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_pd_catgos.
*   insert the new table entries
    INSERT znwd_pd_catgos FROM TABLE @it_znwd_pd_catgos.

*   check the result
    SELECT * FROM znwd_pd_catgos INTO TABLE @it_ZNWD_PD_CATGOS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PD_CATGOS table !' ).

* END OF DATA FILL FOR ZNWD_PD_CATGOS ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
