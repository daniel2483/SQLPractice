select * from Temp_preventivos_infra where fecha >="2013-10-01" AND fecha <= "2013-10-31" order by fecha,nemonico limit 2000;

select count(idTemp_preventivos_infra) from Temp_preventivos_infra where fecha >="2013-10-01" 
AND fecha <= "2013-10-31" order by fecha,nemonico limit 2000;

select count(idTemp_preventivos_infra) from Temp_preventivos_infra where fecha >="2013-10-01" 
AND fecha <= "2013-10-31" AND completado=1 order by fecha,nemonico limit 2000;

select * from Temp_preventivos_infra where fecha >="2013-10-01" 
AND fecha <= "2013-10-31" AND completado=0 order by fecha,nemonico limit 2000;