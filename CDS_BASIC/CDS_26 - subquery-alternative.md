## Subquery Alternative in CDS

ABAP CDS Views are great and all; however, they don’t support subqueries at this time. In this post, I would like to share a workaround which functions similar to “NOT EXISTS”.
The requirement was to exclude material document items (MSEG) which were reverse posted; and the reversal documents themselves.
If I was writing a regular ABAP SQL statement, I could easily achieve this with the help of a NOT EXISTS subquery. Check the code snippet below – I have excluded unrelated WHERE conditions for simplicity.

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

