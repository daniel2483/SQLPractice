select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share
where fecha >="2014-04-01" AND fecha<= "2014-04-31" order by fecha;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share
where fecha_completado is not NULL AND ((fecha >="2014-04-01" AND fecha<= "2014-04-31") OR 
(fecha_reprogramado >="2014-04-01" AND fecha_reprogramado <= "2014-04-31")) order by fecha;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share
where fecha_completado is NULL AND fecha >="2014-04-01" AND fecha<= "2014-04-31" order by fecha;
select * from Temp_preventivos_revenue_share
where fecha >="2014-04-01" AND fecha<= "2014-04-31" order by fecha;
select * from Temp_preventivos_revenue_share
where fecha_completado is not NULL AND fecha >="2014-04-01" AND fecha<= "2014-04-31" order by fecha;
select * from Temp_preventivos_revenue_share 
where fecha_completado is NULL AND fecha >="2014-04-01" AND fecha<= "2014-04-31" order by fecha;