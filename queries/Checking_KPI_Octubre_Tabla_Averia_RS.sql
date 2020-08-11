select * from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND ((fecho_detec >="2013-10-01 00:00:00" 
AND fecho_detec<= "2013-10-31 00:00:00") OR 
(fecho_repar >= "2013-10-01" AND fecho_repar<= "2013-10-31")) order by fecho_detec;

select count(averia_id) from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND ((fecho_detec >="2013-10-01 00:00:00" 
AND fecho_detec<= "2013-10-31 00:00:00") OR (fecho_repar >= "2013-10-01" 
AND fecho_repar<= "2013-10-31"));

select count(averia_id) from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND ((fecho_repar >="2013-10-01 00:00:00" 
AND fecho_repar<= "2013-10-31 00:00:00") OR (fecho_detec >="2013-10-01 00:00:00" 
AND fecho_detec<= "2013-10-31 00:00:00")) AND fecho_repar<>"0000-00-00 00:00:00" order by fecho_detec;

select count(averia_id) from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND 
(fecho_repar >= "2013-10-01" AND fecho_repar<= "2013-10-31") 
 order by fecho_detec;