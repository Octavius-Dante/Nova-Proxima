    WITH +hrp1018 AS ( SELECT objid ,
                              begda,
                              endda ,
                              tabnr FROM hrp1018
                              WHERE objid IN @s_objid ),
         +hrt1018_001 AS ( SELECT tabnr,
                 CASE tabseqnr WHEN @lc_001 THEN kokrs END AS kokrs_001,
                 CASE tabseqnr WHEN @lc_001 THEN kostl END AS kostl_001,
                 CASE tabseqnr WHEN @lc_001 THEN prozt END AS prozt_001,
                 CASE tabseqnr WHEN @lc_001 THEN aufnr END AS aufnr_001,
             CASE tabseqnr WHEN @lc_001 THEN fincode END AS fincode_001,
         CASE tabseqnr WHEN @lc_001 THEN budget_pd END AS budget_pd_001,
         CASE tabseqnr WHEN @lc_001 THEN fkber END AS fkber_001
     FROM hrt1018 WHERE tabnr IN ( SELECT DISTINCT tabnr FROM +hrp1018 )
                  AND   tabseqnr EQ @lc_001 ),
+hrt1018_002 AS ( SELECT tabnr,
     CASE tabseqnr WHEN @lc_002 THEN kokrs END AS kokrs_002,
     CASE tabseqnr WHEN @lc_002 THEN kostl END AS kostl_002,
     CASE tabseqnr WHEN @lc_002 THEN prozt END AS prozt_002,
     CASE tabseqnr WHEN @lc_002 THEN aufnr END AS aufnr_002,
     CASE tabseqnr WHEN @lc_002 THEN fincode END AS fincode_002,
     CASE tabseqnr WHEN @lc_002 THEN budget_pd END AS budget_pd_002,
     CASE tabseqnr WHEN @lc_002 THEN fkber END AS fkber_002
 FROM hrt1018 WHERE tabnr IN ( SELECT DISTINCT tabnr FROM +hrt1018_001 )
              AND   tabseqnr EQ @lc_002 ),

+hrt1018_003 AS ( SELECT tabnr,
 CASE tabseqnr WHEN @lc_003 THEN kokrs END AS kokrs_003,
 CASE tabseqnr WHEN @lc_003 THEN kostl END AS kostl_003,
 CASE tabseqnr WHEN @lc_003 THEN prozt END AS prozt_003,
 CASE tabseqnr WHEN @lc_003 THEN aufnr END AS aufnr_003,
 CASE tabseqnr WHEN @lc_003 THEN fincode END AS fincode_003,
 CASE tabseqnr WHEN @lc_003 THEN budget_pd END AS budget_pd_003,
 CASE tabseqnr WHEN @lc_003 THEN fkber END AS fkber_003
 FROM hrt1018 WHERE tabnr IN ( SELECT DISTINCT tabnr FROM +hrt1018_001 )
              AND   tabseqnr EQ @lc_003 ),

+hrt1018_004 AS ( SELECT tabnr,
 CASE tabseqnr WHEN @lc_004 THEN kokrs END AS kokrs_004,
 CASE tabseqnr WHEN @lc_004 THEN kostl END AS kostl_004,
 CASE tabseqnr WHEN @lc_004 THEN prozt END AS prozt_004,
 CASE tabseqnr WHEN @lc_004 THEN aufnr END AS aufnr_004,
 CASE tabseqnr WHEN @lc_004 THEN fincode END AS fincode_004,
 CASE tabseqnr WHEN @lc_004 THEN budget_pd END AS budget_pd_004,
 CASE tabseqnr WHEN @lc_004 THEN fkber END AS fkber_004
 FROM hrt1018 WHERE tabnr IN ( SELECT DISTINCT tabnr FROM +hrt1018_001 )
              AND   tabseqnr EQ @lc_004 ),

+hrt1018_005 AS ( SELECT tabnr,
 CASE tabseqnr WHEN @lc_005 THEN kokrs END AS kokrs_005,
 CASE tabseqnr WHEN @lc_005 THEN kostl END AS kostl_005,
 CASE tabseqnr WHEN @lc_005 THEN prozt END AS prozt_005,
 CASE tabseqnr WHEN @lc_005 THEN aufnr END AS aufnr_005,
 CASE tabseqnr WHEN @lc_005 THEN fincode END AS fincode_005,
 CASE tabseqnr WHEN @lc_005 THEN budget_pd END AS budget_pd_005,
 CASE tabseqnr WHEN @lc_005 THEN fkber END AS fkber_005
 FROM hrt1018 WHERE tabnr IN ( SELECT DISTINCT tabnr FROM +hrt1018_001 )
              AND   tabseqnr EQ @lc_005 ),

+hrt1018_006 AS ( SELECT tabnr,
 CASE tabseqnr WHEN @lc_006 THEN kokrs END AS kokrs_006,
 CASE tabseqnr WHEN @lc_006 THEN kostl END AS kostl_006,
 CASE tabseqnr WHEN @lc_006 THEN prozt END AS prozt_006,
 CASE tabseqnr WHEN @lc_006 THEN aufnr END AS aufnr_006,
 CASE tabseqnr WHEN @lc_006 THEN fincode END AS fincode_006,
 CASE tabseqnr WHEN @lc_006 THEN budget_pd END AS budget_pd_006,
 CASE tabseqnr WHEN @lc_006 THEN fkber END AS fkber_006
 FROM hrt1018 WHERE tabnr IN ( SELECT DISTINCT tabnr FROM +hrt1018_001 )
              AND   tabseqnr EQ @lc_006 ),

+result1 AS ( SELECT g~objid, g~begda,g~endda ,a~tabnr , a~kokrs_001 ,a~kostl_001 ,a~prozt_001 ,a~aufnr_001,a~fincode_001,a~budget_pd_001,a~fkber_001,
b~kokrs_002 ,b~kostl_002 ,b~prozt_002 ,b~aufnr_002,b~fincode_002,b~budget_pd_002,b~fkber_002,
c~kokrs_003 ,c~kostl_003 ,c~prozt_003 ,c~aufnr_003,c~fincode_003,c~budget_pd_003,c~fkber_003,
d~kokrs_004 ,d~kostl_004 ,d~prozt_004 ,d~aufnr_004,d~fincode_004,d~budget_pd_004,d~fkber_004,
e~kokrs_005 ,e~kostl_005 ,e~prozt_005 ,e~aufnr_005,e~fincode_005,e~budget_pd_005,e~fkber_005,
f~kokrs_006 ,f~kostl_006 ,f~prozt_006 ,f~aufnr_006,f~fincode_006,f~budget_pd_006,f~fkber_006

FROM +hrp1018 AS g
LEFT OUTER JOIN +hrt1018_001 AS a ON g~tabnr = a~tabnr
LEFT OUTER JOIN +hrt1018_002 AS b ON a~tabnr = b~tabnr
LEFT OUTER JOIN +hrt1018_003 AS c ON a~tabnr = c~tabnr
LEFT OUTER JOIN +hrt1018_004 AS d ON a~tabnr = d~tabnr
LEFT OUTER JOIN +hrt1018_005 AS e ON a~tabnr = e~tabnr
LEFT OUTER JOIN +hrt1018_006 AS f ON a~tabnr = f~tabnr

)
SELECT * FROM +result1 ORDER BY objid INTO TABLE @DATA(lt_out_hrt). "tabnr