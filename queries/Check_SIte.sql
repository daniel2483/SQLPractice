select count(site_id)  from site where rsite="NG-10013-00";

select * from site where rsite like "NG-10013-00" OR rsite like "410340" OR rsite like "410250" 
OR rsite like "410238" OR rsite like "NG-10012-00" OR rsite like "NG-10013-00" OR rsite like
"NG-10099-00" OR rsite like "NG-10098-00" OR rsite like "410837" OR rsite like "NG-10016-00" OR 
rsite like "NG-10025-01" OR rsite like "NG-10027-00";

select * from Temp_preventivos_infra where cargado=0 order by idTemp_preventivos_infra;
