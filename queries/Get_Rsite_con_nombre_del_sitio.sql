select rsite as nemonico from claro_cr.site 
		where nombre like TRIM('ALTO LA VICTORIA') OR
		nombre like CONCAT("'%",TRIM('ALTO LA VICTORIA'),"'") OR nombre like CONCAT("'",TRIM('ALTO LA VICTORIA'),"%'") 
		OR nombre like CONCAT("'%",TRIM('ALTO LA VICTORIA'),"%'") OR nombre='ALTO LA VICTORIA'  limit 1;