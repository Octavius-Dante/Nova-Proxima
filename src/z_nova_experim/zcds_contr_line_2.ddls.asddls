@AbapCatalog.sqlViewName: 'ZCDS_CONTRLINE2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS for ZTRST_CONTR_LINE - aggr data 1'
define view ZCDS_CONTR_LINE_2 as select from ZCDS_CONTR_LINE
{
   key BUKRS,
   key FUND,
   key CONTRIB_IRN,
   key CONTRIB_SEQ_NO,
   TRANS_TYPE,
   
   case TRANS_TYPE
   when 'A' then CONTRIB_AMT * -1
   else CONTRIB_AMT
   end as CONTRIB_AMT_2,  
   
   CONTRIB_AMT,
   CONTR_AGRMT_DATE,
   CONTR_APPR_DATE,
   STATUS,
   SEC_STATUS,
   CREATED_BY,
   CREATED_ON,
   CREATED_AT,
   AUTHORIZED_BY,
   AUTHORIZED_ON,
   AUTHORIZED_AT,
   CONT_REF_NO,
   COMMENTS,
   EFFCOMMENTS,
   SEND_TF_NUMBER,
   UPD_USER,
   UPD_DATE,
   UPD_TIME
   
} 

//where FUND = 'TF054001' 
