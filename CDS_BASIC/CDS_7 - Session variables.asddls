@AbapCatalog.sqlViewName: 'ZCDS_TEST_07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Session Variables'
define view ZCDS_609879_07 
as select from sflight 

{
    key carrid as Carrid,       //Key Field
    key connid as Connid,       //Key Field
    key fldate as Fldate,       //Key Field
        seatsmax as Seatsmax,   //Non-Key Field
        seatsocc as Seatsocc,   //Non-Key Field

// just an expression assigning values to a newly defined field         
    'Flight' as Title,          //Literal - Text
    10       as Num1,           //Literal - Number

// Current logged in user session details     
    $session.user            as UserName,
    $session.client          as Client,
    $session.system_language as SystemLanguage
    //$session.system_date     as SystemDate, 
} 
      
// $session.user            
// $session.client          
// $session.system_language 
// $session.system_date       // this is not available in EHP8