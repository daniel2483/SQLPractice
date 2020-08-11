select * from Temp_preventivos_infra;

select count(idTemp_preventivos_infra) from Temp_preventivos_infra where fecha_completado is not NULL;

select count(idTemp_preventivos_infra) from Temp_preventivos_infra where fecha_completado is NULL;