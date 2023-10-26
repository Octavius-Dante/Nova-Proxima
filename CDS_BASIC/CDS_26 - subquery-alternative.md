## Subquery Alternative in CDS

ABAP CDS Views are great and all; however, they don’t support subqueries at this time. 

In this post, I would like to share a workaround which functions similar to “NOT EXISTS”.
The requirement was to exclude material document items (MSEG) which were reverse posted; and the reversal documents themselves.

If I was writing a regular ABAP SQL statement, 
I could easily achieve this with the help of a NOT EXISTS subquery. Check the code snippet below – I have excluded unrelated WHERE conditions for simplicity.

``` abap

SELECT mblnr, mjahr, zeile 
  FROM mseg AS mseg1 
  WHERE 
    ( sjahr EQ '0000' OR sjahr IS NULL )
    AND
    ( NOT EXISTS (
      SELECT mandt FROM mseg AS mseg2 WHERE
        sjahr EQ mseg1.mjahr AND
        smbln EQ mseg1.mblnr AND
        smblp EQ mseg1.zeile
    ) )
  INTO TABLE @DATA(lt_mseg).

```

This logic doesn’t work in CDS views directly due to lack of subquery support. To get the same result using CDS views, I have split the query into two views. The first one returns a wide list where original and reversal MSEG records are listed side by side.

``` asddls

@AbapCatalog.sqlViewName: 'ZMMV_001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Original and reversal docs side by side'
define view ZMMV_MAT_DOC_ITEM_REV_STATUS as 
  select from 
    mseg as mseg1
    left outer join mseg as mseg2 on
      mseg2.sjahr = mseg1.mjahr and
      mseg2.smbln = mseg1.mblnr and
      mseg2.smblp = mseg1.zeile
  {
    mseg1.mblnr as mblnr1,
    mseg1.mjahr as mjahr1,
    mseg1.zeile as zeile1,
    mseg1.sjahr as sjahr1,
    mseg1.smbln as smbln1,
    mseg1.smblp as smblp1,
    mseg2.mblnr as mblnr2,
    mseg2.mjahr as mjahr2,
    mseg2.zeile as zeile2,
    mseg2.sjahr as sjahr2,
    mseg2.smbln as smbln2,
    mseg2.smblp as smblp2
  }

```
