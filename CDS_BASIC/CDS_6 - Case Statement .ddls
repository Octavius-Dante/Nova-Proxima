@AbapCatalog.sqlViewName: 'ZCDS_TEST_06'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Case statement'
define view ZCDS_609879_06 as select from sflight 
{
    mandt as Mandt,
    carrid as Carrid,
    connid as Connid,
    fldate as Fldate,
    price as Price,
    currency as Currency,
    planetype as Planetype,

// case type 1 with value check    
    case planetype 
    when '747-400'  then 'Airbus - Jumbo jet -1'
    when 'A340-600' then 'Airfrance carrier 1'
    when 'A319-100' then 'Swiss airlines'
    when 'A380-800' then 'Boeing Company'
    when '767-200'  then 'Lufthansa'
    when 'A320-200' then 'Etihad'
    end as Flight_company,
     
    seatsmax as Seatsmax,
    seatsocc as Seatsocc,
    paymentsum as Paymentsum,

// Case type 2 with expressions    
    case  
    when paymentsum > 100000 and paymentsum <= 200000 then 'High Revenue'
    when paymentsum > 200000 then 'High Revenue'    
    when paymentsum > 50000  and paymentsum <= 150000 then 'Medium Revenue'
    when paymentsum > 1000   and paymentsum <= 100000 then 'Low Revenue'
    else 'Undefined Level'
    end as Revenue_stat    
}