-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `crear_preventivo`()
BEGIN
DECLARE done int;
DECLARE g_site varchar(100);
DECLARE g_fecha datetime;
DECLARE g_ot int;

declare g_descripcion varchar(80);
declare g_articulo_conf varchar(80);
declare g_grupo varchar(45);
declare g_tipo_trabajo varchar(45);
declare g_estado varchar(45);
declare g_fecha_estado datetime;
declare g_notificado_por varchar(45);
declare g_fecha_notificacion datetime;
declare g_inicio_real datetime;
declare g_fin_real datetime;
declare g_causa varchar(45);
declare g_solucion varchar(45);
declare g_objetivo text;
declare g_registros int;
declare g_ubicacion varchar(45);
declare x int default 1;
declare ENTER varchar(2);
declare cod_resp_dept int;

declare G_Site_id int;
declare G_TT_ref varchar(15);
declare Fecho_Ejecucion datetime;
declare G_persona_id int;
declare g_dept_id int;



declare ESTACION varchar(45) ;

declare TEXTO_ALARMA text ;

declare cod_proceso int;
declare cod_texto int default 155;

declare cod_prioridad int default 2;

declare cod_responsable int;

declare rep_publico varchar(5) default 'True';

declare cod_tipo_reporte int default 2; 
declare cod_informante int default 8;
declare cod_site int;


DECLARE cur_ CURSOR FOR
SELECT get_site_id(preventivos.site) site_id,preventivos.tt_ref,preventivos.fecho,
preventivo_dept_resp.dept_id,preventivo_dept_resp.persona_id 
FROM preventivos,preventivo_dept_resp
where
preventivos.dept=preventivo_dept_resp.dept;



#proceso de creacion de reportes


set ENTER=concat(char(13),char(10));

set cod_resp_dept=37; # JOACE

select count(*) into g_registros FROM preventivos,preventivo_dept_resp
where
preventivos.dept=preventivo_dept_resp.dept;


OPEN cur_;
set x=1;

set cod_proceso= 7; #proceso infraextructura
set cod_texto=447;
set cod_prioridad=4; # prioridad menor 48h
set rep_publico='True';
set cod_tipo_reporte=2; # reporte preventivo
set cod_informante=3; #dispatch
set g_estado=''; #estado del la ot ref

set TEXTO_ALARMA=concat('Mantenimiento Preventivo generado automáticamente',ENTER); #Texto de Alrma


rep_open_loop:REPEAT


     FETCH cur_ into G_Site_id,G_TT_ref,Fecho_Ejecucion,g_dept_id,G_persona_id ;

     call Create_reporte(G_Site_id,
                          now_instancia(),
                          Fecho_Ejecucion,
                          cod_proceso,
                          cod_texto,
                          TEXTO_ALARMA,
                          G_TT_ref,
                          cod_prioridad,
                          G_persona_id,
                          rep_publico,
                          cod_tipo_reporte,
                          cod_informante,
                          g_dept_id,g_estado);


      
   set x=x+1;

      UNTIL x > g_registros  END repeat rep_open_loop;
close cur_;

END