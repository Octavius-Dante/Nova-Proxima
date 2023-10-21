@AbapCatalog.sqlViewName: 'ZCDS_TEST_19'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
// @AccessControl. authorizationCheck: #CHECK
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VDM based Consumption view'

// Following Annotations are important
@VDM.viewType:#CONSUMPTION
@Analytics. query: true

define view ZCDS_609879_19

// CONSUMPTION view with appropriate annotation for DATA category and VDM representation  
as select from ZCDS_609879_18 

{

@AnalyticsDetails.query.axis: #ROWS
@EndUserText. label: 'Created On'
erdat,

@AnalyticsDetails.query.axis: #ROWS
@EndUserText. label: 'Material'
matnr,

@AnalyticsDetails.query.axis: #ROWS
@EndUserText. label: 'OrderType'
auart,

@AnalyticsDetails.query.axis: #COLUMNS
@EndUserText. label: 'Quantity'
Quantity

}