select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where (fecha >="2013-09-29" AND fecha<= "2013-10-05") OR (fecha_completado >="2013-09-29" 
AND fecha_completado<= "2013-10-05" AND fecha <>0)
order by fecha;

select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where fecha_completado is not NULL AND 
((fecha >="2013-09-29" AND fecha<= "2013-10-05") OR (fecha_completado >="2013-09-29" 
AND fecha_completado<= "2013-10-05")) order by fecha;

select * from Temp_preventivos_revenue_share where (fecha >="2013-09-29" AND fecha<= "2013-10-05")
order by fecha,nemonico;

select * from Temp_preventivos_revenue_share where fecha_completado is not NULL AND 
((fecha >="2013-09-29" AND fecha<= "2013-10-05") OR (fecha_completado >="2013-09-29" 
AND fecha_completado<= "2013-10-05")) order by fecha,nemonico;