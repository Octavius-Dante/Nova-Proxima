METHOD if_statements BY DATABASE PROCEDURE
                        FOR HDB LANGUAGE SQLSCRIPT
                        USING sflight.
  --Example for EXISTS
  declare lv_result int;  --data declaration
  declare lv_carrier constant nvarchar(2) := 'AA';
  
  if exists ( select carrid from sflight
              where carrid = :iv_carrid
              and   connid = :iv_connid )
      then lv_result = 1;
  elseif :iv_carrid in ( select carrid from sflight
                         where carrid = :iv_carrid
                         and   connid = :iv_connid )
      then lv_result = 2;
  end if;

  --Comparison between variables
  if :lv_carrier = :iv_carrid
      then lv_result = 1;
  end if;

  --IN
  if :iv_carrid IN ( 'AA', 'AB', 'AZ' )
      then lv_result = 1;
  end if;

ENDMETHOD.