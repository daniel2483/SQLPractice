select count(averia_id) from averia where (tipo_rep_id=2 AND proceso_id=7
AND informante_id=3 AND weekofyear(fecho_detec)= 44)
OR (tipo_rep_id=2 AND proceso_id=7 AND informante_id=3 AND weekofyear(fecho_repar)= 44
AND fecho_detec <>0);

select count(averia_id) from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND (weekofyear(fecho_repar)= 44);

select * from averia where (tipo_rep_id=2 AND proceso_id=7
AND informante_id=3 AND weekofyear(fecho_detec)= 44)
OR (tipo_rep_id=2 AND proceso_id=7 AND informante_id=3 AND weekofyear(fecho_repar)= 44
AND fecho_detec <>0) order by fecho_detec;

select * from averia where tipo_rep_id=2 AND proceso_id=7 AND informante_id=3 
AND (weekofyear(fecho_repar)= 44) order by fecho_detec;