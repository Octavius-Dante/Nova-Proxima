@AbapCatalog.sqlViewName: 'ZCDS_X14'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '# test 14 - Casting Example'
define view ZCDS_TEXT_X14
  as select from snwd_so_inv_item
{

  client                                  as Client,
  node_key                                as NodeKey,
  parent_key                              as ParentKey,

  so_item_guid                            as SoItemGuid,
  quantity                                as Quantity,
  cast( quantity as abap.quan( 13, 3) )   as CAST_QUANTITY,
  cast( quantity as abap.fltp(16) )       as CAST_FLOATING_POINT,
  quantity_unit                           as QuantityUnit,
  //cast( quantity_unit AS ABAP.unit( 16) ) as CAST_QUANTITY_UNIT,
  gross_amount                            as GrossAmount,
  net_amount                              as NetAmount,
  cast ( net_amount as abap.dec( 15, 3 )) as CAST_DECIMAL,
  tax_amount                              as TaxAmount,
  cast( tax_amount as abap.curr( 15, 3 )) as CAST_AMOUNT_CURRENCY,
  currency_code                           as CurrencyCode,
  //cast( currency_code AS ABAP.cuky( 5 ) ) as CAST_CURRENCY_KEY,
  product_guid                            as ProductGuid,
  inv_item_pos                            as InvItemPos,
  cast( inv_item_pos as abap.numc( 10 ))  as CAST_NUMERICAL_CHAR,
  //cast( inv_item_pos as abap.int8(19))    as CAST_INT8,
  cast( inv_item_pos as abap.char( 20 ))  as CAST_CHARACTER,
  _dataaging                              as Dataaging

}

// cast ( case when likp.bolnr = ' ' then '#' else likp.bolnr end as bolnr ) as test1
// @Semantics – Used for S4HANA Embedded Analytics
// Semantic annotation is a data representation for S4 CORE services
// any defined field name in sap abap is not always has a meaningful name
// so what that field hold is represnted by semantics annotation
// Used by the core engines for data processing and data consumption
// https://help.sap.com/doc/saphelp_nw75/7.5.5/en-US/fb/cd3a59a94148f6adad80b9c97304ff/content.htm?no_cache=true
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
