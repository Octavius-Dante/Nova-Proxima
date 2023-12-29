CLASS ZCL_10_DATA_DECLARATION DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_amdp_marker_hdb,
      if_oo_adt_classrun.

    TYPES:
      BEGIN OF ty_data,
        uname  TYPE usr21-bname,
        langu  TYPE sy-langu,
        datum  TYPE sy-datum,
        text   TYPE c LENGTH 10,
        number TYPE i,
      END OF ty_data,
      tt_data TYPE STANDARD TABLE OF ty_data WITH EMPTY KEY.

    CLASS-METHODS data_declaration
      EXPORTING VALUE(et_data) TYPE tt_data
      RAISING   cx_amdp_error.

ENDCLASS.

CLASS ZCL_10_DATA_DECLARATION IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    data_declaration( IMPORTING et_data = DATA(lt_data) ).
    out->write( lt_data ).
  ENDMETHOD.

  METHOD data_declaration BY DATABASE PROCEDURE
                          FOR HDB LANGUAGE SQLSCRIPT.

    declare lc_yes constant nvarchar(3) := 'YES';
    declare lc_no  constant nvarchar(2) := 'NO';

    declare lv_char char(2);
    declare lv_varchar varchar(10);
    declare lv_counter integer;
    declare lv_date date;
    declare lv_time time;

    declare mytab table( uname  "$ABAP.type( usr21-bname )",
                         langu  "$ABAP.type( syst_langu )",
                         datum  date,
                         text   "$ABAP.type( ty_data-text )",
                         number "$ABAP.type( i )" );

    mytab.uname[1]  := 'TEST_DECLARE';
    mytab.langu[1]  := 'E';
    mytab.datum[1]  := session_context('SAP_SYSTEM_DATE');
    mytab.text[1]   := cast( 0123456789 as "$ABAP.type( ty_data-text )" );
    mytab.number[1] := 1;

    et_data = SELECT * FROM :mytab;


*Numeric
*TinyINT − 8 bit unsigned integer [0 to 255]
*SMALLINT − 16 bit signed integer. [-32,768 to 32,767]

*Integer − 32 bit signed integer. [-2,147,483,648 to 2,147,483,648]
*BIGINT − 64 bit signed integer. [-9,223,372,036,854,775,808 to 9,223,372,036,854,775,808]
*SMALL − Decimal [-10^38 +1 to 10^38 -1 ]
*REAL − Decimal [-3.40E38 to 3.40E38]
*DOUBLE − 64 bit floating point number. [-1.7976931348623157E308 to 1.7976931348623157E308]

*Character & String
*Varchar − maximum of 8000 characters.
*Nvarchar − maximum length of 4000 characters
*ALPHANUM − Alphanumeric characters
*SHORTTEXT − stores variable length character string which supports text search features and string search features.

*Date Time
*DATE − Date [YYYY-MM-DD]
*TIME − Time [HH: MI: SS]
*SECOND DATE − Date and Time [YYYY-MM-DD HH:MM:SS]
*TIMESTAMP − Date, Time and Fraction of second [YYYY-MM-DD HH:MM:SS:FFn]

*Large Objects
*NCLOB − Large UNICODE character object.
*BLOB − Large amount of Binary data.
*CLOB − Large amount of ASCII character data.
*TEXT − it enables text search features.

*Binary
*VARBINARY − binary data in bytes. Max integer length is between 1 and 5000.

*Boolean
*Store Boolean value i.e. TRUE/FALSE

  ENDMETHOD.
ENDCLASS.