select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where cargado=1;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where cargado=0;
select * from Temp_preventivos_revenue_share where cargado=0;
select * from Temp_preventivos_revenue_share where cargado=1;
select * from Temp_preventivos_revenue_share where fecha_completado is not NULL;
select * from Temp_preventivos_revenue_share where fecha_completado is NULL;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where completado = 0;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where completado = 1;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where fecha_completado is not NULL;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where fecha_completado is NULL;
select * from Temp_preventivos_revenue_share order by idTemp_preventivos_revenue_share;
select * from Temp_preventivos_revenue_share where weekofyear(fecha)=42 OR 
weekofyear(fecha_completado)=4 order by fecha,nemonico;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share where weekofyear(fecha)=42 OR 
weekofyear(fecha_completado)=42 order by fecha,nemonico;
