-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `Insert_equipo_bodega`()
BEGIN
-- Procedure para Cargar Datos de la Tabla tem_claro_cr.sitios_metro a la tabla 
-- claro_cr.equipo

	-- Variables de columnas
	DECLARE temp_bodega_id int(11);
	DECLARE temp_codigo varchar(160);
	DECLARE temp_descripcion varchar(45);
	DECLARE temp_serie varchar(80);
	DECLARE temp_proyecto varchar(45);
	DECLARE temp_cantidad varchar(45);
	DECLARE temp_cargado int(11);

	-- Variables de IDs

	DECLARE temp_codigo_tipo int(11);
	DECLARE temp_codigo_proyecto int(11);

	-- Variables Seteadas
	DECLARE temp_codigo_site int default 0; -- Esta en o debido a que se encuentra en Bodega
	DECLARE temp_codigo_estado int default 1;   -- En Bodega	
	DECLARE temp_codigo_categoria int(11) default 0; -- N/A debido a que no se tiene info
	DECLARE temp_codigo_area int(11) default 0; -- N/A debido a que no se tiene info
	DECLARE temp_codigo_equipo_tipo_kit int default 0; -- N/A
	DECLARE temp_codigo_tipo_unidad int default 0; -- N/A
	DECLARE temp_codigo_persona int default 0; -- N/A
	DECLARE temp_valor_unidad double default 0; -- Valor 0 debido a que es la primera insercion
	DECLARE temp_consumible bit default 0; -- No consumible
	DECLARE temp_activo bit default 1; -- Es un equipo activo (no se descarta de las consultas)

--			temp_codigo_site,temp_codigo_estado,temp_codigo_categoria,
--			temp_codigo_tipo,temp_codigo_area,temp_codigo_proyecto,
--			temp_codigo_equipo_tipo_kit,temp_codigo_tipo_unidad,
--			temp_codigo_persona,temp_serie,temp_valor_unidad,temp_consumible,
--			temp_activo

	
	DECLARE done int;
	declare rsite_tmp int;
	DECLARE cur_ CURSOR FOR select 	bodega_id,
									codigo,
									descripcion,
									serie,
									proyecto,
									cantidad,
									Cargado from tem_claro_cr.bodega where cargado = 0;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	OPEN cur_;

	FETCH cur_ into temp_bodega_id,
					temp_codigo,
					temp_descripcion,
					temp_serie,
					temp_proyecto,
					temp_cantidad,
					temp_cargado;
      rep_open_loop:REPEAT
		
--		select 		temp_bodega_id,
--					temp_codigo,
--					temp_descripcion,
--					temp_serie,
--					temp_proyecto,
--					temp_cantidad,
--					temp_cargado;

		-- Obtengo el ID del codigo
		SET temp_codigo_tipo = Get_id_codigo_tipo(temp_codigo);

		-- Obtengo el ID del proyecto
		SET temp_codigo_proyecto = Get_id_equipo_proyecto(temp_proyecto);

		-- Select para Debugging
--		select 	temp_bodega_id,temp_codigo_site,temp_codigo_estado,
--				temp_codigo_categoria,temp_codigo_tipo,temp_codigo_area,
--				temp_codigo_proyecto,temp_codigo_equipo_tipo_kit,
--				temp_codigo_tipo_unidad,temp_codigo_persona,temp_serie,
--				temp_valor_unidad,temp_consumible,temp_activo; 

		 IF (temp_bodega_id is not NULL AND temp_cargado=0) then
			INSERT into claro_cr.equipo 
			(site_id,equipo_estado_id,equipo_categoria_id,equipo_tipo_id,
			equipo_area_id,equipo_proyecto_id,equipo_tipo_kit_id,
			equipo_tipo_unidad_id,persona_id,serie,valor_unidad,
			consumible,activo) VALUES
			(temp_codigo_site,temp_codigo_estado,temp_codigo_categoria,temp_codigo_tipo,
			temp_codigo_area,temp_codigo_proyecto,temp_codigo_equipo_tipo_kit,
			temp_codigo_tipo_unidad,temp_codigo_persona,temp_serie,temp_valor_unidad,
			temp_consumible,temp_activo);
			UPDATE tem_claro_cr.bodega set Cargado = 1 where bodega_id=temp_bodega_id;
		END IF;


		set done=0;
FETCH cur_ into 	temp_bodega_id,
					temp_codigo,
					temp_descripcion,
					temp_serie,
					temp_proyecto,
					temp_cantidad,
					temp_cargado;
      UNTIL done END repeat rep_open_loop;
close cur_;
	--
	--  
END