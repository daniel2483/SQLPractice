select averia_id,informante_id,gne_rep,fecho_detec,fecho_recep,fecho_repar,
estado_id,proceso_id,texto,dept_repara_id,persona_id,tipo_rep_id,cierre_cod_id 
from averia where tipo_rep_id=2 AND proceso_id=5 AND informante_id=3;
select count(averia_id) from averia where tipo_rep_id=2 AND proceso_id=5 
AND informante_id=3;
select * from averia where tipo_rep_id=2 AND proceso_id=5 AND informante_id=3 
AND fecho_repar <> 0;
select count(averia_id) from averia where tipo_rep_id=2 AND proceso_id=5 
AND informante_id=3 AND fecho_repar <> 0;
select count(averia_id) from averia where tipo_rep_id=2 AND proceso_id=5 
AND informante_id=3 AND fecho_repar = 0;
select * from averia where tipo_rep_id=2 AND proceso_id=5 AND informante_id=3 
AND fecho_repar = 0;
select * from averia where tipo_rep_id=2 AND proceso_id=5 AND informante_id=3 order by fecho_detec;