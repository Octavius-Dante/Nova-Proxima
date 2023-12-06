@EndUserText.label: 'AMDP sql string operations'
define table function zcds_amdp_5_str_ops
returns
{

  key mandt                   : abap.clnt;
      matnr                   : abap.char(18);
      string_length           : abap.int4;
      string_lower_case       : abap.char(40);
      string_upper_case       : abap.char(40);
      first_letter_caps       : abap.char(40);
      left_text               : abap.char(40);
      right_text              : abap.char(40);
      substring_text          : abap.char(40);
      SUBSTR_before_text      : abap.char(40);
      SUBSTR_after_text       : abap.char(40);
      string_position         : abap.char(40);
      replace_text            : abap.char(40);
      lpad_text               : abap.char(40);
      rpad_text               : abap.char(40);
      string_alpha_conversion : abap.char(40);
      ltrim_text              : abap.char(40);
      rtrim_text              : abap.char(40);

      //LENGTH(<Str>)                      Length
      //ABAP_LOWER(<Str>)                  Conversion of the string to lowercase / uppercase letters
      //ABAP_UPPER(<Str>)
      //INITCAP(<Str>)                     Captialize the first character of each word
      //LEFT(<Str>, <length>)              Left/Right part of the string with the length
      //RIGHT(<Str>, <length>)
      //SUBSTR(<Str>, <Pos>,  <length>)    Part of the string
      //SUBSTR_BEFORE(<Str1>, <Str2>)      Part of String1 before/after String2
      //SUBSTR_AFTER(<Str1>, <Str2>)
      //LOCATE(<Str1>, <Str2>)             Position of String2 in String1
      //REPLACE(<Str1>, <Str2>, <Str3>)    Replaces String2 in String1 with String3
      //LPAD(<Str>, <length> [<Pattern>])  Filling left/right with pattern up to length
      //RPAD(<Str>, <length> [<Pattern>])
      //ABAP_ALPHANUM(<Str>, <length>)     Alpha conversion
      //LTRIM(<Str> [,<CS>])               Remove the character set (<CS>) from left/right
      //RTRIM(<Str> [,<CS>])

/*
*ABAP_ALPHANUM Function (String)
*ABAP_LOWER Function (String)
*ABAP_NUMC Function (String)
*ABAP_UPPER Function (String)
*ASCII Function (String)
*BINTOHEX Function (String)
*BINTONHEX Function (String)
*BINTOSTR Function (String)
*CHAR Function (String)
*CONCAT Function (String)
*CONCAT_NAZ Function (String)
*HAMMING_DISTANCE Function (String)
*HEXTOBIN Function (String)
*HEXTONUM Function (String)
*INITCAP Function (String)
*LCASE Function (String)
*LEFT Function (String)
*LENGTH Function (String)
*LOCATE Function (String)
*LOCATE_REGEXPR Function (String)
*LOWER Function (String)
*LPAD Function (String)
*LTRIM Function (String)
*NCHAR Function (String)
*NORMALIZE Function (String)
*NUMTOHEX Function (String)
*OCCURRENCES_REGEXPR Function (String)
*REPLACE Function (String)
*REPLACE_REGEXPR Function (String)
*RIGHT Function (String)
*RPAD Function (String)
*RTRIM Function (String)
*SOUNDEX Function (String)
*STRTOBIN Function (String)
*SUBSTR_AFTER Function (String)
*SUBSTR_BEFORE Function (String)
*SUBSTRING Function (String)
*SUBSTRING_REGEXPR Function (String)
*TRIM Function (String)
*UCASE Function (String)
*UNICODE Function (String)
*UPPER Function (String)
*XMLTABLE Function (String)
*/

}
implemented by method
  ZCL_AMDP_5_string_ops=>GET_DATA;