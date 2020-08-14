-- Proceso Infraestructura
select distinct b.nombre as proveedor
                from 
                claro_cr.averia a, claro_cr.dept b
                where 
                a.dept_repara_id  = b.dept_id
                and b.dept_id!=0
                and tipo_rep_id = 2 and proceso_id=7;
-- Proceso Telecom	
select distinct b.nombre as proveedor
                from 
                claro_cr.averia a, claro_cr.dept b
                where 
                a.dept_repara_id  = b.dept_id
                and b.dept_id!=0
                and tipo_rep_id = 2 and proceso_id=2;