CLASS zcl_amdp_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS get_amt_details
        FOR TABLE FUNCTION ZCDS_BOTTOM_REC_CONTR.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_2 IMPLEMENTATION.

  METHOD get_amt_details
* AMDP Table Function
  BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY
  USING zcds_contr_line_4.

* CLIENT needs to be presented in every TABLE function mandt is mandatory in return parameter
* so selection table (cds) should have MANDT or we should fill it separately

*    RETURN  select TOP 5 distinct
*            mandt, cust_num, customer_name, contrib_amt
*            from zcds_contr_line_4 order by contrib_amt desc;

    RETURN  select TOP 37 distinct
            mandt, cust_num, customer_name, contrib_amt
            from zcds_contr_line_4 order by contrib_amt ASC;

  ENDMETHOD.


ENDCLASS.
