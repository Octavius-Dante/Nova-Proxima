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

* If you’re using a table that starts with a forward slash in a select statement,
* it needs to be encapsulated within double quotes, and all in upper case

* <TABLENAME> = /NWD/APO/MATERIAL  IT SHOULD BE CALLED IN SELECT WITH DOUBLE QUOTES "/NWD/APO/MATERIAL"

    mara = select * from zmara_1;

* Cannot join the tables directly in select have to select a table 
* then keep it in buffer and then use it like (For all entries)

    makt = SELECT a.client, a.matnr, a.mtart, a.meins, maktx
             from :mara as a join zmakt
             on a.matnr = zmakt.matnr;

* can use string operation in where conditions as mentioned below
* left(zmakt.maktx, 10) = 'Sample Text';

     return select client as mandt, matnr, mtart, meins, maktx
        from :makt;

  endmethod.
ENDCLASS.
