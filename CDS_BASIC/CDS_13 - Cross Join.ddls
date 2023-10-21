@AbapCatalog.sqlViewName: 'ZCDS_TEST_13'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sample cross join check'
define view ZCDS_609879_13    

// This join exist in S4 but not avilalbe in EHp8
// Brings records from first table and secodn table with combination 
// example first table 21 records second table 40 records
// result will be 21 x 40 - combination records 840

as select from sflight 
    cross join spfli
{ 
  key sflight.carrid as id, 
  key spfli.connid as flight
}
