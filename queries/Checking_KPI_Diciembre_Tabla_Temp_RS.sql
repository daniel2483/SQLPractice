select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share
where fecha >="2013-12-01" AND fecha<= "2013-12-31" order by fecha;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share 
where fecha_completado is not NULL AND fecha >="2013-12-01" AND fecha<= "2013-12-31" order by fecha;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share where fecha >="2013-12-01" AND cargado=0
AND fecha<= "2013-12-31" order by fecha,nemonico;
select * from Temp_preventivos_revenue_share where fecha >="2013-12-01" 
AND fecha<= "2013-12-31" order by fecha,nemonico;
select * from Temp_preventivos_revenue_share where fecha >="2013-12-01" 
AND fecha<= "2013-12-31" order by fecha,nemonico;