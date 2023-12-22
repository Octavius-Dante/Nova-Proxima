*&---------------------------------------------------------------------*
*& Report ZTABLE_SCHEMA_DATA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztable_schema_data.

* Functionality overview

* Download Html page layout of table with table details same as (abap mass download)
* Table definition with annotations
* Structure definition with annotations

* Layout of table definition using following types
* Only Data type, Data element with foreign key annotations, Data element alone)

* Download the table data in json file format - to given directory
* Download the table data in tab-delimited file format - to given directory

*&---------------------------------------------------------------------*
*& DATA declarations
*&---------------------------------------------------------------------*

* Holds all domain texts
TYPES: BEGIN OF tdomainstructure,
         domname    TYPE domname,
         domvalue_l TYPE domvalue_l,
         domvalue_h TYPE domvalue_l,
         ddtext     TYPE val_text,
       END OF tdomainstructure.

* Holds a table\structure definition
TYPES: BEGIN OF tdicttablestructure,
         fieldname LIKE dd03l-fieldname,
         position  LIKE dd03l-position,
         keyflag   LIKE dd03l-keyflag,
         rollname  LIKE dd03l-rollname,
         domname   LIKE dd03l-domname,
         datatype  LIKE dd03l-datatype,
         leng      LIKE dd03l-leng,
* new inclusion - start
         decimals  LIKE dd03l-decimals,
         reftable  LIKE dd03l-reftable,
         reffield  LIKE dd03l-reffield,
* new inclusion - end
         lowercase TYPE lowercase,
         ddtext    LIKE dd04t-ddtext,
         idomains  TYPE tdomainstructure OCCURS 0,
       END OF tdicttablestructure.

TYPES: BEGIN OF tdict_length,
         fieldname LIKE dd03l-fieldname,
         position  LIKE dd03l-position,
         position2 TYPE i,
         fkey      TYPE char1,
         keyflag   LIKE dd03l-keyflag,
         rollname  LIKE dd03l-rollname,
         domname   LIKE dd03l-domname,
         datatype  LIKE dd03l-datatype,
         leng      LIKE dd03l-leng,
         decimals  LIKE dd03l-decimals,
         reftable  LIKE dd03l-reftable,
         reffield  LIKE dd03l-reffield,
         lowercase TYPE lowercase,
         ddtext    LIKE dd04t-ddtext,
         idomains  TYPE tdomainstructure OCCURS 0,
         length    TYPE i,
         differ    TYPE i,
       END OF tdict_length.

TYPES: BEGIN OF tdictfilename,
         tablename LIKE dd03l-tabname,
         filename  TYPE string,
       END OF tdictfilename.

* Holds a tables attributes + its definition
TYPES: BEGIN OF tdicttable,
         tablename  LIKE dd03l-tabname,
         tabletitle LIKE dd02t-ddtext,
         istructure TYPE tdicttablestructure OCCURS 0,
       END OF tdicttable.

* JSON file download processing structure.
TYPES : BEGIN OF gty_det,
          tabname   TYPE tabname,
          fieldname TYPE fieldname,
          index     TYPE i,
        END OF gty_det,

        BEGIN OF gty_text,
          text(2500) TYPE c,
        END OF gty_text.

* JSON file download processing variables.
DATA : lt_table_filds       TYPE TABLE OF dfies,
       lt_dref              TYPE REF TO data,
       ls_dref              TYPE REF TO data,
       lt_dd30l             TYPE STANDARD TABLE OF dd03l,
       ls_dd30l             TYPE dd03l,
       lt_tbl_fld           TYPE STANDARD TABLE OF gty_det,
       ls_tbl_fld           TYPE gty_det,
       lv_variable_1(500)   TYPE c, "char100,
       lv_variable_2(2500)  TYPE c,
       lv_field             TYPE char30,
       lt_text              TYPE STANDARD TABLE OF gty_text,
       ls_text              TYPE gty_text,
*       gv_table             TYPE tabname16,
*       gv_path              TYPE string,
       lv_filename          TYPE string,
       lv_file              TYPE string,
       lv_path              TYPE string,
       lv_file_name         TYPE string,
       lv_count             TYPE i,
       lv_temp(2500)        TYPE c,
       lv_val_1             TYPE i,
       lv_val_2             TYPE i,
       lv_total             TYPE i,
       lv_text_trim(75)     TYPE c,
       gv_end               TYPE char1,
       lv_set_bracket_open  TYPE char1 VALUE '{',
       lv_set_bracket_close TYPE char1 VALUE '}'.

* JSON file download processing field-symbols.
*** --- Field Symbols
FIELD-SYMBOLS : <fld_value> TYPE any.
FIELD-SYMBOLS : <fs_table> TYPE any.
FIELD-SYMBOLS : <ft_table> TYPE STANDARD TABLE.
FIELD-SYMBOLS : <dyn_field>.

DATA : gv_class  TYPE devclass,
       gv_tables TYPE tabname.

* Presentation server path variables
DATA : gv_file TYPE saepfad,
       gv_path TYPE string.

* Package Name and Table name hodlers
DATA : gv_table   TYPE tabname,
       gv_package TYPE devclass.

DATA : gv_flag_all TYPE char1.

*  Dictionary objects which have previously been downloaded
DATA: idictfilename TYPE STANDARD TABLE OF tdictfilename WITH HEADER LINE.
DATA: pmlang TYPE spras VALUE 'EN'.
DATA: idictionary TYPE STANDARD TABLE OF tdicttable WITH HEADER LINE.
DATA: dumidictstructure TYPE STANDARD TABLE OF tdicttablestructure.
DATA: serverslashseparator TYPE string.
DATA: serverfilesystem TYPE filesys_d.
DATA: serveropsystem TYPE string.
DATA: downloadfolder TYPE string.
DATA: slashseparatortouse TYPE string.
DATA: statusbarmessage(100).
DATA: dumihtml TYPE STANDARD TABLE OF string.

DATA : gv_tablename  TYPE tabname.
DATA : gv_description TYPE dd02t-ddtext.

*temp varaible
DATA psortt TYPE char1.
DATA pserv TYPE char1.
DATA ppromess TYPE char1 VALUE 'X'.
DATA pback TYPE char1 VALUE 'X'.
DATA gv_flag TYPE char6.

DATA : lt_tdict_length TYPE STANDARD TABLE OF tdict_length.
FIELD-SYMBOLS : <gfs_tdict_length> TYPE tdict_length.

RANGES: sotablenames FOR dd02l-tabname.

CONSTANTS: unix TYPE string VALUE 'UNIX'.
CONSTANTS: non_unix TYPE string VALUE 'not UNIX'.
CONSTANTS: htmlextension TYPE string VALUE 'html'.
CONSTANTS: is_table TYPE string VALUE 'T'.
CONSTANTS: period TYPE string VALUE '.'.
CONSTANTS: versionno TYPE string VALUE '2.5'.
CONSTANTS: ss_code TYPE c VALUE 'C'.
CONSTANTS: ss_table TYPE c VALUE 'T'.

CONSTANTS : gc_path_sep     TYPE char1 VALUE '\',
            gc_table_path   TYPE char8 VALUE '\Tables\',
            gc_package_path TYPE char9 VALUE '\Package\'.

*<given path>\<Package name>\<Tables>\<Table_Names.html>
*<given path>\<Package name>\<Table_Data>\<JSON_FILE>\<Table_name.json>
*<given path>\<Package name>\<Table_Data>\<TABD_FILE>\<Table_name.txt>

*&---------------------------------------------------------------------*
*& Screen layout declarations
*&---------------------------------------------------------------------*

SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE header1.
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : r1 RADIOBUTTON GROUP g1 DEFAULT 'X' USER-COMMAND aa.
SELECTION-SCREEN COMMENT 5(63) name1.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : r2 RADIOBUTTON GROUP g1.
SELECTION-SCREEN COMMENT 5(63) name2.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN: END OF BLOCK b1.

SELECTION-SCREEN: BEGIN OF BLOCK b2 WITH FRAME TITLE header2.
SELECT-OPTIONS : sopack FOR gv_class   NO INTERVALS MODIF ID aa.
SELECT-OPTIONS : sotable FOR gv_tables NO INTERVALS MODIF ID cc.

SELECTION-SCREEN SKIP.
PARAMETERS p_pspath TYPE rlgrap-filename.
SELECTION-SCREEN SKIP.
SELECTION-SCREEN COMMENT /1(79) value.
PARAMETERS : json AS CHECKBOX DEFAULT 'X'. " - Json file for Git ABAP uploader cloud
SELECTION-SCREEN SKIP.
*SELECTION-SCREEN COMMENT /1(79) value_1.
*PARAMETERS : tabd AS CHECKBOX DEFAULT 'X'. " - Tab-delimited text file

* All records
PARAMETERS : all_rec RADIOBUTTON GROUP rad1 DEFAULT 'X',
* Only 50K records
             50k_rec RADIOBUTTON GROUP rad1,
* Only 25K records
             25k_rec RADIOBUTTON GROUP rad1,
* Only 10K records
             10k_rec RADIOBUTTON GROUP rad1,
* Only 5K records
             5k_rec  RADIOBUTTON GROUP rad1.

SELECTION-SCREEN COMMENT /10(79) value_2.
SELECTION-SCREEN: END OF BLOCK b2.

INITIALIZATION.
  header1 = 'Extraction based on'.
  header2 = 'File path and file types'.
  name1   = 'Package Name'.
  name2   = 'Table Name'.
  value   = 'Json file format table data download Max 50K records'.
*  value_1 = 'Tab delimited file format download'.


AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_pspath.
* Presentation server directory selection
  CALL METHOD cl_gui_frontend_services=>directory_browse
    EXPORTING
      window_title    = 'File Directory'
      initial_folder  = 'C:'
    CHANGING
      selected_folder = gv_path.
  CALL METHOD cl_gui_cfw=>flush.

  CONCATENATE gv_path '' INTO p_pspath.

  IF p_pspath IS NOT INITIAL.
    downloadfolder = p_pspath.
  ENDIF.

AT SELECTION-SCREEN OUTPUT.

  IF r1 = 'X'.

    LOOP AT SCREEN.

      IF screen-group1 = 'AA'.
        screen-active = '1'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'CC'.
        screen-active = '0'.
        MODIFY SCREEN.
      ENDIF.

    ENDLOOP.

  ELSEIF r2 = 'X'.

    LOOP AT SCREEN.

      IF screen-group1 = 'AA'.
        screen-active = '0'.
        MODIFY SCREEN.
      ENDIF.

      IF screen-group1 = 'CC'.
        screen-active = '1'.
        MODIFY SCREEN.
      ENDIF.

    ENDLOOP.

  ENDIF.


  PERFORM determineserveropsystem USING serverslashseparator serverfilesystem serveropsystem.

* Determine if the external command exists.  If it doesn't then disable the server input field
*  PERFORM findexternalcommand USING serverfilesystem.

  slashseparatortouse = serverslashseparator.
*&---------------------------------------------------------------------*
*& Processing logic start
*&---------------------------------------------------------------------*
START-OF-SELECTION.

* Tables
  IF NOT sotable IS INITIAL.
    sotablenames[] = sotable[].
  ENDIF.

  IF downloadfolder IS INITIAL
  AND p_pspath IS NOT INITIAL.
    downloadfolder = p_pspath.
  ENDIF.

  PERFORM retrievetables USING idictionary[]
                               sotablenames[]
                               sopack[].

  IF NOT ( idictionary[] IS INITIAL ).
    PERFORM downloadddstructures USING idictionary[]
                                       idictfilename[]
                                       downloadfolder
                                       htmlextension
                                       space
                                       psortt
                                       slashseparatortouse
                                       pserv
                                       ppromess
                                       serverfilesystem
                                       pback.
  ENDIF.


*  DATA(lotablenames) = sotablenames.

  BREAK-POINT.

  IF sopack IS NOT INITIAL.

    SELECT a~tabname, a~tabclass FROM dd02l AS a
      JOIN tadir AS b ON a~tabname = b~obj_name
      INTO TABLE @DATA(lt_tables)
             WHERE a~tabname IN @sotablenames
             AND a~tabclass EQ 'TRANSP'
             AND a~tabclass <> 'CLUSTER'
             AND a~tabclass <> 'POOL'
             AND a~tabclass <> 'VIEW'
             AND a~as4local = 'A'
             AND b~pgmid = 'R3TR'
             AND b~object = 'TABL'
             AND b~devclass IN @sopack[].

  ENDIF.

  IF sotable IS NOT INITIAL.

    SELECT tabname, tabclass FROM dd02l
      INTO TABLE @lt_tables
    WHERE tabname IN @sotablenames
      AND tabclass EQ 'TRANSP'.

  ENDIF.


  IF sy-subrc EQ 0.
*TRANSP  - Transparent table
    DESCRIBE TABLE lt_tables LINES DATA(lv_lines).
  ENDIF.

  IF json EQ 'X'.
* Json file download logic
    CLEAR : gv_path.
    CONCATENATE downloadfolder '\DATA_JSON' INTO gv_path .

    IF lt_tables IS NOT INITIAL.
      LOOP AT lt_tables INTO DATA(wa_tab_names).
        IF sy-tabix EQ lv_lines.
          gv_flag_all = 'X'.
        ENDIF.

        PERFORM process_json USING wa_tab_names-tabname.
        CLEAR : wa_tab_names.
      ENDLOOP.
    ENDIF.

  ENDIF.

*
*  IF tabd EQ 'X'.
** Tab-Delimited file download logic
*    CLEAR : gv_path.
*    CONCATENATE downloadfolder '\DATA_TABD' INTO gv_path .
*
*    IF lt_tables IS NOT INITIAL.
*      LOOP AT lt_tables INTO wa_tab_names.
*        IF sy-tabix EQ lv_lines.
*          gv_flag_all = 'X'.
*        ENDIF.
*
*        PERFORM process_tabd USING wa_tab_names-tabname.
*        CLEAR : wa_tab_names.
*      ENDLOOP.
*    ENDIF.
*
*  ENDIF.

  MESSAGE 'All activities completed' TYPE 'I'.

* FUNCTIONALITY COMMENTS ---NEED TO CONSTRUCT---------

*<given path>\<Package name>\<Table_Data>\<JSON_FILE>\<Table_name.json>
*<given path>\<Package name>\<Table_Data>\<TABD_FILE>\<Table_name.txt>

*----------------------------------------------------------------------------------------------------------------------
*  retrieveTables...             Search for tables in dictionary
*----------------------------------------------------------------------------------------------------------------------
FORM retrievetables USING ilocdictstructure LIKE idictionary[]
                          sotable LIKE sotable[]
                          VALUE(solocpackage) LIKE sopack[].

  DATA: idictstructure TYPE STANDARD TABLE OF tdicttable.
  DATA: wadictstructure TYPE tdicttable.

  SELECT a~tabname AS tablename
         INTO CORRESPONDING FIELDS OF TABLE idictstructure
         FROM dd02l AS a
         INNER JOIN tadir AS b
           ON a~tabname = b~obj_name
         WHERE a~tabname IN sotable
           AND a~tabclass <> 'CLUSTER'
           AND a~tabclass <> 'POOL'
           AND a~tabclass <> 'VIEW'
           AND a~as4local = 'A'
           AND b~pgmid = 'R3TR'
           AND b~object = 'TABL'
           AND b~devclass IN solocpackage[].

  LOOP AT idictstructure INTO wadictstructure.
    PERFORM findtabledescription USING wadictstructure-tablename
                                       wadictstructure-tabletitle.

    PERFORM findtabledefinition USING wadictstructure-tablename
                                      wadictstructure-istructure[].

    APPEND wadictstructure TO ilocdictstructure.
    CLEAR wadictstructure.
  ENDLOOP.
ENDFORM.

*----------------------------------------------------------------------------------------------------------------------
*  findTableDescription...  Search for table description in dictionary
*----------------------------------------------------------------------------------------------------------------------
FORM findtabledescription USING VALUE(tablename)
                                      tabledescription.

  SELECT SINGLE ddtext
                FROM dd02t
                INTO tabledescription
                WHERE tabname = tablename
                 AND ddlanguage = pmlang.
ENDFORM.

*----------------------------------------------------------------------------------------------------------------------
*  findTableDefinition... Find the structure of a table from the SAP database.
*----------------------------------------------------------------------------------------------------------------------
FORM findtabledefinition USING VALUE(tablename)
                               idictstruct LIKE dumidictstructure[].

  DATA gotstate LIKE dcobjif-gotstate.
  DATA: definition TYPE STANDARD TABLE OF dd03p WITH HEADER LINE.
  DATA: idomaindataa TYPE STANDARD TABLE OF dd07v WITH HEADER LINE.
  DATA: idomaindatan TYPE STANDARD TABLE OF dd07v WITH HEADER LINE.
  DATA: wadictstruct TYPE tdicttablestructure.
  DATA: wadomainstruct TYPE tdomainstructure.
  DATA: wadd02v_n TYPE dd02v.

  CLEAR idictstruct[].

  CALL FUNCTION 'DD_INT_TABL_GET'
    EXPORTING
      tabname        = tablename
      langu          = pmlang
    IMPORTING
      gotstate       = gotstate
      dd02v_n        = wadd02v_n
    TABLES
      dd03p_n        = definition
    EXCEPTIONS
      internal_error = 1.

  IF sy-subrc = 0 AND NOT wadd02v_n IS INITIAL.
    CALL FUNCTION 'DD_TABL_EXPAND'
      EXPORTING
        dd02v_wa          = wadd02v_n
        mode              = 46
        prid              = 0
      TABLES
        dd03p_tab         = definition
      EXCEPTIONS
        illegal_parameter = 1.
  ENDIF.

  IF sy-subrc = 0 AND gotstate = 'A'.
    LOOP AT definition.
      MOVE-CORRESPONDING definition TO wadictstruct.
      PERFORM removeleadingzeros CHANGING wadictstruct-position.
      PERFORM removeleadingzeros CHANGING wadictstruct-leng.

*     Add any domain data
      CALL FUNCTION 'DD_DOMA_GET'
        EXPORTING
          domain_name   = definition-domname
          get_state     = 'M  '
          langu         = pmlang
*         prid          = 0
          withtext      = 'X'
        TABLES
          dd07v_tab_a   = idomaindataa
          dd07v_tab_n   = idomaindatan
        EXCEPTIONS
          illegal_value = 1
          op_failure    = 2.

      LOOP AT idomaindataa.
        MOVE-CORRESPONDING idomaindataa TO wadomainstruct.
        APPEND wadomainstruct TO wadictstruct-idomains.
      ENDLOOP.

      CLEAR idomaindataa[].
      APPEND wadictstruct TO idictstruct.
      CLEAR wadictstruct.
    ENDLOOP.
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
*&---------------------------------------------------------------------*
*&      Form  DETERMINESERVEROPSYSTEM
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_SERVERSLASHSEPARATOR  text
*      -->P_SERVERFILESYSTEM  text
*      -->P_SERVEROPSYSTEM  text
*----------------------------------------------------------------------*
FORM determineserveropsystem USING separator
                                   serverfilesystem
                                   serveropsystem.

* Find the file system
  SELECT SINGLE filesys
                FROM opsystem
                INTO serverfilesystem
                WHERE opsys = sy-opsys.

  FIND 'WINDOWS' IN serverfilesystem IGNORING CASE.
  IF sy-subrc = 0.
    separator = '\'.
    serveropsystem = non_unix.
    serverfilesystem = 'Windows NT'.
  ELSE.
    FIND 'DOS' IN serverfilesystem IGNORING CASE.
    IF sy-subrc = 0.
      separator = '\'.
      serveropsystem = non_unix.
    ELSE.
      separator = '/'.
      serveropsystem = unix.
    ENDIF.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  FINDEXTERNALCOMMAND
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_SERVERFILESYSTEM  text
*----------------------------------------------------------------------*
FORM findexternalcommand USING VALUE(locserverfilesystem).

  DATA: castserveropsys TYPE syopsys.

  castserveropsys = locserverfilesystem.

  CALL FUNCTION 'SXPG_COMMAND_CHECK'
    EXPORTING
      commandname       = 'ZDTX_MKDIR'
      operatingsystem   = castserveropsys
    EXCEPTIONS
      command_not_found = 1
      OTHERS            = 0.

  IF sy-subrc <> 0.
    LOOP AT SCREEN.
      IF screen-name = 'PLOGICAL'.
        screen-input = 0.
        MODIFY SCREEN.
      ENDIF.

      IF screen-name = 'PSERV'.
        screen-input = 0.
        MODIFY SCREEN.
      ENDIF.

      IF screen-name = 'PPC'.
        screen-input = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.

    MESSAGE s000(oo) WITH 'Download to server disabled,' 'external command ZDTX_MKDIR not defined.'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  DOWNLOADDDSTRUCTURES
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_IDICTIONARY[]  text
*      -->P_IDICTFILENAME[]  text
*      -->P_DOWNLOADFOLDER  text
*      -->P_HTMLEXTENSION  text
*      -->P_SPACE  text
*      -->P_PSORTT  text
*      -->P_SLASHSEPARATORTOUSE  text
*      -->P_PSERV  text
*      -->P_PPROMESS  text
*      -->P_SERVERFILESYSTEM  text
*      -->P_PBACK  text
*----------------------------------------------------------------------*
FORM downloadddstructures USING ilocdictionary LIKE idictionary[]
                                ilocdictionaryfilename LIKE idictfilename[]
                                VALUE(pathname)
                                VALUE(htmlfileextension)
                                VALUE(subdir)
                                VALUE(sorttablesasc)
                                VALUE(slashseparator)
                                VALUE(savetoserver)
                                VALUE(displayprogressmessage)
                                VALUE(locserverfilesystem)
                                VALUE(addbackground) TYPE abap_bool.


  FIELD-SYMBOLS: <wadictionary> TYPE tdicttable.
  DATA: tablefilename TYPE string.
  DATA: tablefilenamewithpath TYPE string.
  DATA: ihtmltable TYPE STANDARD TABLE OF string WITH HEADER LINE.
  DATA: newsubdirectory TYPE string.
  DATA: completesavepath TYPE string.
  DATA: wadictfilename LIKE LINE OF ilocdictionaryfilename.

  LOOP AT ilocdictionary ASSIGNING <wadictionary>.

    gv_tablename = <wadictionary>-tablename. " later used for Table definition code
    gv_description = <wadictionary>-tabletitle. " later used for Table definition code

    PERFORM buildfilename USING pathname
                                subdir
                                <wadictionary>-tablename
                                space
                                space
                                htmlfileextension
                                is_table
                                savetoserver
                                slashseparator
                                tablefilenamewithpath
                                tablefilename
                                newsubdirectory
                                completesavepath.



    READ TABLE ilocdictionaryfilename INTO wadictfilename WITH KEY tablename = <wadictionary>-tablename
                                                                   filename = completesavepath.
    IF sy-subrc <> 0.
*     Try and import a converted table to memory as it will be much quicker than converting it again
      IMPORT ihtmltable FROM MEMORY ID <wadictionary>-tablename.
      IF sy-subrc <> 0.
        IF displayprogressmessage = abap_true.
          CONCATENATE 'Converting table' <wadictionary>-tablename 'to html' INTO statusbarmessage SEPARATED BY space.
          PERFORM displaystatus USING statusbarmessage 0.
        ENDIF.

        PERFORM convertddtohtml USING <wadictionary>-istructure[]
                                      ihtmltable[]
                                      <wadictionary>-tablename
                                      <wadictionary>-tabletitle
                                      sorttablesasc
                                      addbackground.

        EXPORT ihtmltable TO MEMORY ID <wadictionary>-tablename.
      ENDIF.

      PERFORM savefiletopc USING ihtmltable[]
                                 tablefilenamewithpath
                                 tablefilename
                                 space
                                 space
                                 displayprogressmessage.

      wadictfilename-tablename = <wadictionary>-tablename.
      wadictfilename-filename = completesavepath.
      APPEND wadictfilename TO ilocdictionaryfilename.
      CLEAR wadictfilename.
    ENDIF.

    CLEAR ihtmltable[].
    CLEAR : gv_tablename, gv_description.
  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  BUILDFILENAME
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_PATHNAME  text
*      -->P_SUBDIR  text
*      -->P_<WADICTIONARY>_TABLENAME  text
*      -->P_SPACE  text
*      -->P_SPACE  text
*      -->P_HTMLFILEEXTENSION  text
*      -->P_IS_TABLE  text
*      -->P_SAVETOSERVER  text
*      -->P_SLASHSEPARATOR  text
*      -->P_TABLEFILENAMEWITHPATH  text
*      -->P_TABLEFILENAME  text
*      -->P_NEWSUBDIRECTORY  text
*      -->P_COMPLETESAVEPATH  text
*----------------------------------------------------------------------*
FORM buildfilename USING VALUE(userpath)
                         VALUE(additionalsubdirectory)
                         VALUE(objectname)
                         VALUE(mainfunctionno)
                         VALUE(includename)
                         VALUE(fileextension)
                         VALUE(downloadtype)
                         VALUE(downloadtoserver)
                         VALUE(slashseparator)
                               newfilenamewithpath
                               newfilenameonly
                               newsubdirectory
                               completepath.

  REPLACE ALL OCCURRENCES OF '/' IN objectname WITH '_'.

* If we are running on a non UNIX environment we will need to remove forward slashes from the additional path.
  IF serveropsystem = non_unix.
    IF NOT additionalsubdirectory IS INITIAL.
      TRANSLATE additionalsubdirectory USING '/_'.
      IF additionalsubdirectory+0(1) = '_'.
        SHIFT additionalsubdirectory LEFT BY 1 PLACES.
      ENDIF.
    ENDIF.
  ENDIF.

  IF additionalsubdirectory IS INITIAL.
    CONCATENATE userpath slashseparator 'dictionary'   " slashSeparator objectName
                         slashseparator
                         objectname period fileextension
                         INTO newfilenamewithpath.

    CONCATENATE userpath slashseparator 'dictionary' INTO newsubdirectory.
    CONCATENATE userpath slashseparator 'dictionary' INTO completepath.
  ELSE.
    CONCATENATE userpath slashseparator additionalsubdirectory
                         slashseparator 'dictionary'   " slashSeparator objectName
                         slashseparator
                         objectname period fileextension
                         INTO newfilenamewithpath.

    CONCATENATE userpath slashseparator additionalsubdirectory slashseparator 'dictionary' INTO newsubdirectory.
    CONCATENATE userpath slashseparator additionalsubdirectory slashseparator 'dictionary' INTO completepath.
  ENDIF.



  TRANSLATE completepath TO LOWER CASE.
  CONCATENATE objectname period fileextension INTO newfilenameonly.
  TRANSLATE newfilenameonly TO LOWER CASE.
  TRANSLATE newfilenamewithpath TO LOWER CASE.
  TRANSLATE newsubdirectory TO LOWER CASE.

* If we are running on a non UNIX environment we will need to remove incorrect characters from the filename.

  IF serveropsystem = non_unix.
    TRANSLATE newfilenameonly USING '/_'.
    TRANSLATE newfilenamewithpath USING '/_'.
    TRANSLATE newfilenameonly USING '< '.
    TRANSLATE newfilenamewithpath USING '< '.
    TRANSLATE newfilenameonly USING '> '.
    TRANSLATE newfilenamewithpath USING '> '.
    TRANSLATE newfilenameonly USING '? '.
    TRANSLATE newfilenamewithpath USING '? '.
    TRANSLATE newfilenameonly USING '| '.
    TRANSLATE newfilenamewithpath USING '| '.
    CONDENSE newfilenameonly NO-GAPS.
    CONDENSE newfilenamewithpath NO-GAPS.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  CONVERTDDTOHTML
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_<WADICTIONARY>_ISTRUCTURE[]  text
*      -->P_IHTMLTABLE[]  text
*      -->P_<WADICTIONARY>_TABLENAME  text
*      -->P_<WADICTIONARY>_TABLETITLE  text
*      -->P_SORTTABLESASC  text
*      -->P_ADDBACKGROUND  text
*----------------------------------------------------------------------*
FORM convertddtohtml USING ilocdictstructure LIKE dumidictstructure[]
                           ilochtml LIKE dumihtml[]
                           VALUE(tablename)
                           VALUE(tabletitle)
                           VALUE(sorttablesasc)
                           VALUE(addbackground) TYPE abap_bool..

  DATA: icolumncaptions TYPE STANDARD TABLE OF string WITH HEADER LINE.
  DATA: wadictionary TYPE tdicttablestructure.
  DATA: wahtml TYPE string.
  DATA: title TYPE string.
  FIELD-SYMBOLS: <ilocdictstructure> TYPE tdicttablestructure.
* Holds one cell from the internal table
  FIELD-SYMBOLS: <fsfield>.
* The value of one cell form the internal table
  DATA: wtextcell TYPE string.
  DATA: rowcounter(3).
* The base type of the field we are reading
  DATA: wfieldbasetype.

  PERFORM buildddcolumnheaders USING icolumncaptions[].

* Add a html header to the table
  CONCATENATE 'Dictionary object-' tablename INTO title SEPARATED BY space.
  PERFORM addhtmlheader USING ilochtml[]
                              title
                              addbackground
                              ss_table.

  APPEND `<body>` TO ilochtml.

* new inclusion - start
  APPEND `<body bgcolor=#1C2228>` TO ilochtml.
* new inclusion - end

  APPEND `  <table class="outerTable">` TO ilochtml.
  APPEND `    <tr>` TO ilochtml.

* To get correct delivery class for a table
  SELECT SINGLE tabname, tabclass, contflag FROM dd02l
    INTO (@DATA(lv_tname), @DATA(lv_tabclass), @DATA(lv_contflag))
  WHERE tabname EQ @gv_tablename.
  IF sy-subrc EQ 0.

*TRANSP	Transparent table
*INTTAB	Structure
*CLUSTER  Cluster table
*POOL	Pooled table
*VIEW	General view structure
*APPEND	Append structure

    CASE lv_tabclass.
      WHEN 'TRANSP'.

        CONCATENATE `      <td><h2><span style="color: #50FA7B"> Table : ` tablename '</span></h2>' INTO wahtml.
        APPEND wahtml TO ilochtml.

      WHEN 'APPEND'.

        CONCATENATE `      <td><h2><span style="color: #50FA7B"> Append Structure : ` tablename '</span></h2>' INTO wahtml.
        APPEND wahtml TO ilochtml.

      WHEN 'INTTAB'.

        CONCATENATE `      <td><h2><span style="color: #50FA7B"> Structure : ` tablename '</span></h2>' INTO wahtml.
        APPEND wahtml TO ilochtml.

    ENDCASE.

  ELSE.

    CONCATENATE `      <td><h2>Table: ` tablename '</h2>' INTO wahtml.
    APPEND wahtml TO ilochtml.

  ENDIF.

  CONCATENATE `  <h3>Description: ` tabletitle '</h3></td>' INTO wahtml.
  APPEND wahtml TO ilochtml.
  APPEND `    </tr>` TO ilochtml.

  APPEND `    <tr>` TO ilochtml.
  APPEND `      <td><!--This is where our main table begins  -->` TO ilochtml.
  APPEND `<table class="innerTable">` TO ilochtml.

* Do we need to sort the fields into alphabetical order
  IF NOT sorttablesasc IS INITIAL.
    SORT ilocdictstructure ASCENDING BY fieldname.
  ENDIF.

* This is where the header fields are defined
* new inclusion - start
*        APPEND `<tr>` TO ilochtml.
  APPEND `<tr class="header">` TO ilochtml.
* new inclusion - end
  LOOP AT icolumncaptions.
    CONCATENATE `  <th>` icolumncaptions `</th>` INTO wahtml.
    APPEND wahtml TO ilochtml.
  ENDLOOP.
  APPEND `</tr>` TO ilochtml.

* Add the table cells here
  LOOP AT ilocdictstructure ASSIGNING <ilocdictstructure>.
    APPEND `<tr class="cell">` TO ilochtml.
    rowcounter = rowcounter + 1.
    CONCATENATE `  <td>` rowcounter `</td>` INTO wahtml.
    APPEND wahtml TO ilochtml.

    DO.
*     Assign each field in the table to the field symbol
      ASSIGN COMPONENT sy-index OF STRUCTURE <ilocdictstructure> TO <fsfield>.
      IF sy-subrc = 0.
        DESCRIBE FIELD <fsfield> TYPE wfieldbasetype.
        IF wfieldbasetype <> 'h'.
          MOVE <fsfield> TO wtextcell.
          wahtml = `  <td>`.

*         Add the caption name
          IF wtextcell IS INITIAL.
            CONCATENATE wahtml '&nbsp;' '</td>' INTO wahtml.
          ELSE.
            CONCATENATE wahtml wtextcell '</td>' INTO wahtml.
          ENDIF.

          APPEND wahtml TO ilochtml.
          CLEAR wahtml.
        ENDIF.
      ELSE.
        EXIT.
      ENDIF.
    ENDDO.

    APPEND `</tr>` TO ilochtml.
  ENDLOOP.

  APPEND `      </table>` TO ilochtml.
  APPEND `     </td>` TO ilochtml.
  APPEND `   </tr>` TO ilochtml.
  APPEND '<br/>' TO ilochtml.

* Add in any domain entries
  PERFORM adddomaintohtml USING ilocdictstructure[]
                                ilochtml[].


  DO 3 TIMES.
* Direct data type
    IF sy-index EQ 1.
      gv_flag = 'DDT'.
** Add Table definition code for ABAP cloud
* Direct Data type
      PERFORM addtabledefinition_doma USING ilocdictstructure[]
                                      ilochtml[].
    ENDIF.

* Data element with foreign key
    IF sy-index EQ 2.
      gv_flag = 'DEWFK'.
** Add Table definition code for ABAP cloud
* Data elements with foreign key
      PERFORM addtabledefinition_doma USING ilocdictstructure[]
                                      ilochtml[].
    ENDIF.

* Data element without foreign key
    IF sy-index EQ 3.
      gv_flag = 'DEWOFK'.
** Add Table definition code for ABAP cloud
* Data elements without foreign key
      PERFORM addtabledefinition_doma USING ilocdictstructure[]
                                      ilochtml[].
    ENDIF.
  ENDDO.
  CLEAR gv_flag.

* Add a html footer to the table
  PERFORM addhtmlfooter USING ilochtml[].
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  ADDDOMAINTOHTML
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ILOCDICTSTRUCTURE[]  text
*      -->P_ILOCHTML[]  text
*----------------------------------------------------------------------*
FORM adddomaintohtml USING ilocdictstructure LIKE dumidictstructure[]
                           ilochtml LIKE dumihtml[].

  DATA: icolumncaptions TYPE STANDARD TABLE OF string WITH HEADER LINE.
  DATA: wadictionary TYPE tdicttablestructure.
  DATA: wahtml TYPE string.
  DATA: title TYPE string.
  FIELD-SYMBOLS: <ilocdictstructure> TYPE tdicttablestructure.
  DATA: idomstructure TYPE STANDARD TABLE OF tdomainstructure WITH HEADER LINE.
* Holds one cell from the internal table
  FIELD-SYMBOLS: <fsfield>.
* The value of one cell form the internal table
  DATA: wtextcell TYPE string.
  DATA: rowcounter(3).
* The base type of the field we are reading
  DATA: wfieldbasetype.
  DATA: addedheader TYPE flag VALUE ''.

  PERFORM builddomcolumnheaders USING icolumncaptions[].

* Add the table cells here
  LOOP AT ilocdictstructure ASSIGNING <ilocdictstructure>.
    LOOP AT <ilocdictstructure>-idomains INTO idomstructure.
*     OK, lets add the header since we know we have some domain texrt to add.
      IF addedheader = ''.
        APPEND `  <table class="outerTable">` TO ilochtml.
        APPEND `    <tr>` TO ilochtml.
        CONCATENATE `      <td><h2>Fixed Domain Values ` '</h2>' INTO wahtml.
        APPEND wahtml TO ilochtml.
        APPEND `    </tr>` TO ilochtml.

        APPEND `    <tr>` TO ilochtml.
        APPEND `      <td><!--This is where our main table begins  -->` TO ilochtml.
        APPEND `<table class="innerTable">` TO ilochtml.

*       This is where the header fields are defined
* new inclusion - start
*        APPEND `<tr>` TO ilochtml.
        APPEND `<tr class="header">` TO ilochtml.
* new inclusion - end
        LOOP AT icolumncaptions.
          CONCATENATE `  <th>` icolumncaptions `</th>` INTO wahtml.
          APPEND wahtml TO ilochtml.
        ENDLOOP.
        APPEND `</tr>` TO ilochtml.
        addedheader = 'X'.
      ENDIF.

      APPEND `<tr class="cell">` TO ilochtml.
      DO.
*       Assign each field in the table to the field symbol
        ASSIGN COMPONENT sy-index OF STRUCTURE idomstructure TO <fsfield>.
        IF sy-subrc = 0.
          DESCRIBE FIELD <fsfield> TYPE wfieldbasetype.
          IF wfieldbasetype <> 'h'.
            MOVE <fsfield> TO wtextcell.
            wahtml = `  <td>`.

*           Add the caption name
            IF wtextcell IS INITIAL.
              CONCATENATE wahtml '&nbsp;' '</td>' INTO wahtml.
            ELSE.
              CONCATENATE wahtml wtextcell '</td>' INTO wahtml.
            ENDIF.

            APPEND wahtml TO ilochtml.
            CLEAR wahtml.
          ENDIF.
        ELSE.
          EXIT.
        ENDIF.
      ENDDO.

      APPEND `</tr>` TO ilochtml.
    ENDLOOP.
  ENDLOOP.

  IF addedheader = 'X'.
    APPEND `      </table>` TO ilochtml.
    APPEND `     </td>` TO ilochtml.
    APPEND `   </tr>` TO ilochtml.
  ENDIF.
ENDFORM.                    "addDomaintoHTML
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
*&      Form  ADDHTMLHEADER
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ILOCHTML[]  text
*      -->P_TITLE  text
*      -->P_ADDBACKGROUND  text
*      -->P_SS_TABLE  text
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
*&      Form  BUILDDDCOLUMNHEADERS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ICOLUMNCAPTIONS[]  text
*----------------------------------------------------------------------*
FORM builddomcolumnheaders USING iloccolumncaptions LIKE dumihtml[].

  APPEND 'Domain Name' TO iloccolumncaptions.
  APPEND 'Value Low' TO iloccolumncaptions.
  APPEND 'Value High' TO iloccolumncaptions.
  APPEND 'Text' TO iloccolumncaptions.

ENDFORM.                    "buildDomColumnHeaders
*&---------------------------------------------------------------------*
*&      Form  BUILDDDCOLUMNHEADERS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ICOLUMNCAPTIONS[]  text
*----------------------------------------------------------------------*
*----------------------------------------------------------------------------------------------------------------------
*  buildColumnHeaders... build table column names
*----------------------------------------------------------------------------------------------------------------------
FORM buildddcolumnheaders USING iloccolumncaptions LIKE dumihtml[].

  APPEND 'Row' TO iloccolumncaptions.
  APPEND 'Field name' TO iloccolumncaptions.
  APPEND 'Position' TO iloccolumncaptions.
  APPEND 'Key' TO iloccolumncaptions.
  APPEND 'Data element' TO iloccolumncaptions.
  APPEND 'Domain' TO iloccolumncaptions.
  APPEND 'Datatype' TO iloccolumncaptions.
  APPEND 'Length' TO iloccolumncaptions.

* new inclusion - start
  APPEND 'Decimals' TO iloccolumncaptions.
  APPEND 'Ref-table' TO iloccolumncaptions.
  APPEND 'Ref-Field' TO iloccolumncaptions.
* new inclusion - end

  APPEND 'Lowercase' TO iloccolumncaptions.
  APPEND 'Domain text' TO iloccolumncaptions.

ENDFORM.

*----------------------------------------------------------------------------------------------------------------------
*  buildColumnHeadersTableTypes
*----------------------------------------------------------------------------------------------------------------------
FORM buildcolumnheaderstabletypes  USING iloccolumncaptions LIKE dumihtml[].

  APPEND 'Row' TO iloccolumncaptions.
  APPEND 'Name of table type' TO iloccolumncaptions.
  APPEND 'Name of row type for table types' TO iloccolumncaptions.
  APPEND 'Category of table type (range or general table type)' TO iloccolumncaptions.
  APPEND 'Elem. type of LOW and HIGH components of a Ranges type' TO iloccolumncaptions.
  APPEND 'Type of Object Referenced' TO iloccolumncaptions.
  APPEND 'Initial Line Number for Table Types' TO iloccolumncaptions.
  APPEND 'Description' TO iloccolumncaptions.

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
*&---------------------------------------------------------------------*
*-------------------------------------------------------------------------------------------------------
*  saveFileToPc...    write an internal table to a file on the local PC
*-------------------------------------------------------------------------------------------------------
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
ENDFORM.                                                                                                  "saveFileToPc
*&---------------------------------------------------------------------*
*&      Form  ADDTABLEDEFINITION_DOMA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ILOCDICTSTRUCTURE[]  text
*      -->P_ILOCHTML[]  text
*----------------------------------------------------------------------*
FORM addtabledefinition_doma  USING    ilocdictstructure LIKE dumidictstructure[]
                                       ilochtml LIKE dumihtml[].

  DATA : wa_dictstructure LIKE LINE OF ilocdictstructure.
  DATA : htmltable TYPE STANDARD TABLE OF string WITH HEADER LINE.
  DATA : gv_max_length TYPE i.

  DATA : pree_space  TYPE string,
         post_space  TYPE string,
         line_holder TYPE string.

  TYPES : BEGIN OF lty_fields_seg,
            tab_lines TYPE string,
          END OF lty_fields_seg.

  TYPES : BEGIN OF lty_forkey_holder,
            fieldname TYPE fieldname,
            istruct   TYPE lty_fields_seg OCCURS 0,
          END OF lty_forkey_holder.

  DATA lt_dd05m TYPE STANDARD TABLE OF dd05m.
  DATA lt_page_line TYPE STANDARD TABLE OF string WITH HEADER LINE.

  DATA lt_forkey_holder TYPE STANDARD TABLE OF lty_forkey_holder.
  DATA ls_forkey_holder TYPE lty_forkey_holder.

  DATA lt_fields_seg TYPE STANDARD TABLE OF lty_fields_seg.
  DATA ls_fields_seg TYPE lty_fields_seg.

  DATA lv_decimal TYPE char6.

* Code block layout definition
  APPEND '<table class="outerTable">' TO htmltable.
  APPEND `  <tr class="normalBoldLarge">` TO htmltable.

* To get correct delivery class for a table
  SELECT SINGLE tabname, tabclass, contflag FROM dd02l
    INTO (@DATA(lv_tname), @DATA(lv_tabclass), @DATA(lv_contflag))
  WHERE tabname EQ @gv_tablename.
  IF sy-subrc EQ 0.
    IF lv_tabclass EQ 'INTTAB'
      OR lv_tabclass EQ 'APPEND'.

*TRANSP	Transparent table
*INTTAB	Structure
*CLUSTER  Cluster table
*POOL	Pooled table
*VIEW	General view structure
*APPEND	Append structure

* Definetley a structure - Then change the definition type.
      DATA(gv_struct_flag) = 'X'.
    ENDIF.
  ENDIF.

** Heading to table definition block not required
  IF gv_struct_flag NE 'X'.

    IF gv_flag EQ 'DDT'.
      APPEND `<h3> <span style="color: yellow"> Table definition </span> with <span style="color: yellow">  data types </span> </h3> </td>` TO htmltable.
      APPEND `   </tr>` TO htmltable.
    ENDIF.

    IF gv_flag EQ 'DEWFK'.
      APPEND `<h3> <span style="color: yellow"> Table definition </span> using data element <span style="color: yellow"> with foreign key </span> </h3> </td>` TO htmltable.
      APPEND `   </tr>` TO htmltable.
    ENDIF.

    IF gv_flag EQ 'DEWOFK'.
      APPEND `<h3> <span style="color: yellow"> Table definition </span> using data element <span style="color: yellow"> without foreign key </span> </h3> </td>` TO htmltable.
      APPEND `   </tr>` TO htmltable.
    ENDIF.

  ELSE.

*    IF gv_flag EQ 'DDT'.
*      APPEND `<h3> Structure definition with data types </h3> </td>` TO htmltable.
*      APPEND `   </tr>` TO htmltable.
*    ENDIF.
*
*    IF gv_flag EQ 'DEWFK'.
*      APPEND `<h3> Structure definition using data element with foreign key </h3> </td>` TO htmltable.
*      APPEND `   </tr>` TO htmltable.
*    ENDIF.
*
*    IF gv_flag EQ 'DEWOFK'.
*      APPEND `<h3> Structure definition using data element without foreign key </h3> </td>` TO htmltable.
*      APPEND `   </tr>` TO htmltable.
*    ENDIF.

    IF gv_flag EQ 'DDT'.
      APPEND `<h3> <span style="color: yellow"> Structure definition </span> with <span style="color: yellow">  data types </span> </h3> </td>` TO htmltable.
      APPEND `   </tr>` TO htmltable.
    ENDIF.

    IF gv_flag EQ 'DEWFK'.
      APPEND `<h3> <span style="color: yellow"> Structure definition </span> using data element <span style="color: yellow"> with foreign key </span> </h3> </td>` TO htmltable.
      APPEND `   </tr>` TO htmltable.
    ENDIF.

    IF gv_flag EQ 'DEWOFK'.
      APPEND `<h3> <span style="color: yellow"> Structure definition </span> using data element <span style="color: yellow"> without foreign key </span> </h3> </td>` TO htmltable.
      APPEND `   </tr>` TO htmltable.
    ENDIF.

  ENDIF.

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
  CONCATENATE ` @EndUserText.label : '` gv_description `' <br /> ` INTO htmltable.
  APPEND htmltable.

  IF gv_struct_flag NE 'X'.
* TABLE ANNOTATIONS

    APPEND ` @AbapCatalog.enhancement.category : #EXTENSIBLE_ANY <br /> ` TO htmltable.
    APPEND ` @AbapCatalog.tableCategory : #TRANSPARENT <br /> ` TO htmltable.

    IF lv_contflag IS NOT INITIAL.
      CASE  lv_contflag.
        WHEN 'A'.
          APPEND ` @AbapCatalog.deliveryClass : #A <br />` TO htmltable.
        WHEN 'C'.
          APPEND ` @AbapCatalog.deliveryClass : #C <br />` TO htmltable.
        WHEN 'L'.
          APPEND ` @AbapCatalog.deliveryClass : #L <br />` TO htmltable.
        WHEN 'G'.
          APPEND ` @AbapCatalog.deliveryClass : #G <br />` TO htmltable.
        WHEN 'E'.
          APPEND ` @AbapCatalog.deliveryClass : #E <br />` TO htmltable.
        WHEN 'S'.
          APPEND ` @AbapCatalog.deliveryClass : #S <br />` TO htmltable.
        WHEN 'W'.
          APPEND ` @AbapCatalog.deliveryClass : #W <br />` TO htmltable.
      ENDCASE.

    ELSE.
      APPEND ` @AbapCatalog.deliveryClass : #A <br />` TO htmltable.
    ENDIF.

    APPEND ` @AbapCatalog.dataMaintenance : #RESTRICTED <br /> ` TO htmltable.

    DATA(lv_tablename) = gv_tablename.
    TRANSLATE lv_tablename TO LOWER CASE.

* insert - 2-start
    APPEND `</div>` TO htmltable.
    APPEND `   <div class="code">` TO htmltable.
    APPEND '<br />' TO htmltable.
* insert - 2-end

    CONCATENATE ` define table ` lv_tablename ` { <br /> ` INTO htmltable.
    APPEND htmltable.

  ELSE.
* Structure annotations
    APPEND ` @AbapCatalog.enhancement.category : #EXTENSIBLE_ANY <br /> ` TO htmltable.

    lv_tablename = gv_tablename.
    TRANSLATE lv_tablename TO LOWER CASE.

* insert - 2-start
    APPEND `</div>` TO htmltable.
    APPEND `   <div class="code">` TO htmltable.
    APPEND '<br />' TO htmltable.
* insert - 2-end

    CONCATENATE ` define structure ` lv_tablename ` { <br /> ` INTO htmltable.
    APPEND htmltable.

  ENDIF.

* Line space after Table / Structure start
  APPEND ` <br /> ` TO htmltable.

  MOVE-CORRESPONDING ilocdictstructure TO lt_tdict_length.

* TO identify the longest Fieldname in table structure.
  LOOP AT lt_tdict_length ASSIGNING <gfs_tdict_length>.
    <gfs_tdict_length>-length = strlen( <gfs_tdict_length>-fieldname ).
    <gfs_tdict_length>-position2 = <gfs_tdict_length>-position.
  ENDLOOP.

  SORT lt_tdict_length BY length DESCENDING.

  READ TABLE lt_tdict_length INTO DATA(ls_wa) INDEX 1.
  IF sy-subrc EQ 0.
    gv_max_length = ls_wa-length.
  ENDIF.

  SORT lt_tdict_length BY position2 DESCENDING.
  READ TABLE lt_tdict_length INTO ls_wa INDEX 1.
  IF sy-subrc EQ 0.
* Back up of last record for structure closing - line spacing check
    DATA(ls_last_line_bkup) = ls_wa.
  ENDIF.

  SORT lt_tdict_length BY position2 ASCENDING.

  LOOP AT lt_tdict_length ASSIGNING <gfs_tdict_length>.
    <gfs_tdict_length>-differ = gv_max_length - <gfs_tdict_length>-length.
  ENDLOOP.

* Non-breaking space based on different section.
  DATA(lv_foreign_key) = '&nbsp;&nbsp;&nbsp;&nbsp;'.
  DATA(lv_where)       = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.
  DATA(lv_and)         = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.
  DATA(lv_code_pre)    = '&nbsp;&nbsp;'.

* Annotations for specific data types
  DATA(anno_sema_curr) = lv_code_pre && '@Semantics.amount.currencyCode&nbsp;:&nbsp;'.
  DATA(anno_sema_quan) = lv_code_pre && '@Semantics.quantity.unitOfMeasure&nbsp;:&nbsp;'.
  DATA(anno_sema_lang) = lv_code_pre && '@AbapCatalog.textLanguage <br />'.
  DATA(anno_fkey_labl) = lv_code_pre && '@AbapCatalog.foreignKey.label :'.
  DATA(anno_fkey_kty1) = lv_code_pre && '@AbapCatalog.foreignKey.keyType : #KEY <br />'.
  DATA(anno_fkey_kty2) = lv_code_pre && '@AbapCatalog.foreignKey.keyType : #NON_KEY <br />'.
  DATA(anno_fkey_kty3) = lv_code_pre && '@AbapCatalog.foreignKey.keyType : #TEXT_KEY <br />'.
  DATA(anno_fkey_chck) = lv_code_pre && '@AbapCatalog.foreignKey.screenCheck : true <br />'.
  DATA(anno_eusr_labl) = lv_code_pre && '@EndUserText.label : '. " Annotation Used for direct data types only

* Foreign key data retrieval
*** Foreign key details can be acquired from followign FM - to build foregin key relation based Table definition -

  IF gv_flag EQ 'DEWFK'.

    CALL FUNCTION 'DDIF_TABL_GET'
      EXPORTING
        name          = gv_tablename
        state         = 'A'
      TABLES
        dd05m_tab     = lt_dd05m
      EXCEPTIONS
        illegal_input = 1
        OTHERS        = 2.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

    IF lt_dd05m IS NOT INITIAL.
* Foreign key derivation for later use

      DATA(lt_dd05m_t) = lt_dd05m.
      DATA(lt_dd05m_2) = lt_dd05m.
      CLEAR lt_dd05m_2.

      DELETE ADJACENT DUPLICATES FROM lt_dd05m_t COMPARING fieldname.

      LOOP AT lt_tdict_length ASSIGNING <gfs_tdict_length>.
        READ TABLE lt_dd05m_t INTO DATA(ls_dd05m) WITH KEY fieldname = <gfs_tdict_length>-fieldname.
        IF sy-subrc EQ 0.
          <gfs_tdict_length>-fkey = 'X'.
        ENDIF.
      ENDLOOP.

*      LOOP AT lt_dd05m_t INTO DATA(ls_dd05m).
      LOOP AT lt_dd05m_t INTO ls_dd05m.

        TRANSLATE ls_dd05m-checktable TO LOWER CASE.
        TRANSLATE ls_dd05m-checkfield TO LOWER CASE.
        TRANSLATE ls_dd05m-fortable TO LOWER CASE.
        TRANSLATE ls_dd05m-forkey TO LOWER CASE.

        lt_dd05m_2 = VALUE #( FOR ls_wa1 IN lt_dd05m WHERE ( fieldname EQ ls_dd05m-fieldname ) ( ls_wa1 ) ).
        IF lt_dd05m_2 IS NOT INITIAL.
          DESCRIBE TABLE lt_dd05m_2 LINES DATA(lv_lines).

* FOREIGN KEY LINE
          CONCATENATE lv_foreign_key 'with foreign key' '&nbsp;' ls_dd05m-checktable '<br />' INTO lt_page_line.
          APPEND lt_page_line.

          IF lv_lines EQ 1.
* ONLY WHERE CLAUSE LINE
            CONCATENATE lv_where 'where' '&nbsp;' ls_dd05m-checkfield '&nbsp;=&nbsp;' ls_dd05m-fortable '.' ls_dd05m-forkey ';' '<br />' INTO lt_page_line.
            APPEND lt_page_line.

            IF lt_page_line IS NOT INITIAL.

              LOOP AT lt_page_line INTO DATA(ls_page_line).
                ls_fields_seg-tab_lines = ls_page_line.
                APPEND ls_fields_seg TO lt_fields_seg.
                CLEAR : ls_page_line, ls_fields_seg.
              ENDLOOP.

              ls_forkey_holder-fieldname = ls_dd05m-fieldname.
              ls_forkey_holder-istruct[] = lt_fields_seg[].

              APPEND ls_forkey_holder TO lt_forkey_holder.
              CLEAR : ls_forkey_holder, lt_fields_seg.
              REFRESH lt_page_line.
            ENDIF.

          ENDIF.

          IF lv_lines EQ 2.
* WHERE CLAUSE LINE
            CONCATENATE lv_where 'where' '&nbsp;' ls_dd05m-checkfield '&nbsp;=&nbsp;' ls_dd05m-fortable '.' ls_dd05m-forkey '<br />' INTO lt_page_line.
            APPEND lt_page_line.

* AND CONDITION
            READ TABLE lt_dd05m_2 INTO DATA(wa_dd05m) INDEX 2.

            TRANSLATE wa_dd05m-checkfield TO LOWER CASE.
            TRANSLATE wa_dd05m-fortable TO LOWER CASE.
            TRANSLATE wa_dd05m-forkey TO LOWER CASE.

            CONCATENATE lv_and 'and' '&nbsp;' wa_dd05m-checkfield '&nbsp;=&nbsp;' wa_dd05m-fortable '.' wa_dd05m-forkey ';' '<br />' INTO lt_page_line.
            APPEND lt_page_line.

            IF lt_page_line IS NOT INITIAL.

              LOOP AT lt_page_line INTO ls_page_line.
                ls_fields_seg-tab_lines = ls_page_line.
                APPEND ls_fields_seg TO lt_fields_seg.
                CLEAR : ls_page_line, ls_fields_seg.
              ENDLOOP.

              ls_forkey_holder-fieldname = ls_dd05m-fieldname.
              ls_forkey_holder-istruct[] = lt_fields_seg[].

              APPEND ls_forkey_holder TO lt_forkey_holder.
              CLEAR : ls_forkey_holder, lt_fields_seg.
              REFRESH lt_page_line.
            ENDIF.

          ELSEIF lv_lines GT 2.

            DO lv_lines TIMES.

              DATA(lv_index) = sy-index.
              IF sy-index EQ 1.

* WHERE CLAUSE LINE
                CONCATENATE lv_where 'where' '&nbsp;' ls_dd05m-checkfield '&nbsp;=&nbsp;' ls_dd05m-fortable '.' ls_dd05m-forkey '<br />' INTO lt_page_line.
                APPEND lt_page_line.

              ELSE.
* AND CONDITION
                CLEAR wa_dd05m.
                READ TABLE lt_dd05m_2 INTO wa_dd05m INDEX lv_index.

                IF lv_lines EQ lv_index.

                  TRANSLATE wa_dd05m-checkfield TO LOWER CASE.
                  TRANSLATE wa_dd05m-fortable TO LOWER CASE.
                  TRANSLATE wa_dd05m-forkey TO LOWER CASE.

                  CONCATENATE lv_and 'and' '&nbsp;' wa_dd05m-checkfield '&nbsp;=&nbsp;' wa_dd05m-fortable '.' wa_dd05m-forkey ';' '<br />' INTO lt_page_line.
                  APPEND lt_page_line.

                ELSE.

                  CONCATENATE lv_and 'and' '&nbsp;' wa_dd05m-checkfield '&nbsp;=&nbsp;' wa_dd05m-fortable '.' wa_dd05m-forkey '<br />' INTO lt_page_line.
                  APPEND lt_page_line.

                ENDIF.
              ENDIF.

            ENDDO.

            IF lt_page_line IS NOT INITIAL.

              LOOP AT lt_page_line INTO ls_page_line.
                ls_fields_seg-tab_lines = ls_page_line.
                APPEND ls_fields_seg TO lt_fields_seg.
                CLEAR : ls_page_line, ls_fields_seg.
              ENDLOOP.

              ls_forkey_holder-fieldname = ls_dd05m-fieldname.
              ls_forkey_holder-istruct[] = lt_fields_seg[].

              APPEND ls_forkey_holder TO lt_forkey_holder.
              CLEAR : ls_forkey_holder, lt_fields_seg.
              REFRESH lt_page_line.
            ENDIF.

          ENDIF.
        ENDIF.

        CLEAR ls_dd05m.
      ENDLOOP.
    ENDIF.
  ENDIF.

* Table structure preparation begins
  LOOP AT lt_tdict_length INTO DATA(wa_tdict_struct).

    IF  wa_tdict_struct-keyflag EQ 'X'.

* 3 charcter space in 'Key' keyword
* 1 charcter space for spacing
* total 4 charcter spacing required to be reduced
* from difference for good alignment for KEY fields

      SUBTRACT 4 FROM wa_tdict_struct-differ.

      DO wa_tdict_struct-differ TIMES.
        CONCATENATE '&nbsp;' post_space INTO post_space.
      ENDDO.

    ELSE.
      DO wa_tdict_struct-differ TIMES.
        CONCATENATE '&nbsp;' post_space INTO post_space.
      ENDDO.
    ENDIF.

    CONDENSE post_space.

    IF gv_flag EQ 'DEWFK'.
      IF sy-tabix EQ 1.
        IF wa_tdict_struct-keyflag EQ 'X'.
* insert - 2-start
          APPEND `</div>` TO htmltable.
          APPEND `   <div class="codeComment">` TO htmltable.
* insert - 2-end
* Key field annotation
          APPEND anno_fkey_chck TO htmltable.
* insert - 2-start
          APPEND `</div>` TO htmltable.
          APPEND `   <div class="code">` TO htmltable.
* insert - 2-end
        ENDIF.
      ELSE.
        IF wa_tdict_struct-fkey EQ 'X'.
* Line spacing for readability in the output.
          APPEND ' <br /> ' TO htmltable.
* insert - 2-start
          APPEND `</div>` TO htmltable.
          APPEND `   <div class="codeComment">` TO htmltable.
* insert - 2-end
* Key field type annotation
          APPEND anno_fkey_kty2 TO htmltable.
* Key field annotation
          APPEND anno_fkey_chck TO htmltable.
* insert - 2-start
          APPEND `</div>` TO htmltable.
          APPEND `   <div class="code">` TO htmltable.
* insert - 2-end
        ENDIF.
      ENDIF.
    ENDIF.

* Currency , Quantity and Text - Annotations
    TRANSLATE wa_tdict_struct-reftable TO LOWER CASE.
    TRANSLATE wa_tdict_struct-reffield TO LOWER CASE.

    IF wa_tdict_struct-datatype EQ 'curr' OR wa_tdict_struct-datatype EQ 'CURR'.
* Line space after field definition flag
      DATA(gv_line_space) = 'X'.

      IF gv_flag NE 'DDT'.
* Line spacing for readability in the output.
        APPEND ' <br /> ' TO htmltable.
      ENDIF.

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

      IF gv_flag NE 'DDT'.
* Line spacing for readability in the output.
        APPEND ' <br /> ' TO htmltable.
      ENDIF.

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

      IF gv_flag NE 'DDT'.
* Line spacing for readability in the output.
        APPEND ' <br /> ' TO htmltable.
      ENDIF.

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
    TRANSLATE wa_tdict_struct-rollname TO LOWER CASE.

* Type 1 - Direct Data type
    IF gv_flag EQ 'DDT'.

      CLEAR : pree_space.
      pree_space = lv_code_pre.

      IF wa_tdict_struct-ddtext IS INITIAL.
        REPLACE ALL OCCURRENCES OF '_' IN wa_tdict_struct-fieldname WITH ` `.
        TRANSLATE wa_tdict_struct-fieldname TO LOWER CASE.
        wa_tdict_struct-ddtext = wa_tdict_struct-fieldname.
      ENDIF.

*      CONCATENATE anno_eusr_labl `&nbsp;'` wa_tdict_struct-ddtext `'<br />` INTO htmltable.

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

      IF wa_tdict_struct-keyflag EQ 'X'.

        CONCATENATE pree_space 'key' '&nbsp;' lv_fieldname post_space '&nbsp;' ':' '&nbsp;' INTO line_holder.
        IF wa_tdict_struct-decimals IS INITIAL.
          CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng ')' '&nbsp;' 'not null; <br />' INTO htmltable.
        ELSE.
          CLEAR lv_decimal.
          lv_decimal = wa_tdict_struct-decimals.
          PERFORM removeleadingzeros CHANGING lv_decimal.
          CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng ',' lv_decimal ')' '&nbsp;' 'not null; <br />' INTO htmltable.
        ENDIF.

      ELSE.

        CONCATENATE pree_space lv_fieldname post_space '&nbsp;' ':' '&nbsp;' INTO line_holder.
        IF wa_tdict_struct-decimals IS INITIAL.
          CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng '); <br />' INTO htmltable.
        ELSE.
          CLEAR lv_decimal.
          lv_decimal = wa_tdict_struct-decimals.
          PERFORM removeleadingzeros CHANGING lv_decimal.
          CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng ',' lv_decimal ')' '&nbsp;' '; <br />' INTO htmltable.
        ENDIF.

      ENDIF.

      APPEND htmltable.
      CLEAR htmltable.

      IF gv_line_space NE 'X'.
        APPEND '<br />' TO htmltable.
        CLEAR htmltable.
      ENDIF.

    ENDIF.

    IF gv_flag EQ 'DEWFK'.
* Type 2 - Data element with foreign key
* need to do dataelement check first if it exist go for building with DE else build like data type

      CLEAR : pree_space.
      pree_space = lv_code_pre.

      IF wa_tdict_struct-rollname IS NOT INITIAL.

        IF wa_tdict_struct-keyflag EQ 'X'.
          CONCATENATE pree_space 'key' '&nbsp;' lv_fieldname post_space '&nbsp;' ':' '&nbsp;' INTO line_holder.
          CONCATENATE line_holder wa_tdict_struct-rollname '&nbsp;' 'not null; <br />' INTO htmltable.
          APPEND htmltable.
          CLEAR htmltable.
        ELSE.
          CONCATENATE pree_space lv_fieldname post_space '&nbsp;' ':' '&nbsp;' INTO line_holder.
          CONCATENATE line_holder wa_tdict_struct-rollname ';<br />' INTO htmltable.
          APPEND htmltable.
          CLEAR htmltable.
        ENDIF.

* Foreign Key check and conditions adding.
        CLEAR ls_forkey_holder.
        READ TABLE lt_forkey_holder INTO ls_forkey_holder
        WITH KEY fieldname = wa_tdict_struct-fieldname.
        IF sy-subrc EQ 0.

          LOOP AT ls_forkey_holder-istruct INTO DATA(ls_struct).
            APPEND ls_struct-tab_lines TO htmltable.
            CLEAR ls_struct.
          ENDLOOP.

* Line spacing for readability in the output.
          APPEND ' <br /> ' TO htmltable.

        ENDIF.

      ELSE.

* IN DATA ELEMENT SECTION SOME FIELDS WITH NO DATAELEMENT - SO DIRECT DATA TYPE ASSIGNEMNT

        IF wa_tdict_struct-ddtext IS INITIAL.
          REPLACE ALL OCCURRENCES OF '_' IN wa_tdict_struct-fieldname WITH ` `.
          TRANSLATE wa_tdict_struct-fieldname TO LOWER CASE.
          wa_tdict_struct-ddtext = wa_tdict_struct-fieldname.
        ENDIF.

* Line spacing for enduser annotation in this definition section
        APPEND '<br />' TO htmltable.
        CLEAR htmltable.

*        CONCATENATE anno_eusr_labl `&nbsp;'` wa_tdict_struct-ddtext `'<br />` INTO htmltable.

* insert - 2-start
        APPEND `</div>` TO htmltable.
        APPEND `   <div class="codeComment">` TO htmltable.
* insert - 2-end

        CONCATENATE anno_eusr_labl `&nbsp;'` wa_tdict_struct-ddtext `'<br />` INTO htmltable.

        DATA(gv_line_ddt) = 'X'.
        APPEND htmltable.
        CLEAR htmltable.

* insert - 2-start
        APPEND `</div>` TO htmltable.
        APPEND `   <div class="code">` TO htmltable.
* insert - 2-end

        IF wa_tdict_struct-keyflag EQ 'X'.

          CONCATENATE pree_space 'key' '&nbsp;' lv_fieldname post_space '&nbsp;' ':' '&nbsp;' INTO line_holder.
          IF wa_tdict_struct-decimals IS INITIAL.
            CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng ')' '&nbsp;' 'not null; <br />' INTO htmltable.
          ELSE.
            CLEAR lv_decimal.
            lv_decimal = wa_tdict_struct-decimals.
            PERFORM removeleadingzeros CHANGING lv_decimal.
            CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng ',' lv_decimal ')' '&nbsp;' 'not null; <br />' INTO htmltable.
          ENDIF.

        ELSE.

          CONCATENATE pree_space lv_fieldname post_space '&nbsp;' ':' '&nbsp;' INTO line_holder.
          IF wa_tdict_struct-decimals IS INITIAL.
            CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng '); <br />' INTO htmltable.
          ELSE.
            CLEAR lv_decimal.
            lv_decimal = wa_tdict_struct-decimals.
            PERFORM removeleadingzeros CHANGING lv_decimal.
            CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng ',' lv_decimal ')' '&nbsp;' '; <br />' INTO htmltable.
          ENDIF.

        ENDIF.

      ENDIF.

      APPEND htmltable.
      CLEAR htmltable.

      IF gv_line_ddt EQ 'X'.
        APPEND '<br />' TO htmltable.
        CLEAR htmltable.
        CLEAR gv_line_ddt.
      ENDIF.

    ENDIF.


    IF gv_flag EQ 'DEWOFK'.
* Type 3 - Data element without foreign key
* need to do dataelement check first if it exist go for building with DE else build like data type

      CLEAR : pree_space.
      pree_space = lv_code_pre.

      IF wa_tdict_struct-rollname IS NOT INITIAL.

        IF wa_tdict_struct-keyflag EQ 'X'.
          CONCATENATE pree_space 'key' '&nbsp;' lv_fieldname post_space '&nbsp;' ':' '&nbsp;' INTO line_holder.
          CONCATENATE line_holder wa_tdict_struct-rollname '&nbsp;' 'not null; <br />' INTO htmltable.
        ELSE.
          CONCATENATE pree_space lv_fieldname post_space '&nbsp;' ':' '&nbsp;' INTO line_holder.
          CONCATENATE line_holder wa_tdict_struct-rollname ';<br />' INTO htmltable.
        ENDIF.

      ELSE.

* IN DATA ELEMENT SECTION SOME FIELDS WITH NO DATAELEMENT - SO DIRECT DATA TYPE ASSIGNEMNT

        IF wa_tdict_struct-ddtext IS INITIAL.
          REPLACE ALL OCCURRENCES OF '_' IN wa_tdict_struct-fieldname WITH ` `.
          TRANSLATE wa_tdict_struct-fieldname TO LOWER CASE.
          wa_tdict_struct-ddtext = wa_tdict_struct-fieldname.
        ENDIF.

* Line spacing for enduser annotation in this definition section
        APPEND '<br />' TO htmltable.
        CLEAR htmltable.

* insert - 2-start
        APPEND `</div>` TO htmltable.
        APPEND `   <div class="codeComment">` TO htmltable.
* insert - 2-end

        CONCATENATE anno_eusr_labl `&nbsp;'` wa_tdict_struct-ddtext `'<br />` INTO htmltable.

        gv_line_ddt = 'X'.
        APPEND htmltable.
        CLEAR htmltable.

* insert - 2-start
        APPEND `</div>` TO htmltable.
        APPEND `   <div class="code">` TO htmltable.
* insert - 2-end

        IF wa_tdict_struct-keyflag EQ 'X'.

          CONCATENATE pree_space 'key' '&nbsp;' lv_fieldname post_space '&nbsp;' ':' '&nbsp;' INTO line_holder.
          IF wa_tdict_struct-decimals IS INITIAL.
            CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng ')' '&nbsp;' 'not null; <br />' INTO htmltable.
          ELSE.
            CLEAR lv_decimal.
            lv_decimal = wa_tdict_struct-decimals.
            PERFORM removeleadingzeros CHANGING lv_decimal.
            CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng ',' lv_decimal ')' '&nbsp;' 'not null; <br />' INTO htmltable.
          ENDIF.

        ELSE.

          CONCATENATE pree_space lv_fieldname post_space '&nbsp;' ':' '&nbsp;' INTO line_holder.
          IF wa_tdict_struct-decimals IS INITIAL.
            CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng '); <br />' INTO htmltable.
          ELSE.
            CLEAR lv_decimal.
            lv_decimal = wa_tdict_struct-decimals.
            PERFORM removeleadingzeros CHANGING lv_decimal.
            CONCATENATE line_holder 'abap.' wa_tdict_struct-datatype '(' wa_tdict_struct-leng ',' lv_decimal ')' '&nbsp;' '; <br />' INTO htmltable.
          ENDIF.

        ENDIF. " key flag check - direct data type

      ENDIF. " Data element check

      APPEND htmltable.
      CLEAR htmltable.

      IF gv_line_ddt EQ 'X'.
        APPEND '<br />' TO htmltable.
        CLEAR htmltable.
        CLEAR gv_line_ddt.
      ENDIF.
    ENDIF.

    IF gv_line_space EQ 'X'.
      APPEND ` <br /> ` TO htmltable.
      CLEAR gv_line_space.
    ENDIF.

    CLEAR : line_holder, wa_tdict_struct, post_space, pree_space.

  ENDLOOP.

  IF gv_flag EQ 'DEWFK'
    OR  gv_flag EQ 'DEWOFK'.
* if last field has data element then spacing is needed
* if last field has no DE then data type is used spacing is done already
    IF ls_last_line_bkup-rollname IS NOT INITIAL.
      APPEND ` <br /> ` TO htmltable.
    ENDIF.
  ENDIF.

  APPEND ` } <br /> ` TO htmltable.

  APPEND `            </div>` TO htmltable.
  APPEND `          </td>`  TO htmltable.
  APPEND `        </tr>` TO htmltable.
  APPEND `      </table>` TO htmltable.
  APPEND `      </td>` TO htmltable.
  APPEND `      </tr>` TO htmltable.

  APPEND LINES OF htmltable[] TO ilochtml[].

  CLEAR : gv_struct_flag , ls_last_line_bkup.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  PROCESS_JSON
*&---------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
FORM process_json  USING pv_table TYPE tabname.

*** --- Assigning fields symbols for Tables
  CREATE DATA lt_dref TYPE TABLE OF (pv_table).
  CREATE DATA ls_dref TYPE (pv_table).

*** --- Assign field symbol with table type of DDIC
  ASSIGN lt_dref->* TO <ft_table>.

*** --- Assign field symbol with Structure type of DDIC
  ASSIGN ls_dref->* TO <fs_table>.

  IF all_rec EQ abap_true.

    SELECT *
    FROM (pv_table)
    INTO TABLE <ft_table>.

  ELSEIF 50k_rec EQ abap_true.

    SELECT *
    FROM (pv_table)
    INTO TABLE <ft_table> UP TO 50000 ROWS.

  ELSEIF 25k_rec EQ abap_true.

    SELECT *
    FROM (pv_table)
    INTO TABLE <ft_table> UP TO 25000 ROWS.

  ELSEIF 10k_rec EQ abap_true.

    SELECT *
    FROM (pv_table)
    INTO TABLE <ft_table> UP TO 10000 ROWS.

  ELSEIF 5k_rec EQ abap_true.

    SELECT *
    FROM (pv_table)
    INTO TABLE <ft_table> UP TO 5000 ROWS.

  ENDIF.


  IF sy-subrc EQ 0.

    SELECT tabname, fieldname, position, datatype, leng FROM dd03l
    INTO TABLE @DATA(lt_dd03l) WHERE tabname EQ @pv_table.

    SORT lt_dd03l BY position ASCENDING. "Field order in the table

    DELETE lt_dd03l WHERE fieldname = '.INCLU--AP' " append structure
                       OR fieldname = '.INCLUDE'.  " include structure

    LOOP AT lt_dd03l ASSIGNING FIELD-SYMBOL(<lfs_dd03l>).
      <lfs_dd03l>-position = sy-tabix.
    ENDLOOP.

    DESCRIBE TABLE lt_dd03l LINES DATA(lv_lines).

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

    lv_filename = pv_table.


    CONCATENATE gv_path '\' lv_filename '.json' INTO lv_file.


    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename                = lv_file
        filetype                = 'ASC'
*       write_field_separator   = 'X'
        codepage                = '4310'
      TABLES
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
    IF sy-subrc IS NOT INITIAL.
* Implement suitable error handling here
      MESSAGE 'File Process Error' TYPE 'E'.
    ENDIF.
  ENDIF.

*  IF gv_flag_all EQ abap_true.
*    MESSAGE 'All Json file activities completed' TYPE 'I'.
*  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  PROCESS_TABD
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_WA_TAB_NAMES_TABNAME  text
*----------------------------------------------------------------------*
FORM process_tabd USING pv_table TYPE tabname.

*** --- Assigning fields symbols for Tables
  CREATE DATA lt_dref TYPE TABLE OF (pv_table).
  CREATE DATA ls_dref TYPE (pv_table).

*** --- Assign field symbol with table type of DDIC
  ASSIGN lt_dref->* TO <ft_table>.

*** --- Assign field symbol with Structure type of DDIC
  ASSIGN ls_dref->* TO <fs_table>.

  IF all_rec EQ abap_true.

    SELECT *
    FROM (pv_table)
    INTO TABLE <ft_table>.

  ELSEIF 50k_rec EQ abap_true.

    SELECT *
    FROM (pv_table)
    INTO TABLE <ft_table> UP TO 50000 ROWS.

  ELSEIF 25k_rec EQ abap_true.

    SELECT *
    FROM (pv_table)
    INTO TABLE <ft_table> UP TO 25000 ROWS.

  ELSEIF 10k_rec EQ abap_true.

    SELECT *
    FROM (pv_table)
    INTO TABLE <ft_table> UP TO 10000 ROWS.

  ELSEIF 5k_rec EQ abap_true.

    SELECT *
    FROM (pv_table)
    INTO TABLE <ft_table> UP TO 5000 ROWS.

  ENDIF.

  IF sy-subrc EQ 0.

    CONCATENATE gv_path '\' lv_filename '.txt' INTO lv_file.

    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename                = lv_file
        filetype                = 'DAT'
        write_field_separator   = 'X'
      TABLES
        data_tab                = <ft_table>
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
    IF sy-subrc IS NOT INITIAL.
* Implement suitable error handling here
      MESSAGE 'File Process Error' TYPE 'E'.
    ENDIF.
  ENDIF.

*  IF gv_flag_all EQ abap_true.
*    MESSAGE 'All Tab delimited file activities completed' TYPE 'I'.
*  ENDIF.

ENDFORM.
