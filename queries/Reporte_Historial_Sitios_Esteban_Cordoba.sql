select a.averia_id TT,REPLACE(b.rsite,concat(char(13),char(10)),'') "Sitio",
		a.fecho_detec "Fecha Detección",a.fecho_recep "Fecha de Canalización",
		a.fecho_repar "Fecha de Reparación",c.nombre "Root Cause",
		REPLACE(a.last_interv,concat(char(13),char(10)),'') "Última Intervención",
		REPLACE(a.solucion,concat(char(13),char(10)),'') "Solución"
		from claro_cr.averia a,claro_cr.site b,claro_cr.text_averia c where 
		a.gne_rep=b.site_id AND 
		a.texto_id=c.text_averia_id AND
		b.rsite like '%RU1230%';