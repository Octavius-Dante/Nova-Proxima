@AbapCatalog.sqlViewName: 'ZCDS_TEST_05'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'CDS Numeric functions'
define view ZCDS_609879_05 

as select from sflight inner join //inner Join
spfli on sflight.carrid = spfli.carrid and spfli.connid = sflight.connid
{
key sflight.carrid ,
key sflight.connid ,
key sflight.fldate ,
spfli.distance as DISTANCE,
sflight.price as Airfare,

//Ceil and Floor/
ceil(sflight.price) as numeric_func_ceil,
floor (sflight.price) as numeric_func_floor,

// Div/ Integer part of the division of arg1 by arg2  
div( spfli.distance , sflight.price ) as numeric_func_Div_op1,

//Division/ Division of arg1 by arg2 The result is rounded to dec decimal places.
division(sflight.seatsocc ,sflight.seatsmax, 3) as numeric_func_Div_op2,

//mod/  Positive or negative integer remainder of the division of arg1 by arg2.  
MOD(sflight.seatsmax,sflight.seatsocc ) as numeric_func_mod,

//Round/
ROUND(sflight.price,1 ) as numeric_func_round,

//ABS/
abs(-2) as numeric_func_abs,

sflight.currency as FareCurrency,
sflight.planetype as PlaneCategory,
sflight.seatsmax as MaxAvailableSeats,
sflight.seatsocc as OccupiedSeats ,
spfli.countryfr as COUNTRYFR,
spfli.countryto as COUNTRYTO

}