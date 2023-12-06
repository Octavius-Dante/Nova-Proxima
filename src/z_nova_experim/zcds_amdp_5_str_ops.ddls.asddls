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

}
implemented by method
  ZCL_AMDP_5_string_ops=>GET_DATA;