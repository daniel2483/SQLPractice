select a.fecha,
		a.total,
		if(b.total2,b.total2,0) as total2 from (
		select weekofyear(fechaIni) as fecha, 
		count(a.averiaId) as total 
		from archivos_cr.preventivos_datos_archivo a 
		where 
		a.asp = 'JOACE' 
		-- and a.asp = a.asp 
		and weekofyear(fechaIni) >= weekofyear('2014-01-01') 
		and weekofyear(fechaIni) <= weekofyear(DATE_ADD('2014-01-01',INTERVAL 30 day))
		and fechaIni >= '2013-11-01' GROUP by fecha
		)as a left join ( 
		select weekofyear(fechaIni) as fecha, sum(archivos_cr.HorasEntreFechas(fechaSubida,fechaIni) <= 24 ) as total2 
		from archivos_cr.preventivos_datos_archivo b
		where 
		b.asp = 'JOACE' 
		and weekofyear(fechaIni) >= weekofyear('2014-01-01') 
		and weekofyear(fechaIni) <= weekofyear(DATE_ADD('2014-01-01',INTERVAL 30 day)) 
		and fechaIni >= '2013-11-01' GROUP by fecha
		) as b on a.fecha=b.fecha;
