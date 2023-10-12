CLASS zcl_znwd_pd_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_pd_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_PD  ****************************

    DATA : it_ZNWD_PD TYPE TABLE OF znwd_pd.

*   fill internal table (itab)
    it_ZNWD_PD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM znwd_pd.
*   insert the new table entries
    INSERT znwd_pd FROM TABLE @it_znwd_pd.

*   check the result
    SELECT * FROM znwd_pd INTO TABLE @it_ZNWD_PD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PD table !' ).

* END OF DATA FILL FOR ZNWD_PD ************************
************************************************************************

  ENDMETHOD.
ENDCLASS.
