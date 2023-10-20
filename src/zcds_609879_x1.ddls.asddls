@AbapCatalog.sqlViewName: 'ZCDS_TEST_X1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '# test 1'
define view ZCDS_609879_X1 as select from znwd_po_i
{
   // node_key as NodeKey,
    parent_key as ParentKey,
    max(po_item_pos) as PoItemPos //,
/*    product_guid as ProductGuid,
    note_guid as NoteGuid,
    currency_code as CurrencyCode,
    gross_amount as GrossAmount,
    net_amount as NetAmount,
    tax_amount as TaxAmount
    
*/    
} group by //znwd_po_i.node_key ,
  znwd_po_i.parent_key  /*,
product_guid,
note_guid,
currency_code,
gross_amount,
net_amount,
tax_amount
*/
