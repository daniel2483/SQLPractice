select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where (fecha >="2013-10-13" AND fecha<= "2013-10-19") OR (fecha_completado >="2013-10-13" 
AND fecha_completado<= "2013-10-19" AND fecha <>0)
order by fecha;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where fecha_completado is not NULL AND 
(fecha_completado >="2013-10-13" AND fecha_completado<= "2013-10-19") order by fecha;
select * from Temp_preventivos_revenue_share where (fecha >="2013-10-13" AND fecha<= "2013-10-19") 
OR (fecha_completado >="2013-10-13" AND fecha_completado<= "2013-10-19" AND fecha <>0) 
order by fecha,nemonico;
select * from Temp_preventivos_revenue_share where fecha_completado is NULL 
AND fecha >="2013-19-13" AND fecha<= "2013-10-19" order by fecha,nemonico;
select * from Temp_preventivos_revenue_share where fecha >="2013-10-13" AND fecha<= "2013-10-19" 
order by fecha,nemonico;