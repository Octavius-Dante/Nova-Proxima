  DATA lc_guid TYPE REF TO cl_abap_random_packed.
  DATA lv_seed TYPE i.
  DATA lv_guid TYPE p.

CALL METHOD cl_abap_random=>seed
  RECEIVING
    seed   = lv_seed.

  CALL METHOD cl_abap_random_packed=>create
   EXPORTING
      seed   = lv_seed
      min    = 1000000000
      max    = 9999999999
    RECEIVING
      prng   = lc_guid.

  lv_guid = lc_guid->get_next( ).