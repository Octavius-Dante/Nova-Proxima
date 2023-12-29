
  METHOD loop_statements BY DATABASE PROCEDURE
                         FOR HDB LANGUAGE SQLSCRIPT.

    --for loop
    declare lv_sum int := 0;
    declare lv_indx int := 0;

    for lv_indx in 1..10
       do
           declare lv_tmp int := lv_sum;
           lv_tmp = lv_tmp + lv_indx;
           lv_sum = lv_tmp;
    end for;

    --while loop
    lv_indx = 0;
    while lv_indx <= 10
        do
            declare lv_tmp int := lv_sum;
            lv_tmp = lv_tmp + lv_indx;
            lv_sum = lv_tmp;
            lv_indx = lv_indx + 1;
    end while;


    --while loop with break
    lv_indx = 0;
    while lv_indx <= 1000
        do
            lv_indx = lv_indx + 1;
         if lv_indx = 10
            then break ;
         end if;
    end while;

* For loop records looping 

--loop on table data
lt_scarr  = select * from scarr
            where mandt = SESSION_CONTEXT('CLIENT');
for lv_indx in 1..record_count( :lt_scarr )
do lv_str = :lt_scarr.carrid[ lv_indx ];
end for;



  ENDMETHOD.