select nemonico,fecha,fecha_completado,Id_nombre from Temp_preventivos_revenue_share where 
(fecha >= "2013-10-01" AND fecha <= "2013-10-31") OR (fecha_completado >= "2013-10-01" AND 
fecha_completado <= "2013-10-31") order by fecha,nemonico;

select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share where 
(fecha >= "2013-10-01" AND fecha <= "2013-10-31") OR 
(fecha_completado >= "2013-10-01" AND fecha_completado <= "2013-10-31");

select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share where 
(fecha >= "2013-10-01" AND fecha <= "2013-10-31") OR 
(fecha_completado >= "2013-10-01" AND fecha_completado <= "2013-10-31")
AND fecha<> "0000-00-00";

select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share where 
(fecha_completado >= "2013-10-01" AND fecha_completado <= "2013-10-31");

select * from Temp_preventivos_revenue_share where (fecha >= "2013-10-01" 
AND fecha <= "2013-10-31") OR (fecha_completado >= "2013-10-01" AND fecha_completado <= "2013-10-31")
order by fecha,nemonico;