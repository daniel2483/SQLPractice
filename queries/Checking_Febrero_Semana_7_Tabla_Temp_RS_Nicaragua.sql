SELECT * FROM movistar_nic.Temp_preventivos_revenue_share where weekofyear(fecha)=7;
SELECT count(idTemp_preventivos_revenue_share) FROM movistar_nic.Temp_preventivos_revenue_share 
where weekofyear(fecha)=7;