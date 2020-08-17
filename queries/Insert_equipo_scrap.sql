-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `Insert_equipo_scrap`()
BEGIN

	DECLARE temp_scrap_id int(11);
	DECLARE temp_codigo varchar(160);
	DECLARE temp_descripcion varchar(45);
	DECLARE temp_serie varchar(80);
	DECLARE temp_proyecto varchar(45);
	DECLARE temp_cantidad varchar(45);
	DECLARE temp_tipo_unidad int(11);
	DECLARE temp_consumible int(11);
	DECLARE temp_cargado int(11);

	
	DECLARE temp_codigo_tipo int(11);
	DECLARE temp_codigo_proyecto int(11);

	DECLARE temp_codigo_site int default 0; 	
	DECLARE temp_codigo_estado int default 1;   	
	DECLARE temp_codigo_categoria int(11) default 0; 	
	DECLARE temp_codigo_area int(11) default 0; 	
	DECLARE temp_codigo_equipo_tipo_kit int default 0; 	
	DECLARE temp_codigo_persona int default 0; 	
	DECLARE temp_activo bit default 1; 

	
	DECLARE done int;
	declare rsite_tmp int;
	DECLARE cur_ CURSOR FOR select 	scrap_id,
									codigo,
									descripcion,
									serie,
									proyecto,
									cantidad,
									tipo_unidad,
									consumible,
									cargado 
									from 
									tem_claro_cr.scrap 
									where cargado = 0;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	OPEN cur_;

	FETCH cur_ into temp_scrap_id,
					temp_codigo,
					temp_descripcion,
					temp_serie,
					temp_proyecto,
					temp_cantidad,
					temp_tipo_unidad,
					temp_consumible,
					temp_cargado;
      rep_open_loop:REPEAT
		

				SET temp_codigo_tipo = Get_id_codigo_tipo(temp_codigo);

				SET temp_codigo_proyecto = Get_id_equipo_proyecto(temp_proyecto);

		
		 IF (temp_scrap_id is not NULL AND temp_cargado=0) then
			INSERT into claro_cr.equipo 
			(site_id,					-- 1
			equipo_estado_id,			-- 2
			equipo_categoria_id,		-- 3
			equipo_tipo_id,				-- 4
			equipo_area_id,				-- 5
			equipo_proyecto_id,			-- 6
			equipo_tipo_kit_id,			-- 7
			equipo_tipo_unidad_id,		-- 8
			persona_id,					-- 9
			serie,						-- 10
			valor_unidad,				-- 11
			consumible,					-- 12
			activo) 					-- 13
			VALUES
			(temp_codigo_site,			-- 1	
			temp_codigo_estado,			-- 2
			temp_codigo_categoria,		-- 3
			temp_codigo_tipo,			-- 4
			temp_codigo_area,			-- 5
			temp_codigo_proyecto,		-- 6
			temp_codigo_equipo_tipo_kit,-- 7
			temp_tipo_unidad,			-- 8
			temp_codigo_persona,		-- 9
			temp_serie,					-- 10
			temp_cantidad,				-- 11
			temp_consumible,			-- 12
			temp_activo);				-- 13

			UPDATE tem_claro_cr.scrap set cargado = 1 where scrap_id=temp_scrap_id;
		END IF;


		set done=0;
FETCH cur_ into 	temp_scrap_id,
					temp_codigo,
					temp_descripcion,
					temp_serie,
					temp_proyecto,
					temp_cantidad,
					temp_tipo_unidad,
					temp_consumible,
					temp_cargado;
      UNTIL done END repeat rep_open_loop;
close cur_;
		END