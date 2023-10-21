*&---------------------------------------------------------------------*
*& Report ztest_609879_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_609879_01.

DATA: gr_table TYPE REF TO cl_salv_table.

PARAMETERS : p_fund TYPE ZTF_FUND_NO.

SELECT * FROM zcds_609879_03( TF_FUNDNO = @p_fund ) INTO TABLE @DATA(IT_FUND).

** FIRST OPTION : QUICK ALV DISPLAY for internal table
      cl_salv_table=>factory( IMPORTING r_salv_table = gr_table CHANGING t_table = IT_FUND ).
      gr_table->display( ).

** SECOND OPTION : QUICK ALV DISPLAY for CDS
*      cl_salv_gui_table_ida=>create_for_cds_view('ZCDS_609879_01')->fullscreen( )->display( ).