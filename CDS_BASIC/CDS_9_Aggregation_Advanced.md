To calcualte the sum and based on condition some records 
have to be subtracted in he sum of record under a key field

Sample as follows

``` abap

define view YCDSV_SIT as
select 
  from wb2_v_ekko_ekpo2 as a
  join ekbe             as b
    on a.ebeln_i = b.ebeln
   and a.ebelp_i = b.ebelp
{
  a.matnr_i as matnr
, a.werks_i as werks
, a.ebeln_i
, a.ebelp_i
, b.xblnr
, b.charg
, sum( 
       case
         when shkzg = 'S' then b.menge * -1
         else b.menge
       end
     ) as TransitStock
}
 where   a.bsart   = 'ZSTO'
   and   a.loekz_i = ' '
   and   a.elikz_i = ' '
   and   b.zekkn   = '00'
   and ( b.vgabe   = '1'
    or   b.vgabe   = '6' )
 group by matnr_i, werks_i, ebeln_i, ebelp_i, xblnr, charg
having TransitStock > 0
;

```

having clause with further enhanced condition

``` abap

HAVING sum( 
       case
         when shkzg = 'S' then b.menge * -1
         else b.menge
       end ) > 0

```

another example 

``` abap 

@AbapCatalog.sqlViewName: 'SALES_ORDER_VW' 
define view sales_order as 
  select from snwd_so 
    inner join 
      snwd_bpa on buyer_guid = snwd_bpa.node_key 
  {  key bp_role as role, //e.g. customer or supplier 
     count(distinct buyer_guid) as partners_count, 
     sum(snwd_so.gross_amount) as sum_gross_amount } 
  where snwd_so.currency_code = 'EUR' 
  group by bp_role 
  having sum(snwd_so.gross_amount) > 100000.00;
  
```  
