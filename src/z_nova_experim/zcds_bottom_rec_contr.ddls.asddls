/*
    @ClientHandling: {
    type: #CLIENT_DEPENDENT,
    algorithm: #SESSION_VARIABLE
    }
*/

@EndUserText.label: 'Demo CDS to return bottom rcords'
define table function ZCDS_BOTTOM_REC_CONTR
//  with parameters
//    @Environment.systemField: #CLIENT
//    p_sap_clnt : abap.clnt
    
returns
{
  key mandt         : abap.clnt;
      cust_num      : abap.char(10);
      customer_name : abap.char(71);
      contrib_amt   : abap.curr(18,2);
}
implemented by method
  ZCL_AMDP_2=>GET_AMT_DETAILS;