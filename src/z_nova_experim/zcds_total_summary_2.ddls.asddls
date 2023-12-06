// if the following client handling annotation is not there 
// this View will enocunter error 

@ClientHandling: {
type: #CLIENT_DEPENDENT,
algorithm: #SESSION_VARIABLE
}

@EndUserText.label: 'AMDP Table function TOTAL summary'
define table function ZCDS_TOTAL_SUMMARY_2

  with parameters
    @Environment.systemField: #CLIENT
    p_sap_clnt : abap.clnt

returns
{
  key client        : abap.clnt;
      cust_num      : abap.char(10);
      customer_name : abap.char(71);
      //contrib_amt   : abap.curr(13,2);
      contrib_amt   : abap.curr(18,2);
}
implemented by method
  ZCL_AMDP_3=>GET_AMT_DETAILS;