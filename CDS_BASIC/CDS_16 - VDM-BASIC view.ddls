@AbapCatalog.sqlViewName: 'ZCDS_TEST_16'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
// @AccessControl.authorizationCheck: #CHECK
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VDM based BASIC View'

// Following Annotations are important
@VDM.viewType: #BASIC
@Analytics. dataCategory: #FACT

define view ZCDS_609879_16 

// Basic view with appropriate annotation for DATA category and VDM representation
// VDM - virtual data model 

as select from vbak as vbak
    inner join vbap as vbap on vbak.vbeln = vbap.vbeln
{
   key vbak.vbeln,
       auart,
       vbak.erdat,
       matnr,
       kwmeng 
}

