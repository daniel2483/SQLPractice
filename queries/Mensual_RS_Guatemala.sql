select * from movistar_gua.averia
where estado_id=1 AND proceso_id=7 AND
texto_id=77 and texto="Mantenimiento preventivo de sitio" AND
fecho_detec >= "2014-06-01 00:00:00" AND fecho_detec <= "2014-06-31 00:00:00" 
order by averia_id asc limit 1000;

select a.averia_id, b.rsite, a.fecho_detec, a.fecho_repar from movistar_gua.averia as a, movistar_gua.site as b 
where a.gne_rep=b.site_id AND estado_id=1 AND proceso_id=7 
AND texto_id=77 and texto="Mantenimiento preventivo de sitio" AND
fecho_detec >= "2014-06-01 00:00:00" AND fecho_detec <= "2014-06-31 00:00:00" order by b.rsite desc limit 1000;