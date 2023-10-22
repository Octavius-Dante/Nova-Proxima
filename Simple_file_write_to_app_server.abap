REPORT zr_upload_itab_data_to_app_ser NO STANDARD PAGE HEADING.
*// Data declaration
DATA:lv_file       TYPE rlgrap-filename,
     lv_csv_format TYPE truxs_t_text_data.

*// Start of selection
START-OF-SELECTION.
  SELECT a~bukrs, a~land1, a~waers, a~spras, b~landx, c~ltext
         INTO TABLE @DATA(lt_t001)
         FROM t001 AS a
         INNER JOIN
         t005t AS b
         ON a~land1 EQ b~land1
         INNER JOIN
         tcurt AS c
  ON a~waers EQ c~waers WHERE b~spras EQ 'E' AND c~spras EQ 'E'.

*// Converting the internal table data into CSV format
  CALL FUNCTION 'SAP_CONVERT_TO_CSV_FORMAT'
    EXPORTING
      i_field_seperator    = ';'
    TABLES
      i_tab_sap_data       = lt_t001
    CHANGING
      i_tab_converted_data = lv_csv_format
    EXCEPTIONS
      conversion_failed    = 1
      OTHERS               = 2.

*// Application server name
  lv_file = '/tmp/pchavva.csv'.
*// Open dataset
  OPEN DATASET lv_file FOR OUTPUT IN TEXT MODE ENCODING DEFAULT .
  LOOP AT lv_csv_format INTO DATA(ls_t001).
*// Transfer structure to application server file
    TRANSFER ls_t001 TO lv_file.
  ENDLOOP.
*// Close data set
  CLOSE DATASET lv_file.