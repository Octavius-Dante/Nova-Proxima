@AbapCatalog.sqlViewName: 'ZCDS_TEST_08'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Union All'

define view ZCDS_609879_08 as select from sflight
{
  key carrid  as CarrierId,
  key connid  as ConnectionId,
  key fldate  as FlightDate,
// Annotation are only allowed in first query  
      @Semantics.amount.currencyCode: 'CurrencyCode'  
      price     as Price,
      currency  as CurrencyCode,
      planetype as PlaneTypeId,
      seatsmax  as SeatsMax,
      seatsocc  as SeatsOccupied
}
where currency = 'USD'
   or currency = 'EUR' 

/*

union all // shows records from both sets
union     // sorts and removes the duplicate records 

select from sflight
{
  key carrid  as CarrierId,
  key connid  as ConnectionId,
  key fldate  as FlightDate,
      price     as Price,
      currency  as CurrencyCode,
      planetype as PlaneTypeId,
      seatsmax  as SeatsMax,
      seatsocc  as SeatsOccupied
}
where currency = 'EUR'

*/