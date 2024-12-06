*&---------------------------------------------------------------------*
*& Report ZTEST_STRING_JUNK_CHECK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_string_junk_check.

DATA : lv_string_1 TYPE c LENGTH 120 VALUE 'r structural defects; member is performing satisfactorily \nCondition 3 â€“ Fair â€“ minor deficiencies in the bridge'.
DATA : lv_symbol2 TYPE char2 VALUE '\n'.

DATA txt TYPE string.
DATA txt2 LIKE txt.

txt = lv_string_1.
PERFORM cleansetext USING txt CHANGING txt2.

WRITE : txt.

REPLACE ALL OCCURRENCES OF lv_symbol2 IN txt2 WITH space.

WRITE : /, txt2.


FORM cleansetext USING invalue TYPE string CHANGING outvalue TYPE string .
  DATA: nlength    TYPE i, ctemp(120) TYPE c.
*  TRANSLATE invalue TO UPPER CASE.
  nlength = strlen( invalue ).

  DO nlength TIMES.
    SUBTRACT 1 FROM nlength.
    IF 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_ ' CS invalue+nlength(1).
      CONCATENATE invalue+nlength(1) ctemp INTO ctemp.
    ENDIF.
  ENDDO.

  outvalue = ctemp.
ENDFORM.
