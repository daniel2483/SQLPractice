select count(idTemp_preventivos_infra) from Temp_preventivos_infra
where (weekofyear(fecha)= 46) OR (weekofyear(fecha_completado)=46 AND fecha <>0) order by fecha;
select count(idTemp_preventivos_infra) from Temp_preventivos_infra
where fecha_completado is not NULL AND (weekofyear(fecha_completado)=46) order by fecha;

select * from Temp_preventivos_infra
where (weekofyear(fecha)= 46) OR (weekofyear(fecha_completado)=46 AND fecha <>0) order by fecha;
select * from Temp_preventivos_infra
where fecha_completado is not NULL AND (weekofyear(fecha_completado)=46) order by fecha;

select * from Temp_preventivos_infra where weekofyear(fecha)=46
order by fecha,nemonico;

select * from Temp_preventivos_infra 
where fecha_completado is not NULL AND (weekofyear(fecha_completado)=46) order by fecha,nemonico;


select * from Temp_preventivos_infra order by idTemp_preventivos_infra limit 3000;

