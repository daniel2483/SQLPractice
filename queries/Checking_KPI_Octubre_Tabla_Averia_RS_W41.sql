select count(averia_id) from averia where (tipo_rep_id=2 AND proceso_id=7
AND informante_id=3 AND fecho_detec >="2013-10-06" AND fecho_detec<= "2013-10-12")
OR (tipo_rep_id=2 AND proceso_id=7 AND informante_id=3 AND fecho_repar >="2013-10-06" 
AND fecho_repar<= "2013-10-12" AND fecho_detec <>0);

select count(averia_id) from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND (fecho_repar >="2013-10-06" AND fecho_repar<= "2013-10-12");

select * from averia where (tipo_rep_id=2 AND proceso_id=7
AND informante_id=3 AND fecho_detec >="2013-10-06" AND fecho_detec<= "2013-10-12")
OR (tipo_rep_id=2 AND proceso_id=7 AND informante_id=3 AND fecho_repar >="2013-10-06" 
AND fecho_repar<= "2013-10-12" AND fecho_detec <>0) order by fecho_detec;

select * from averia where tipo_rep_id=2 AND proceso_id=7 AND informante_id=3 
AND (fecho_repar >="2013-10-06" AND fecho_repar<= "2013-10-12") order by fecho_detec;