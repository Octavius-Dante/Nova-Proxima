CLASS zcl_znwd_dg_results_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_dg_results_fill IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_DG_RESULTS  ****************************

    DATA : it_ZNWD_DG_RESULTS TYPE TABLE OF ZNWD_DG_RESULTS.

*   fill internal table (itab)
    it_ZNWD_DG_RESULTS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_DG_RESULTS.
*   insert the new table entries
    INSERT ZNWD_DG_RESULTS FROM TABLE @IT_ZNWD_DG_RESULTS.

*   check the result
    SELECT * FROM ZNWD_DG_RESULTS INTO TABLE @it_ZNWD_DG_RESULTS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_DG_RESULTS table !' ).

* END OF DATA FILL FOR ZNWD_DG_RESULTS ************************
************************************************************************

ENDMETHOD.
ENDCLASS.
