@AbapCatalog.sqlViewName: 'ZCDS_CONTRLINE3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS for ZTRST_CONTR_LINE - aggr data 2'
define view ZCDS_CONTR_LINE_3 as select from ZCDS_CONTR_LINE_2 
{
   key BUKRS,
   key FUND,
   key CONTRIB_IRN,
//   key CONTRIB_SEQ_NO,
//   TRANS_TYPE,
  sum(CONTRIB_AMT_2) as calculation_amt

} where FUND = 'TF050576'
group by BUKRS , FUND, CONTRIB_IRN 
//group by BUKRS , FUND, CONTRIB_IRN, CONTRIB_SEQ_NO, TRANS_TYPE
;
