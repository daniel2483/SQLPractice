call Create_report(
cod_site,
FECHA_DETEC,
cod_cierre,
cod_proceso,
cod_texto,
TEXTO_ALARMA,
tt_ref,
cod_prioridad,
cod_responsable,
rep_publico,
cod_tipo_reporte);


CREATE DEFINER=`root`@`%` PROCEDURE `Create_report`
(cod_site int,
fecha_deteccion datetime,
cod_cier int,
proceso_id int,
texto_id int,
texto text,
tt_ref varchar(15),
cod_prioridad int,
responsable_id int,
rep_publico VARCHAR(5),
cod_tipo_reporte int )
begin
