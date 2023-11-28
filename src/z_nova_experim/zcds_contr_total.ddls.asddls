@AbapCatalog.sqlViewName: 'ZCONTR_TOTAL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'total amount for contr fund table'
define view ZCDS_CONTR_TOTAl
  as select from ZCDS_CONTR_LINE_4
{
  $session.client as client,
  cust_num,
  customer_name,
  contrib_amt
}
union all select from ZCDS_CONTR_GR_TOTAL
{

  $session.client as client,
  'Grand Tot'     as cust_num,
  ''              as customer_name,
  contrib_amt
}
