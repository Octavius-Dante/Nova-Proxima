TYPE-POOLS: truxs.
*&---------------------------------------------------------------------*
*& Data Types
*&---------------------------------------------------------------------*
TYPES: BEGIN OF ty_spfli,
       carrid    TYPE spfli-carrid,
       connid    TYPE spfli-connid,
       countryfr TYPE spfli-countryfr,
       cityfrom  TYPE spfli-cityfrom,
       airpfrom  TYPE spfli-airpfrom,
       countryto TYPE spfli-countryto,
       cityto    TYPE spfli-cityto,
       airpto    TYPE spfli-airpto,
       END OF ty_spfli.
*&---------------------------------------------------------------------*
*& Data Declaration
*&---------------------------------------------------------------------*
DATA: gt_spfli TYPE TABLE OF ty_spfli.
DATA: gt_text  TYPE truxs_t_text_data.
*&---------------------------------------------------------------------*
*& Start-of-Selection
*&---------------------------------------------------------------------*
START-OF-SELECTION.
  SELECT carrid
         connid
         countryfr
         cityfrom
         airpfrom
         countryto
         cityto
         airpto
         UP TO 10 ROWS FROM spfli INTO TABLE gt_spfli.

*Convert to text
  CALL FUNCTION 'SAP_CONVERT_TO_TEX_FORMAT'
    EXPORTING
      i_field_seperator    = ','  " Comma seperator
    TABLES
      i_tab_sap_data       = gt_spfli
    CHANGING
      i_tab_converted_data = gt_text
    EXCEPTIONS
      conversion_failed    = 1
      OTHERS               = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

*Download CSV file
  CALL METHOD cl_gui_frontend_services=>gui_download
    EXPORTING
      filename                = 'c:\temp\test.csv'
    CHANGING
      data_tab                = gt_text
    EXCEPTIONS
      file_write_error        = 1
      no_batch                = 2
      gui_refuse_filetransfer = 3
      invalid_type            = 4
      no_authority            = 5
      unknown_error           = 6
      header_not_allowed      = 7
      separator_not_allowed   = 8
      filesize_not_allowed    = 9
      header_too_long         = 10
      dp_error_create         = 11
      dp_error_send           = 12
      dp_error_write          = 13
      unknown_dp_error        = 14
      access_denied           = 15
      dp_out_of_memory        = 16
      disk_full               = 17
      dp_timeout              = 18
      file_not_found          = 19
      dataprovider_exception  = 20
      control_flush_error     = 21
      not_supported_by_gui    = 22
      error_no_gui            = 23
      OTHERS                  = 24.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.