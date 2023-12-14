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
target_timestamp = cl_abap_tstmp=>add( tstmp = est_time_stamp secs = lv_total_secs ).

BREAK-POINT.

*lo_send_request->send_request->set_send_at( target_timestamp ).
*lo_send_request->send( space ).
