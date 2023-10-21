@AbapCatalog.sqlViewName: 'ZCDS_TEST_15'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Example Semantics expression and Currency conversion'
define view ZCDS_609879_15 with parameters

    conv_date       : abap.dats,
    target_currency : abap.cuky

// @Semantics – Used for S4HANA Embedded Analytics
        
// Semantic annotation is a data representation for S4 CORE services  
// any defined field name in sap abap is not always has a meaningful name 
// so what that field hold is represnted by semantics annotation 
          
// Used by the core engines for data processing and data consumption

// Refer the following link for all semantics reference-
// https://help.sap.com/doc/saphelp_nw75/7.5.5/en-US/fb/cd3a59a94148f6adad80b9c97304ff/content.htm?no_cache=true

as select from ekko join ekpo on ekko.ebeln = ekpo.ebeln

{
    ekko.mandt as Mandt,
    ekko.ebeln as Ebeln,
    ekko.bukrs as Bukrs,
    ekko.bstyp as Bstyp,
    ekko.bsart as Bsart,    

//  @Semantics.currencyCode: true    
    ekko.waers as source_currency_key,      
    ekpo.netpr as source_currency_amount,

// Currency conversion function in CDS
     
//    @Semantics.amount.currencyCode : 'Target_currency_key'
      currency_conversion( Amount             => ekpo.netpr,
                           source_currency    => ekko.waers,
                           round              => 'X',
                           target_currency    => :target_currency,
                           exchange_rate_type => 'M',
                           exchange_rate_date => :conv_date,
                           error_handling     => 'SET_TO_NULL'
                         ) as Target_currency_amount,
                         
//      @Semantics.currencyCode: true
      :target_currency     as Target_currency_key
}

// Refer Sample here for currency and quantity unit conversion function in cds 
// https://discoveringabap.com/2021/10/12/exploring-abap-on-hana-6-currency-unit-conversion-in-cds-views/