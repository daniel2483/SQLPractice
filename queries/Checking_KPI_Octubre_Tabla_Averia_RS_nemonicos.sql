select averia_id,(select rsite from site where site_id=gne_rep) as nemonico,gne_rep,fecho_detec,fecho_repar,
tipo_rep_id,persona_id,cierre_cod_id from averia where tipo_rep_id=2 AND proceso_id=7 
AND informante_id=3 AND fecho_detec >="2013-10-01 00:00:00" 
AND fecho_detec<= "2013-10-31 00:00:00" order by fecho_detec;

select averia_id,gne_rep,fecho_detec,fecho_repar,tipo_rep_id,persona_id,cierre_cod_id 
from averia where tipo_rep_id=2 AND proceso_id=7 AND informante_id=3 
AND fecho_detec >="2013-10-01 00:00:00" AND fecho_detec<= "2013-10-31 00:00:00" 
order by fecho_detec;