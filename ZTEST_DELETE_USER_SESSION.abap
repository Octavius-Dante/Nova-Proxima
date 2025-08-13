*&---------------------------------------------------------------------*
*& Report ZTEST_DELETE_USER_SESSION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*&
*& Program to delete user session by using username as input.
*&
*& This program requires authorization object
*&
*&  AUTHORIZATION OBJECT - S_ADMI_FCD
*&  AUTHORIZATION FIELD  - PADM.
*&
*& for using TH_DELETE_USER  Function module
*&
*& * OTHERS
*& user whose login session needs to be deleted, same user cannot
*& perform this action someother user has to login and use the
*& program to delete the session
*&
*& * YOURS
*& user whose session needs to be cleared should select the yours button and execute
*& name input is not mandatory
*&
*&---------------------------------------------------------------------*

REPORT ztest_delete_user_session.

DATA:
*  username TYPE syuname,                      " Replace with actual username
*  client   TYPE mandt,                        " Replace with actual client
  tid      TYPE syst-index VALUE '0000000001', " Replace with actual TID
  logon_id TYPE i VALUE -1.                    " Required logon ID

DATA : data_list      TYPE STANDARD TABLE OF uinfo,
       data_user_list TYPE STANDARD TABLE OF usrinfo.
DATA : ans.

PARAMETERS : username TYPE xubname OBLIGATORY,
             yours    RADIOBUTTON GROUP gr1,
             others   RADIOBUTTON GROUP gr1 DEFAULT 'X'.

INITIALIZATION.

  username = sy-uname.
  yours = abap_true.
  others = abap_false.

START-OF-SELECTION.

  IF others = 'X'.
    IF sy-uname = username.
      MESSAGE 'For others - change the username' TYPE 'S' DISPLAY LIKE 'E'.
      LEAVE LIST-PROCESSING.
    ENDIF.
  ENDIF.

*TH_DELETE_MODE,
*TH_GET_OWN_WP_NO, or TH_STOP_WP

  IF others EQ abap_true.

* Get user session details
    CALL FUNCTION 'TH_USER_LIST' " DESTINATION 'AP1CLNT900'
      TABLES
        list          = data_list
        usrlist       = data_user_list
      EXCEPTIONS
        auth_misssing = 1
        OTHERS        = 2.
    IF sy-subrc <> 0.
* Implement suitable error handling here
      MESSAGE 'Error getting user session' TYPE 'E'.
    ENDIF.

    DATA(lt_delete_user) = data_user_list.
    CLEAR lt_delete_user.

* Filtering the session for the given user
    lt_delete_user = VALUE #( FOR ls_wa IN data_user_list WHERE
    ( bname = username ) ( ls_wa ) ).

    IF lt_delete_user IS INITIAL.

      WRITE : 'No Session is active in the system for the user', username.

    ELSE.

      logon_id = '1-'.

      LOOP AT lt_delete_user INTO DATA(ls_delete).

* Delete user session
        CALL FUNCTION 'TH_DELETE_USER' " DESTINATION 'AP1CLNT900'
          EXPORTING
            user     = ls_delete-bname
            client   = ls_delete-mandt
            tid      = ls_delete-tid
            logon_id = logon_id
          EXCEPTIONS
            OTHERS   = 1.

* Writing to the screen like a classical report
        IF sy-subrc = 0.
          WRITE : / ls_delete-bname , ls_delete-tid , 'Session deleted successfully'.
        ELSE.
          WRITE : / ls_delete-bname , ls_delete-tid , 'Session NOT deleted - ERROR'.
        ENDIF.

        CLEAR ls_delete.
      ENDLOOP.

    ENDIF.
  ENDIF.

  IF yours EQ abap_true.

    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        titlebar              = 'Do you really want to log off? '
*       DIAGNOSE_OBJECT       = ' '
        text_question         =
                                'Do you really want to log off all sessions'
        text_button_1         = 'Close all'
*       ICON_BUTTON_1         = ' '
*       text_button_2         = 'Dont close'
*       ICON_BUTTON_2         = ' '
*       DEFAULT_BUTTON        = '2'
        display_cancel_button = space
*       USERDEFINED_F1_HELP   = ' '
        start_column          = 25
        start_row             = 6
*       POPUP_TYPE            =
      IMPORTING
        answer                = ans
*    TABLES
*       PARAMETER             =
      EXCEPTIONS
        text_not_found        = 1
        OTHERS                = 2.
    CHECK ans = '1'.
    CALL 'SYST_LOGOFF'.

  ENDIF.
