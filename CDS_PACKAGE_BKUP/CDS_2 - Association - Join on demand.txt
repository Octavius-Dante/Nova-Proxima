@AbapCatalog.sqlViewName: 'ZCDS_TEST_02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS with association -cardinality [1:N]' 

/* COMMENTS for understanding 

THIS CDS has association with cardinality 1:n so when it is executed
first table is shown and if a record is selected (upon right click) 
will get second connected tablerecord -follow assocaition option 
this shows it is called join on demand only works with assocaition 1:n cardinality 

where condition is not possible in this association*/

define view ZCDS_609879_02 as select from ztrustfund
association [1..*] to ztrst_fund as _b // assocaition cardinality 
on $projection.tf_fund = _b.tf_number 
{

   key ztrustfund.tf_fund as fund_number,
   ztrustfund.fikrs as data,
   ztrustfund.tf_fund_grp as fund_group,
   ztrustfund.tf_name as fund_name,
   ztrustfund.tf_donor_no as donor_name,
   
   _b // exposed association table -- join on demand second table    
   
} 

/*{
        // To-one associations
        assoc1 : Association[0..1]    to target; 
        assoc2 : Association          to target; 
        assoc3 : Association[1]       to target; 
        assoc4 : Association[1..1]    to target; // association has one target instance

        // To-many associations
        assoc5 : Association[0..*]    to target{id1};
        assoc6 : Association[]        to target{id1}; // as assoc4, [] is short for [0..*]
        assoc7 : Association[2..7]    to target{id1}; // any numbers are possible; user provides
        assoc8 : Association[1, 0..*] to target{id1}; // additional info. about source cardinality
 };*/