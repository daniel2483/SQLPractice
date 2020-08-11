select count(idTemp_preventivos_infra) from Temp_preventivos_infra
where (weekofyear(fecha)= 47) OR (weekofyear(fecha_completado)=47 AND fecha <>0) order by fecha;
select count(idTemp_preventivos_infra) from Temp_preventivos_infra
where fecha_completado is not NULL AND (weekofyear(fecha_completado)=47) order by fecha;

select * from Temp_preventivos_infra
where (weekofyear(fecha)= 47) OR (weekofyear(fecha_completado)=47 AND fecha <>0) order by fecha;
select * from Temp_preventivos_infra
where fecha_completado is not NULL AND (weekofyear(fecha_completado)=47) order by fecha;

select * from Temp_preventivos_infra where weekofyear(fecha)=47
order by fecha,nemonico;

select * from Temp_preventivos_infra 
where fecha_completado is not NULL AND (weekofyear(fecha_completado)=47) order by fecha,nemonico;


