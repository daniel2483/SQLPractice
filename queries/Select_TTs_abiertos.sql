select a.averia_id TT,
		b.rsite Sitio,
		c.nombre Prioridad,
		HorasEntreFechas(now(),fecho_recep)/24 Tiempo,
		a.fecho_recep Fecha,
		d.nombre Proceso
		from 
		averia as a, 
		site as b, 
		prioridad as c,
		proceso as d
		where 
		b.site_id=a.gne_rep AND 
		a.prioridad_id=c.prioridad_id AND 
		a.proceso_id=d.proceso_id AND
		a.estado_id = 2 AND
		c.nombre<>"CFS" 
		order by fecho_recep asc limit 100;