@AbapCatalog.sqlViewName: 'ZTOTAL_SUMMARY_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Total Summary using CDS'


// THIS DID NOT WORK AS EXPECTED - 

define view ZCDS_TOTAL_SUMMARY_3
  as select from ZCDS_SUMMARY_A
{
  cust_num,
  customer_name,
//  CurrencyCode,
  contrib_amt
}

union select from ZCDS_SUMMARY_B

{
  'Others' as cust_num,
  ''       as customer_name,
//  ''       as CurrencyCode,
  contrib_amt
}

union select from ZCDS_SUMMARY_C

{
  'Gr.total' as cust_num,
  ''         as customer_name,
//  ''         as CurrencyCode,
  contrib_amt
};
