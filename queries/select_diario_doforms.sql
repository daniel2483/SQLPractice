select a.fecha, a.total, b.total2 from ( 
		-- Total de RIRs
		select DATE(a.fecho_visita) as fecha,
		count(rir_proyecto_id) as total 
		from doforms.rir_proyecto a
		where a.fecho_visita=a.fecho_visita AND
		weekofyear(fecho_visita) >= weekofyear('2014-02-01') 
		and weekofyear(fecho_visita) <= weekofyear(DATE_ADD('2014-02-01',INTERVAL 30 day))
		GROUP by fecha
		)as a left join ( 
		-- RIR completadas
		select DATE(b.fecho_visita) as fecha,
		count(rir_proyecto_id) as total2 
		from doforms.rir_proyecto b
		where DispatchStatus=7 AND
		weekofyear(fecho_visita) >= weekofyear('2014-02-01') 
		and weekofyear(fecho_visita) <= weekofyear(DATE_ADD('2014-02-01',INTERVAL 30 day))
		GROUP by fecha
		) as b on a.fecha=b.fecha;