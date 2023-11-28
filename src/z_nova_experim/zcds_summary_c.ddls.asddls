@AbapCatalog.sqlViewName: 'ZCDS_SUMMARY_3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS Total summary View 3'
define view ZCDS_SUMMARY_C as select from ZCDS_CONTR_GR_TOTAL
{
  $session.client as client,
  'Grand Total'             as cust_num,
  ''                        as customer_name,
  // THIS IS ANNOTATION IS MANDATORY WHEN YOU GET ERROR FOR LENGHT OR REFERENCE FIELD OR DATA TYPE
  @Semantics.currencyCode
  cast ('USD' as abap.cuky) as CurrencyCode,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  contrib_amt    
}
