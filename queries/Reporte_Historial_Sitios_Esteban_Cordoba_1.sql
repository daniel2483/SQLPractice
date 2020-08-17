
select
averia.averia_id "TT ID ERC",
averia.tt_ref "TT Ref Client",
TRUNCATE(t_total,1) "Total Time",
estado.nombre "Report Status",
prioridad.nombre Priority,
date_format(fecho_detec,'%m/%d/%Y') "Opening Date",
site_repa.nombre "Element Name",
site_repa.rsite Mnemonic,
proceso.nombre "Process Department",
replace(averia.texto,CONCAT(char(13),char(10)),' ') "Original Description",
persona.nombre Responsable,
date_format(DATE_ADD(fecho_detec,interval t_max HOUR),'%m/%d/%Y') "Max Resolution Date",
date_format(aprox_time,'%m/%d/%Y') "Planned Resolution Date",
week(aprox_time) "Planned Resolution Week",
case averia.tt_excedido when 0 then 'NO' when 1 then 'Yes' end 'Report Out of Time',
replace(averia.last_interv,CONCAT(char(13),char(10)),' ') "Last Action",
partner.nombre Support,
averia.partner_ref_tt "TT Ref Support",
date_format(partner_canaliz.fecho_open,'%m/%d/%Y')"Opening Date Sup.",
partner_canaliz.encargado "Resp Sup.",
partner_canaliz.prioridad "Priority Sup.",
case partner_canaliz.state_id when 1 then 'New' when 2 then 'Assigned' when 3 then 'Analysis' when 4 then 'Waiting Customer' when 5 then 'Closed' when 6 then 'Canceled' end "Status Sup."
from
claro_cr.averia left JOIN claro_cr.partner_canaliz on partner_canaliz.averia_id=averia.averia_id,
claro_cr.prioridad,
claro_cr.proceso,
claro_cr.site site_repa,
claro_cr.partner,
claro_cr.estado,
claro_cr.persona
where
averia.public='True'
and
((averia.estado_id =2) or (averia.estado_id =3))
and
(averia.estado_id=estado.estado_id)
and
(averia.prioridad_id = prioridad.prioridad_id)
and
averia.persona_id=persona.persona_id
and
(averia.proceso_id = proceso.proceso_id)
and
(averia.gne_repa =site_repa.site_id)
and
(averia.partner_id=partner.partner_id)
order by proceso.nombre,averia.estado_id desc,averia.t_total  desc