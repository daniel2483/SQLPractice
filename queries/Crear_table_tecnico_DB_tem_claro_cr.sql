CREATE TABLE `tecnico` (
  `tecnico_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `area` varchar(45) DEFAULT '',
  `categoria` varchar(45) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `consumible` int(10) NOT NULL DEFAULT '0',
  `tecnico` int(10) NOT NULL DEFAULT '0',
  `cargado` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`tecnico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;