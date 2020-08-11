select * from Temp_preventivos_infra where fecha>="2014-01-01" order by nemonico;

select count(idTemp_preventivos_infra) from Temp_preventivos_infra where fecha>="2014-01-01" 
order by fecha;

select count(idTemp_preventivos_infra) from Temp_preventivos_infra where completado=1 
AND fecha>="2014-01-01";

select * from Temp_preventivos_infra where fecha>="2014-01-01" AND fecha_completado is NULL order by nemonico;