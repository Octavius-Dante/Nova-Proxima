@AbapCatalog.sqlViewName: 'ZCDS_TEST_23'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - COALESCE Statement'
define view ZCDS_609879_23 

as select from snwd_po_inv_item

{
    
client as Client,
node_key as NodeKey,
parent_key as ParentKey,
po_item_guid as PoItemGuid,
quantity as Quantity,
quantity_unit as QuantityUnit,
gross_amount as GrossAmount,
net_amount as NetAmount,
tax_amount as TaxAmount,
    
case when net_amount <> 0.00
     then net_amount
     else tax_amount
     end as amount_case_stat,

// coalesce statement acts like a shortest version of 
// (if not initial check with else block) 

// SYNTAX : COALESCE ( [if condition check ] , [ else block ] )
     
COALESCE( gross_amount , tax_amount ) as tax_coalesce_stat,
COALESCE( gross_amount , net_amount ) as net_coalesce_stat           

// IF THE FIELD PROEPRTY SETTING IS DEFINED AS NOT NULL FOR THE FIELD IN DB TABLE COALESCE WONT WORK 

// COALESCE( inv.netwr , 'Hard code value example' ) as amount_coalesce_stat  
} where gross_amount = 0.00; 
  
