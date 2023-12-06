CLASS zcl_amdp_4_joins DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS get_data
        FOR TABLE FUNCTION zcds_amdp_4_join.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_4_joins IMPLEMENTATION.
  METHOD get_data
* AMDP Table Function
BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY
USING zmara_1 zmakt.

    mara = select * from zmara_1;

    makt = SELECT a.client, a.matnr, a.mtart, a.meins, maktx
             from :mara as a join zmakt
             on a.matnr = zmakt.matnr;

     RETURN select client as mandt, matnr, mtart, meins, maktx
        from :makt;

  endmethod.
ENDCLASS.
