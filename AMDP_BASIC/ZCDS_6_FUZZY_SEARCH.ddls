@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AMDP sql string operations'
define table function zcds_amdp_6_FUZZY_SEARCH
  with parameters
    @Environment.systemField: #CLIENT
    clnt      : abap.clnt,
    CARR_NAME : abap.char(20)
returns
{

  key mandt    : abap.clnt;
      SCORE    : abap.fltp(16,16);
      carrid   : abap.char(3);
      carrname : abap.char(20);

}

implemented by method
  ZCL_AMDP_6_FUZZY_SEARCH=>GET_DATA;