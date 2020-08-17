USE `doforms`;
DELIMITER $$
CREATE DEFINER=`root`@`%` TRIGGER `informe_ssc02_AINS` AFTER INSERT ON `informe_ssc02` FOR EACH ROW
BEGIN

DECLARE site VARCHAR(45);

IF NEW.ID_del_Sitio THEN
	SELECT sitio into site from doforms.sitios_cambio_de_baterias where
			sitio=NEW.ID_del_Sitio;
	
	IF site is not null AND site<>''
		Then
			Update doforms.sitios_cambio_de_baterias set cambio = 1
					where sitio=NEW.ID_del_Sitio;
		END IF;

END IF;

END