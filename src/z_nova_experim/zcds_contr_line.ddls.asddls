@AbapCatalog.sqlViewName: 'ZCDS_CONTRLINE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS for ZTRST_CONTR_LINE - all data'
define view ZCDS_CONTR_LINE as select from ztrst_contr_line
{*};
