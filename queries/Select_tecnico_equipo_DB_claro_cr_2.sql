select w.codigo, w.equipo_id, w.equipo_estado_id, w.equipo_tipo_id, w.serie,
                w.valor_unidad, w.equipo, w.nombre, w.fecha, w.equipo_movimiento_id,
                w.equipo_tipo_unidad_id, w.valor_unidad valor from( 

                            select z.codigo, z.equipo_id, z.equipo_estado_id, z.equipo_tipo_id, z.serie,
                                            z.valor_unidad, z.equipo, z.nombre, z.fecha, z.equipo_movimiento_id,
                                            z.equipo_tipo_unidad_id, z.valor_unidad valor
                                            from (
                                            select c.codigo, a.equipo_id, a.equipo_estado_id, a.equipo_tipo_id,a.serie,
                                            c.nombre as equipo, d.nombre, e.fecho as fecha, e.equipo_movimiento_id as equipo_movimiento_id,
                                            d.equipo_tipo_unidad_id, f.valor_unidad
                                            from 
                                            claro_cr.equipo a, 
                                            claro_cr.persona b,
                                            claro_cr.equipo_tipo c,
                                            claro_cr.equipo_tipo_unidad d, 
                                            claro_cr.equipo_movimiento e,
                                            claro_cr.equipo_movimiento_detalle f
                                            where a.persona_id = b.persona_id
                                            and  c.equipo_tipo_id = a.equipo_tipo_id
                                            and b.persona_id = 212
                                            and a.equipo_tipo_unidad_id = d.equipo_tipo_unidad_id
                                            and f.equipo_movimiento_id = e.equipo_movimiento_id
                                            and f.equipo_id = a.equipo_id                
                                            order by f.equipo_movimiento_id desc                
                                            ) as z group by z.equipo_id
                            union all
                            select 	
				b.codigo, 
				a.equipo_id, 
				a.equipo_estado_id, 
				b.equipo_tipo_id, 
				a.serie,
				a.valor_unidad, 
				b.nombre equipo, 
				c.nombre, 
				now() as fecha,
				'NA' as equipo_movimiento_id,
				a.equipo_tipo_unidad_id, 
				a.valor_unidad valor
				from 
				claro_cr.equipo a,
				claro_cr.equipo_tipo b,
				claro_cr.equipo_tipo_unidad c where 
				c.equipo_tipo_unidad_id = a.equipo_tipo_unidad_id AND
				a.equipo_tipo_id = b.equipo_tipo_id AND
				persona_id=212) as w group by w.equipo_id;