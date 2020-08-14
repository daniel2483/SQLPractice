-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `upload_preventivo_revenue_share`()
BEGIN
declare FECHA_DETEC datetime;
declare OPERACION varchar(45) ;
declare NAME varchar(45) ;
declare ESTACION varchar(45) ;
declare NE_NOMBRE varchar(45) ;
declare NE_NOM_GRUPO varchar(45) ;
declare NE_DEPARTAMENTO varchar(45) ;
declare NUMERO_ALARMA varchar(45) ;
declare TEXTO_ALARMA varchar(45) default 'Mantenimiento preventivo de sitio' ;

declare cod_proceso int default 7; # Revenue_share
declare cod_texto int default 77; # N/A
declare tt_ref varchar(15) default 'NA';
declare cod_prioridad int default 6; #prioridad solicitud para nicaragua

declare cod_responsable int default 1; # el respansable hay que averiguarlo

declare rep_publico varchar(5) default 'True'; #reporte publico

declare cod_tipo_reporte int default 2; #reporte preventivo;
declare cod_site int;
declare id_tmp int;
declare complet bit;
declare cod_cierre int; #_18 Preventivo Ejecutado  y _19 Preventivo Incompleto



DECLARE done int;

DECLARE cur_ CURSOR FOR select idTemp_preventivos_revenue_share, nemonico, completado, fecha from Temp_preventivos_revenue_share where cargado <> 1;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

OPEN cur_;

FETCH cur_ into id_tmp,ESTACION,complet,FECHA_DETEC;
		
		rep_open_loop:REPEAT

		if complet = 0 then
		set cod_cierre = 19;  # Preventivo Incompleto
		elseif complet = 1 then
		set cod_cierre =18;  # Preventivo ejecutado
		end if;

        if ESTACION <>'' then
           select site_id into cod_site from site where rsite like concat('I',ESTACION);
		if cod_site <>'' then
        call Create_report(cod_site,FECHA_DETEC,cod_cierre,cod_proceso,cod_texto,TEXTO_ALARMA,tt_ref,cod_prioridad,cod_responsable,rep_publico,cod_tipo_reporte);
		update Temp_preventivos_revenue_share set cargado =1 where id_tmp;
       end if;

    end if;
	set done=0;
		FETCH cur_ into id_tmp,ESTACION,complet,FECHA_DETEC;


      UNTIL done END repeat rep_open_loop;

close cur_;

END