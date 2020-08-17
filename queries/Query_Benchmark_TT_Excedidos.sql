SELECT a.averia_id,b.rsite,c.nombre  FROM averia a, site b,prioridad c where fecho_detec >="2014-09-01 00:00:00" AND fecho_detec <= "2014-09-30 00:00:00" 
AND estado_id in (1,2) AND a.prioridad_id<5 AND proceso_id=7 AND a.gne_rep=b.site_id AND a.prioridad_id=c.prioridad_id 
AND a.tt_excedido=1
limit 100000000