*&H*********************************************************************
*&H      Developer     : Hamad Ahmad                                   *
*&H      Date          : 26.10.2021                                    *
*&H      Company       : Systems Limited                               *
*&P*********************************************************************
*&D             Report : ZFIND_CDS_VIEWS_AND_TABLES                    *
*&D             Tcode  : ZCDS                                          *
*&D Program Defination : Find the Views/CDS/Tables Store Multiple Field*
*&A*********************************************************************
*&A PROGRAM CHANGES / Modification Logs :                              *
*&A +-----------------------------------------------------------------+*
*&A I Date  I    Code          I Programmer    I     Changes          I*
*&A +-----------------------------------------------------------------+*
*&A         I                  I               I                       *
*&A*********************************************************************
* SAHK900100       HAMMAD     TR: For testing Abap Objects [HMD]
************************************************************************

report.

tables: dd04t,
        swwwihead,
        vbkpf,
        rbkp,
        cdhdr,
        cdpos,
        dd03l,
        dd41v,
        t685t,
        vbpa,
        tpart,
        konvc,
        boole,
        ekko.
data:dref type ref to data.
field-symbols:<table> type standard table.
type-pools: slis, icon.

* Internal Tables
types: begin of t_ialv,
         tabname    type dd03l-tabname,
         ddtext     type dd02t-ddtext,
         ddlname    type ddldependency-ddlname,
         objectname type ddldependency-objectname,
         tbtext     type ddddlsrct-ddtext,
         field1     type dd03l-fieldname,
         field2     type dd03l-fieldname,
         field3     type dd03l-fieldname,
         field4     type dd03l-fieldname,
       end of t_ialv .

data: ialv   type standard table of t_ialv,
      wa_alv type t_ialv.

data: alv_container type ref to cl_gui_custom_container,
      alv_grid      type ref to cl_gui_alv_grid,
      ok_code       like sy-ucomm,
      fieldcat      type slis_t_fieldcat_alv with header line.

***********SELECTION SCREEN*********************************
selection-screen begin of block bl with frame title title_1.


  selection-screen begin of line.
    selection-screen comment (15)  s_cds for field cds.
    parameters:
                    cds radiobutton group rdG1 default 'X'.
  selection-screen end of line.

  selection-screen begin of line.
    selection-screen comment (15)  s_Tab for field table.
    parameters:
                    table radiobutton group rdG1.
  selection-screen end of line.

selection-screen end of block bl.


selection-screen begin of block b2 with frame title title_2.

  selection-screen begin of line.

    selection-screen comment (11)  t_FIELD1 for field s_field1.

    select-options:

*                    s_field1 FOR dd03l-fieldname NO-EXTENSION NO INTERVALS DEFAULT 'EBELN' OBLIGATORY,
*                    s_field2 FOR dd03l-fieldname NO-EXTENSION NO INTERVALS DEFAULT 'EBELP' OBLIGATORY,
*                    s_field3 FOR dd03l-fieldname NO-EXTENSION NO INTERVALS DEFAULT 'BELNR',
*                    s_field4 FOR dd03l-fieldname NO-EXTENSION NO INTERVALS DEFAULT 'MATNR',

                    s_field1 for dd03l-fieldname no-extension no intervals  obligatory,
                    s_field2 for dd03l-fieldname no-extension no intervals ,
                    s_field3 for dd03l-fieldname no-extension no intervals ,
                    s_field4 for dd03l-fieldname no-extension no intervals ,

                    s_exc for boole-boole no-extension no intervals default'/' no-display.
  selection-screen end of line.

  selection-screen skip 1.

selection-screen end of block b2.

initialization.
  title_1   = 'Find Your CDS Views or Standard Tables'.
  title_2   = 'Enter your Required Fields'.
  t_FIELD1  = 'Fields Name'.
  s_cds     = 'CDS Views'.
  S_tab     = 'Standard Tables'.

***********SELECTION SCREEN*********************************

*SELECT-OPTIONS: S_FIELD1 FOR DD03L-FIELDNAME NO-EXTENSION NO INTERVALS DEFAULT 'EBELN',
**s_crdat for /opt/vim_1head-ARCHIVE_DATE,
*S_FIELD2 FOR DD03L-FIELDNAME NO-EXTENSION NO INTERVALS DEFAULT 'EBELP',
*S_FIELD3 FOR DD03L-FIELDNAME NO-EXTENSION NO INTERVALS DEFAULT 'BELNR',
*S_FIELD4 FOR DD03L-FIELDNAME NO-EXTENSION NO INTERVALS DEFAULT 'MATNR',
*S_EXC FOR BOOLE-BOOLE NO-EXTENSION NO INTERVALS DEFAULT'/' NO-DISPLAY.

start-of-selection.

  if s_field2 is initial.
    s_field2 = s_field1.
  endif.

  field-symbols:<fs_tab13> type mandt.
  data:wa_dd1      type dd03l,
       wa_dd2      type dd03l,
       wa_dd3      type dd03l,
       wa_dd4      type dd03l,
       lv_tab      type dd03l-tabname,
       wa_dd_final type dd03l.
  if s_exc-low is not initial.
    lv_tab = '/%'.
  endif.


  if cds eq 'X'.
    perform cds_Views.
  else.
    perform standard_tables.
  endif.

  perform get_fieldcatalog.

  call function 'REUSE_ALV_GRID_DISPLAY'
    exporting
      i_callback_program = sy-repid
*     is_layout          = w_layout
      it_fieldcat        = fieldcat[]
*     it_events          = i_events
    tables
      t_outtab           = ialv
    exceptions
      program_error      = 1
      others             = 2.
  if sy-subrc <> 0.

  endif.

form standard_tables.

  if s_field1-low is not initial.
    select c~tabname
      from ( ( dd03l as c
           inner join dd02v as p on p~tabname  = c~tabname
                                and p~tabclass = 'TRANSP')
*                              AND p~cityto   = @cityto )
           inner join dd09l as f on f~tabname = p~tabname )
      where ( ( c~rollname eq @s_field1-low )
      or ( c~fieldname eq @s_field1-low  ) )
      and p~tabname not like @lv_tab
         into table @data(itab13).
  endif.
  if s_field2-low is not initial.
    select c~tabname
    from ( ( dd03l as c
         inner join dd02v as p on p~tabname  = c~tabname
                              and p~tabclass = 'TRANSP')
*                              AND p~cityto   = @cityto )
         inner join dd09l as f on f~tabname = p~tabname )
    where ( ( c~rollname eq @s_field2-low )
    or ( c~fieldname eq @s_field2-low  )    )
    and p~tabname not like @lv_tab
       into table @data(itab14).
  endif.
  if s_field3-low is not initial.
    select c~tabname
    from ( ( dd03l as c
         inner join dd02v as p on p~tabname  = c~tabname
                              and p~tabclass = 'TRANSP')
         inner join dd09l as f on f~tabname = p~tabname )
    where ( ( c~rollname eq @s_field3-low )

    or ( c~fieldname eq @s_field3-low  )    )
    and p~tabname not like @lv_tab
       into table @data(itab15).
  endif.
  if s_field4-low is not initial.
    select c~tabname
  from ( ( dd03l as c
       inner join dd02v as p on p~tabname  = c~tabname
                            and p~tabclass = 'TRANSP')
*                              AND p~cityto   = @cityto )
       inner join dd09l as f on f~tabname = p~tabname )
  where ( ( c~rollname eq @s_field4-low )
  or ( c~fieldname eq @s_field4-low  )
  )
  and p~tabname not like @lv_tab
*                                AND f~connid = p~connid )
*       ORDER BY c~carrname, p~connid, f~fldate
     into table @data(itab16).
  endif.
  sort itab13 by tabname.
  delete adjacent duplicates from itab13 comparing tabname..
  sort itab14 by tabname.
  delete adjacent duplicates from itab14 comparing tabname..
  sort itab15 by tabname.
  delete adjacent duplicates from itab15 comparing tabname..
  sort itab16 by tabname.
  delete adjacent duplicates from itab16 comparing tabname.
  if s_field1-low is not initial.

    loop at itab13 into data(wa_tab133).
      if itab14[] is not initial.
        read table itab14  into data(wa_tab134) with key tabname = wa_tab133-tabname.
        if sy-subrc = 0.
          if itab15[] is not initial.
            read table itab15  into data(wa_tab135) with key tabname = wa_tab133-tabname.
            if sy-subrc = 0.
              if itab16[] is not initial.
                read table itab16  into data(wa_tab136) with key tabname = wa_tab133-tabname.
                if sy-subrc = 0.
                  wa_alv-tabname =  wa_tab134-tabname.
                  wa_alv-field1 =  s_field1-low.
                  wa_alv-field2 =  s_field2-low.
                  wa_alv-field3 =  s_field3-low.
                  wa_alv-field4 =  s_field4-low.
                  append wa_alv to ialv.
                  clear wa_alv.
                else.

                  wa_alv-tabname =  wa_tab134-tabname.
                  wa_alv-field1 =  s_field1-low.
                  wa_alv-field2 =  s_field2-low.
                  wa_alv-field3 =  s_field3-low.
                  append wa_alv to ialv.
                  clear wa_alv.
                endif.
              else.

                wa_alv-tabname =  wa_tab134-tabname.
                wa_alv-field1 =  s_field1-low.
                wa_alv-field2 =  s_field2-low.
                wa_alv-field3 =  s_field3-low.

                append wa_alv to ialv.
                clear wa_alv.
              endif.
            else.

              wa_alv-tabname =  wa_tab134-tabname.
              wa_alv-field1 =  s_field1-low.
              wa_alv-field2 =  s_field2-low.

              append wa_alv to ialv.
              clear wa_alv.
            endif.

          else.
            wa_alv-tabname =  wa_tab134-tabname.
            wa_alv-field1 =  s_field1-low.
            wa_alv-field2 =  s_field2-low.
            append wa_alv to ialv.
            clear wa_tab134.
            clear wa_alv.
          endif.

        endif.
      endif.

    endloop.

  endif.
  delete adjacent duplicates from ialv comparing all fields.

  loop at ialv into wa_alv.

    select single ddtext from dd02t into wa_alv-tbtext where tabname eq wa_alv-tabname and ddlanguage eq 'E'.

    modify ialv from wa_alv.
    clear wa_alv.
  endloop.

endform.

form cds_Views.
  if s_field1-low is not initial.

    select c~ddlname, c~objectname, p~tabname, p~fieldname, p~rollname
      from ( ddldependency as c
           inner join dd03l as p on p~tabname  = c~objectname
                                and p~as4local = c~state )

      where p~fieldname = @s_field1-low
      and p~tabname not like @lv_tab

         into table @data(itab13).
  endif.
  if s_field2-low is not initial.

    select c~ddlname, c~objectname, p~tabname, p~fieldname, p~rollname
    from ( ddldependency as c
         inner join dd03l as p on p~tabname  = c~objectname
                              and p~as4local = c~state )
*                              AND p~cityto   = @cityto )
*         INNER JOIN dd09l AS f ON f~tabname = p~tabname )
    where p~fieldname = @s_field2-low
      and p~tabname not like @lv_tab
       into table @data(itab14).
  endif.
  if s_field3-low is not initial.

    select c~ddlname, c~objectname, p~tabname, p~fieldname, p~rollname
    from ( ddldependency as c
         inner join dd03l as p on p~tabname  = c~objectname
                              and p~as4local = c~state )
    where p~fieldname = @s_field3-low
      and p~tabname not like @lv_tab
       into table @data(itab15).
  endif.
  if s_field4-low is not initial.

    select c~ddlname, c~objectname, p~tabname, p~fieldname, p~rollname
    from ( ddldependency as c
         inner join dd03l as p on p~tabname  = c~objectname
                              and p~as4local = c~state )
*                              AND p~cityto   = @cityto )
*         INNER JOIN dd09l AS f ON f~tabname = p~tabname )
    where p~fieldname = @s_field4-low
      and p~tabname not like @lv_tab
       into table @data(itab16).
  endif.
  sort itab13 by tabname.
  delete adjacent duplicates from itab13 comparing tabname..
  sort itab14 by tabname.
  delete adjacent duplicates from itab14 comparing tabname..
  sort itab15 by tabname.
  delete adjacent duplicates from itab15 comparing tabname..
  sort itab16 by tabname.
  delete adjacent duplicates from itab16 comparing tabname.
  if s_field1-low is not initial.
    loop at itab13 into data(wa_tab133).
      if itab14[] is not initial.
        read table itab14  into data(wa_tab134) with key ddlname = wa_tab133-ddlname.
        if sy-subrc = 0.
          if itab15[] is not initial.
            read table itab15  into data(wa_tab135) with key ddlname = wa_tab133-ddlname."tabname = wa_tab133-tabname.
            if sy-subrc = 0.
              if itab16[] is not initial.
                read table itab16  into data(wa_tab136) with key ddlname = wa_tab133-ddlname."tabname = wa_tab133-tabname.
                if sy-subrc = 0.
                  wa_alv-tabname =  wa_tab134-tabname.
                  wa_alv-objectname =  wa_tab134-objectname.
                  wa_alv-ddlname =  wa_tab134-ddlname.
                  wa_alv-field1 =  s_field1-low.
                  wa_alv-field2 =  s_field2-low.
                  wa_alv-field3 =  s_field3-low.
                  wa_alv-field4 =  s_field4-low.
                  append wa_alv to ialv.
                  clear wa_alv.
                else.

                  wa_alv-tabname =  wa_tab134-tabname.
                  wa_alv-objectname =  wa_tab134-objectname.
                  wa_alv-ddlname =  wa_tab134-ddlname.
                  wa_alv-field1 =  s_field1-low.
                  wa_alv-field2 =  s_field2-low.
                  wa_alv-field3 =  s_field3-low.
                  append wa_alv to ialv.
                  clear wa_alv.
                endif.
              else.

                wa_alv-objectname =  wa_tab134-objectname.
                wa_alv-ddlname =  wa_tab134-ddlname.
                wa_alv-field1 =  s_field1-low.
                wa_alv-field2 =  s_field2-low.
                wa_alv-field3 =  s_field3-low.

                append wa_alv to ialv.
                clear wa_alv.
              endif.
            else.

              wa_alv-tabname =  wa_tab134-tabname.
              wa_alv-objectname =  wa_tab134-objectname.
              wa_alv-ddlname =  wa_tab134-ddlname.
              wa_alv-field1 =  s_field1-low.
              wa_alv-field2 =  s_field2-low.

              append wa_alv to ialv.
              clear wa_alv.
            endif.

          else.
            wa_alv-tabname =  wa_tab134-tabname.
            wa_alv-objectname =  wa_tab134-objectname.
            wa_alv-ddlname =  wa_tab134-ddlname.
            wa_alv-field1 =  s_field1-low.
            wa_alv-field2 =  s_field2-low.
            append wa_alv to ialv.
            clear wa_tab134.
            clear wa_alv.
          endif.

        endif.
      endif.

    endloop.


  endif.
  delete adjacent duplicates from ialv comparing all fields.


  loop at ialv into wa_alv.

    select single ddtext from ddddlsrct into wa_alv-ddtext where ddlname eq wa_alv-ddlname.

    modify ialv from wa_alv.
    clear wa_alv.
  endloop.

endform.


form get_fieldcatalog.

  if table = 'X'.

    clear: fieldcat.
    fieldcat-seltext_m    = 'Tablename'.
    fieldcat-fieldname  = 'TABNAME'.
    fieldcat-outputlen  = '15'.
    append fieldcat to fieldcat.

    clear: fieldcat.
    fieldcat-seltext_m    = 'Table Short text'.
    fieldcat-fieldname  = 'TBTEXT'.
    fieldcat-outputlen  = '60'.
    append fieldcat to fieldcat.

  endif.

*  CLEAR: FIELDCAT.
*  FIELDCAT-SELTEXT_M    = 'DDLNAME'.
*  FIELDCAT-FIELDNAME  = 'DDLNAME'.
*  FIELDCAT-OUTPUTLEN  = '20'.
*  APPEND FIELDCAT TO FIELDCAT.

  if cds = 'X'.
    clear: fieldcat.
    fieldcat-seltext_m    = 'CDS VIEWS'.
    fieldcat-fieldname  = 'OBJECTNAME'.
    fieldcat-outputlen  = '20'.
    append fieldcat to fieldcat.

    clear: fieldcat.
    fieldcat-seltext_m    = 'DDL Short text'.
    fieldcat-fieldname  = 'DDTEXT'.
    fieldcat-outputlen  = '60'.
    append fieldcat to fieldcat.
  endif.

  clear: fieldcat.
  fieldcat-seltext_m   = 'Field1'.
  fieldcat-fieldname  = 'FIELD1'.
  fieldcat-outputlen  = '12'.
  append fieldcat to fieldcat.
  clear: fieldcat.
  fieldcat-seltext_m   = 'Field2'.
  fieldcat-fieldname  = 'FIELD2'.
  fieldcat-outputlen  = '12'.
  append fieldcat to fieldcat.
  clear: fieldcat.
  fieldcat-seltext_m   = 'Field3'.
  fieldcat-fieldname  = 'FIELD3'.
  fieldcat-outputlen  = '12'.
  append fieldcat to fieldcat.
  clear: fieldcat.
  fieldcat-seltext_m    = 'Field4'.
  fieldcat-fieldname  = 'FIELD4'.
  fieldcat-outputlen  = '12'.
  append fieldcat to fieldcat.

endform.