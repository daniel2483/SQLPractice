select * from Temp_preventivos_revenue_share where fecha>="2014-01-01" order by fecha;

select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share where fecha>="2014-01-01" 
order by fecha;

select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share where completado=1 
AND fecha>="2014-01-01";