-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` FUNCTION `Get_time_per_priority_and_site`(cod_site int,cod_prioridad int ) RETURNS double
begin
declare G_t_max double default 0;

select t_max into G_t_max from manual_prioridad
where
prioridad_id=cod_prioridad and
site_id=cod_site;


if  G_t_max ='' then
    select Time_h into G_t_max from prioridad where prioridad_id=cod_prioridad;

end if;


return G_t_max;

end