@AbapCatalog.sqlViewName: 'ZCDS_CONTRLINE4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS for ZTRST_CONTR_LINE - aggr final'
define view ZCDS_CONTR_LINE_4
  as select from ZCDS_CONTR_LINE
{
  key BUKRS,
  key FUND,
  key CONTRIB_IRN,

      sum (
         case TRANS_TYPE
         when 'C' then CONTRIB_AMT * -1
         when 'D' then CONTRIB_AMT * -1
         else CONTRIB_AMT
         end
         ) as calculation_amt

}
group by
  BUKRS,
  FUND,
  CONTRIB_IRN
