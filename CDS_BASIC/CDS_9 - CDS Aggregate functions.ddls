@AbapCatalog.sqlViewName: 'ZCDS_TEST_09'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Aggregations'
define view ZCDS_609879_09 as select from snwd_so
  { 
        key buyer_guid,             
        @Semantics.currencyCode currency_code,
// SUM
       @Semantics.amount.currencyCode: 'currency_code'
        sum(gross_amount) as sum_gross_amount,
// MIN 
       @Semantics.amount.currencyCode: 'currency_code'
        min(gross_amount) as min_gross_amount,
// MAX 
       @Semantics.amount.currencyCode: 'currency_code'
        max(gross_amount) as max_gross_amount,
// AVERAGE
       @Semantics.amount.currencyCode: 'currency_code'
        avg(gross_amount) as avg_gross_amount,
// COUNT      
        count(*) as sales_orders_count 
} group by buyer_guid, currency_code