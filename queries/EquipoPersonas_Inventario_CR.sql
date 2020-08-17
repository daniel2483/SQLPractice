select 	b.codigo, 			# 1
                        a.equipo_id, 			# 2
                        a.equipo_estado_id, 		# 3
                        b.equipo_tipo_id, 		# 4
                        a.serie,			# 5
                        a.valor_unidad, 		# 6
                        b.nombre equipo, 		# 7
                        c.nombre, 			# 8
                        now() as fecha,			# 9
                        'NA' as equipo_movimiento_id,	# 10
                        a.equipo_tipo_unidad_id, 	# 11
                        a.valor_unidad valor		# 12
                        from 
                        claro_cr.equipo a,
                        claro_cr.equipo_tipo b,
                        claro_cr.equipo_tipo_unidad c where 
                        c.equipo_tipo_unidad_id = a.equipo_tipo_unidad_id and
                        a.equipo_tipo_id = b.equipo_tipo_id and
                        persona_id=212 and 
                        a.valor_unidad > 0