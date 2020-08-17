select claro_cr.averia.averia_id AS TT_ID_ERC,
claro_cr.site.rsite AS Rsite,
claro_cr.site.nombre AS Sitio,
claro_cr.averia.tt_ref "Folio",
claro_cr.proceso.nombre AS "Tipo Tickete",
claro_cr.region.nombre AS Region,
claro_cr.prioridad.nombre AS Prioridad,
claro_cr.GetTiempoDiferido(claro_cr.averia.averia_id) AS "Tdiferido", 
claro_cr.estado.nombre AS Estado,
concat(date_format(claro_cr.averia.fecho_detec, '%m/%d/%Y %h:%i %p')) AS "Fecha Creacion",
max((case when (claro_cr.intervencion.tipo_interven_id = 2) then date_format(claro_cr.intervencion.fecho_inter,'%m/%d/%Y %h:%i %p') else ' ' end)) AS "Fecha ASP Notificada",
max((case when (claro_cr.intervencion.tipo_interven_id = 2) then claro_cr.HorasEntreFechasDef(claro_cr.intervencion.fecho_inter,claro_cr.averia.fecho_detec) else '0' end)) AS "Tiempo ASP/h",
max((case when (claro_cr.intervencion.tipo_interven_id = 3) then date_format(claro_cr.intervencion.fecho_inter,'%m/%d/%Y %h:%i %p') else ' ' end)) AS "Fecha Arribo TÃ©cnico",
max((case when (claro_cr.intervencion.tipo_interven_id = 3) then claro_cr.HorasEntreFechasDef(claro_cr.intervencion.fecho_inter,claro_cr.averia.fecho_detec) else '0' end)) AS "Tiempo Arribo Tecnico/h",
max((case when (claro_cr.intervencion.tipo_interven_id = 4) then date_format(claro_cr.intervencion.fecho_inter,'%m/%d/%Y %h:%i %p') else ' ' end)) AS "Fecha Tecnico Ejecuta",
max((case when (claro_cr.intervencion.tipo_interven_id = 4) then claro_cr.HorasEntreFechasDef(claro_cr.intervencion.fecho_inter,claro_cr.averia.fecho_detec) else '0' end)) AS "Tiempo Tecnico Ejecuta/h",
(max((case when (claro_cr.intervencion.tipo_interven_id = 4) then claro_cr.HorasEntreFechasDef(claro_cr.intervencion.fecho_inter,claro_cr.averia.fecho_detec) else '0' end))-
max((case when (claro_cr.intervencion.tipo_interven_id = 3) then claro_cr.HorasEntreFechasDef(claro_cr.intervencion.fecho_inter,claro_cr.averia.fecho_detec) else '0' end))) As "KPI SLA2",
max((case when (claro_cr.intervencion.tipo_interven_id = 5) then date_format(claro_cr.intervencion.fecho_inter,'%m/%d/%Y %h:%i %p') else ' ' end)) AS "Fecha Aprobacion CCR",
max((case when (claro_cr.intervencion.tipo_interven_id = 5) then claro_cr.HorasEntreFechasDef(claro_cr.intervencion.fecho_inter,claro_cr.averia.fecho_detec) else '0' end)) AS "Tiempo Aprobacion CCR/h",
if ((max(case when (claro_cr.intervencion.tipo_interven_id = 3) then True else False end)),'NO','SI') as Autorecuperado,
date_format(claro_cr.averia.fecho_repar,'%m/%d/%Y %h:%i %p') AS "Fecha de Reparacion",
claro_cr.HorasEntreFechasDef(claro_cr.averia.fecho_repar,claro_cr.averia.fecho_detec) AS "Tiempo Absoluto",
claro_cr.informante.nombre AS "Centro Informante",
REPLACE(claro_cr.averia.solucion,concat(char(13),char(10)),'') as Solucion,
date_format((claro_cr.averia.fecho_detec + interval claro_cr.averia.t_max hour),'%m/%d/%Y %h:%i %p') AS "Fecha Maxima Solucion",
claro_cr.site.alcatel_name Criticidad,
claro_cr.Cal_T_Total_reporte(averia.averia_id) Cronometro
from
claro_cr.averia,
claro_cr.text_averia,
claro_cr.intervencion,
claro_cr.proceso,
claro_cr.site,
claro_cr.region,
claro_cr.localidad,
claro_cr.prioridad,
claro_cr.estado,
claro_cr.cierre_cod,
claro_cr.informante
where
(
(claro_cr.text_averia.text_averia_id = claro_cr.averia.texto_id) and
(claro_cr.averia.averia_id = claro_cr.intervencion.averia_id) and (claro_cr.averia.proceso_id = claro_cr.proceso.proceso_id) and
(claro_cr.averia.gne_repa = claro_cr.site.site_id) and (claro_cr.site.region_id = claro_cr.region.region_id) and (claro_cr.site.localidad_id = claro_cr.localidad.localidad_id) and
(claro_cr.averia.prioridad_id = claro_cr.prioridad.prioridad_id) and (claro_cr.averia.estado_id = claro_cr.estado.estado_id) and
(claro_cr.averia.cierre_cod_id = claro_cr.cierre_cod.cierre_cod_id) and 
(claro_cr.informante.informante_id = claro_cr.averia.informante_id) and
(claro_cr.averia.solucion like '%RRU%') and
(claro_cr.proceso.nombre <> 'INFRAESTRUCT') and
(averia.fecho_detec >='2014-09-01 00:00:00') and
(averia.fecho_detec <='2014-09-30 23:59:59')
) group by claro_cr.averia.averia_id;