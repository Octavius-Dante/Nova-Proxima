@AbapCatalog.sqlViewName: 'ZCDS_TEST_24'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Date functions - validation check 1'
define view ZCDS_609879_24_DATE_1 
            with parameters p_from_date:abap.dats
            as select from snwd_so
 {
  snwd_so.buyer_guid,
  snwd_so.billing_status,
  
  // returns 1 - Valid Date
  // returns 0 - Invalid Date
   
  DATS_IS_VALID(:p_from_date) as from_date
}
// INPUT THE DATE FORMAT YYYYMMDD