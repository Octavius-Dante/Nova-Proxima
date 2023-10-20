CLASS zcl_all_table_flush DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_all_table_flush IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DELETE FROM znwd_po_i.
  ENDMETHOD.
ENDCLASS.
