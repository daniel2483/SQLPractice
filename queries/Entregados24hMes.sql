select DATE_FORMAT(a.fecha, '%M') as fecha, a.total, b.total2 from (
	select DATE_FORMAT(fechaIni, '%Y-%m-01') as fecha, count(preventivos_datos_archivo.averiaId) as total 
	from archivos_cr.preventivos_datos_archivo 
	where fechaIni like '$years%' and asp = '$proveedor' 
	and fechaIni like '$fecha%' and fechaIni >= '2013-11-01' GROUP by fecha
	)as a left join ( 
	select DATE_FORMAT(b.fechaIni, '%Y-%m-01') as fecha, sum(archivos_cr.HorasEntreFechas(fechaSubida,fechaIni) <= 24 ) as total2 
	from archivos_cr.preventivos_datos_archivo b
	where 
	b.fechaIni like '$years%' and b.asp = '$proveedor'
	and b.fechaIni like '$fecha%' and fechaIni >= '2013-11-01' GROUP by fecha
	) as b on a.fecha=b.fecha;
