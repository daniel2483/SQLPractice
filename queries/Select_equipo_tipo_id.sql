	SELECT equipo_tipo_id FROM equipo_tipo 
			where codigo = trim('W36A1-A05BPXXKS') OR codigo like trim('W36A1-A05BPXXKS%') 
			OR codigo like trim('%W36A1-A05BPXXKS%') OR codigo like trim('%W36A1-A05BPXXKS')limit 1;