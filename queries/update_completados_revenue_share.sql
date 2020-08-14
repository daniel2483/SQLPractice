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
declare FECHA_REPROG datetime;
declare FECHA_TEMP datetime;
declare id_tmp int;
DECLARE done int;
declare rsite_tmp int;
DECLARE cur_ CURSOR FOR select idTemp_preventivos_revenue_share,nemonico,fecha,fecha_reprogramado,fecha_completado from Temp_preventivos_revenue_share where cargado = 1 AND completado = 1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
OPEN cur_;

-- SELECT 'Message Text' AS `Title`;

FETCH cur_ into id_tmp,ESTACION,FECHA_DETEC,FECHA_REPROG,FECHA_COMPLET;
      rep_open_loop:REPEAT

		SET FECHA_TEMP = FECHA_DETEC;
		-- Se actualiza la fecha de Ejecucion (Reparacion) del MP RS Guatemala
		if FECHA_COMPLET <> 0 and FECHA_COMPLET is not NULL then
			select site_id into rsite_tmp from site where rsite = ESTACION;
		if rsite_tmp is not NULL then
			-- select id_tmp,ESTACION,FECHA_DETEC,FECHA_COMPLET from Temp_preventivos_revenue_share;
			update averia set cierre_cod_id =18, fecho_repar=FECHA_COMPLET where tipo_rep_id=2 and proceso_id=7 and gne_rep=rsite_tmp and fecho_detec=FECHA_DETEC;
		end if;
		end if;

		-- Se actualiza la fecha de Programacion del MP RS Guatemala con la fecha de Reprogramacion.
		if FECHA_REPROG <> 0 and FECHA_REPROG is not NULL then
			select site_id into rsite_tmp from site where rsite = ESTACION;
		if rsite_tmp is not NULL then
			select id_tmp,ESTACION,FECHA_DETEC,FECHA_COMPLET from Temp_preventivos_revenue_share;
			update averia set fecho_detec=FECHA_REPROG where tipo_rep_id=2 and proceso_id=7 and gne_rep=rsite_tmp and fecho_detec=FECHA_TEMP;
		end if;
		end if;			
		set done=0;
FETCH cur_ into id_tmp,ESTACION,FECHA_DETEC,FECHA_REPROG,FECHA_COMPLET;
      UNTIL done END repeat rep_open_loop;
close cur_;
END