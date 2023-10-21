@AbapCatalog.sqlViewName: 'ZCDS_TEST_11'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'left outer join'
define view ZCDS_609879_11   

// EVERYTHING FROM THE left table and matching key field records in the right selected 
as select from scarr left outer join spfli
    on scarr.carrid = spfli.carrid
{ 
  key scarr.carrid      as id, 
  key scarr.carrname    as carrier, 
  key spfli.connid      as flight, 
      spfli.cityfrom    as departure,  
      spfli.cityto      as destination
}