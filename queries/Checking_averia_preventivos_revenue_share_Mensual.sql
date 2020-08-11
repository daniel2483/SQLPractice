select DATE_FORMAT(a.fecha, '%M') as fecha, a.total, b.total2 from (
	select if(DATE_FORMAT(fecho_detec, '%Y-%m-01')<=DATE_FORMAT(fecho_repar, '%Y-%m-01'),
	if(weekofyear(fecho_detec), DATE_FORMAT(fecho_detec, '%Y-%m-01'), DATE_FORMAT(fecho_repar, '%Y-%m-01')) ,
    if(weekofyear(fecho_repar), DATE_FORMAT(fecho_repar, '%Y-%m-01'), DATE_FORMAT(fecho_detec, '%Y-%m-01'))) as fecha,
    count(averia.averia_id) as total 
	from movistar_gua.averia 
	where tipo_rep_id=2 and fecho_detec != 0 and fecho_detec like '2013%'  and proceso_id=7 
	GROUP by fecha
	)as a left join ( 
	select if(DATE_FORMAT(if(fecho_detec=0,fecho_repar,fecho_detec), '%Y-%m-01')<=DATE_FORMAT(fecho_repar, '%Y-%m-01'),
	if(weekofyear(if(fecho_detec=0,fecho_repar,fecho_detec)), DATE_FORMAT(if(fecho_detec=0,fecho_repar,fecho_detec), '%Y-%m-01'), DATE_FORMAT(fecho_repar, '%Y-%m-01')) ,
	if(weekofyear(if(fecho_detec!=0,fecho_repar,fecho_detec)), DATE_FORMAT(fecho_repar, '%Y-%m-01'), DATE_FORMAT(fecho_detec, '%Y-%m-01'))) as fecha,
	count(averia_id) as total2 
	from movistar_gua.averia 
	where (tipo_rep_id=2 and cierre_cod_id=18 and fecho_detec like '2013%'  and proceso_id=7)
	GROUP by fecha
	) as b on a.fecha=b.fecha ;