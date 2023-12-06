@EndUserText.label: 'Demo CDS Sample for joins in AMDP'
define table function ZCDS_AMDP_4_JOIN
returns
{
  key mandt : abap.clnt;
      matnr : abap.char(18);
      mtart : abap.char(4);
      meins : abap.unit(3);
      maktx : abap.char(40);
}
implemented by method
  ZCL_AMDP_4_JOINS=>GET_DATA;