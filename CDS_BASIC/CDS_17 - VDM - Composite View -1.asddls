@AbapCatalog.sqlViewName: 'ZCDS_TEST_17'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
// @AccessControl. authorizationCheck: #CHECK
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VDM based Composite View # 1'

// Following Annotations are important
@VDM. viewType: #COMPOSITE
@Analytics.dataCategory: #FACT

define view ZCDS_609879_17 

// COMPOSITE view with appropriate annotation for DATA category and VDM representation
as select from ZCDS_609879_16
{

matnr,
auart,
erdat,
sum(kwmeng) as Quantity

}
group by
   matnr,
   auart,
   erdat