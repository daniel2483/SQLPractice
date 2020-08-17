select persona_id id, nombre persona from claro_cr.persona
                where persona_id not in (0) AND active = 1 AND
				dep_id in (35,38,39,40) 
                order by nombre;