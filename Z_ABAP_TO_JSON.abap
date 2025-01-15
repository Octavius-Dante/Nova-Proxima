*&---------------------------------------------------------------------*
*& Report Y_ABAP_TO_JSON
*&---------------------------------------------------------------------*
REPORT y_abap_to_json.

* Define the structure for the token request
TYPES: BEGIN OF ty_attribute,
         referenceid TYPE string,
         value       TYPE string,
         type        TYPE string,
         operator    TYPE string,
       END OF ty_attribute.

TYPES: ty_attributes TYPE TABLE OF ty_attribute WITH EMPTY KEY.

TYPES: BEGIN OF ty_token_request,
         archive_id TYPE string,
         attributes TYPE ty_attributes,
       END OF ty_token_request.

DATA:
  ls_token_request TYPE ty_token_request.

* Set up the token request structure
ls_token_request-archive_id = '42'.

APPEND INITIAL LINE TO ls_token_request-attributes ASSIGNING FIELD-SYMBOL(<fs_attribute>).
<fs_attribute>-referenceid = '184'.
<fs_attribute>-value       = 'companyNumber'.  " Replace with actual company number
<fs_attribute>-type        = 'string'.
<fs_attribute>-operator    = 'like'.

APPEND INITIAL LINE TO ls_token_request-attributes ASSIGNING <fs_attribute>.
<fs_attribute>-referenceid = '72'.
<fs_attribute>-value       = 'journalEntryNumber'.  " Replace with actual journal entry number
<fs_attribute>-type        = 'string'.
<fs_attribute>-operator    = 'like'.

APPEND INITIAL LINE TO ls_token_request-attributes ASSIGNING <fs_attribute>.
<fs_attribute>-referenceid = '73'.
<fs_attribute>-value       = 'year'.  " Replace with actual year
<fs_attribute>-type        = 'string'.
<fs_attribute>-operator    = 'like'.

* Convert the structure to JSON
DATA(lo_writer) = cl_sxml_string_writer=>create( type = if_sxml=>co_xt_json ).
CALL TRANSFORMATION id
  SOURCE data = ls_token_request
  RESULT XML lo_writer.

* Convert xstring to string
DATA(lv_body) = cl_abap_codepage=>convert_from( lo_writer->get_output( ) ).

WRITE:/ 'JSON Structure with values: ', lv_body.
