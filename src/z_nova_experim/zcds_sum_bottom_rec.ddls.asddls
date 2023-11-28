@AbapCatalog.sqlViewName: 'Z_SUM_BOT_REC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS to Sum Bottom records'
define view ZCDS_SUM_BOTTOM_REC as select from ZCDS_BOTTOM_REC_CONTR
{

 sum(contrib_amt) as contrib_amt
}
