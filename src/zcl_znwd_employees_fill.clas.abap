CLASS zcl_znwd_employees_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_znwd_employees_fill IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_EMPLOYEES  ****************************

    DATA : it_ZNWD_EMPLOYEES TYPE TABLE OF ZNWD_EMPLOYEES.

*   fill internal table (itab)
    it_ZNWD_EMPLOYEES = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_EMPLOYEES.
*   insert the new table entries
    INSERT ZNWD_EMPLOYEES FROM TABLE @IT_ZNWD_EMPLOYEES.

*   check the result
    SELECT * FROM ZNWD_EMPLOYEES INTO TABLE @it_ZNWD_EMPLOYEES.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_EMPLOYEES table !' ).

* END OF DATA FILL FOR ZNWD_EMPLOYEES ************************
************************************************************************

ENDMETHOD.
ENDCLASS.
