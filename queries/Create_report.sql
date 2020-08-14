-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `Create_report`(cod_site int,fecha_deteccion datetime,cod_cier int,proceso_id int,texto_id int,texto text,tt_ref varchar(15),cod_prioridad int,responsable_id int,rep_publico VARCHAR(5),cod_tipo_reporte int )
begin

declare ESTADO_CERRADO int default 1;
declare REGISTRA_APERTURA int default 1;
declare INFORMANTE int default 3; #Fron Ofice CR



declare G_t_max DOUBLE;


set G_t_max= 24;


insert into averia
(prioridad_id,cierre_cod_id,informante_id,gne_rep,fecho_detec,fecho_recep,estado_id,reg_id_open,proceso_id,texto_id,texto,public,tt_ref,gne_repa,t_max,tipo_rep_id,persona_id,info_notif,reg_id_close)
values
(cod_prioridad,cod_cier,INFORMANTE,cod_site,fecha_deteccion,now_instancia(),ESTADO_CERRADO,REGISTRA_APERTURA,proceso_id,texto_id,texto,rep_publico,tt_ref,
cod_site,G_t_max,cod_tipo_reporte,responsable_id,texto,1);


end