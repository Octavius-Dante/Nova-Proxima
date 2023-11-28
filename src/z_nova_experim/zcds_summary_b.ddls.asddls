@AbapCatalog.sqlViewName: 'ZCDS_SUMMARY_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS Total summary View 2'
define view ZCDS_SUMMARY_B as select from ZCDS_SUM_BOTTOM_REC
{
  $session.client as client,
  'Others SUM'              as cust_num,
  ''                        as customer_name,
  // THIS IS ANNOTATION IS MANDATORY WHEN YOU GET ERROR FOR LENGHT OR REFERENCE FIELD OR DATA TYPE
  @Semantics.currencyCode
  cast ('USD' as abap.cuky) as CurrencyCode,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  contrib_amt    
}
