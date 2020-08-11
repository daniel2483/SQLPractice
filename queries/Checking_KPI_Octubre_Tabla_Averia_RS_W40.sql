select count(averia_id) from averia where (tipo_rep_id=2 AND proceso_id=7
AND informante_id=3 AND fecho_detec >="2013-09-29" AND fecho_detec<= "2013-10-05") 
OR (tipo_rep_id=2 AND proceso_id=7 AND informante_id=3 AND fecho_repar >="2013-09-29" 
AND fecho_repar<= "2013-10-05" AND fecho_detec <>0) order by fecho_detec;

select count(averia_id) from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND (fecho_repar >="2013-09-29" AND fecho_repar<= "2013-10-05");

select * from averia where (tipo_rep_id=2 AND proceso_id=7
AND informante_id=3 AND fecho_detec >="2013-09-29" AND fecho_detec<= "2013-10-05") 
OR (tipo_rep_id=2 AND proceso_id=7 AND informante_id=3 AND fecho_repar >="2013-09-29" 
AND fecho_repar<= "2013-10-05" AND fecho_detec <>0) order by fecho_detec;

select * from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND (fecho_repar >="2013-09-29" AND fecho_repar<= "2013-10-05") order by 
fecho_detec;


