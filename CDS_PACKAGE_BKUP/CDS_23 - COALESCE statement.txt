@AbapCatalog.sqlViewName: 'ZCDS_TEST_23'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - COALESCE Statement'
define view ZCDS_609879_23 

as select from vbak as so
left outer join vbfa as flow 
on  flow.vbelv = so.vbeln
and flow.vbtyp_v = 'C'
and flow.vbtyp_n = 'M'


left outer join vbrk as inv
on inv.vbeln = flow.vbeln 
{
    
    so.vbeln as sales_order,
    so.netwr as so_amount,
    inv.netwr as inv_amount,
    
case when inv.netwr is not null
     then inv.netwr
     else so.netwr
     end as amount_case_stat,

// coalesce statement acts like a shortest version of 
// (if not initial check with else block) 

// SYNTAX : COALESCE ( [if condition check ] , [ else block ] )
     
COALESCE( inv.netwr , so.netwr ) as amount_coalesce_stat           

// COALESCE( inv.netwr , 'Hard code value example' ) as amount_coalesce_stat  
} 
  