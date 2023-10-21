@AbapCatalog.sqlViewName: 'zcds_test_03'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS with association -cardinality [1] and where parameter'

/* 

Assocaition with parameters on where condition 
it is only possible when association cardinality is 1:1 

which is same like join condition there is no join on demand
this brings all matching key fields like our regular abap inner join   

*/


define view ZCDS_609879_03 
with parameters 
TF_FUNDNO : ZTF_FUND_NO 
as select from ztrustfund as _a
association [1] to ztrst_fund as _b 
on _a.tf_fund = _b.tf_number
{
   key _a.tf_fund,
   _a.fikrs,
   _a.tf_fund_grp,
   _a.tf_name,
   _a.tf_donor_no,
   _b.bukrs,
   _b.fund,
   _b.tfund_typ,
   _b.program_type,
   _b.tf_hold_curr
}  
 where  _b.tf_hold_curr = 'USD' 
 // parameter call type - 1 // and _a.tf_fund = $parameters.TF_FUNDNO
 // parameter call type - 2 // and _a.tf_fund = :TF_FUNDNO
 and _a.tf_fund = :TF_FUNDNO
 
 
 
 // in naother cds view the above cds can be called like follows 
 
 /*
 this cds is like filtering records for your convenience there is no 
 LOOP in cds so we create more cds and filter records 
 
 define view <new view name> as select from ZCDS_609879_03(tf_fund :'<give the value>')
 {
 tf_fund
 fikrs
 tf_fund_grp
 }
 
 */