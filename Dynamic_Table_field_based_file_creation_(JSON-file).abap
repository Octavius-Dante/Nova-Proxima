*&---------------------------------------------------------------------*
*& Report ZTABLE_DATA_EXTR_FIELD_SEL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztable_data_extr_field_sel.

* Functionality overview

* Given table fields are selected in selection screen 
* data is selected from table for selected fields
* selected data converted to json file 
* HTML table definition structure is preapred for the selected field 

* Most useful for eclispe based table creation in on-prem and abap cloud BTP

*---------------------------------------------------------------------*
* TYPES
*---------------------------------------------------------------------*
TYPES:
* Type for the table along with Marker Flag
  BEGIN OF t_fld.
    INCLUDE STRUCTURE dd03p AS dd03p.       " Dictonary Attributes
  TYPES:
    mark      LIKE rsdxx-mark,      " Entry marked
    type_icon TYPE dd02d-datatype,  " Type Icon
  END OF t_fld,

  BEGIN OF gty_dictionary,
    tablename LIKE dd03l-tabname,
    fieldname LIKE dd03l-fieldname,
    position  LIKE dd03l-position,
    position2 TYPE i,
    datatype  LIKE dd03l-datatype,
    leng      LIKE dd03l-leng,
    decimals  LIKE dd03l-decimals,
    ddtext    LIKE dd04t-ddtext,
    reftable  TYPE reftable,
    reffield  TYPE reffield,
    length    TYPE i,
    differ    TYPE i,
  END OF gty_dictionary,

  BEGIN OF gty_text,
    text(2500) TYPE c,
  END OF gty_text,

* Type for the table header
  BEGIN OF ty_str_hdr,
    field_name TYPE char20,
  END OF ty_str_hdr,

  BEGIN OF gty_where_clause,
    line TYPE char72,
  END OF gty_where_clause.

*---------------------------------------------------------------------*
*  DATA                                                               *
*---------------------------------------------------------------------*


DATA:

  lv_variable_1(500)    TYPE c, "char100,
  lv_variable_2(2500)   TYPE c,
  lv_field              TYPE char30,
  lv_localfile          TYPE string,
  git_header_text       TYPE STANDARD TABLE OF ty_str_hdr, " Header Text
  lt_text               TYPE STANDARD TABLE OF gty_text,
  ls_text               TYPE gty_text,
  gs_field_list         TYPE string, " SELECT Field List
  gref_struct_result    TYPE REF TO cl_abap_structdescr, " Structure
  gref_table_result     TYPE REF TO cl_abap_tabledescr,  " Table
  gt_components         TYPE STANDARD TABLE OF abap_componentdescr
                       WITH KEY name, " Components
  gt_dictionary         TYPE STANDARD TABLE OF gty_dictionary,
  gs_dictionary         TYPE gty_dictionary,
  gt_where_clause       TYPE STANDARD TABLE OF gty_where_clause,
  gs_where_clause       TYPE gty_where_clause,
  gv_tab_desc           TYPE as4text,
  dumihtml              TYPE STANDARD TABLE OF string,
  statusbarmessage(100),

* Dynamic variables
  lt_dref               TYPE REF TO data,
  ls_dref               TYPE REF TO data,

* Some needed values
  lv_set_bracket_open   TYPE char1 VALUE '{',
  lv_set_bracket_close  TYPE char1 VALUE '}'.

CONSTANTS: ss_code TYPE c VALUE 'C'.
CONSTANTS: ss_table TYPE c VALUE 'T'.
CONSTANTS: versionno TYPE string VALUE '2.5'.
*---------------------------------------------------------------------*
*  FIELD-SYMBOLS                                                               *
*---------------------------------------------------------------------*
*FIELD-SYMBOLS: <fs_dynamic_tab> TYPE INDEX TABLE. " Final Table
FIELD-SYMBOLS : <fld_value> TYPE any.
FIELD-SYMBOLS : <fs_table> TYPE any.
FIELD-SYMBOLS : <ft_table> TYPE STANDARD TABLE.
FIELD-SYMBOLS : <dyn_field>.

*---------------------------------------------------------------------*
* SELECTION SCREEN                                                    *
*---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
PARAMETERS:
  p_tab  TYPE tabname OBLIGATORY,
  p_file TYPE string OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.
*---------------------------------------------------------------------*
* AT SELECTION-SCREEN ON VALUE-REQUEST.
*---------------------------------------------------------------------*
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
* F4 Help for File
  PERFORM sub_f4_for_file CHANGING p_file.

*---------------------------------------------------------------------*
* START-OF-SELECTION.                                                 *
*---------------------------------------------------------------------*
START-OF-SELECTION.
* Option to Select Which Field to download
  PERFORM sub_pop_up_to_select USING p_tab
                            CHANGING gref_table_result
                                     gref_struct_result.

*---------------------------------------------------------------------*
* END-OF-SELECTION.                                                   *
*---------------------------------------------------------------------*
END-OF-SELECTION.
* Do the Dynamic Select from Any Table
  PERFORM sub_dynamic_select USING    gref_table_result
                                      gref_struct_result.

* Download the json format file to the Local Machine
  PERFORM sub_download_file USING p_file.

*---------------------------------------------------------------------*
* SUB ROUTINES                                                        *
*---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Form  SUB_F4_FOR_FILE
*&---------------------------------------------------------------------*
*       F4 Help
*----------------------------------------------------------------------*
FORM sub_f4_for_file  CHANGING p_p_file TYPE string.

  CALL METHOD cl_gui_frontend_services=>directory_browse
    EXPORTING
      window_title         = 'Select Directory'
      initial_folder       = 'c:\'
    CHANGING
      selected_folder      = p_p_file
    EXCEPTIONS
      cntl_error           = 1
      error_no_gui         = 2
      not_supported_by_gui = 3
      OTHERS               = 4.
  IF sy-subrc <> 0.
* Implement suitable error handling here
    MESSAGE 'Directory selection Error' TYPE 'E'.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SUB_POP_UP_TO_SELECT
*&---------------------------------------------------------------------*
*       Select Fields for Output
*----------------------------------------------------------------------*
FORM sub_pop_up_to_select  USING    p_p_tab TYPE tabname
      CHANGING    lr_table_result  TYPE REF TO  cl_abap_tabledescr
                                  lr_struct_result TYPE REF TO cl_abap_structdescr..

  DATA:
    lv_get_state  TYPE dctablget,
    li_fld_copy   TYPE TABLE OF t_fld,
    li_dd03p      TYPE TABLE OF dd03p,
    ls_components LIKE LINE OF gt_components,
    ls_header     TYPE ty_str_hdr.

  lv_get_state-tabd = lv_get_state-tabt = 'A'.

* Get table metadata
  CALL FUNCTION 'DD_TABL_GET'
    EXPORTING
      get_state    = lv_get_state
      prid         = -2
      tabl_name    = p_p_tab
      withtext     = 'X'
      add_typeinfo = 'X'
    TABLES
      dd03p_tab_a  = li_dd03p
    EXCEPTIONS
      OTHERS       = 2.

* Adding extra fields
* Field MARK is used for now to idendify the selected field(s)
  li_fld_copy = li_dd03p.

  CALL FUNCTION 'DD_LIST_TABFIELDS'
    EXPORTING
      eutype       = 'V'
      p_with_type  = 'X'
    TABLES
      fieldtab     = li_fld_copy
    EXCEPTIONS
      not_executed = 1
      OTHERS       = 2.

* .INCLUDE, .APPEND and other attributes should be deleted
* They have INTTYPE as blank
  DELETE li_fld_copy WHERE inttype IS INITIAL.

* Remove what the user did not choose
  DELETE li_fld_copy WHERE mark IS INITIAL.

  LOOP AT li_fld_copy INTO DATA(ls_fields).

*   Make the list of fields to be used in SELECT Statement
    CONCATENATE ls_fields-fieldname gs_field_list INTO gs_field_list SEPARATED BY space.

**   Header Line (Medium Text) for the Spreadsheet
*    CONCATENATE ls_fields-scrtext_m gs_header_text INTO gs_header_text SEPARATED BY cl_abap_char_utilities=>horizontal_tab.

    ls_components-name = ls_fields-fieldname.
    ls_components-type ?= cl_abap_elemdescr=>describe_by_name( ls_fields-rollname ) .
    APPEND ls_components TO gt_components.

    APPEND ls_fields-scrtext_m TO git_header_text.

  ENDLOOP.

  TRY .
      lr_struct_result = cl_abap_structdescr=>create( p_components = gt_components ).
      lr_table_result =  cl_abap_tabledescr=>create( p_line_type  = lr_struct_result ).
    CATCH cx_sy_struct_creation.    "
    CATCH cx_sy_table_creation.

  ENDTRY.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SUB_DYNAMIC_SELECT
*&---------------------------------------------------------------------*
*       Dynamically Select from Any Table
*----------------------------------------------------------------------*
FORM sub_dynamic_select  USING    lr_table_result  TYPE REF TO cl_abap_tabledescr
                                  lr_struct_result TYPE REF TO cl_abap_structdescr.

  FIELD-SYMBOLS:
        <lfs_struct> TYPE any.

*** --- Assigning fields symbols for Tables
  CREATE DATA lt_dref TYPE TABLE OF (p_tab).
  CREATE DATA ls_dref TYPE (p_tab).

*** --- Assign field symbol with table type of DDIC
  ASSIGN lt_dref->* TO <ft_table>.
*** --- Assign field symbol with Structure type of DDIC
  ASSIGN ls_dref->* TO <fs_table>.

  IF <ft_table> IS  ASSIGNED.
*   This is the Dynamic Select
    SELECT (gs_field_list) FROM (p_tab) INTO CORRESPONDING FIELDS OF TABLE <ft_table>.
  ENDIF.

  IF <ft_table> IS NOT INITIAL.

    DESCRIBE TABLE gt_components LINES DATA(lv_line).

    CLEAR gt_where_clause.

    LOOP AT gt_components INTO DATA(ls_compo).
      IF sy-tabix EQ 1.
* Table name
        CONCATENATE `a~TABNAME EQ '` p_tab `'` INTO gs_where_clause-line.
        APPEND gs_where_clause TO gt_where_clause.
* data element text condition
        gs_where_clause-line = `AND b~DDLANGUAGE EQ 'E'`.
        APPEND gs_where_clause TO gt_where_clause.
* Field name
        CONCATENATE `AND ( a~FIELDNAME EQ '` ls_compo-name `'` INTO gs_where_clause-line.
        APPEND gs_where_clause TO gt_where_clause.
      ELSEIF sy-tabix EQ lv_line.
* Field name
        CONCATENATE `OR a~FIELDNAME EQ '` ls_compo-name `'` INTO gs_where_clause-line.
        APPEND gs_where_clause TO gt_where_clause.
      ELSE.
* Field name
        CONCATENATE `OR a~FIELDNAME EQ '` ls_compo-name `'` INTO gs_where_clause-line.
        APPEND gs_where_clause TO gt_where_clause.
      ENDIF.
      CLEAR : ls_compo, gs_where_clause.
    ENDLOOP.
* Adding closing bracket to where clause
    gs_where_clause-line = `)`.
    APPEND gs_where_clause TO gt_where_clause.
    CLEAR : gs_where_clause, lv_line.

    SELECT SINGLE ddtext
              FROM dd02t
              INTO @DATA(lv_tab_desc)
              WHERE tabname EQ @p_tab
               AND ddlanguage EQ 'E'.
    IF sy-subrc EQ 0.
      gv_tab_desc = lv_tab_desc.
    ENDIF.

* Dynamic json format field and data assignment for selected records
    SELECT a~tabname, a~fieldname, a~position, a~datatype, a~leng, a~decimals, b~ddtext, a~reftable, a~reffield
    FROM dd03l AS a JOIN dd04t AS b ON a~rollname = b~rollname
    INTO TABLE @DATA(lt_dd03l) WHERE (gt_where_clause).
    IF sy-subrc EQ 0.
*      gt_dictionary = lt_dd03l.
      MOVE-CORRESPONDING lt_dd03l TO gt_dictionary.
    ENDIF.

    SORT lt_dd03l BY position ASCENDING. "Field order in the table

* Just in case if this structure block gets selected in screen
    DELETE lt_dd03l WHERE fieldname = '.INCLU--AP' " append structure
                       OR fieldname = '.INCLUDE'.  " include structure

    LOOP AT lt_dd03l ASSIGNING FIELD-SYMBOL(<lfs_dd03l>).
      <lfs_dd03l>-position = sy-tabix.
    ENDLOOP.

    DESCRIBE TABLE lt_dd03l LINES DATA(lv_lines).

* Table Strcture building in HTML file for download
    CONCATENATE 'Converting table' p_tab 'to html' INTO statusbarmessage SEPARATED BY space.
    PERFORM displaystatus USING statusbarmessage 0.

    PERFORM convertddtohtml CHANGING dumihtml[].

    CONCATENATE p_file '\' p_tab '.html' INTO DATA(gv_path).

    PERFORM savefiletopc USING dumihtml[]
                               gv_path " FILE PATH with file name
                               p_tab " FILE NAME  - TABLE
                               space
                               space
                               'X'.

    LOOP AT <ft_table> ASSIGNING <fs_table>.

      IF sy-tabix EQ 1.
* create new statement for record insert block
        ls_text-text =  |[|.
        APPEND ls_text TO lt_text.
        CLEAR : ls_text.
      ENDIF.

      DO lv_lines TIMES.
        READ TABLE lt_dd03l INTO DATA(ls_fld) WITH KEY position = sy-index.
        lv_field = ls_fld-fieldname.
        ASSIGN COMPONENT lv_field OF STRUCTURE <fs_table> TO <fld_value>.

* ############################################################################
* IF it is a Text field containing Double quotes " it needs to be changed
* or json file wont work during data load in abap cloud BTP class

*** IF Table field is a text type containing Double quotes "
        IF ls_fld-datatype EQ 'CHAR'
          AND ls_fld-leng GT 10.
          REPLACE ALL OCCURRENCES OF '"' IN <fld_value> WITH 'change text'.
        ENDIF.

* implement your suitable replacement text for double quotes
* ############################################################################

* DURING FIRST FIELD ASSIGNMENT
        IF sy-index EQ 1.

          lv_variable_1 = |{ lv_set_bracket_open }| & |"| & |{ ls_fld-fieldname }| & |"| & |:| & |"| & |{ <fld_value> }| & |",|.

        ENDIF.

* DURING OTHER MIDDLE FIELDS ASSIGNMENT
        IF sy-index > 1.

          lv_variable_1 = |"| & |{ ls_fld-fieldname }| & |"| & |:| & |"| & |{ <fld_value> }| & |",|.

        ENDIF.

* DURING LAST FIELD ASSIGNMENT
        IF sy-index EQ lv_lines.

          CLEAR lv_variable_1.
          lv_variable_1 = |"| & |{ ls_fld-fieldname }| & |"| & |:| & |"| & |{ <fld_value> }| & |"| & |{ lv_set_bracket_close }|.

        ENDIF.

        CONCATENATE lv_variable_2 lv_variable_1 INTO lv_variable_2 ."SEPARATED BY space.

        CLEAR : ls_fld, lv_field, lv_variable_1.
      ENDDO.

      ls_text-text = lv_variable_2.
      APPEND ls_text TO lt_text.
      CLEAR : lv_variable_2, ls_text.

      ls_text-text = ','.
      APPEND ls_text TO lt_text.
      CLEAR ls_text.

      CLEAR : ls_text, lv_variable_2.
    ENDLOOP.

* RECORD INSERT BLOCK STATEMENT CLOSE
    ls_text-text =  |]|.
    APPEND ls_text TO lt_text.
    CLEAR ls_text.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SUB_DOWNLOAD_FILE
*&---------------------------------------------------------------------*
*       Download File
*----------------------------------------------------------------------*
FORM sub_download_file  USING  p_p_file TYPE string.

  DATA: lv_file      TYPE string.

* Moving to a type compatible variable
  CONCATENATE p_p_file '\' p_tab '.json' INTO lv_file.

  CALL METHOD cl_gui_frontend_services=>gui_download
    EXPORTING
      filename                = lv_file
      filetype                = 'ASC'
      codepage                = '4310'
    CHANGING
      data_tab                = lt_text
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
  IF sy-subrc = 0.
    WRITE:/ 'File downloaded successfully' COLOR COL_POSITIVE.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  CONVERTDDTOHTML
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM convertddtohtml CHANGING ilochtml LIKE dumihtml[].

  DATA: addbackground TYPE abap_bool.
  DATA: icolumncaptions TYPE STANDARD TABLE OF string WITH HEADER LINE.
  DATA: wahtml TYPE string.
  DATA: title TYPE string.
  DATA: wtextcell TYPE string.
  DATA: wfieldbasetype.
  DATA: addedheader TYPE flag VALUE ''.
  DATA: htmltable TYPE STANDARD TABLE OF string WITH HEADER LINE.
  DATA: gv_max_length TYPE i.
  DATA: lv_decimal TYPE char6.
  DATA: lv_length TYPE char6.

  DATA : pree_space  TYPE string,
         post_space  TYPE string,
         line_holder TYPE string.

  title = gv_tab_desc.

* Add a html header to the table
  CONCATENATE 'Dictionary object-' p_tab INTO title SEPARATED BY space.
  PERFORM addhtmlheader USING ilochtml[]
                              title
                              addbackground
                              ss_code.

  APPEND `<body>` TO ilochtml.

* new inclusion - start
  APPEND `<body bgcolor=#1C2228>` TO ilochtml.
* new inclusion - end

  APPEND `  <table class="outerTable">` TO ilochtml.
  APPEND `    <tr>` TO ilochtml.

  CONCATENATE `      <td><h2><span style="color: #50FA7B"> Table : ` p_tab '</span></h2>' INTO wahtml.
  APPEND wahtml TO ilochtml.

  CONCATENATE `  <h3>Description: ` gv_tab_desc '</h3></td>' INTO wahtml.
  APPEND wahtml TO ilochtml.
  CLEAR wahtml.

  APPEND `    </tr>` TO ilochtml.

  APPEND `    <tr>` TO ilochtml.
  APPEND `      <td><!--This is where our main table begins  --></td>` TO ilochtml.
*  APPEND `<table class="innerTable">` TO ilochtml.
  APPEND `</tr>` TO ilochtml.
*  APPEND `      </table>` TO ilochtml.
  APPEND '<br/>' TO ilochtml.

* Definition starts here
* Code block layout definition
  APPEND '<table class="outerTable">' TO htmltable.
  APPEND `  <tr class="normalBoldLarge">` TO htmltable.

  APPEND `<h3> <span style="color: yellow"> Table definition </span> with <span style="color: yellow">  data types </span> </h3> </td>` TO htmltable.
  APPEND `   </tr>` TO htmltable.

* Code
  APPEND `  <tr>` TO htmltable.
  APPEND `     <td>` TO htmltable.

* Table containing code
  APPEND `     <table class="innerTable">` TO htmltable.
  APPEND `       <tr>` TO htmltable.
  APPEND `          <td>` TO htmltable.

*  APPEND `   <div class="code">` TO htmltable.
  APPEND `   <div class="codeComment">` TO htmltable.
  APPEND '<br />' TO htmltable.

* Table / Structure definition block
  CONCATENATE ` @EndUserText.label : '` gv_tab_desc `' <br /> ` INTO htmltable.
  APPEND htmltable.

  APPEND ` @AbapCatalog.enhancement.category : #EXTENSIBLE_ANY <br /> ` TO htmltable.
  APPEND ` @AbapCatalog.tableCategory : #TRANSPARENT <br /> ` TO htmltable.
  APPEND ` @AbapCatalog.deliveryClass : #A <br />` TO htmltable.
  APPEND ` @AbapCatalog.dataMaintenance : #RESTRICTED <br /> ` TO htmltable.

  DATA(lv_tablename) = p_tab.
  TRANSLATE lv_tablename TO LOWER CASE.

* insert - 2-start
  APPEND `</div>` TO htmltable.
  APPEND `   <div class="code">` TO htmltable.
  APPEND '<br />' TO htmltable.
* insert - 2-end

  CONCATENATE ` define table ` lv_tablename ` { <br /> ` INTO htmltable.
  APPEND htmltable.

* Line space after Table / Structure start
  APPEND ` <br /> ` TO htmltable.

* TO identify the longest Fieldname in table structure.
  LOOP AT gt_dictionary ASSIGNING FIELD-SYMBOL(<gfs_dictionary>).
    <gfs_dictionary>-length = strlen( <gfs_dictionary>-fieldname ).
    <gfs_dictionary>-position2 = <gfs_dictionary>-position.
  ENDLOOP.

  SORT gt_dictionary BY length DESCENDING.

  READ TABLE gt_dictionary INTO DATA(ls_wa) INDEX 1.
  IF sy-subrc EQ 0.
    gv_max_length = ls_wa-length.
  ENDIF.

  SORT gt_dictionary BY position2 DESCENDING.
  READ TABLE gt_dictionary INTO ls_wa INDEX 1.
  IF sy-subrc EQ 0.
* Back up of last record for structure closing - line spacing check
    DATA(ls_last_line_bkup) = ls_wa.
  ENDIF.

  SORT gt_dictionary BY position2 ASCENDING.

  LOOP AT gt_dictionary ASSIGNING <gfs_dictionary>.
    <gfs_dictionary>-differ = gv_max_length - <gfs_dictionary>-length.
  ENDLOOP.

* Non-breaking space based on different section.
  DATA(lv_code_pre)    = '&nbsp;&nbsp;'.

* Annotations for specific data types
  DATA(anno_sema_curr) = lv_code_pre && '@Semantics.amount.currencyCode&nbsp;:&nbsp;'.
  DATA(anno_sema_quan) = lv_code_pre && '@Semantics.quantity.unitOfMeasure&nbsp;:&nbsp;'.
  DATA(anno_sema_lang) = lv_code_pre && '@AbapCatalog.textLanguage <br />'.
  DATA(anno_eusr_labl) = lv_code_pre && '@EndUserText.label : '. " Annotation Used for direct data types only

* Table structure preparation begins
  LOOP AT gt_dictionary INTO DATA(wa_tdict_struct).

    DO wa_tdict_struct-differ TIMES.
      CONCATENATE '&nbsp;' post_space INTO post_space.
    ENDDO.

    CONDENSE post_space.

    IF wa_tdict_struct-datatype EQ 'curr' OR wa_tdict_struct-datatype EQ 'CURR'.
* Line space after field definition flag
      DATA(gv_line_space) = 'X'.
* Line spacing for readability in the output.
*      APPEND ' <br /> ' TO htmltable.

* insert - 2-start
      APPEND `</div>` TO htmltable.
      APPEND `   <div class="codeComment">` TO htmltable.
* insert - 2-end

      CONCATENATE anno_sema_curr `'` wa_tdict_struct-reftable '.' wa_tdict_struct-reffield `'<br />` INTO htmltable.
      APPEND htmltable.

* insert - 2-start
      APPEND `</div>` TO htmltable.
      APPEND `   <div class="code">` TO htmltable.
* insert - 2-end

    ENDIF.

    IF wa_tdict_struct-datatype EQ 'QUAN' OR wa_tdict_struct-datatype EQ 'quan'.
* Line space after field definition flag
      gv_line_space = 'X'.
* Line spacing for readability in the output.
*      APPEND ' <br /> ' TO htmltable.

* insert - 2-start
      APPEND `</div>` TO htmltable.
      APPEND `   <div class="codeComment">` TO htmltable.
* insert - 2-end

      CONCATENATE anno_sema_quan `'` wa_tdict_struct-reftable '.' wa_tdict_struct-reffield `'<br />` INTO htmltable.
      APPEND htmltable.
    ENDIF.

* insert - 2-start
    APPEND `</div>` TO htmltable.
    APPEND `   <div class="code">` TO htmltable.
* insert - 2-end

    IF wa_tdict_struct-datatype EQ 'lang' OR wa_tdict_struct-datatype EQ 'LANG'.
* Line space after field definition flag
      gv_line_space = 'X'.
* Line spacing for readability in the output.
*      APPEND ' <br /> ' TO htmltable.

* insert - 2-start
      APPEND `</div>` TO htmltable.
      APPEND `   <div class="codeComment">` TO htmltable.
* insert - 2-end

      APPEND anno_sema_lang TO htmltable.

* insert - 2-start
      APPEND `</div>` TO htmltable.
      APPEND `   <div class="code">` TO htmltable.
* insert - 2-end

    ENDIF.


    DATA(lv_fieldname) = wa_tdict_struct-fieldname.
    TRANSLATE lv_fieldname TO LOWER CASE.
    TRANSLATE wa_tdict_struct-datatype TO LOWER CASE.

    CLEAR : pree_space.
    pree_space = lv_code_pre.

    IF wa_tdict_struct-ddtext IS INITIAL.
      REPLACE ALL OCCURRENCES OF '_' IN wa_tdict_struct-fieldname WITH ` `.
      TRANSLATE wa_tdict_struct-fieldname TO LOWER CASE.
      wa_tdict_struct-ddtext = wa_tdict_struct-fieldname.
    ENDIF.

* insert - 2-start
    APPEND `</div>` TO htmltable.
    APPEND `   <div class="codeComment">` TO htmltable.
* insert - 2-end

    CONCATENATE anno_eusr_labl `&nbsp;'` wa_tdict_struct-ddtext `'<br />` INTO htmltable.
    APPEND htmltable.
    CLEAR htmltable.

* insert - 2-start
    APPEND `</div>` TO htmltable.
    APPEND `   <div class="code">` TO htmltable.
* insert - 2-end

    CONCATENATE pree_space lv_fieldname post_space '&nbsp;' ':' '&nbsp;' INTO line_holder.
    IF wa_tdict_struct-decimals IS INITIAL.
* data type length
      lv_length = wa_tdict_struct-leng.
      PERFORM removeleadingzeros CHANGING lv_length.
      CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' lv_length '); <br />' INTO htmltable.
    ELSE.
* decimal length
      CLEAR lv_decimal.
      lv_decimal = wa_tdict_struct-decimals.
      PERFORM removeleadingzeros CHANGING lv_decimal.
* data type length
      lv_length = wa_tdict_struct-leng.
      PERFORM removeleadingzeros CHANGING lv_length.
      CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' lv_length ',' lv_decimal ')' '&nbsp;' '; <br />' INTO htmltable.
    ENDIF.

      APPEND htmltable.
      CLEAR htmltable.

        APPEND '<br />' TO htmltable.
        CLEAR htmltable.

    CLEAR : line_holder, wa_tdict_struct, post_space, pree_space.
  ENDLOOP.

  APPEND ` } <br /> ` TO htmltable.

  APPEND `            </div>` TO htmltable.
  APPEND `          </td>`  TO htmltable.
  APPEND `        </tr>` TO htmltable.
  APPEND `      </table>` TO htmltable.
  APPEND `      </td>` TO htmltable.
  APPEND `      </tr>` TO htmltable.

  APPEND LINES OF htmltable[] TO ilochtml[].

  CLEAR : ls_last_line_bkup.


* Definition ends here
* Add a html footer to the table
  PERFORM addhtmlfooter USING ilochtml[].

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  ADDHTMLHEADER
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ILOCHTML[]  text
*      -->P_TITLE  text
*      -->P_ADDBACKGROUND  text
*      -->P_SS_CODE  text
*----------------------------------------------------------------------*
FORM addhtmlheader USING ilocheader LIKE dumihtml[]
                         VALUE(title)
                         VALUE(addbackground) TYPE abap_bool
                         VALUE(stylesheettype) TYPE char1.

  DATA: waheader TYPE string.

  APPEND '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">' TO ilocheader.
  APPEND '<html xmlns="http://www.w3.org/1999/xhtml">' TO ilocheader.
  APPEND '<head>' TO ilocheader.
*     append '<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />' to iLocHeader.
  APPEND '<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=ISO-8859-1" />' TO ilocheader.

  CONCATENATE '<title>' title '</title>' INTO waheader.
  APPEND waheader TO ilocheader.

  CASE stylesheettype.
    WHEN ss_code.
      PERFORM addcodestyles USING ilocheader
                                  addbackground.
    WHEN ss_table.
      PERFORM addtablestyles USING ilocheader
                                   addbackground.
  ENDCASE.

  PERFORM addgenericstyles USING ilocheader
                                 addbackground.

  APPEND '</head>' TO ilocheader.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  ADDCODESTYLES
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ILOCHEADER  text
*      -->P_ADDBACKGROUND  text
*----------------------------------------------------------------------*
FORM addcodestyles USING ilocheader LIKE dumihtml[]
                         VALUE(addbackground) TYPE abap_bool.

  APPEND '<style type="text/css">' TO ilocheader.
* new inclusion - start
*  APPEND `.code{ font-family:"Courier New", Courier, monospace; color:#000; font-size:14px; background-color:#F2F4F7 }` TO ilocheader.
*  APPEND `  .codeComment {font-family:"Courier New", Courier, monospace; color:#0000F0; font-size:14px; background-color:#F2F4F7 }` TO ilocheader.
*  APPEND `  .normalBold{ font-family:Arial, Helvetica, sans-serif; color:#000; font-size:12px; font-weight:800 }` TO ilocheader.
*  APPEND `  .normalBoldLarge{ font-family:Arial, Helvetica, sans-serif; color:#000; font-size:16px; font-weight:800 }` TO ilocheader.
  APPEND `  .code{ font-family:"Courier New", Courier, monospace; color:#D3D7D9; font-size:14px; background-color:#1C2228 }` TO ilocheader.
  APPEND `  .codeComment2 {font-family:"Courier New", Courier, monospace; color:#D3D7D9; font-size:14px; background-color:#1C2228 }` TO ilocheader.
  APPEND `  .normalBold{ font-family:Arial, Helvetica, sans-serif; color:#D3D7D9; font-size:12px; font-weight:800 }` TO ilocheader.
  APPEND `  .normalBoldLarge{ font-family:Arial, Helvetica, sans-serif; color:#D3D7D9; font-size:16px; font-weight:800 }` TO ilocheader.
* new inclusion - end
  APPEND '</style>' TO ilocheader.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  ADDTABLESTYLES
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ILOCHEADER  text
*      -->P_ADDBACKGROUND  text
*----------------------------------------------------------------------*
FORM addtablestyles USING ilocheader LIKE dumihtml[]
                          VALUE(addbackground) TYPE abap_bool.

  APPEND '<style type="text/css">' TO ilocheader.
  APPEND `  th{text-align:left}` TO ilocheader.

  APPEND `  .cell{` TO ilocheader.
  APPEND `     font-family:"Courier New", Courier, monospace;` TO ilocheader.
* new inclusion - start
*  APPEND `     color:#000;` TO ilocheader.
  APPEND `     color:#D3D7D9;` TO ilocheader.
* new inclusion - end
  APPEND `     font-size:12px;` TO ilocheader.
* new inclusion - start
*  APPEND `     background-color:#F2F4F7;` TO ilocheader.
  APPEND `     background-color:#29313A;` TO ilocheader.
* new inclusion - end
  APPEND `  }` TO ilocheader.
* new inclusion - start
*  APPEND `  .cell td { border: thin solid #ccc; }` TO ilocheader.
*  APPEND `  .cell td { border: thin solid #808080; }` TO ilocheader.
  APPEND `  .cell td { border: thin solid #29313A; }` TO ilocheader.
* new inclusion - end
  APPEND `</style>` TO ilocheader.
ENDFORM.                    "addTableStyles
*&---------------------------------------------------------------------*
*&      Form  ADDGENERICSTYLES
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ILOCHEADER  text
*      -->P_ADDBACKGROUND  text
*----------------------------------------------------------------------*
FORM addgenericstyles USING ilocheader LIKE dumihtml[]
                          VALUE(addbackground) TYPE abap_bool.

  APPEND '<style type="text/css">' TO ilocheader.
* new inclusion - start
*  APPEND `  .normal{ font-family:Arial, Helvetica, sans-serif; color:#000; font-size:12px }` TO ilocheader.
*  APPEND `  .footer{ font-family:Arial, Helvetica, sans-serif; color:#000; font-size:12px; text-align: center }` TO ilocheader.
*  APPEND `  h2{ font-family:Arial, Helvetica, sans-serif; color:#000; font-size:16px; font-weight:800 }` TO ilocheader.
*  APPEND `  h3{ font-family:Arial, Helvetica, sans-serif; color:#000; font-size:14px; font-weight:800 }` TO ilocheader.

* Table structure
  APPEND `  .header{ font-family:Arial, Helvetica, sans-serif; color:#D3D7D9; font-size:13px; font-weight:800 }` TO ilocheader.
  APPEND `  .normal{ font-family:Arial, Helvetica, sans-serif; color:#D3D7D9; font-size:12px }` TO ilocheader.
  APPEND `  .footer{ font-family:Arial, Helvetica, sans-serif; color:#D3D7D9; font-size:12px; text-align: center }` TO ilocheader.
  APPEND `  h2{ font-family:Arial, Helvetica, sans-serif; color:#D3D7D9; font-size:16px; font-weight:800 }` TO ilocheader.
  APPEND `  h3{ font-family:Arial, Helvetica, sans-serif; color:#D3D7D9; font-size:14px; font-weight:800 }` TO ilocheader.

* Code - Table definition
  APPEND `  .code{ font-family:"Courier New", Courier, monospace; color:#D3D7D9; font-size:14px; background-color:#1C2228 }` TO ilocheader.
  APPEND `  .codeComment{ font-family:"Courier New", Courier, monospace; color:#ADFC03; font-size:14px; background-color:#1C2228 }` TO ilocheader.
*  APPEND `  .codeComment {font-family:"Courier New", Courier, monospace; color:#60B1D9; font-size:14px; background-color:#1C2228 }` TO ilocheader.
  APPEND `  .normalBold{ font-family:Arial, Helvetica, sans-serif; color:#D3D7D9; font-size:12px; font-weight:800 }` TO ilocheader.
  APPEND `  .normalBoldLarge{ font-family:Arial, Helvetica, sans-serif; color:#D3D7D9; font-size:16px; font-weight:800 }` TO ilocheader.

* new inclusion - end
  APPEND `  .outerTable{` TO ilocheader.
  IF NOT addbackground IS INITIAL.
* new inclusion - start
*    APPEND `   background-color:#E0E7ED;` TO ilocheader.
    APPEND `   background-color:#29313A;` TO ilocheader.
* new inclusion - end
  ENDIF.
  APPEND `   width:100%;` TO ilocheader.
* new inclusion - start
  APPEND `   border-color:#3A4552;;` TO ilocheader.
* new inclusion - end
  APPEND `   border-top-width: thin;` TO ilocheader.
  APPEND `   border-right-width: thin;` TO ilocheader.
  APPEND `   border-right-width: thin;` TO ilocheader.
  APPEND `   border-left-width: thin;` TO ilocheader.
  APPEND `   border-top-style: solid;` TO ilocheader.
  APPEND `   border-right-style: solid;` TO ilocheader.
  APPEND `   border-bottom-style: solid;` TO ilocheader.
  APPEND `   border-left-style: solid;` TO ilocheader.
  APPEND `  }` TO ilocheader.

  APPEND `  .innerTable{` TO ilocheader.
  IF NOT addbackground IS INITIAL.
* new inclusion - start
*    APPEND `   background-color:#F2F4F7;` TO ilocheader. - WHITE
    APPEND `   background-color:#1C2228;` TO ilocheader. " Dark grey - QUARTZ DARK
*    APPEND `   background-color:#344B5F;` TO ilocheader. " Dark grey - QUARTZ DARK THEME - SELECTION BLUE
* new inclusion - end
  ENDIF.
  APPEND `   width:100%;` TO ilocheader.
* new inclusion - start
  APPEND `   border-color:#808080;` TO ilocheader. " dark grey
*  APPEND `   border-color:#91C8F6;` TO ilocheader. " Sap dark quartz theme - border blue - OVER GLOW - AVOIDED
* new inclusion - end
  APPEND `   border-top-width: thin;` TO ilocheader.
  APPEND `   border-right-width: thin;` TO ilocheader.
  APPEND `   border-bottom-width: thin;` TO ilocheader.
  APPEND `   border-left-width: thin;` TO ilocheader.
  APPEND `   border-top-style: solid;` TO ilocheader.
  APPEND `   border-right-style: solid;` TO ilocheader.
  APPEND `   border-bottom-style: solid;` TO ilocheader.
  APPEND `   border-left-style: solid;` TO ilocheader.
  APPEND `  }` TO ilocheader.
  APPEND '</style>' TO ilocheader.
ENDFORM.                    "addGenericStyles
*&---------------------------------------------------------------------*
*&      Form  BUILDFOOTERMESSAGE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_FOOTERMESSAGE  text
*----------------------------------------------------------------------*
FORM buildfootermessage USING returnmessage.

  CONCATENATE `Extracted by Mass Download version `
              versionno ` - Lordes Dante Epicurus. 2012-`
              sy-datum+0(4) `. Sap Release ` sy-saprl INTO returnmessage.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  ADDHTMLFOOTER
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ILOCHTML[]  text
*----------------------------------------------------------------------*
FORM addhtmlfooter USING ilocfooter LIKE dumihtml[].

  DATA: footermessage TYPE string.
  DATA: wafooter TYPE string.

  PERFORM buildfootermessage USING footermessage.

  APPEND `   <tr>` TO ilocfooter.
  CONCATENATE '<td class="footer">' footermessage '</td>' INTO wafooter.
  APPEND wafooter TO ilocfooter.
  APPEND `   </tr>` TO ilocfooter.
  APPEND `</table>` TO ilocfooter.
  APPEND '</body>' TO ilocfooter.
  APPEND '</html>' TO ilocfooter.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  DISPLAYSTATUS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_STATUSBARMESSAGE  text
*      -->P_0      text
*----------------------------------------------------------------------*
FORM displaystatus USING VALUE(message)
                         VALUE(delay).

  CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
    EXPORTING
      percentage = 0
      text       = message
    EXCEPTIONS
      OTHERS     = 1.

  IF delay > 0.
    WAIT UP TO delay SECONDS.
  ENDIF.
ENDFORM.
FORM savefiletopc USING idownload TYPE STANDARD TABLE
                        VALUE(filenamewithpath)
                        VALUE(filename)
                        VALUE(writefieldseparator)
                        VALUE(truncatetrailingblanks)
                        VALUE(displayprogressmessage).

  DATA: statusmessage TYPE string.
  DATA: objfile TYPE REF TO cl_gui_frontend_services.
  DATA: strsubrc TYPE string.

  IF NOT displayprogressmessage IS INITIAL.
    CONCATENATE `Downloading: ` filename INTO statusmessage.
    PERFORM displaystatus USING statusmessage 0.
  ENDIF.

  CREATE OBJECT objfile.
  objfile->gui_download( EXPORTING filename = filenamewithpath
                                    filetype = 'ASC'
                                    write_field_separator = writefieldseparator
                                    trunc_trailing_blanks = truncatetrailingblanks
                           CHANGING data_tab = idownload[]
                         EXCEPTIONS file_write_error        = 1
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
                                    error_no_gui            = 23 ).

  IF sy-subrc <> 0.
    strsubrc = sy-subrc.
    CONCATENATE `File save error: ` filename ` sy-subrc: ` strsubrc INTO statusmessage.
    PERFORM displaystatus USING statusmessage 3.
  ENDIF.
ENDFORM.

FORM removeleadingzeros CHANGING myvalue.

  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
    EXPORTING
      input  = myvalue
    IMPORTING
      output = myvalue
    EXCEPTIONS
      OTHERS = 1.
ENDFORM.
