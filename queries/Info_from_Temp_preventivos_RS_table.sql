select * from Temp_preventivos_revenue_share;

select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share where fecha_completado is not NULL;

select count(idTemp_preventivos_revenue_share) from Temp_preventivos_revenue_share where fecha_completado is NULL;