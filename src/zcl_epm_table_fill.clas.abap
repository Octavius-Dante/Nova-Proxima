CLASS zcl_epm_table_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_epm_table_fill IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZNWD_AD  ****************************

    DATA : it_ZNWD_AD TYPE TABLE OF ZNWD_AD.

*   fill internal table (itab)
    it_ZNWD_AD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_AD.
*   insert the new table entries
    INSERT ZNWD_AD FROM TABLE @IT_ZNWD_AD.

*   check the result
    SELECT * FROM ZNWD_AD INTO TABLE @it_ZNWD_AD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_AD table !' ).

* END OF DATA FILL FOR ZNWD_AD ************************
*************************************************************************
** DATA FILL FOR ZNWD_ADMIN_DATA  ****************************
*
*    DATA : it_ZNWD_ADMIN_DATA TYPE TABLE OF ZNWD_ADMIN_DATA.
*
**   fill internal table (itab)
*    it_ZNWD_ADMIN_DATA = VALUE #(
*
*    ).
*
**   Delete the possible entries in the database table - in case it was already filled
*    DELETE FROM ZNWD_ADMIN_DATA.
**   insert the new table entries
*    INSERT ZNWD_ADMIN_DATA FROM TABLE @IT_ZNWD_ADMIN_DATA.
*
**   check the result
*    SELECT * FROM ZNWD_ADMIN_DATA INTO TABLE @it_ZNWD_ADMIN_DATA.
*    Out->write( sy-dbcnt ).
*    Out->write( 'Data inserted successfully for ZNWD_ADMIN_DATA table !' ).
*
** END OF DATA FILL FOR ZNWD_ADMIN_DATA ************************
*************************************************************************
* DATA FILL FOR ZNWD_ATTACHMENTS  ****************************

    DATA : it_ZNWD_ATTACHMENTS TYPE TABLE OF ZNWD_ATTACHMENTS.

*   fill internal table (itab)
    it_ZNWD_ATTACHMENTS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_ATTACHMENTS.
*   insert the new table entries
    INSERT ZNWD_ATTACHMENTS FROM TABLE @IT_ZNWD_ATTACHMENTS.

*   check the result
    SELECT * FROM ZNWD_ATTACHMENTS INTO TABLE @it_ZNWD_ATTACHMENTS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_ATTACHMENTS table !' ).

* END OF DATA FILL FOR ZNWD_ATTACHMENTS ************************
************************************************************************
** DATA FILL FOR ZNWD_AU_LOCK  ****************************
*
*    DATA : it_ZNWD_AU_LOCK TYPE TABLE OF ZNWD_AU_LOCK.
*
**   fill internal table (itab)
*    it_ZNWD_AU_LOCK = VALUE #(
*
*    ).
*
**   Delete the possible entries in the database table - in case it was already filled
*    DELETE FROM ZNWD_AU_LOCK.
**   insert the new table entries
*    INSERT ZNWD_AU_LOCK FROM TABLE @IT_ZNWD_AU_LOCK.
*
**   check the result
*    SELECT * FROM ZNWD_AU_LOCK INTO TABLE @it_ZNWD_AU_LOCK.
*    Out->write( sy-dbcnt ).
*    Out->write( 'Data inserted successfully for ZNWD_AU_LOCK table !' ).
*
** END OF DATA FILL FOR ZNWD_AU_LOCK ************************
*************************************************************************
* DATA FILL FOR ZNWD_BPA  ****************************

    DATA : it_ZNWD_BPA TYPE TABLE OF ZNWD_BPA.

*   fill internal table (itab)
    it_ZNWD_BPA = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_BPA.
*   insert the new table entries
    INSERT ZNWD_BPA FROM TABLE @IT_ZNWD_BPA.

*   check the result
    SELECT * FROM ZNWD_BPA INTO TABLE @it_ZNWD_BPA.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_BPA table !' ).

* END OF DATA FILL FOR ZNWD_BPA ************************
************************************************************************
* DATA FILL FOR ZNWD_BPA_CONTACT  ****************************

    DATA : it_ZNWD_BPA_CONTACT TYPE TABLE OF ZNWD_BPA_CONTACT.

*   fill internal table (itab)
    it_ZNWD_BPA_CONTACT = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_BPA_CONTACT.
*   insert the new table entries
    INSERT ZNWD_BPA_CONTACT FROM TABLE @IT_ZNWD_BPA_CONTACT.

*   check the result
    SELECT * FROM ZNWD_BPA_CONTACT INTO TABLE @it_ZNWD_BPA_CONTACT.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_BPA_CONTACT table !' ).

* END OF DATA FILL FOR ZNWD_BPA_CONTACT ************************
************************************************************************
* DATA FILL FOR ZNWD_COMPANY  ****************************

    DATA : it_ZNWD_COMPANY TYPE TABLE OF ZNWD_COMPANY.

*   fill internal table (itab)
    it_ZNWD_COMPANY = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_COMPANY.
*   insert the new table entries
    INSERT ZNWD_COMPANY FROM TABLE @IT_ZNWD_COMPANY.

*   check the result
    SELECT * FROM ZNWD_COMPANY INTO TABLE @it_ZNWD_COMPANY.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_COMPANY table !' ).

* END OF DATA FILL FOR ZNWD_COMPANY ************************
************************************************************************
************************************************************************
* DATA FILL FOR ZNWD_DG_RESULTS  ****************************

    DATA : it_ZNWD_DG_RESULTS TYPE TABLE OF ZNWD_DG_RESULTS.

*   fill internal table (itab)
    it_ZNWD_DG_RESULTS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_DG_RESULTS.
*   insert the new table entries
    INSERT ZNWD_DG_RESULTS FROM TABLE @IT_ZNWD_DG_RESULTS.

*   check the result
    SELECT * FROM ZNWD_DG_RESULTS INTO TABLE @it_ZNWD_DG_RESULTS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_DG_RESULTS table !' ).

* END OF DATA FILL FOR ZNWD_DG_RESULTS ************************
************************************************************************
************************************************************************
* DATA FILL FOR ZNWD_EMPLOYEES  ****************************

    DATA : it_ZNWD_EMPLOYEES TYPE TABLE OF ZNWD_EMPLOYEES.

*   fill internal table (itab)
    it_ZNWD_EMPLOYEES = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_EMPLOYEES.
*   insert the new table entries
    INSERT ZNWD_EMPLOYEES FROM TABLE @IT_ZNWD_EMPLOYEES.

*   check the result
    SELECT * FROM ZNWD_EMPLOYEES INTO TABLE @it_ZNWD_EMPLOYEES.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_EMPLOYEES table !' ).

* END OF DATA FILL FOR ZNWD_EMPLOYEES ************************
************************************************************************
** DATA FILL FOR ZNWD_EPM_INDX  ****************************
*
*    DATA : it_ZNWD_EPM_INDX TYPE TABLE OF ZNWD_EPM_INDX.
*
**   fill internal table (itab)
*    it_ZNWD_EPM_INDX = VALUE #(
*
*    ).
*
**   Delete the possible entries in the database table - in case it was already filled
*    DELETE FROM ZNWD_EPM_INDX.
**   insert the new table entries
*    INSERT ZNWD_EPM_INDX FROM TABLE @IT_ZNWD_EPM_INDX.
*
**   check the result
*    SELECT * FROM ZNWD_EPM_INDX INTO TABLE @it_ZNWD_EPM_INDX.
*    Out->write( sy-dbcnt ).
*    Out->write( 'Data inserted successfully for ZNWD_EPM_INDX table !' ).
*
** END OF DATA FILL FOR ZNWD_EPM_INDX ************************
************************************************************************
** DATA FILL FOR ZNWD_EPM_SESSION_LOCK  ****************************
*
*    DATA : it_ZNWD_EPM_SESSION_LOCK TYPE TABLE OF ZNWD_EPM_SESSION_LOCK.
*
**   fill internal table (itab)
*    it_ZNWD_EPM_SESSION_LOCK = VALUE #(
*
*    ).
*
**   Delete the possible entries in the database table - in case it was already filled
*    DELETE FROM ZNWD_EPM_SESSION_LOCK.
**   insert the new table entries
*    INSERT ZNWD_EPM_SESSION_LOCK FROM TABLE @IT_ZNWD_EPM_SESSION_LOCK.
*
**   check the result
*    SELECT * FROM ZNWD_EPM_SESSION_LOCK INTO TABLE @it_ZNWD_EPM_SESSION_LOCK.
*    Out->write( sy-dbcnt ).
*    Out->write( 'Data inserted successfully for ZNWD_EPM_SESSION_LOCK table !' ).
*
** END OF DATA FILL FOR ZNWD_EPM_SESSION_LOCK ************************
*************************************************************************
** DATA FILL FOR ZNWD_EPM_SNAPS  ****************************
*
*    DATA : it_ZNWD_EPM_SNAPS TYPE TABLE OF ZNWD_EPM_SNAPS.
*
**   fill internal table (itab)
*    it_ZNWD_EPM_SNAPS = VALUE #(
*
*    ).
*
**   Delete the possible entries in the database table - in case it was already filled
*    DELETE FROM ZNWD_EPM_SNAPS.
**   insert the new table entries
*    INSERT ZNWD_EPM_SNAPS FROM TABLE @IT_ZNWD_EPM_SNAPS.
*
**   check the result
*    SELECT * FROM ZNWD_EPM_SNAPS INTO TABLE @it_ZNWD_EPM_SNAPS.
*    Out->write( sy-dbcnt ).
*    Out->write( 'Data inserted successfully for ZNWD_EPM_SNAPS table !' ).
*
** END OF DATA FILL FOR ZNWD_EPM_SNAPS ************************
************************************************************************
* DATA FILL FOR ZNWD_EXTENSIONS  ****************************

    DATA : it_ZNWD_EXTENSIONS TYPE TABLE OF ZNWD_EXTENSIONS.

*   fill internal table (itab)
    it_ZNWD_EXTENSIONS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_EXTENSIONS.
*   insert the new table entries
    INSERT ZNWD_EXTENSIONS FROM TABLE @IT_ZNWD_EXTENSIONS.

*   check the result
    SELECT * FROM ZNWD_EXTENSIONS INTO TABLE @it_ZNWD_EXTENSIONS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_EXTENSIONS table !' ).

* END OF DATA FILL FOR ZNWD_EXTENSIONS ************************
************************************************************************
* DATA FILL FOR ZNWD_GI_HEAD  ****************************

    DATA : it_ZNWD_GI_HEAD TYPE TABLE OF ZNWD_GI_HEAD.

*   fill internal table (itab)
    it_ZNWD_GI_HEAD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_GI_HEAD.
*   insert the new table entries
    INSERT ZNWD_GI_HEAD FROM TABLE @IT_ZNWD_GI_HEAD.

*   check the result
    SELECT * FROM ZNWD_GI_HEAD INTO TABLE @it_ZNWD_GI_HEAD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_GI_HEAD table !' ).

* END OF DATA FILL FOR ZNWD_GI_HEAD ************************
************************************************************************
* DATA FILL FOR ZNWD_GI_I  ****************************

    DATA : it_ZNWD_GI_I TYPE TABLE OF ZNWD_GI_I.

*   fill internal table (itab)
    it_ZNWD_GI_I = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_GI_I.
*   insert the new table entries
    INSERT ZNWD_GI_I FROM TABLE @IT_ZNWD_GI_I.

*   check the result
    SELECT * FROM ZNWD_GI_I INTO TABLE @it_ZNWD_GI_I.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_GI_I table !' ).

* END OF DATA FILL FOR ZNWD_GI_I ************************
************************************************************************
* DATA FILL FOR ZNWD_GR_HEAD  ****************************

    DATA : it_ZNWD_GR_HEAD TYPE TABLE OF ZNWD_GR_HEAD.

*   fill internal table (itab)
    it_ZNWD_GR_HEAD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_GR_HEAD.
*   insert the new table entries
    INSERT ZNWD_GR_HEAD FROM TABLE @IT_ZNWD_GR_HEAD.

*   check the result
    SELECT * FROM ZNWD_GR_HEAD INTO TABLE @it_ZNWD_GR_HEAD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_GR_HEAD table !' ).

* END OF DATA FILL FOR ZNWD_GR_HEAD ************************
************************************************************************
* DATA FILL FOR ZNWD_GR_I  ****************************

    DATA : it_ZNWD_GR_I TYPE TABLE OF ZNWD_GR_I.

*   fill internal table (itab)
    it_ZNWD_GR_I = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_GR_I.
*   insert the new table entries
    INSERT ZNWD_GR_I FROM TABLE @IT_ZNWD_GR_I.

*   check the result
    SELECT * FROM ZNWD_GR_I INTO TABLE @it_ZNWD_GR_I.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_GR_I table !' ).

* END OF DATA FILL FOR ZNWD_GR_I ************************
************************************************************************
* DATA FILL FOR ZNWD_ITELO_DEPTS  ****************************

    DATA : it_ZNWD_ITELO_DEPTS TYPE TABLE OF ZNWD_ITELO_DEPTS.

*   fill internal table (itab)
    it_ZNWD_ITELO_DEPTS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_ITELO_DEPTS.
*   insert the new table entries
    INSERT ZNWD_ITELO_DEPTS FROM TABLE @IT_ZNWD_ITELO_DEPTS.

*   check the result
    SELECT * FROM ZNWD_ITELO_DEPTS INTO TABLE @it_ZNWD_ITELO_DEPTS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_ITELO_DEPTS table !' ).

* END OF DATA FILL FOR ZNWD_ITELO_DEPTS ************************
************************************************************************
** DATA FILL FOR ZNWD_ITEM_AVAILABILITY  ****************************
*
*    DATA : it_ZNWD_ITEM_AVAILABILITY TYPE TABLE OF ZNWD_ITEM_AVAILABILITY.
*
**   fill internal table (itab)
*    it_ZNWD_ITEM_AVAILABILITY = VALUE #(
*
*    ).
*
**   Delete the possible entries in the database table - in case it was already filled
*    DELETE FROM ZNWD_ITEM_AVAILABILITY.
**   insert the new table entries
*    INSERT ZNWD_ITEM_AVAILABILITY FROM TABLE @IT_ZNWD_ITEM_AVAILABILITY.
*
**   check the result
*    SELECT * FROM ZNWD_ITEM_AVAILABILITY INTO TABLE @it_ZNWD_ITEM_AVAILABILITY.
*    Out->write( sy-dbcnt ).
*    Out->write( 'Data inserted successfully for ZNWD_ITEM_AVAILABILITY table !' ).
*
** END OF DATA FILL FOR ZNWD_ITEM_AVAILABILITY ************************
*************************************************************************
*************************************************************************
* DATA FILL FOR ZNWD_LR_HEADER  ****************************

    DATA : it_ZNWD_LR_HEADER TYPE TABLE OF ZNWD_LR_HEADER.

*   fill internal table (itab)
    it_ZNWD_LR_HEADER = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_LR_HEADER.
*   insert the new table entries
    INSERT ZNWD_LR_HEADER FROM TABLE @IT_ZNWD_LR_HEADER.

*   check the result
    SELECT * FROM ZNWD_LR_HEADER INTO TABLE @it_ZNWD_LR_HEADER.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_LR_HEADER table !' ).

* END OF DATA FILL FOR ZNWD_LR_HEADER ************************
************************************************************************
* DATA FILL FOR ZNWD_LR_ITEM  ****************************

    DATA : it_ZNWD_LR_ITEM TYPE TABLE OF ZNWD_LR_ITEM.

*   fill internal table (itab)
    it_ZNWD_LR_ITEM = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_LR_ITEM.
*   insert the new table entries
    INSERT ZNWD_LR_ITEM FROM TABLE @IT_ZNWD_LR_ITEM.

*   check the result
    SELECT * FROM ZNWD_LR_ITEM INTO TABLE @it_ZNWD_LR_ITEM.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_LR_ITEM table !' ).

* END OF DATA FILL FOR ZNWD_LR_ITEM ************************
************************************************************************
* DATA FILL FOR ZNWD_PD  ****************************

    DATA : it_ZNWD_PD TYPE TABLE OF ZNWD_PD.

*   fill internal table (itab)
    it_ZNWD_PD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_PD.
*   insert the new table entries
    INSERT ZNWD_PD FROM TABLE @IT_ZNWD_PD.

*   check the result
    SELECT * FROM ZNWD_PD INTO TABLE @it_ZNWD_PD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PD table !' ).

* END OF DATA FILL FOR ZNWD_PD ************************
************************************************************************
* DATA FILL FOR ZNWD_PD_CATGOS  ****************************

    DATA : it_ZNWD_PD_CATGOS TYPE TABLE OF ZNWD_PD_CATGOS.

*   fill internal table (itab)
    it_ZNWD_PD_CATGOS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_PD_CATGOS.
*   insert the new table entries
    INSERT ZNWD_PD_CATGOS FROM TABLE @IT_ZNWD_PD_CATGOS.

*   check the result
    SELECT * FROM ZNWD_PD_CATGOS INTO TABLE @it_ZNWD_PD_CATGOS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PD_CATGOS table !' ).

* END OF DATA FILL FOR ZNWD_PD_CATGOS ************************
************************************************************************
* DATA FILL FOR ZNWD_PD_CF  ****************************

    DATA : it_ZNWD_PD_CF TYPE TABLE OF ZNWD_PD_CF.

*   fill internal table (itab)
    it_ZNWD_PD_CF = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_PD_CF.
*   insert the new table entries
    INSERT ZNWD_PD_CF FROM TABLE @IT_ZNWD_PD_CF.

*   check the result
    SELECT * FROM ZNWD_PD_CF INTO TABLE @it_ZNWD_PD_CF.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PD_CF table !' ).

* END OF DATA FILL FOR ZNWD_PD_CF ************************
************************************************************************
** DATA FILL FOR ZNWD_PD_EI  ****************************
*
*    DATA : it_ZNWD_PD_EI TYPE TABLE OF ZNWD_PD_EI.
*
**   fill internal table (itab)
*    it_ZNWD_PD_EI = VALUE #(
*
*    ).
*
**   Delete the possible entries in the database table - in case it was already filled
*    DELETE FROM ZNWD_PD_EI.
**   insert the new table entries
*    INSERT ZNWD_PD_EI FROM TABLE @IT_ZNWD_PD_EI.
*
**   check the result
*    SELECT * FROM ZNWD_PD_EI INTO TABLE @it_ZNWD_PD_EI.
*    Out->write( sy-dbcnt ).
*    Out->write( 'Data inserted successfully for ZNWD_PD_EI table !' ).
*
** END OF DATA FILL FOR ZNWD_PD_EI ************************
*************************************************************************
* DATA FILL FOR ZNWD_PO  ****************************

    DATA : it_ZNWD_PO TYPE TABLE OF ZNWD_PO.

*   fill internal table (itab)
    it_ZNWD_PO = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_PO.
*   insert the new table entries
    INSERT ZNWD_PO FROM TABLE @IT_ZNWD_PO.

*   check the result
    SELECT * FROM ZNWD_PO INTO TABLE @it_ZNWD_PO.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PO table !' ).

* END OF DATA FILL FOR ZNWD_PO ************************
************************************************************************
* DATA FILL FOR ZNWD_PO_I  ****************************

    DATA : it_ZNWD_PO_I TYPE TABLE OF ZNWD_PO_I.

*   fill internal table (itab)
    it_ZNWD_PO_I = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_PO_I.
*   insert the new table entries
    INSERT ZNWD_PO_I FROM TABLE @IT_ZNWD_PO_I.

*   check the result
    SELECT * FROM ZNWD_PO_I INTO TABLE @it_ZNWD_PO_I.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PO_I table !' ).

* END OF DATA FILL FOR ZNWD_PO_I ************************
************************************************************************
* DATA FILL FOR ZNWD_PO_INV_HEAD  ****************************

    DATA : it_ZNWD_PO_INV_HEAD TYPE TABLE OF ZNWD_PO_INV_HEAD.

*   fill internal table (itab)
    it_ZNWD_PO_INV_HEAD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_PO_INV_HEAD.
*   insert the new table entries
    INSERT ZNWD_PO_INV_HEAD FROM TABLE @IT_ZNWD_PO_INV_HEAD.

*   check the result
    SELECT * FROM ZNWD_PO_INV_HEAD INTO TABLE @it_ZNWD_PO_INV_HEAD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PO_INV_HEAD table !' ).

* END OF DATA FILL FOR ZNWD_PO_INV_HEAD ************************
************************************************************************
* DATA FILL FOR ZNWD_PO_INV_ITEM  ****************************

    DATA : it_ZNWD_PO_INV_ITEM TYPE TABLE OF ZNWD_PO_INV_ITEM.

*   fill internal table (itab)
    it_ZNWD_PO_INV_ITEM = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_PO_INV_ITEM.
*   insert the new table entries
    INSERT ZNWD_PO_INV_ITEM FROM TABLE @IT_ZNWD_PO_INV_ITEM.

*   check the result
    SELECT * FROM ZNWD_PO_INV_ITEM INTO TABLE @it_ZNWD_PO_INV_ITEM.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PO_INV_ITEM table !' ).

* END OF DATA FILL FOR ZNWD_PO_INV_ITEM ************************
************************************************************************
* DATA FILL FOR ZNWD_PO_SL  ****************************

    DATA : it_ZNWD_PO_SL TYPE TABLE OF ZNWD_PO_SL.

*   fill internal table (itab)
    it_ZNWD_PO_SL = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_PO_SL.
*   insert the new table entries
    INSERT ZNWD_PO_SL FROM TABLE @IT_ZNWD_PO_SL.

*   check the result
    SELECT * FROM ZNWD_PO_SL INTO TABLE @it_ZNWD_PO_SL.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_PO_SL table !' ).

* END OF DATA FILL FOR ZNWD_PO_SL ************************
************************************************************************
* DATA FILL FOR ZNWD_REV_HEAD  ****************************

    DATA : it_ZNWD_REV_HEAD TYPE TABLE OF ZNWD_REV_HEAD.

*   fill internal table (itab)
    it_ZNWD_REV_HEAD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_REV_HEAD.
*   insert the new table entries
    INSERT ZNWD_REV_HEAD FROM TABLE @IT_ZNWD_REV_HEAD.

*   check the result
    SELECT * FROM ZNWD_REV_HEAD INTO TABLE @it_ZNWD_REV_HEAD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_REV_HEAD table !' ).

* END OF DATA FILL FOR ZNWD_REV_HEAD ************************
************************************************************************
* DATA FILL FOR ZNWD_REV_ITEM  ****************************

    DATA : it_ZNWD_REV_ITEM TYPE TABLE OF ZNWD_REV_ITEM.

*   fill internal table (itab)
    it_ZNWD_REV_ITEM = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_REV_ITEM.
*   insert the new table entries
    INSERT ZNWD_REV_ITEM FROM TABLE @IT_ZNWD_REV_ITEM.

*   check the result
    SELECT * FROM ZNWD_REV_ITEM INTO TABLE @it_ZNWD_REV_ITEM.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_REV_ITEM table !' ).

* END OF DATA FILL FOR ZNWD_REV_ITEM ************************
************************************************************************
************************************************************************
* DATA FILL FOR ZNWD_REV_RATING  ****************************

    DATA : it_ZNWD_REV_RATING TYPE TABLE OF ZNWD_REV_RATING.

*   fill internal table (itab)
    it_ZNWD_REV_RATING = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_REV_RATING.
*   insert the new table entries
    INSERT ZNWD_REV_RATING FROM TABLE @IT_ZNWD_REV_RATING.

*   check the result
    SELECT * FROM ZNWD_REV_RATING INTO TABLE @it_ZNWD_REV_RATING.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_REV_RATING table !' ).

* END OF DATA FILL FOR ZNWD_REV_RATING ************************
************************************************************************
* DATA FILL FOR ZNWD_SETTINGS  ****************************

    DATA : it_ZNWD_SETTINGS TYPE TABLE OF ZNWD_SETTINGS.

*   fill internal table (itab)
    it_ZNWD_SETTINGS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_SETTINGS.
*   insert the new table entries
    INSERT ZNWD_SETTINGS FROM TABLE @IT_ZNWD_SETTINGS.

*   check the result
    SELECT * FROM ZNWD_SETTINGS INTO TABLE @it_ZNWD_SETTINGS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_SETTINGS table !' ).

* END OF DATA FILL FOR ZNWD_SETTINGS ************************
************************************************************************
* DATA FILL FOR ZNWD_SO  ****************************

    DATA : it_ZNWD_SO TYPE TABLE OF ZNWD_SO.

*   fill internal table (itab)
    it_ZNWD_SO = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_SO.
*   insert the new table entries
    INSERT ZNWD_SO FROM TABLE @IT_ZNWD_SO.

*   check the result
    SELECT * FROM ZNWD_SO INTO TABLE @it_ZNWD_SO.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_SO table !' ).

* END OF DATA FILL FOR ZNWD_SO ************************
************************************************************************
* DATA FILL FOR ZNWD_SO_I  ****************************

    DATA : it_ZNWD_SO_I TYPE TABLE OF ZNWD_SO_I.

*   fill internal table (itab)
    it_ZNWD_SO_I = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_SO_I.
*   insert the new table entries
    INSERT ZNWD_SO_I FROM TABLE @IT_ZNWD_SO_I.

*   check the result
    SELECT * FROM ZNWD_SO_I INTO TABLE @it_ZNWD_SO_I.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_SO_I table !' ).

* END OF DATA FILL FOR ZNWD_SO_I ************************
************************************************************************
** DATA FILL FOR ZNWD_SO_INCL_EEW_PS  ****************************
*
*    DATA : it_ZNWD_SO_INCL_EEW_PS TYPE TABLE OF ZNWD_SO_INCL_EEW_PS.
*
**   fill internal table (itab)
*    it_ZNWD_SO_INCL_EEW_PS = VALUE #(
*
*    ).
*
**   Delete the possible entries in the database table - in case it was already filled
*    DELETE FROM ZNWD_SO_INCL_EEW_PS.
**   insert the new table entries
*    INSERT ZNWD_SO_INCL_EEW_PS FROM TABLE @IT_ZNWD_SO_INCL_EEW_PS.
*
**   check the result
*    SELECT * FROM ZNWD_SO_INCL_EEW_PS INTO TABLE @it_ZNWD_SO_INCL_EEW_PS.
*    Out->write( sy-dbcnt ).
*    Out->write( 'Data inserted successfully for ZNWD_SO_INCL_EEW_PS table !' ).
*
** END OF DATA FILL FOR ZNWD_SO_INCL_EEW_PS ************************
*************************************************************************
** DATA FILL FOR ZNWD_SO_INCL_EEW_TR  ****************************
*
*    DATA : it_ZNWD_SO_INCL_EEW_TR TYPE TABLE OF ZNWD_SO_INCL_EEW_TR.
*
**   fill internal table (itab)
*    it_ZNWD_SO_INCL_EEW_TR = VALUE #(
*
*    ).
*
**   Delete the possible entries in the database table - in case it was already filled
*    DELETE FROM ZNWD_SO_INCL_EEW_TR.
**   insert the new table entries
*    INSERT ZNWD_SO_INCL_EEW_TR FROM TABLE @IT_ZNWD_SO_INCL_EEW_TR.
*
**   check the result
*    SELECT * FROM ZNWD_SO_INCL_EEW_TR INTO TABLE @it_ZNWD_SO_INCL_EEW_TR.
*    Out->write( sy-dbcnt ).
*    Out->write( 'Data inserted successfully for ZNWD_SO_INCL_EEW_TR table !' ).
*
** END OF DATA FILL FOR ZNWD_SO_INCL_EEW_TR ************************
*************************************************************************
* DATA FILL FOR ZNWD_SO_INV_HEAD  ****************************

    DATA : it_ZNWD_SO_INV_HEAD TYPE TABLE OF ZNWD_SO_INV_HEAD.

*   fill internal table (itab)
    it_ZNWD_SO_INV_HEAD = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_SO_INV_HEAD.
*   insert the new table entries
    INSERT ZNWD_SO_INV_HEAD FROM TABLE @IT_ZNWD_SO_INV_HEAD.

*   check the result
    SELECT * FROM ZNWD_SO_INV_HEAD INTO TABLE @it_ZNWD_SO_INV_HEAD.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_SO_INV_HEAD table !' ).

* END OF DATA FILL FOR ZNWD_SO_INV_HEAD ************************
************************************************************************
* DATA FILL FOR ZNWD_SO_INV_ITEM  ****************************

    DATA : it_ZNWD_SO_INV_ITEM TYPE TABLE OF ZNWD_SO_INV_ITEM.

*   fill internal table (itab)
    it_ZNWD_SO_INV_ITEM = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_SO_INV_ITEM.
*   insert the new table entries
    INSERT ZNWD_SO_INV_ITEM FROM TABLE @IT_ZNWD_SO_INV_ITEM.

*   check the result
    SELECT * FROM ZNWD_SO_INV_ITEM INTO TABLE @it_ZNWD_SO_INV_ITEM.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_SO_INV_ITEM table !' ).

* END OF DATA FILL FOR ZNWD_SO_INV_ITEM ************************
************************************************************************
* DATA FILL FOR ZNWD_SO_SL  ****************************

    DATA : it_ZNWD_SO_SL TYPE TABLE OF ZNWD_SO_SL.

*   fill internal table (itab)
    it_ZNWD_SO_SL = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_SO_SL.
*   insert the new table entries
    INSERT ZNWD_SO_SL FROM TABLE @IT_ZNWD_SO_SL.

*   check the result
    SELECT * FROM ZNWD_SO_SL INTO TABLE @it_ZNWD_SO_SL.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_SO_SL table !' ).

* END OF DATA FILL FOR ZNWD_SO_SL ************************
************************************************************************
** DATA FILL FOR ZNWD_SOI_INCL_EEW_PS  ****************************
*
*    DATA : it_ZNWD_SOI_INCL_EEW_PS TYPE TABLE OF ZNWD_SOI_INCL_EEW_PS.
*
**   fill internal table (itab)
*    it_ZNWD_SOI_INCL_EEW_PS = VALUE #(
*
*    ).
*
**   Delete the possible entries in the database table - in case it was already filled
*    DELETE FROM ZNWD_SOI_INCL_EEW_PS.
**   insert the new table entries
*    INSERT ZNWD_SOI_INCL_EEW_PS FROM TABLE @IT_ZNWD_SOI_INCL_EEW_PS.
*
**   check the result
*    SELECT * FROM ZNWD_SOI_INCL_EEW_PS INTO TABLE @it_ZNWD_SOI_INCL_EEW_PS.
*    Out->write( sy-dbcnt ).
*    Out->write( 'Data inserted successfully for ZNWD_SOI_INCL_EEW_PS table !' ).
*
** END OF DATA FILL FOR ZNWD_SOI_INCL_EEW_PS ************************
*************************************************************************
** DATA FILL FOR ZNWD_SOI_INCL_EEW_TR  ****************************
*
*    DATA : it_ZNWD_SOI_INCL_EEW_TR TYPE TABLE OF ZNWD_SOI_INCL_EEW_TR.
*
**   fill internal table (itab)
*    it_ZNWD_SOI_INCL_EEW_TR = VALUE #(
*
*    ).
*
**   Delete the possible entries in the database table - in case it was already filled
*    DELETE FROM ZNWD_SOI_INCL_EEW_TR.
**   insert the new table entries
*    INSERT ZNWD_SOI_INCL_EEW_TR FROM TABLE @IT_ZNWD_SOI_INCL_EEW_TR.
*
**   check the result
*    SELECT * FROM ZNWD_SOI_INCL_EEW_TR INTO TABLE @it_ZNWD_SOI_INCL_EEW_TR.
*    Out->write( sy-dbcnt ).
*    Out->write( 'Data inserted successfully for ZNWD_SOI_INCL_EEW_TR table !' ).
*
** END OF DATA FILL FOR ZNWD_SOI_INCL_EEW_TR ************************
*************************************************************************
* DATA FILL FOR ZNWD_STAFFING  ****************************

    DATA : it_ZNWD_STAFFING TYPE TABLE OF ZNWD_STAFFING.

*   fill internal table (itab)
    it_ZNWD_STAFFING = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_STAFFING.
*   insert the new table entries
    INSERT ZNWD_STAFFING FROM TABLE @IT_ZNWD_STAFFING.

*   check the result
    SELECT * FROM ZNWD_STAFFING INTO TABLE @it_ZNWD_STAFFING.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_STAFFING table !' ).

* END OF DATA FILL FOR ZNWD_STAFFING ************************
************************************************************************
* DATA FILL FOR ZNWD_STOCK  ****************************

    DATA : it_ZNWD_STOCK TYPE TABLE OF ZNWD_STOCK.

*   fill internal table (itab)
    it_ZNWD_STOCK = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_STOCK.
*   insert the new table entries
    INSERT ZNWD_STOCK FROM TABLE @IT_ZNWD_STOCK.

*   check the result
    SELECT * FROM ZNWD_STOCK INTO TABLE @it_ZNWD_STOCK.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_STOCK table !' ).

* END OF DATA FILL FOR ZNWD_STOCK ************************
************************************************************************
* DATA FILL FOR ZNWD_TEXT_KEY  ****************************

    DATA : it_ZNWD_TEXT_KEY TYPE TABLE OF ZNWD_TEXT_KEY.

*   fill internal table (itab)
    it_ZNWD_TEXT_KEY = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_TEXT_KEY.
*   insert the new table entries
    INSERT ZNWD_TEXT_KEY FROM TABLE @IT_ZNWD_TEXT_KEY.

*   check the result
    SELECT * FROM ZNWD_TEXT_KEY INTO TABLE @it_ZNWD_TEXT_KEY.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_TEXT_KEY table !' ).

* END OF DATA FILL FOR ZNWD_TEXT_KEY ************************
************************************************************************
* DATA FILL FOR ZNWD_TEXTS  ****************************

    DATA : it_ZNWD_TEXTS TYPE TABLE OF ZNWD_TEXTS.

*   fill internal table (itab)
    it_ZNWD_TEXTS = VALUE #(

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ZNWD_TEXTS.
*   insert the new table entries
    INSERT ZNWD_TEXTS FROM TABLE @IT_ZNWD_TEXTS.

*   check the result
    SELECT * FROM ZNWD_TEXTS INTO TABLE @it_ZNWD_TEXTS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZNWD_TEXTS table !' ).

* END OF DATA FILL FOR ZNWD_TEXTS ************************
************************************************************************


ENDMETHOD.

ENDCLASS.
