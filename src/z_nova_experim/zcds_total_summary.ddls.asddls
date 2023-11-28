@AbapCatalog.sqlViewName: 'ZTOTAL_SUMMARY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS to show total summary'

@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view ZCDS_TOTAL_SUMMARY
  as select from ZCDS_TOP5_CONTR
{
  key cust_num,
      customer_name,
      // THIS IS ANNOTATION IS MANDATORY WHEN YOU GET ERROR FOR LENGHT OR REFERENCE FIELD OR DATA TYPE
      @Semantics.currencyCode
      cast ('USD' as abap.cuky) as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'

      contrib_amt
}

union all

select from ZCDS_SUM_BOTTOM_REC
{
  key 'Others SUM'              as cust_num,
      ''                        as customer_name,
      cast ('USD' as abap.cuky) as CurrencyCode,
      contrib_amt
}

union all

select from ZCDS_CONTR_GR_TOTAL
{
  key 'Grand Total'             as cust_num,
      ''                        as customer_name,
      cast ('USD' as abap.cuky) as CurrencyCode,
      contrib_amt
}
