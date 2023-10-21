@AbapCatalog.sqlViewName: 'ZCDS_TEST_25'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Date functions - 2'
define view ZCDS_609879_25_DATE_2 as select from vbak
{
    
  vbak.vbeln,  //Sales Document
  vbak.auart,  //Sales Document Type
  vbak.audat,  //Document Date
  vbak.vdatu,  //Requested delivery date
  
// DATS_DAYS_BETWEEN( date1 , date2 ) 
// this is used to get the values between given 2 dates

  DATS_DAYS_BETWEEN(audat, vdatu) as no_of_days,  

  
// DATS_ADD_DAYS( date , days , on_error )
// adds days to the specified date 

  DATS_ADD_DAYS(vdatu,  10, 'NULL')      as option_1_1,  //add 10 days
  DATS_ADD_DAYS(vdatu, -10, 'NULL')      as option_1_2,  //substract 10 days
  DATS_ADD_DAYS(vdatu,   5, 'FAIL')      as option_1_3,
  DATS_ADD_DAYS(vdatu,   4, 'INITIAL')   as option_1_4,
  DATS_ADD_DAYS(vdatu,   2, 'UNCHANGED') as option_1_5,
  
// DATS_ADD_MONTHS(date, months, on_error)
// add months to the specified date
  
  DATS_ADD_MONTHS(vdatu,  10, 'NULL')      as option_2_1,  //add 10 months
  DATS_ADD_MONTHS(vdatu, -10, 'NULL')      as option_2_2,  //substract 10 months 
  DATS_ADD_MONTHS(vdatu,   5, 'FAIL')      as option_2_3, 
  DATS_ADD_MONTHS(vdatu,   4, 'INITIAL')   as option_2_4,
  DATS_ADD_MONTHS(vdatu,   2, 'UNCHANGED') as option_2_5
  
}