CLASS zcl_amdp_7_tab_update DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_amdp_marker_hdb.

  CLASS-METHODS : insert_record
  IMPORTING
  VALUE(iv_matnr) type char18
  EXPORTING
  VALUE(i_message) type char20.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_7_tab_update IMPLEMENTATION.

METHOD insert_record BY DATABASE PROCEDURE FOR HDB
LANGUAGE SQLSCRIPT "OPTIONS READ-ONLY
USING zmara_1 zmara_2.

update_rec = select CLIENT, matnr, mtart, meins
FROM zmara_1 WHERE matnr = :iv_matnr;

INSERT INTO ZMARA_2 SELECT * FROM :UPDATE_REC;
I_MESSAGE = 'Records updated';

ENDMETHOD.

ENDCLASS.