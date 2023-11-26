@AbapCatalog.sqlViewName: 'ZDEMO_TOTAL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'demo - actual total'
define view ZCDS_CONTR_TOTAl as select from ZCDS_CONTR_LINE_4
{  
   cust_num,
   customer_name,
   contrib_amt
}
union all 
select from ZCDS_CONTR_GR_TOTAL
{
//    cust_num,
//    customer_name,

    'Grand Tot' as cust_num,
    '' as customer_name,  
    contrib_amt  
}

//    'Grand Tot' as cust_num,
//    '' as customer_name,  
