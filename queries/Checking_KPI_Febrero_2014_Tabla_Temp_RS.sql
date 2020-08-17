select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share
where fecha >="2014-02-01" AND fecha<= "2014-02-28" order by fecha;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share
where fecha_completado is not NULL AND ((fecha >="2014-02-01" AND fecha<= "2014-02-28") OR 
(fecha_reprogramado >="2014-02-01" AND fecha_reprogramado <= "2014-02-28")) order by fecha;
select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share
where fecha_completado is NULL AND fecha >="2014-02-01" AND fecha<= "2014-02-28" order by fecha;
select * from Temp_preventivos_revenue_share
where fecha >="2014-02-01" AND fecha<= "2014-02-28" order by fecha;
select * from Temp_preventivos_revenue_share
where fecha_completado is not NULL AND fecha >="2014-02-01" AND fecha<= "2014-02-28" order by fecha;
select * from Temp_preventivos_revenue_share 
where fecha_completado is NULL AND fecha >="2014-02-01" AND fecha<= "2014-02-28" order by fecha;