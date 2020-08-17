SELECT * FROM averia where fecho_detec >="2014-09-01 00:00:00" AND fecho_detec <= "2014-09-30 00:00:00" 
AND estado_id in (1) AND prioridad_id<5 AND proceso_id=7 limit 100000000