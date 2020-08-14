select a.fecha, a.total, b.total2 from (    
                -- programados
                 select if( if(weekofyear(fecho_detec),weekofyear(fecho_detec),0) >= if(weekofyear(fecho_repar),weekofyear(fecho_repar),0),
                if(weekofyear(fecho_repar), weekofyear(fecho_repar), weekofyear(fecho_detec)),weekofyear(fecho_detec)) as fecha,
                 count(averia.averia_id) as total 
                from movistar_gua.averia 
                where tipo_rep_id=2 and proceso_id=5 AND informante_id=3 and fecho_detec != 0                   
                and  fecho_detec >= '2014-02-01' and
                ((weekofyear(fecho_detec) >= weekofyear('2014-02-01') 
                and weekofyear(fecho_detec) <= if( weekofyear('2014-02-01') >= 48,52,weekofyear(DATE_ADD('2014-02-01',INTERVAL  30 day))) and fecho_detec != 0) or
                (weekofyear(fecho_repar) >= weekofyear('2014-02-01') 
                and  weekofyear(fecho_repar) <= if( weekofyear('2014-02-01') >= 48,52,weekofyear(DATE_ADD('2014-02-01',INTERVAL  30 day))) and fecho_detec = 0) or
                (weekofyear(fecho_repar) >= weekofyear('2014-02-01') 
                and  weekofyear(fecho_repar) <= if( weekofyear('2014-02-01') >= 48,52,weekofyear(DATE_ADD('2014-02-01',INTERVAL  30 day))) 
                and fecho_detec != 0 and fecho_repar != 0))
                GROUP by fecha
                )as a left join (                 
                -- mantenimientos ejecutados
                 select if( if(weekofyear(fecho_detec),weekofyear(fecho_detec),0) >= if(weekofyear(fecho_repar),weekofyear(fecho_repar),0),
                if(weekofyear(fecho_repar), weekofyear(fecho_repar), weekofyear(fecho_detec)),if(weekofyear(fecho_detec), weekofyear(fecho_detec), weekofyear(fecho_repar))) as fecha,
                 count(averia_id) as total2 
                from movistar_gua.averia 
                where tipo_rep_id=2  and weekofyear(fecho_repar) >= weekofyear('2014-02-01') 
                and  weekofyear(fecho_repar) <= if( weekofyear('2014-02-01') >= 48,52,weekofyear(DATE_ADD('2014-02-01',INTERVAL  30 day))) 
                and proceso_id=5 AND informante_id=3  GROUP by fecha
                ) as b on a.fecha=b.fecha;