@AbapCatalog.sqlViewName: 'ZCDS_TEST_21'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Currency Conversion'
define view ZCDS_609879_21 as select from sflight
{
  @EndUserText.label: 'Airline Code'
  key carrid   as AirlineCode,

  @EndUserText.label: 'Connection No.'
  key connid   as ConnectionNumber,

  @EndUserText.label: 'Flight Date'
  key fldate   as FlightDate,

  @EndUserText.label: 'Price'
  price    as Price,

  @EndUserText.label: 'Currency'
  currency as Currency,

// CURRENCY CONVERSION FUNCTION simple example 

  @EndUserText.label: 'Price (in Australian Dollars)'
  currency_conversion(
                      amount             => price,
                      source_currency    => currency,
                      target_currency    => cast('AUD' as abap.cuky),
                      exchange_rate_date => fldate
                     ) as PriceInAUD
}

/*

Refer following link for reference in detail

https://saplearners.com/unit-and-currency-conversion-in-abap-cds-views/


*/