select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where (weekofyear(fecha)= 44) OR (weekofyear(fecha_completado)=44 AND fecha <>0) order by fecha;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where fecha_completado is not NULL AND (weekofyear(fecha_completado)=44) order by fecha;

select * from Temp_preventivos_revenue_share 
where (weekofyear(fecha)= 44) OR (weekofyear(fecha_completado)=44 AND fecha <>0) order by fecha;
select * from Temp_preventivos_revenue_share 
where fecha_completado is not NULL AND (weekofyear(fecha_completado)=44) order by fecha;

select * from Temp_preventivos_revenue_share where weekofyear(fecha)=44
order by fecha,nemonico;

select * from Temp_preventivos_revenue_share 
where fecha_completado is not NULL AND (weekofyear(fecha_completado)=44) order by fecha,nemonico;