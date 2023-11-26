@AbapCatalog.sqlViewName: 'ZDEMO_GR_TOTAL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'demo Grandtotal'
define view ZCDS_CONTR_GR_TOTAL as select from ZCDS_CONTR_LINE_4
{    
//    'Grand Tot' as cust_num,
//    '' as customer_name,   
    sum(contrib_amt) as contrib_amt    
}
