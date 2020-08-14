-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `update_completados_revenue_share`()
BEGIN
declare ESTACION varchar(45) ;
declare FECHA_DETEC datetime;
declare FECHA_COMPLET datetime;
declare id_tmp int;
DECLARE done int;
declare rsite_tmp int;
DECLARE cur_ CURSOR FOR select idTemp_preventivos_revenue_share, nemonico,fecha, fecha_completado from Temp_preventivos_revenue_share where cargado = 1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
OPEN cur_;

FETCH cur_ into id_tmp,ESTACION,FECHA_DETEC,FECHA_COMPLET;
      rep_open_loop:REPEAT
		if FECHA_COMPLET <> 0 and FECHA_COMPLET is not NULL then
			select site_id into rsite_tmp from site where rsite=ESTACION;
		if rsite_tmp is not NULL then
			update averia set cierre_cod_id =18, fecho_repar=FECHA_COMPLET where tipo_rep_id=2 and proceso_id=7 and gne_rep=rsite_tmp and fecho_detec=FECHA_DETEC;
		end if;
		end if;
		set done=0;
FETCH cur_ into id_tmp,ESTACION,FECHA_DETEC, FECHA_COMPLET;
      UNTIL done END repeat rep_open_loop;
close cur_;
END