SELECT * FROM movistar_nic.averia where weekofyear(fecho_detec)=8 
and (weekofyear(fecho_repar)=8 OR fecho_repar =0) AND proceso_id=5 AND tipo_rep_id=2;

SELECT count(averia_id) FROM movistar_nic.averia where weekofyear(fecho_detec)=8 
and (weekofyear(fecho_repar)=8 OR fecho_repar =0) AND proceso_id=5 AND tipo_rep_id=2;