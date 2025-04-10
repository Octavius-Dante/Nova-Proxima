*&---------------------------------------------------------------------*
*& Report ZTEST_UUID_GENERATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_uuid_generate.

DATA: system_uuid TYPE REF TO if_system_uuid,
      uuid        TYPE sysuuid_c32.

DATA lv_uuid TYPE sysuuid_c26.

system_uuid = cl_uuid_factory=>create_system_uuid( ).

*&---------------------------------------------------------------------*
* This is used in standard table primary keys for BO objects 
*&---------------------------------------------------------------------*
TRY.
  
* The Chosen one for Table : /SAPYL/TU_SR_ACT - primary key generation 
  
    uuid = system_uuid->create_uuid_c32( ). 
  CATCH cx_uuid_error.
    ...
ENDTRY.
*&---------------------------------------------------------------------*
* This not used in thable primary keys 
*&---------------------------------------------------------------------*
TRY.
    lv_uuid = cl_system_uuid=>create_uuid_c26_static( ). "UUID in Base32
  CATCH cx_uuid_error.
    ...
ENDTRY.
*&---------------------------------------------------------------------*

BREAK-POINT .
