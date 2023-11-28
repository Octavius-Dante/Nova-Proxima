@AbapCatalog.sqlViewName: 'ZCDS_CONTRLINE4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS for ZTRST_CONTR_LINE - aggr final'
define view ZCDS_CONTR_LINE_4
  as select from ztrst_contr_line as _contrline
  association [1..1] to ZCDS_CUSTOMER_CONTR as _customer on _customer.fund = _contrline.fund
{ 
  _customer.mandt,
  _customer.cust_num,
  _customer.customer_name,
  sum (
     case trans_type
     when 'C' then contrib_amt * -1
     when 'D' then contrib_amt * -1
     else contrib_amt
     end
     ) as contrib_amt
}
where
  (
    (
         _contrline.trans_type = 'N'
      or _contrline.trans_type = 'A'
      or _contrline.trans_type = 'C'
    )
    and(
         _contrline.fund       = 'TF050576'
      or _contrline.fund       = 'TF072827'
      or _contrline.fund       = 'TF072841'
      or _contrline.fund       = 'TF072858'
      or _contrline.fund       = 'TF072859'
    )
  )
group by

  _customer.mandt,
  _customer.cust_num,
  _customer.customer_name;
