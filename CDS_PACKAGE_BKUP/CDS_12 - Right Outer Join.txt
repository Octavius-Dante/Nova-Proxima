@AbapCatalog.sqlViewName: 'ZCDS_TEST_12'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS right outer join'
define view ZCDS_609879_12   

// EVERYTHING FROM THE RIGHT table and matching key field records in the LEFT selected 
as select from sflight right outer join spfli
    on  sflight.carrid = spfli.carrid
    and sflight.connid = spfli.connid
{ 
  key sflight.carrid    as id, 
  key sflight.connid    as flight, 
  key sflight.fldate    as departuredate,
      spfli.cityfrom    as departure,  
      spfli.cityto      as destination
}