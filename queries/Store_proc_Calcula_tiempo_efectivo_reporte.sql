-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE Calcula_tiempo_efectivo_reporte(cod_averia int)
BEGIN

DECLARE g_fecho_detec datetime;
DECLARE g_fecho_cierre datetime;

DECLARE g_t_max double;
DECLARE g_hora datetime;
DECLARE g_t_total double;
DECLARE G_temp_Time double;
DECLARE G_tipo_reporte int;
DECLARE G_last_diferido_date datetime;

SELECT fecho_detec,fecho_repar,t_max,estado_id into g_fecho_detec,g_fecho_cierre,g_t_max,G_tipo_reporte FROM averia
where
averia_id=cod_averia;


CASE G_tipo_reporte
    WHEN 2 THEN     -- abierto
    begin
        set G_temp_Time=HorasEntreFechasDef(now_instancia(),g_fecho_detec)-GetTiempoDiferido(cod_averia);


    end;
    WHEN 4 THEN -- reporte diferido
    begin



        set G_temp_Time=HorasEntreFechasDef(now_instancia(),g_fecho_detec)-GetTiempoDiferido(cod_averia);

    end;


    WHEN 1 THEN  -- reporte cerrado
    begin

        set G_temp_Time=HorasEntreFechasDef(g_fecho_cierre,g_fecho_detec)-GetTiempoDiferido(cod_averia);
    end;


     WHEN 3 THEN   -- reporte pendiente de cierre
    begin

        set G_temp_Time=HorasEntreFechasDef(g_fecho_cierre,g_fecho_detec)-GetTiempoDiferido(cod_averia);
    end;

END CASE;

	-- Se actualiza la bandera tt_excedido
	-- select G_temp_Time;  -- Para Debugging
    if G_temp_Time > g_t_max then
			-- True
			update averia set t_total=G_temp_Time, tt_excedido=1 where averia_id=cod_averia;

    ELSE
			-- False
            update averia set t_total=G_temp_Time, tt_excedido=0 where averia_id=cod_averia;

        END IF;




end
