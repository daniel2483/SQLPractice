CREATE TABLE `reparacion` (
  `reparacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `serie` varchar(45) DEFAULT '',
  `proyecto` varchar(45) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `tipo_unidad` int(11) NOT NULL DEFAULT '0',
  `consumible` int(10) NOT NULL DEFAULT '0',
  `cargado` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`reparacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;