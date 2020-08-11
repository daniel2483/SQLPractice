select count(idTemp_preventivos_infra) from Temp_preventivos_infra 
where cargado=1;
select count(idTemp_preventivos_infra) from Temp_preventivos_infra 
where cargado=0;
select * from Temp_preventivos_infra where cargado=0 order by fecha,nemonico;
select * from Temp_preventivos_infra where cargado=1 order by fecha,nemonico;
select * from Temp_preventivos_infra where fecha_completado is not NULL;
select * from Temp_preventivos_infra where fecha_completado is NULL;
select count(idTemp_preventivos_infra) from Temp_preventivos_infra 
where fecha_completado is not NULL;
select count(idTemp_preventivos_infra) from Temp_preventivos_infra 
where fecha_completado is NULL;
select * from Temp_preventivos_infra order by fecha limit 2000;
