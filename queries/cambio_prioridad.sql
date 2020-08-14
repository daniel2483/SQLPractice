LOAD DATA LOCAL INFILE '/home/fecast/TT_Guatemala/in/cambio_prioridad.csv' 
INTO TABLE Temp_cambio_prioridad
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(averia_id,prioridad_id,@cambio)
SET idTemp_cambio_prioridad = NULL,
cambio=cast(@cambio as signed);