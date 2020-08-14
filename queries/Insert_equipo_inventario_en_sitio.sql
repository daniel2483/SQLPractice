-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `Insert_equipo_inventario_en_sitio`()
BEGIN

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

	DECLARE temp_codigo_area int(11);
	DECLARE temp_codigo_categoria int(11);
	DECLARE temp_codigo_site int(11);
	DECLARE temp_codigo_marca int(11);
	DECLARE temp_codigo_tipo int(11);
	
	DECLARE temp_codigo_estado int(11) default 2; # Estado ID=2 En sitio  	
	DECLARE temp_codigo_proyecto int default 3; 	
	DECLARE temp_codigo_equipo_tipo_kit int default 0; 	
	DECLARE temp_codigo_tipo_unidad int default 0; 	
	DECLARE temp_codigo_persona int default 0; 	
	DECLARE temp_valor_unidad double default 0; 	
	DECLARE temp_consumible bit default 0; 	
	DECLARE temp_activo bit default 1; 
	
	DECLARE done int;
	declare rsite_tmp int;
	DECLARE cur_ CURSOR FOR select 	inventario_id,
									categoria,
									nemonico,
									tipo_sitio,
									provincia,
									canton,
									nombre_sitio,
									placa,
									direccion,
									nombre_activo,
									area,
									cantidad,
									banda,
									gabinete,
									marca,
									modelo,
									serie,
									configuracion,
									sectores,
									antena,
									tipo,
									radios,
									altura,
									capacidad,
									no_circuitos,
									breaker_princ,
									feeder,
									lineas_fo,
									no_medidor,
									no_localizacion,
									observaciones,
									cargado from tem_claro_cr.inventario where cargado = 0;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	OPEN cur_;

	FETCH cur_ into temp_inventario_id,
					temp_categoria,
					temp_nemonico,
					temp_tipo_sitio,
					temp_provincia,
					temp_canton,
					temp_nombre_sitio,
					temp_placa,
					temp_direccion,
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
					temp_breaker_princ,
					temp_feeder,
					temp_lineas_fo,
					temp_no_medidor,
					temp_no_localizacion,
					temp_observaciones,
					temp_cargado;
      rep_open_loop:REPEAT
		
		
		SET temp_codigo_tipo_unidad=0; 		
		SET temp_codigo_area = Get_id_codigo_area(temp_area); # Se obtiene el area del equipo: DX,RF,EX,TX,etc
		SET temp_codigo_categoria = Get_id_codigo_categoria(temp_nombre_activo); # Se obtiene la subtageria del equipo (nombre_activo)
		SET temp_codigo_site = Get_id_codigo_site(temp_nemonico_id); # Se obtiene el ID del sitio (nemonico)
		SET temp_codigo_tipo = Get_id_modelo(temp_modelo);


		IF (trim(temp_altura)<>'') then
			SET temp_codigo_tipo_unidad=1; # Si existe altura unidad son metros
		end IF;

		
		IF(trim(temp_capacidad) LIKE '%A%' OR trim(temp_capacidad) LIKE '%AMP%' OR
		   trim(temp_capacidad) LIKE '%A' OR trim(temp_capacidad) LIKE '%AMP') then
			SET temp_codigo_tipo_unidad=2; 	# Unidad son Amperios
		end IF;

		IF (trim(temp_capacidad) LIKE '%APH%' OR 
			trim(temp_capacidad) LIKE '%AH%' OR 
			trim(temp_capacidad) LIKE '%AMP/h%' OR
			trim(temp_capacidad) LIKE '%APH' OR 
			trim(temp_capacidad) LIKE '%AH' OR 
			trim(temp_capacidad) LIKE '%AMP/h') then
			SET temp_codigo_tipo_unidad=7; 	# Unidad son APH
		end IF;

		IF (trim(temp_capacidad) LIKE '%V%' OR trim(temp_capacidad) LIKE 'V%' OR trim(temp_capacidad) LIKE '%V') then
			SET temp_codigo_tipo_unidad=3; 	# Unidad son Voltios
		end IF;

		IF (trim(temp_capacidad) LIKE '%KVA%' OR trim(temp_capacidad) LIKE 'KVAV%' OR trim(temp_capacidad) LIKE '%KVA') then
			SET temp_codigo_tipo_unidad=3; 	# Unidad son KVA
		end IF;

		IF (trim(temp_capacidad) LIKE '%BTU%' OR trim(temp_capacidad) LIKE '%BTU' OR
			trim(temp_capacidad) LIKE 'BTU%') then
			SET temp_codigo_tipo_unidad=6; 	# Unidad son BTUs	
		end IF;

		IF (trim(temp_capacidad) LIKE '%FO%' OR trim(temp_capacidad) LIKE '%FO') then
			SET temp_codigo_tipo_unidad=8; 	# Es una Fibra Optica	
		end IF;

		IF (trim(temp_capacidad) LIKE '%W%' OR trim(temp_capacidad) LIKE '%W') then
			SET temp_codigo_tipo_unidad=9; 	# Unidad son Watts
		end IF;

		IF (trim(temp_capacidad) LIKE '%puertos%' OR trim(temp_capacidad) LIKE '%puertos' OR 
			trim(temp_capacidad) LIKE '%puertos' OR trim(temp_capacidad) LIKE '%pts%') then
			SET temp_codigo_tipo_unidad=10; # Son cantidad de puertos
		end IF;

		IF (trim(temp_capacidad) LIKE '%enlaces%' OR trim(temp_capacidad) LIKE '%enlaces') then
			SET temp_codigo_tipo_unidad=11; # Son cantidad de enlaces	
		end IF;

		IF (trim(temp_capacidad) LIKE '%slot%' OR trim(temp_capacidad) LIKE '%slot') then
			SET temp_codigo_tipo_unidad=14; # Son cantidad de slots	
		end IF;

		IF (trim(temp_capacidad) LIKE '%NA%' OR trim(temp_capacidad) LIKE '%#N/A%' OR
			trim(temp_capacidad) LIKE 'NA' OR trim(temp_capacidad) LIKE '#N/A') then
			SET temp_codigo_tipo_unidad=0; # No aplica
		end IF;

		IF (trim(temp_capacidad) LIKE '%Mbps' OR trim(temp_capacidad) LIKE '%Mb') then
			SET temp_codigo_tipo_unidad=15; # Unidad son Mbps
		end IF;


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

			UPDATE tem_claro_cr.inventario set Cargado = 1 where inventario_id=temp_inventario_id;
		END IF;


		set done=0;
FETCH cur_ into 	temp_inventario_id,
					temp_categoria,
					temp_nemonico,
					temp_tipo_sitio,
					temp_provincia,
					temp_canton,
					temp_nombre_sitio,
					temp_placa,
					temp_direccion,
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
					temp_breaker_princ,
					temp_feeder,
					temp_lineas_fo,
					temp_no_medidor,
					temp_no_localizacion,
					temp_observaciones,
					temp_cargado;
      UNTIL done END repeat rep_open_loop;
close cur_;
		END