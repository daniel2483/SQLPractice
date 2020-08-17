SELECT a.equipo_id,b.rsite, a.site_id,a.valor_unidad,a.consumible,a.serie FROM claro_cr.equipo a, 
									(select site_id,rsite from claro_cr.site) as b where 
		a.site_id=b.site_id AND serie<>"" AND valor_unidad>1 AND consumible = 0 limit 1000000;
SELECT count(equipo_id) FROM claro_cr.equipo where serie<>"" AND valor_unidad>1 AND consumible = 0 limit 1000000;
SELECT distinct serie FROM claro_cr.equipo where serie<>"" AND valor_unidad>1 AND consumible = 0 order by serie limit 1000000;

SELECT * FROM claro_cr.equipo;