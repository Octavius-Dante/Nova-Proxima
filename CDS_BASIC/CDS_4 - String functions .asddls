@AbapCatalog.sqlViewName: 'ZCDS_TEST_04'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true

@EndUserText.label: 'CDS common String operations'
define view ZCDS_609879_04 as select from makt
{
    key matnr,
    maktx as description_1,
    maktx as description_2,

/* Commnly used string operations */    

    left(maktx,4) as string_func_left,             // to get charcters from the left side of string 
    right(maktx,4) as string_func_right,           // to get charcters from the right side of string 
    substring(maktx,4,5) as string_func_substring, // to get substring for a given string 
    instr(maktx,',') as string_func_instr,         // fetch the position of the given charcter ',' in the string
    concat(maktx, maktg) as string_func_concat,    // concatenated the given fields
    
    concat_with_space(maktx, maktg, 5) 
    as string_func_concat_with_space,              // concatenated the given fields with mentioend space char size
    
    replace(maktx, ',', '[X]') 
    as string_func_replace,                        // given string is replaced in the field  
    
    length(maktx) as string_func_length,           // to get the length for a given string
    ltrim(maktx,',') as string_func_ltrim,         // left side of string removes the trailing blanks and leading charcter which matches the parameter char  
    rtrim(maktx,',') as string_func_rtrim,         // right side of string removes the trailing blanks and leading charcter which matches the parameter char
    lpad(maktx, 10, ',') as string_func_lpad,      // specified a string of charcters to use for padding instead of spaces on left 
    rpad(maktx, 10, ',') as string_func_rpad       // specified a string of charcters to use for padding instead of spaces on right
               
}