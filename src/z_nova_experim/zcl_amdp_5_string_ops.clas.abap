CLASS zcl_amdp_5_string_ops DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS get_data
        FOR TABLE FUNCTION zcds_amdp_5_str_ops.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_5_string_ops IMPLEMENTATION.
  METHOD get_data
* AMDP Table Function
BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY
USING zmakt.

    makt = select client, matnr,
    length(maktx) as string_length,
    abap_lower(maktx) as string_lower_case,
    abap_upper(maktx) as string_upper_case,
    initcap(maktx) as first_letter_caps,
    left(maktx, 10) as left_text,
    right(maktx, 10) as right_text,
    substr(maktx, 5, 10) as substring_text,
    substr_before(maktx, 'a') as SUBSTR_BEFORE_text,
    substr_after(maktx, 'a') as SUBSTR_after_text,
    locate(maktx, 'a') as string_position,
    replace(maktx, 'a', 'X') as replace_text,
    lpad(maktx, 10, 'X0X0') as lpad_text,
    Rpad(maktx, 15, 'Y0Y0') as rpad_text,
    abap_alphanum(maktx, 10 ) as string_alpha_conversion,
    maktx as maktx_15,
    maktx as maktx_16 from zmakt;

    RETURN select client as mandt,
    matnr,
    string_length,
    string_lower_case,
    string_upper_case,
    first_letter_caps,
    left_text,
    right_text,
    substring_text,
    SUBSTR_BEFORE_text,
    SUBSTR_after_text,
    string_position,
    replace_text,
    lpad_text,
    rpad_text,
    string_alpha_conversion,
    ltrim( lpad_text , 'X0X0' ) as ltrim_text,
    rtrim( rpad_text , 'Y0Y0' ) as rtrim_text
from :makt;


*LENGTH(<Str>)                      Length
*ABAP_LOWER(<Str>)                  Conversion of the string to lowercase / uppercase letters
*ABAP_UPPER(<Str>)
*INITCAP(<Str>)                     Captialize the first character of each word
*LEFT(<Str>, <length>)              Left/Right part of the string with the length
*RIGHT(<Str>, <length>)
*SUBSTR(<Str>, <Pos>,  <length>)    Part of the string
*SUBSTR_BEFORE(<Str1>, <Str2>)      Part of String1 before/after String2
*SUBSTR_AFTER(<Str1>, <Str2>)
*LOCATE(<Str1>, <Str2>)             Position of String2 in String1
*REPLACE(<Str1>, <Str2>, <Str3>)    Replaces String2 in String1 with String3
*LPAD(<Str>, <length> [<Pattern>])  Filling left/right with pattern up to length
*RPAD(<Str>, <length> [<Pattern>])
*ABAP_ALPHANUM(<Str>, <length>)     Alpha conversion
*LTRIM(<Str> [,<CS>])               Remove the character set (<CS>) from left/right
*RTRIM(<Str> [,<CS>])

*SELECT SUBSTR_AFTER ('Hello My Friend','My ') "substr after" FROM DUMMY;

  ENDMETHOD.
ENDCLASS.
