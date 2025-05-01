**&---------------------------------------------------------------------*
**& Report ZTEST_LAYOUT_FIX
**&---------------------------------------------------------------------*
**&
**& Program to capture entries of a table in a transport
**----------------------------------------------------------------------*
REPORT ZTEST_SCREEN_2.

SELECTION-SCREEN BEGIN OF BLOCK blck1.
SELECTION-SCREEN BEGIN OF LINE.
*SELECTION-SCREEN POSITION 1.
SELECTION-SCREEN COMMENT 1(61) text_1.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN SKIP.

** Name text for parameter 1
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : table_1 AS CHECKBOX MODIF ID cc DEFAULT 'X'.
SELECTION-SCREEN COMMENT 5(63) name1.
SELECTION-SCREEN END OF LINE.

** Name text for parameter 2
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS :table_2 AS CHECKBOX MODIF ID cc.
SELECTION-SCREEN COMMENT 5(63) name2.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN SKIP.
PARAMETERS yard_no TYPE /sapyl/e_yard_no." OBLIGATORY.
SELECTION-SCREEN SKIP.

** Name text for parameter 4
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : tr_add   RADIOBUTTON GROUP rad1 DEFAULT 'X' USER-COMMAND aa.
SELECTION-SCREEN COMMENT 5(63) name3.
SELECTION-SCREEN END OF LINE.

** Name text for parameter 5
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : tabl_upd RADIOBUTTON GROUP rad1.
SELECTION-SCREEN COMMENT 5(63) name4.
SELECTION-SCREEN END OF LINE.

** Name text for parameter 6
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : tabl_del RADIOBUTTON GROUP rad1.
SELECTION-SCREEN COMMENT 5(63) name5.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK blck1.

SELECTION-SCREEN SKIP.

SELECTION-SCREEN BEGIN OF BLOCK blck2.
SELECTION-SCREEN BEGIN OF LINE.
*SELECTION-SCREEN POSITION 1.
SELECTION-SCREEN COMMENT 1(80) text_4 MODIF ID aa.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN SKIP.

SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : tr_cust RADIOBUTTON GROUP rad2 MODIF ID aa.
SELECTION-SCREEN COMMENT 5(63) name6 MODIF ID aa.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : tr_wbnc RADIOBUTTON GROUP rad2 MODIF ID aa DEFAULT 'X'.
SELECTION-SCREEN COMMENT 5(63) name7 MODIF ID aa.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK blck2.

SELECTION-SCREEN SKIP.

SELECTION-SCREEN BEGIN OF BLOCK blck3.
SELECTION-SCREEN BEGIN OF LINE.
*SELECTION-SCREEN POSITION 1.
SELECTION-SCREEN COMMENT 1(83) text_5 MODIF ID bb.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN SKIP.
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : specific RADIOBUTTON GROUP rad3 MODIF ID bb.
SELECTION-SCREEN COMMENT 5(63) name8 MODIF ID bb.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : all_data RADIOBUTTON GROUP rad3 MODIF ID bb DEFAULT 'X'.
SELECTION-SCREEN COMMENT 5(63) name9 MODIF ID bb.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK blck3.


AT SELECTION-SCREEN OUTPUT.

  text_1 = 'This program is designed to work only in AD1-200 and AD1-900'.
  text_4 = 'AD1-200 to capture entries to transport'.
  text_5 = 'AD1-900 to FIX the layout entries in tables use data from 200 and update it to 900'.
*  text_6 = 'Specific entries from the table based on the input'.

  name1 = 'Table 1 : /SAPYL/VOPOSREC'.
  name2 = 'Table 2 : /SCWM/LAGP'.
  name3 = 'Add table entries to Transport in AD1-200'.
  name4 = 'Update table entries in AD1-900'.
  name5 = 'Delete table entries in AD1-900'.
  name6 = 'Transport Customizing'.
  name7 = 'Transport Workbench'.
  name8 = 'Specific entries from the table'.
  name9 = 'All entries from tables'.

* Screen elements appear based on seldction

  IF tr_add = 'X'.
    LOOP AT SCREEN.
      IF screen-group1 = 'BB'.
*        screen-active = '0'.  " ACTIVE OR INVISBLE BOTH WORKS AS SAME
        screen-invisible = '1'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.

  IF tabl_upd = 'X'.
    LOOP AT SCREEN.
      IF screen-group1 = 'AA'.
*        screen-active = '0'.
        screen-invisible = '1'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.

  IF tabl_del = 'X'.
    LOOP AT SCREEN.
      IF screen-group1 = 'AA'.
*        screen-active = '0'.
        screen-invisible = '1'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.
