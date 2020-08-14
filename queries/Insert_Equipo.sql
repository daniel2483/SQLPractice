-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `Insert_equipo_mtr`()
BEGIN
-- Procedure para Cargar Datos de la Tabla tem_claro_cr.sitios_metro a la tabla 
-- claro_cr.equipo

	-- Variables de columnas
	DECLARE temp_sitio_id int(11);
	DECLARE temp_nemonico_id varchar(45);
	DECLARE temp_tipo_sitio varchar(45);
	DECLARE temp_placa varchar(80);
	DECLARE temp_nombre_activo varchar(45);
	DECLARE temp_area varchar(45);
	DECLARE temp_cantidad int;
	DECLARE temp_banda varchar(45); 
	DECLARE temp_gabinete varchar(45);
	DECLARE temp_marca varchar(45); 
	DECLARE temp_modelo varchar(45);
	DECLARE temp_serie varchar(45);
	DECLARE temp_configuracion varchar(45);
	DECLARE temp_sectores varchar(45);
	DECLARE temp_antena varchar(45);
	DECLARE temp_tipo varchar(160);
	DECLARE temp_radios varchar(45);
	DECLARE temp_altura varchar(45);
	DECLARE temp_capacidad varchar(45);
	DECLARE temp_no_circuitos varchar(45);
	DECLARE temp_breaker_principal varchar(45);
	DECLARE temp_feeder varchar(45);
	DECLARE temp_lineas_FO varchar(45);
	DECLARE temp_no_medidor varchar(45);
	DECLARE temp_no_localizacion varchar(45);
	DECLARE temp_observaciones varchar(45);
	DECLARE temp_cargado bit;

	-- Variables de IDs
	DECLARE temp_codigo_area int(11);
	DECLARE temp_codigo_categoria int(11);
	DECLARE temp_codigo_site int(11);
	DECLARE temp_codigo_tipo int(11);

	-- Variables Seteadas
	DECLARE temp_codigo_estado int default 2;   -- En sitio
	DECLARE temp_codigo_proyecto int default 3; -- CLARO CENTRAL FASE I
	DECLARE temp_codigo_equipo_tipo_kit int default 0; -- N/A
	DECLARE temp_codigo_tipo_unidad int default 0; -- N/A
	DECLARE temp_codigo_persona int default 0; -- N/A
	DECLARE temp_valor_unidad double default 0; -- Valor 0 debido a que es la primera insercion
	DECLARE temp_consumible bit default 0; -- No consumible
	DECLARE temp_activo bit default 1; -- Es un equipo activo (no se descarta de las consultas)

	
	DECLARE done int;
	declare rsite_tmp int;
	DECLARE cur_ CURSOR FOR select 	sitios_metro_id,
									nemonico_id,
									Tipo_sitio,
									Placa,
									Nombre_Activo,
									Area,
									Cantidad,
									Banda,
									Gabinete,
									Marca,
									Modelo,
									Serie,
									Configuracion,
									Sectores,
									Antena,
									Tipo,
									Radios,
									Altura,
									Capacidad,
									No_circuitos,
									Breaker_principal,
									Feeder,
									Lineas_FO,
									No_medidor,
									No_localizacion,
									Observaciones,
									Cargado from tem_claro_cr.sitios_metro where cargado = 0;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	OPEN cur_;

	FETCH cur_ into temp_sitio_id,
					temp_nemonico_id,
					temp_tipo_sitio,
					temp_placa,
					temp_nombre_activo,
					temp_area,
					temp_cantidad,
					temp_banda,
					temp_gabinete,
					temp_marca,
					temp_modelo,
					temp_serie,
					temp_configuracion,
					temp_sectores,
					temp_antena,
					temp_tipo,
					temp_radios,
					temp_altura,
					temp_capacidad,
					temp_no_circuitos,
					temp_breaker_principal,
					temp_feeder,
					temp_lineas_FO,
					temp_no_medidor,
					temp_no_localizacion,
					temp_observaciones,
					temp_cargado;
      rep_open_loop:REPEAT
		
		-- select Nombre_de_Activo,Area,Cantidad,Banda,Marca,Modelo,Serie,Configuracion,Sectores into temp_nombre_act,temp_area,temp_cantidad,temp_banda,temp_marca,temp_modelo,temp_serie,temp_configuracion,temp_sectores from tem_claro_cr.sitios_metro;

		SET temp_codigo_tipo_unidad=0; -- Inicializo la variable en el Loop
		SET temp_codigo_area = Get_id_codigo_area(temp_area);
		SET temp_codigo_categoria = Get_id_codigo_categoria(temp_nombre_activo);
		SET temp_codigo_site = Get_id_codigo_site(temp_nemonico_id);
		SET temp_codigo_tipo = Get_id_codigo_tipo(CONCAT(temp_nombre_activo,temp_modelo));


		IF (trim(temp_altura)<>'') then
			SET temp_codigo_tipo_unidad=1; -- Metros debido a que es una medicion de altura
		end IF;

		-- Si hay una medida de capacidad poner temp_codigo_tipo_unidad como amperios

		IF(trim(temp_capacidad) LIKE '%A%' OR trim(temp_capacidad) LIKE '%AMP%' OR
		   trim(temp_capacidad) LIKE '%A' OR trim(temp_capacidad) LIKE '%AMP') then
			SET temp_codigo_tipo_unidad=2; -- A amperios		
		end IF;

		IF (trim(temp_capacidad) LIKE '%APH%' OR 
			trim(temp_capacidad) LIKE '%AH%' OR 
			trim(temp_capacidad) LIKE '%AMP/h%' OR
			trim(temp_capacidad) LIKE '%APH' OR 
			trim(temp_capacidad) LIKE '%AH' OR 
			trim(temp_capacidad) LIKE '%AMP/h') then
			SET temp_codigo_tipo_unidad=7; -- APH amperios por hora	
		end IF;

		IF (trim(temp_capacidad) LIKE '%V%' OR trim(temp_capacidad) LIKE 'V%' OR trim(temp_capacidad) LIKE '%V') then
			SET temp_codigo_tipo_unidad=3; -- V voltios
		end IF;

		IF (trim(temp_capacidad) LIKE '%BTU%' OR trim(temp_capacidad) LIKE '%BTU' OR
			trim(temp_capacidad) LIKE 'BTU%') then
			SET temp_codigo_tipo_unidad=6; -- BTU British Thermal unit
		end IF;

		IF (trim(temp_capacidad) LIKE '%FO%' OR trim(temp_capacidad) LIKE '%FO') then
			SET temp_codigo_tipo_unidad=8; -- FO Fibra optica
		end IF;

		IF (trim(temp_capacidad) LIKE '%W%' OR trim(temp_capacidad) LIKE '%W') then
			SET temp_codigo_tipo_unidad=9; -- Watts 
		end IF;

		IF (trim(temp_capacidad) LIKE '%puertos%' OR trim(temp_capacidad) LIKE '%puertos') then
			SET temp_codigo_tipo_unidad=10; -- puertos
		end IF;

		IF (trim(temp_capacidad) LIKE '%enlaces%' OR trim(temp_capacidad) LIKE '%enlaces') then
			SET temp_codigo_tipo_unidad=11; -- enlaces
		end IF;

--		select 	temp_sitio_id,temp_codigo_site,temp_codigo_estado,
--				temp_codigo_categoria,temp_codigo_tipo,temp_codigo_area,
--				temp_codigo_proyecto,temp_codigo_equipo_tipo_kit,temp_codigo_tipo_unidad,
--				temp_codigo_persona,temp_serie,temp_valor_unidad,temp_consumible,
--				temp_activo; -- temp_capacidad;

		 IF (temp_sitio_id is not NULL AND temp_cargado=0) then
			INSERT into claro_cr.equipo 
			(site_id,equipo_estado_id,equipo_categoria_id,equipo_tipo_id,
			equipo_area_id,equipo_proyecto_id,equipo_tipo_kit_id,
			equipo_tipo_unidad_id,persona_id,serie,valor_unidad,
			consumible,activo) VALUES
			(temp_codigo_site,temp_codigo_estado,temp_codigo_categoria,temp_codigo_tipo,
			temp_codigo_area,temp_codigo_proyecto,temp_codigo_equipo_tipo_kit,
			temp_codigo_tipo_unidad,temp_codigo_persona,temp_serie,temp_valor_unidad,
			temp_consumible,temp_activo);

			UPDATE tem_claro_cr.sitios_metro set Cargado = 1 where sitios_metro_id=temp_sitio_id;
		END IF;


		set done=0;
FETCH cur_ into 	temp_sitio_id,
					temp_nemonico_id,
					temp_tipo_sitio,
					temp_placa,
					temp_nombre_activo,
					temp_area,
					temp_cantidad,
					temp_banda,
					temp_gabinete,
					temp_marca,
					temp_modelo,
					temp_serie,
					temp_configuracion,
					temp_sectores,
					temp_antena,
					temp_tipo,
					temp_radios,
					temp_altura,
					temp_capacidad,
					temp_no_circuitos,
					temp_breaker_principal,
					temp_feeder,
					temp_lineas_FO,
					temp_no_medidor,
					temp_no_localizacion,
					temp_observaciones,
					temp_cargado;
      UNTIL done END repeat rep_open_loop;
close cur_;
	--
	--  
END