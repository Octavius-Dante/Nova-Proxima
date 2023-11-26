@AbapCatalog.sqlViewName: 'ZCDS_CUST_CONTR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'demo cds for customer detail contr'
define view ZCDS_CUSTOMER_CONTR as select from ztrst_contr_head as _contrhead 
association [1..1] to zkna1 as _kna1 on _kna1.kunnr = _contrhead.cust_num
{
    //key _contrhead.bukrs,
    key _contrhead.fund,
        _contrhead.cust_num,
    concat_with_space(_kna1.name1,_kna1.name2,1) as customer_name
   
}


