
    @ClientHandling: {
    type: #INHERITED //,
    //algorithm: #SESSION_VARIABLE
    }


@AbapCatalog.sqlViewName: 'ZCDS_SUMMARY_1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS Total summary View 1'
define view ZCDS_SUMMARY_A as select from ZCDS_TOP5_CONTR
{
  $session.client as client,
  cust_num,
  customer_name,
  // THIS IS ANNOTATION IS MANDATORY WHEN YOU GET ERROR FOR LENGHT OR REFERENCE FIELD OR DATA TYPE
  @Semantics.currencyCode
  cast ('USD' as abap.cuky) as CurrencyCode,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  contrib_amt
}
