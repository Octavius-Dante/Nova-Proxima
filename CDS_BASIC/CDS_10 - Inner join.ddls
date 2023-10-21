@AbapCatalog.sqlViewName: 'ZCDS_TEST_10'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS inner join (same)'
define view ZCDS_609879_10 
// KEY FIELD MATCHED RECORDS ARE RETRIEVED 

 as select from spfli inner join scarr
// as select from spfli join scarr  
    on scarr.carrid = spfli.carrid
{ 
  key spfli.carrid      as id, 
  key scarr.carrname    as carrier, 
  key spfli.connid      as flight, 
      spfli.cityfrom    as departure,  
      spfli.cityto      as destination
}