select a.fecha, a.total, b.total2 from (    
	-- PROGRAMADOS
	select if(weekofyear(fecho_detec),weekofyear(fecho_detec),weekofyear(fecho_repar))
	as fecha, count(averia.averia_id) as total, if(fecho_detec>=fecho_detec,fecho_detec),fecho_repar) into fecha_use
	from movistar_gua.averia 
	where (tipo_rep_id=2 and proceso_id=7 AND informante_id=3 AND fecho_detec <> 0 AND 
	((weekofyear(fecho_detec) >= weekofyear('2013-10-01') 
	and weekofyear(fecho_detec) <= weekofyear(DATE_ADD('2013-10-01',INTERVAL  30 day)) and fecho_detec != 0) or
	(weekofyear(fecho_repar) >= weekofyear('2013-10-01') 
	and  weekofyear(fecho_repar) <= weekofyear(DATE_ADD('2013-10-01',INTERVAL  30 day)) and fecho_detec = 0)))
	GROUP by fecha
	)as a left join (                 
	-- EJECUTADOS
	select if(weekofyear(fecho_detec),weekofyear(fecho_detec),weekofyear(fecho_repar)) as fecha, count(averia_id) as total2 
	from movistar_gua.averia 
	where tipo_rep_id=2  and weekofyear(fecho_repar) >= weekofyear('2013-10-01') 
	and  weekofyear(fecho_repar) <= weekofyear(DATE_ADD('2013-10-01',INTERVAL  30 day)) 
	and proceso_id=7 AND informante_id=3  GROUP by fecha
	) as b on a.fecha=b.fecha;

				
select if(weekofyear(fecho_detec),weekofyear(fecho_detec),weekofyear(fecho_repar)) as fecha, count(averia.averia_id) as total 
                from movistar_gua.averia 
                where tipo_rep_id=2 and proceso_id=7 AND informante_id=3 AND fecho_detec <> 0 AND
                ((weekofyear(fecho_detec) >= weekofyear('2013-10-01') 
                and weekofyear(fecho_detec) <= weekofyear(DATE_ADD('2013-10-01',INTERVAL  30 day)) and fecho_detec != 0) or
                (weekofyear(fecho_repar) >= weekofyear('2013-10-01') 
                and  weekofyear(fecho_repar) <= weekofyear(DATE_ADD('2013-10-01',INTERVAL  30 day)) and fecho_detec = 0))
                GROUP by fecha