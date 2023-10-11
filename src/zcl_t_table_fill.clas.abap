CLASS zcl_t_table_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_t_table_fill IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZT000  ****************************

    DATA : it_ZT000 TYPE TABLE OF ZT000.

*   fill internal table (itab)
    it_ZT000 = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZT000.
*   insert the new table entries
    INSERT ZT000 FROM TABLE @IT_ZT000.

*   check the result
    SELECT * FROM ZT000 INTO TABLE @it_ZT000.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT000 table !' ).

* END OF DATA FILL FOR ZT000 ************************
************************************************************************
* DATA FILL FOR ZT002  ****************************

    DATA : it_ZT002 TYPE TABLE OF ZT002.

*   fill internal table (itab)
    it_ZT002 = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZT002.
*   insert the new table entries
    INSERT ZT002 FROM TABLE @IT_ZT002.

*   check the result
    SELECT * FROM ZT002 INTO TABLE @it_ZT002.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT002 table !' ).

* END OF DATA FILL FOR ZT002 ************************
************************************************************************
* DATA FILL FOR ZT005  ****************************

    DATA : it_ZT005 TYPE TABLE OF ZT005.

*   fill internal table (itab)
    it_ZT005 = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZT005.
*   insert the new table entries
    INSERT ZT005 FROM TABLE @IT_ZT005.

*   check the result
    SELECT * FROM ZT005 INTO TABLE @it_ZT005.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT005 table !' ).

* END OF DATA FILL FOR ZT005 ************************
************************************************************************
* DATA FILL FOR ZT005A  ****************************

    DATA : it_ZT005A TYPE TABLE OF ZT005A.

*   fill internal table (itab)
    it_ZT005A = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZT005A.
*   insert the new table entries
    INSERT ZT005A FROM TABLE @IT_ZT005A.

*   check the result
    SELECT * FROM ZT005A INTO TABLE @it_ZT005A.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT005A table !' ).

* END OF DATA FILL FOR ZT005A ************************
************************************************************************
* DATA FILL FOR ZT005N  ****************************

    DATA : it_ZT005N TYPE TABLE OF ZT005N.

*   fill internal table (itab)
    it_ZT005N = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZT005N.
*   insert the new table entries
    INSERT ZT005N FROM TABLE @IT_ZT005N.

*   check the result
    SELECT * FROM ZT005N INTO TABLE @it_ZT005N.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT005N table !' ).

* END OF DATA FILL FOR ZT005N ************************
************************************************************************
* DATA FILL FOR ZT006  ****************************

    DATA : it_ZT006 TYPE TABLE OF ZT006.

*   fill internal table (itab)
    it_ZT006 = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZT006.
*   insert the new table entries
    INSERT ZT006 FROM TABLE @IT_ZT006.

*   check the result
    SELECT * FROM ZT006 INTO TABLE @it_ZT006.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT006 table !' ).

* END OF DATA FILL FOR ZT006 ************************
************************************************************************
* DATA FILL FOR ZT006D  ****************************

    DATA : it_ZT006D TYPE TABLE OF ZT006D.

*   fill internal table (itab)
    it_ZT006D = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZT006D.
*   insert the new table entries
    INSERT ZT006D FROM TABLE @IT_ZT006D.

*   check the result
    SELECT * FROM ZT006D INTO TABLE @it_ZT006D.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT006D table !' ).

* END OF DATA FILL FOR ZT006D ************************
************************************************************************
* DATA FILL FOR ZT006I  ****************************

    DATA : it_ZT006I TYPE TABLE OF ZT006I.

*   fill internal table (itab)
    it_ZT006I = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZT006I.
*   insert the new table entries
    INSERT ZT006I FROM TABLE @IT_ZT006I.

*   check the result
    SELECT * FROM ZT006I INTO TABLE @it_ZT006I.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT006I table !' ).

* END OF DATA FILL FOR ZT006I ************************
************************************************************************
* DATA FILL FOR ZTBDLS  ****************************

    DATA : it_ZTBDLS TYPE TABLE OF ZTBDLS.

*   fill internal table (itab)
    it_ZTBDLS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZTBDLS.
*   insert the new table entries
    INSERT ZTBDLS FROM TABLE @IT_ZTBDLS.

*   check the result
    SELECT * FROM ZTBDLS INTO TABLE @it_ZTBDLS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZTBDLS table !' ).

* END OF DATA FILL FOR ZTBDLS ************************
************************************************************************
* DATA FILL FOR ZTCURC  ****************************

    DATA : it_ZTCURC TYPE TABLE OF ZTCURC.

*   fill internal table (itab)
    it_ZTCURC = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZTCURC.
*   insert the new table entries
    INSERT ZTCURC FROM TABLE @IT_ZTCURC.

*   check the result
    SELECT * FROM ZTCURC INTO TABLE @it_ZTCURC.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZTCURC table !' ).

* END OF DATA FILL FOR ZTCURC ************************
************************************************************************


ENDMETHOD.

ENDCLASS.
