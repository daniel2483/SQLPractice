select 
b.name Service,
f.name Country,
c.city_name City,
IF(a.msa="yes","","NON MSA Presence") "MSAPresence",
IF(a.fso="yes","","NON FSO Presence") "FSOPresence",
b.hr_per_equip "ActDurationH",
b.n_of_resources_per_equipo "NPersons",
b.support_hour "SupportH",
a.hh_cost "HHCost",
a.hh_cost_overtime "HHCostOvertime",
a.hh_vz_cost "HHCostVz",
a.hh_vz_cost_overtime "HHCostVzOvertime",
a.distance "Distance",
a.travel_time "TravelTime"
from 
verizon_costs.costs a,
verizon_costs.activities b,
verizon_costs.city c,
verizon_costs.persons d,
verizon_costs.equipo_tipo e,
verizon_costs.country f
where
f.IdCountry=c.IdCountry AND
c.city_id=1 AND
b.activity_id=1
limit 1;