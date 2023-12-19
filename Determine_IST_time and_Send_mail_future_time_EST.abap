*&---------------------------------------------------------------------*
*& Report ZTMZ
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztmz.

* schedule this mail sending program
* as a JOB 3 hours before business hours of EST

DATA: utc_time_stamp   TYPE timestamp,
      est_time_stamp   TYPE timestamp,
      target_timestamp TYPE timestamp,
      timezone_date    TYPE d,
      timezone_time    TYPE t,
      ind_target_time  TYPE t,
      ind_calc_time    TYPE t,
      minutes_time     TYPE i,
      seconds_time     TYPE i,
      time_zone        TYPE ttzz-tzone.

DATA : lv_hours        TYPE i,
       lv_mins         TYPE i,
       lv_secs         TYPE i,
       lv_total_secs   TYPE i,
       lv_total_mins   TYPE i,
       lo_send_request TYPE REF TO cl_bcs.


* MAIL SENDING VARIABLES
CONSTANTS:
  lc_subject TYPE so_obj_des VALUE 'Email using CL_BCS Class',
  lc_raw     TYPE char03     VALUE 'RAW'.

DATA:
  lv_mlrec         TYPE so_obj_nam,
  lv_sent_to_all   TYPE os_boolean,
  lv_email         TYPE adr6-smtp_addr,
  lv_subject       TYPE so_obj_des,
  lv_text          TYPE bcsy_text,
  lr_send_request  TYPE REF TO cl_bcs,
  lr_bcs_exception TYPE REF TO cx_bcs,
  lr_recipient     TYPE REF TO if_recipient_bcs,
  lr_sender        TYPE REF TO cl_sapuser_bcs,
  lr_document      TYPE REF TO cl_document_bcs.


time_zone = 'INDIA'.

* Retrieving time stamp of UST.
GET TIME STAMP FIELD utc_time_stamp.

* TO GET IST TIME
CONVERT TIME STAMP utc_time_stamp TIME ZONE time_zone
          INTO DATE timezone_date TIME timezone_time.

* Representation of 6'o clock 24 hours
ind_target_time = '180000'.

* Time difference between target time and current time
ind_calc_time = ind_target_time - timezone_time.

lv_hours = ind_calc_time+0(2).
lv_mins  = ind_calc_time+2(2).
lv_secs  = ind_calc_time+4(2).

* get minutes of the mentioned time
lv_hours = lv_hours * 60. " converting hours to minutes
lv_total_mins = lv_hours + lv_mins.

* get seconds for the given minutes
lv_total_mins = lv_total_mins * 60. " converting minutes to seconds
lv_total_secs = lv_total_mins + lv_secs.

time_zone = 'EST'.

* TO GET EST TIME STAMP
CONVERT TIME STAMP utc_time_stamp TIME ZONE time_zone
          INTO DATE timezone_date TIME timezone_time.

CONCATENATE timezone_date timezone_time INTO DATA(lv_temp).
est_time_stamp = lv_temp.

* Send the mail at delayed time based on seconds counter
target_timestamp = cl_abap_tstmp=>add( tstmp = est_time_stamp  secs = lv_total_secs ).

*lo_send_request->send_request->set_send_at( target_timestamp ).
*lo_send_request->send( space ).

TRY.
    "Create send request
    lr_send_request = cl_bcs=>create_persistent( ).
    lr_send_request->send_request->set_send_at( target_timestamp ).

    "Email From
    lr_sender = cl_sapuser_bcs=>create( sy-uname ).

    "Add sender to send request
    CALL METHOD lr_send_request->set_sender
      EXPORTING
        i_sender = lr_sender.

    "Email To...
    lv_email = 'sample@xyz.com'.
    lr_recipient = cl_cam_address_bcs=>create_internet_address( lv_email ).

    "Add recipient to send request
    CALL METHOD lr_send_request->add_recipient
      EXPORTING
        i_recipient = lr_recipient
        i_express   = 'X'.

    "Email BODY
    APPEND 'Sample ABAP email using Class CL_BCS!' TO lv_text.
    lr_document = cl_document_bcs=>create_document(
                    i_type    = lc_raw
                    i_text    = lv_text
                    i_subject = lc_subject ).

    "Add document to send request
    CALL METHOD lr_send_request->set_document( lr_document ).

    "Send email
    CALL METHOD lr_send_request->send(
      EXPORTING
        i_with_error_screen = 'X'
      RECEIVING
        result              = lv_sent_to_all ).
    IF lv_sent_to_all = 'X'.
      WRITE 'Email sent successully!'.
    ENDIF.

    "Commit to send email
    COMMIT WORK.          "MANDATORY*

    "Exception handling
  CATCH cx_bcs INTO lr_bcs_exception.
    WRITE:
      'Error!',
      'Error type:',
      lr_bcs_exception->error_type.
ENDTRY.
