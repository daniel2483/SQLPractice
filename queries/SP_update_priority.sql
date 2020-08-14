-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `movistar_gua`.`update_priority` ()
-- SP creado para hacer el update de prioridad a los TT
-- Almacenados en la tabla Temp_cambio_prioridad
BEGIN

DECLARE sitio_id int(10);
DECLARE tt int(10);
DECLARE prioridad int(10);
DECLARE idTemp int(10);
DECLARE done int;
DECLARE Tmax double;
DECLARE cur_ CURSOR FOR select idTemp_cambio_prioridad,averia_id,prioridad_id from Temp_cambio_prioridad where cambio=0;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

OPEN cur_;

FETCH cur_ into idTemp,tt,prioridad;
	rep_open_loop:REPEAT

	-- select averia_id,gne_rep,t_max,prioridad_id,tt_excedido from averia where averia_id=tt;
	
	-- Obtengo el site_id de una averia (TT)
	select gne_rep into sitio_id from averia where averia_id=tt; 
	
	if sitio_id is not NULL then
		-- Obtengo el tiempo maximo según prioridad (incluye excepciones)
		set Tmax = Get_time_per_priority_and_site(sitio_id,prioridad);
		
		-- Actualizo los campos t_max y prioridad_id de la tabla averia
		update averia set t_max=Tmax,prioridad_id=prioridad where averia_id=tt;

		-- El cambio se ha registrado en la Tabla averia
		update Temp_cambio_prioridad set cambio=1 where averia_id=tt;

		-- Se actualiza la bandera tt_excedido
		call Calcula_tiempo_efectivo_reporte(tt);
		-- select Tmax; -- Print de variable para Debugging
		-- select averia_id,gne_rep,t_max,prioridad_id,tt_excedido from averia where averia_id=tt;
	end if;
	
	set done=0;
FETCH cur_ into idTemp,tt,prioridad;
	UNTIL done END repeat rep_open_loop;

CLOSE cur_;

END