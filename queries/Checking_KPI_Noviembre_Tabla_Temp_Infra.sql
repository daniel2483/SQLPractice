select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share
where fecha >="2013-11-01" AND fecha<= "2013-11-30" order by fecha;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where fecha_completado is not NULL AND fecha >="2013-11-01" AND fecha<= "2013-11-30" order by fecha;
select * from Temp_preventivos_revenue_share where fecha >="2013-11-01" 
AND fecha<= "2013-11-30" order by fecha,nemonico;
select * from Temp_preventivos_revenue_share where fecha >="2013-11-01" 
AND fecha<= "2013-11-30" order by fecha,nemonico;