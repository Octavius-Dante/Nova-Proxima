@AbapCatalog.sqlViewName: 'ZCDS_TEST_14'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS casting example'

// Fuzzy search definition in cds using following annotation 
// this helps Search.ranking to further define the search behavior in Fiori Element apps

/*
@Search.searchable: true
@Search.fuzzinessThreshold : 0.8
*/

define view ZCDS_609879_14 as select from ekko 
inner join ekpo on ekko.ebeln = ekpo.ebeln
inner join eket on ekpo.ebeln = eket.ebeln
       and ekpo.ebelp = eket.ebelp 
{
    key ekko.ebeln,
    key ekpo.ebelp,
    key eket.etenr,
    
        ekpo.matnr,
        ekpo.werks,
        ekpo.lgort,
        ekpo.meins,
        ekpo.lmein,

// Casting is data type conversion of a given data in the field 
// The cast expression converts the value of the operand to the dictionary type specified by data type.
           
        ekpo.netpr,
        cast(ekpo.netpr as abap.curr(15,4)) as net_price,     
        ekpo.umren,
        cast(ekpo.umren as abap.fltp) as cast_quantity_1,
        ekpo.umrez,
        cast(ekpo.umrez as abap.fltp) as cast_quantity_2,
        eket.menge,
        cast(eket.menge as abap.fltp) as cast_quantity_3,
        eket.wemng,
        cast(eket.wemng as abap.fltp) as cast_quantity_4

// @Semantics – Used for S4HANA Embedded Analytics
        
// Semantic annotation is a data representation for S4 CORE services  
// any defined field name in sap abap is not always has a meaningful name 
// so what that field hold is represnted by semantics annotation 
          
// Used by the core engines for data processing and data consumption

// https://help.sap.com/doc/saphelp_nw75/7.5.5/en-US/fb/cd3a59a94148f6adad80b9c97304ff/content.htm?no_cache=true

}

/*

for detailed casting data types check following link 

https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-us/abencds_f1_cast_expression.html


DATA type               Dictionary Type
-------------------------------------------------------------------
abap.char( len )        CHAR with length len
abap.clnt[(3)]          CLNT
abap.cuky( len )        CHAR with length len
abap.curr(len,decimals) CURR with length len and decimals decimal places
abap.dats[(8)]          DATS
abap.dec(len,decimals)  DEC with length len and decimals decimal places
abap.fltp[(16,16)]      FLTP
abap.int1[(3)]          INT1
abap.int2[(5)]          INT2
abap.int4[(10)]         INT4
abap.int8[(19)]         INT8
abap.lang[(1)]          LANG
abap.numc( len )        NUMC with length len
abap.quan(len,decimals) QUAN with length len with decimals decimal places
abap.raw(len)           RAW
abap.sstring(len)       SSTRING
abap.tims[(6)]          TIMS
abap.unit( len )        CHAR with length len


*/