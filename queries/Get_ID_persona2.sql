SELECT a.nombreCompleto, p.persona_id
                    from rlam.usuarios a, kernel.web_user b, kernel.web_access c, 
                    kernel.tt_instancia d, claro_cr.persona p
                    where 
                    a.username = b.web_login and 
                    b.web_user_id = c.web_user_id and
                    b.web_login like p.login  and
                    b.web_login like 'ECESWIL'   
                    and d.db_name = 'claro_cr' limit 1
union all
SELECT p.nombre, p.persona_id 
	from rlam.usuarios r, claro_cr.persona p
	where p.email='wilky.cespedes@gm.ericsson.com' limit 1;