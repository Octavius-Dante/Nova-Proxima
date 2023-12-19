*&---------------------------------------------------------------------*
*& Report ZJOB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zjob.


* This program will schedule a job at 5am EST few hours before business starts.

* implement this oss note to send mail in future time
* https://userapps.support.sap.com/sap/support/knowledge/en/1601472

CONSTANTS : job_start_time  LIKE  sy-uzeit VALUE '050000'. " 5:00 am

DATA: number           TYPE tbtcjob-jobcount,
      name             TYPE tbtcjob-jobname VALUE 'SEND_MAIL_IST_6PM',
      print_parameters TYPE pri_params,
      job_start_date   TYPE sy-datum.

* Selection screen
PARAMETERS : job_date TYPE sy-datum.

START-OF-SELECTION.

  CALL FUNCTION 'JOB_OPEN'
    EXPORTING
      jobname          = name
    IMPORTING
      jobcount         = number
    EXCEPTIONS
      cant_create_job  = 1
      invalid_job_data = 2
      jobname_missing  = 3
      OTHERS           = 4.
  IF sy-subrc = 0.

* Program to send mail determining IST time on the date this program is execuetd in bg.job
    SUBMIT ztmz TO SAP-SPOOL
                      SPOOL PARAMETERS print_parameters
                      WITHOUT SPOOL DYNPRO
                      VIA JOB name NUMBER number
                      AND RETURN.

    IF sy-subrc = 0.
      job_start_date = job_date.
      CALL FUNCTION 'JOB_CLOSE'
        EXPORTING
          jobcount             = number
          jobname              = name
*         strtimmed            = 'X'
          sdlstrtdt            = job_start_date
          sdlstrttm            = job_start_time
        EXCEPTIONS
          cant_start_immediate = 1
          invalid_startdate    = 2
          jobname_missing      = 3
          job_close_failed     = 4
          job_nosteps          = 5
          job_notex            = 6
          lock_failed          = 7
          OTHERS               = 8.
      IF sy-subrc <> 0.
        MESSAGE 'Job schedule failed' TYPE 'E'.
      ENDIF.
    ELSE.
      MESSAGE 'Job submit failed' TYPE 'E'.
    ENDIF.
  ELSE.
    MESSAGE 'Job creation failed' TYPE 'E'.
  ENDIF.
