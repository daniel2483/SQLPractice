select count(idTemp_preventivos_infra) from Temp_preventivos_infra 
where fecha >="2013-08-01" AND fecha<= "2013-08-31" order by fecha;
select count(idTemp_preventivos_infra) from Temp_preventivos_infra 
where fecha_completado is not NULL AND fecha >="2013-08-01" AND fecha<= "2013-08-31" order by fecha;
select * from Temp_preventivos_infra where fecha >="2013-08-01" AND fecha<= "2013-08-31" 
order by fecha,nemonico;
select * from Temp_preventivos_infra where fecha_completado is NULL 
AND fecha >="2013-08-01" AND fecha<= "2013-08-31" order by fecha,nemonico;