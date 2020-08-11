select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where (fecha >="2013-10-06" AND fecha<= "2013-10-12") OR (fecha_completado >="2013-10-06" 
AND fecha_completado<= "2013-10-12" AND fecha <>0) order by fecha;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where fecha_completado is not NULL AND (fecha_completado >="2013-10-06" 
AND fecha_completado<= "2013-10-12") order by fecha;
select * from Temp_preventivos_revenue_share where (fecha >="2013-10-06" AND fecha<= "2013-10-12") 
OR (fecha_completado >="2013-10-06" AND fecha_completado<= "2013-10-12" AND fecha <>0) 
order by fecha,nemonico;
select * from Temp_preventivos_revenue_share where fecha_completado is NULL 
AND fecha >="2013-12-06" AND fecha<= "2013-10-12" order by fecha,nemonico;
select * from Temp_preventivos_revenue_share where fecha >="2013-10-06" AND fecha<= "2013-10-12" 
order by fecha,nemonico;