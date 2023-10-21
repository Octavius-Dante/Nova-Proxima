REPORT ztest_609879_02.

SELECT FROM vbak as so
LEFT OUTER JOIN vbfa as flow
on flow~vbelv = so~vbeln
AND flow~vbtyp_v = 'C'
AND flow~vbtyp_n = 'M'
LEFT OUTER JOIN vbrk as inv
on inv~vbeln = flow~vbeln

FIELDS
so~vbeln as sales_order,
so~netwr as so_amount,
inv~netwr as inv_amount,

CASE WHEN inv~netwr IS NOT NULL
     THEN inv~netwr
     ELSE so~netwr
     END AS amount_net,

* coalesce statement acts like a shortest version of if not initial check with else block
COALESCE( inv~netwr , so~netwr ) as amount_co

INTO TABLE @data(lt_tab).
if sy-subrc EQ 0.
cl_demo_output=>display( lt_tab ).
endif.