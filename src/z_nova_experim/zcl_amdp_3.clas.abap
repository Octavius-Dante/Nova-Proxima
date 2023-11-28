CLASS zcl_amdp_3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS get_amt_details
        FOR TABLE FUNCTION ZCDS_TOTAL_SUMMARY_2.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_3 IMPLEMENTATION.

  METHOD get_amt_details
* AMDP Table Function
  BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY
  USING zcds_summary_a zcds_summary_b zcds_summary_c.

* CLIENT needs to be presented in every TABLE function mandt is mandatory in return parameter
* so selection table (cds) should have MANDT or we should fill it separately

** Part 1
    ITAB_1 = SELECT client, cust_num, customer_name, Contrib_amt
             FROM ZCDS_SUMMARY_A ORDER BY CUST_NUM;
** Part 2
    ITAB_2 = SELECT client, cust_num, customer_name, contrib_amt
             FROM ZCDS_SUMMARY_B ORDER BY CUST_NUM;
** Part 3
    ITAB_3 = SELECT client, cust_num, customer_name, contrib_amt
             FROM ZCDS_SUMMARY_C ORDER BY CUST_NUM;

* APPEND ALL ITABS IN SEQUENCE TO FINAL TAB AND PUSH IT TO RETURN

* WORK IN PROGRESS

*    RETURN SELECT client, cust_num, customer_name, contrib_amt
*           FROM :ITAB_3;

         RETURN SELECT * FROM :ITAB_1
                UNION ALL
                SELECT * FROM :ITAB_2
                UNION ALL
                SELECT * FROM :ITAB_3;

  ENDMETHOD.

ENDCLASS.
