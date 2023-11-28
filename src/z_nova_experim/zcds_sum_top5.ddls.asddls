@AbapCatalog.sqlViewName: 'Z_SUM_TOP5'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS to Sum Top 5 records'
define view ZCDS_SUM_TOP5
  as select from ZCDS_TOP5_CONTR
//                 ( p_sap_clnt:  $session.client)   // IF PARAMETERS WAS THERE IN SELECTION CDS  
{
//  cust_num,
//  customer_name,
  sum(contrib_amt) as CONTRIB_AMT
} 

// group by cust_num, customer_name;
