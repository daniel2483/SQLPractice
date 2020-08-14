SELECT 
equipo.equipo_id ID,
site.rsite,
equipo_estado.nombre "Nombre del Equipo",
equipo.serie serie,
equipo.valor_unidad 'Valor Unidad',
equipo.consumible 'Consumible',
equipo_area.nombre "Area",
equipo_categoria.nombre Categoria

FROM
equipo,equipo_estado,equipo_area,equipo_categoria,equipo_proyecto,site

WHERE 
-- Link
equipo.equipo_estado_id=equipo_estado.equipo_estado_id AND
equipo.equipo_area_id=equipo_area.equipo_area_id AND
equipo.equipo_categoria_id=equipo_categoria.equipo_categoria_id AND
equipo.equipo_proyecto_id=equipo_proyecto.equipo_proyecto_id AND
equipo.site_id=site.site_id order by ID limit 200000;