@AbapCatalog.sqlViewName: 'ZCDS_TEST_18'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
// @AccessControl. authorizationCheck: #CHECK
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VDM based Composite View # 2'

// Following Annotations are important
@VDM. viewType: #COMPOSITE
@Analytics. dataCategory: #CUBE

define view ZCDS_609879_18 

// COMPOSITE view with appropriate annotation for DATA category and VDM representation
as select from ZCDS_609879_17

{

matnr,
auart,

erdat,
@DefaultAggregation: #SUM
Quantity

}