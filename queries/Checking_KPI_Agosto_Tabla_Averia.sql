select count(averia_id) from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND fecho_detec >="2013-08-01 00:00:00" 
AND fecho_detec<= "2013-08-31 00:00:00" order by fecho_detec;

select count(averia_id) from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND fecho_repar <> 0 AND fecho_detec>="2013-08-01 00:00:00" 
AND fecho_detec<="2013-08-31 00:00:00" order by fecho_detec;

select * from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND fecho_detec >="2013-08-01 00:00:00" 
AND fecho_detec<= "2013-08-31 00:00:00" order by fecho_detec;

select * from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND fecho_repar <> 0 AND fecho_detec>="2013-08-01 00:00:00" 
AND fecho_detec<="2013-08-31 00:00:00" order by fecho_detec;