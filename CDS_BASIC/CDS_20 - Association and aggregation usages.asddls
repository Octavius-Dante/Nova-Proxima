@AbapCatalog.sqlViewName: 'ZCDS_TEST_20'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aggregation & association usages'
define view ZCDS_609879_20 

as select from snwd_so as so
association[1] to snwd_bpa as business_partners
on so.buyer_guid = business_partners.node_key

association[0..1] to snwd_so_inv_head as invoice_headers
on so.node_key = invoice_headers.buyer_guid

{

 key so.so_id as Order_Id,
     so.delivery_status as Delivery_Status,
     invoice_headers.payment_status,
     invoice_headers.currency_code, 
     sum(invoice_headers.gross_amount) as Total_Gross_Amount   
} 

where business_partners.company_name = 'AVANTEL'

group by so.so_id,
         so.delivery_status,
         invoice_headers.payment_status,
         invoice_headers.currency_code
having sum( invoice_headers.gross_amount ) > 10