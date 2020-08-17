SELECT * FROM movistar_gua.averia where weekofyear(fecho_detec)=7 
and (weekofyear(fecho_repar)=7 OR fecho_repar =0) AND proceso_id=7 AND tipo_rep_id=2;

SELECT count(averia_id) FROM movistar_gua.averia where weekofyear(fecho_detec)=7 
and (weekofyear(fecho_repar)=7 OR fecho_repar =0) AND proceso_id=7 AND tipo_rep_id=2;