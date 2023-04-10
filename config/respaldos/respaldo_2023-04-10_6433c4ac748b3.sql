SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `dbsistema`
--




CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `condicion` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`idarticulo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_articulo_categoria_idx` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO articulo VALUES
("6","7","00458","Ligheter","25","modelo lighter de MICRONICS","1535417422.jpg","1"),
("7","9","0040kl","disco solido","58","disco marca KINGSTON","1535417431.jfif","1"),
("8","9","HJL-OP","DATATRABEL","107","usb de 15gb","1535417452.jpg","1");




CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;






CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_ingreso`),
  KEY `fk_detalle_ingreso_idx` (`idingreso`),
  KEY `fk_detalle_articulo_idx` (`idarticulo`),
  CONSTRAINT `fk_detalle_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_ingreso` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO detalle_ingreso VALUES
("16","6","6","10","20.00","30.00"),
("17","6","7","5","200.00","250.00"),
("18","7","8","10","16.00","25.00"),
("19","8","7","10","250.00","300.00"),
("20","9","8","50","20.00","30.00"),
("21","10","6","10","25.00","30.00"),
("22","11","7","15","250.00","300.00");




CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  KEY `fk_detalle_venta_venta_idx` (`idventa`),
  KEY `fk_detalle_venta_articulo_idx` (`idarticulo`),
  CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO detalle_venta VALUES
("12","10","6","10","30.00","5.00"),
("13","10","7","10","250.00","10.00"),
("14","11","6","1","30.00","0.00"),
("15","11","7","1","250.00","0.00"),
("16","12","7","4","250.00","0.00"),
("17","13","7","1","250.00","10.00"),
("18","14","7","2","250.00","10.00"),
("19","15","6","1","30.00","10.00"),
("20","16","7","1","250.00","5.00"),
("21","17","7","1","250.00","5.00"),
("22","18","6","1","30.00","0.00"),
("23","19","7","1","250.00","2.00"),
("24","20","8","2","25.00","0.00"),
("25","21","6","1","30.00","5.00"),
("26","22","6","1","30.00","0.00"),
("27","22","7","1","300.00","0.00"),
("28","22","8","1","30.00","0.00");




CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`idingreso`),
  KEY `fk_ingreso_persona_idx` (`idproveedor`),
  KEY `fk_ingreso_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO ingreso VALUES
("6","7","1","Factura","001","0001","2018-08-20 00:00:00","18.00","1200.00","Aceptado"),
("7","7","1","Factura","001","008","2018-08-21 00:00:00","18.00","160.00","Aceptado"),
("8","7","1","Boleta","0002","0004","2018-08-22 00:00:00","0.00","2500.00","Aceptado"),
("9","9","1","Factura","001","0005","2018-08-23 00:00:00","18.00","1000.00","Aceptado"),
("10","10","1","Factura","001","0006","2018-08-25 00:00:00","18.00","250.00","Aceptado"),
("11","10","1","Factura","001","0007","2018-08-27 00:00:00","18.00","3750.00","Aceptado");




CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO permiso VALUES
("1","Escritorio"),
("2","Almacen"),
("3","Compras"),
("4","Ventas"),
("5","Acceso"),
("6","Consulta Compras"),
("7","Consulta Ventas");




CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO persona VALUES
("7","Proveedor","INKA-PC S.R.L","RUC","12587845254","Av. los pinos 201","54328730","inkapc@hotmail.com"),
("8","Cliente","publico general","DNI","30224520","Av.jose olaya 215","54325230","public@hotmail.com"),
("9","Proveedor","TECNO-PC","RUC","20485248751","Calle los naranjales 245","054587852","tecno@gmail.com"),
("10","Proveedor","INFONET","RUC","40485245824","Av. quiñones 102","054789854","infonet@hotmail.com"),
("11","Cliente","pedro","DNI","458521748","Simon bolivar 120","78954263","pedro@gmailcom");




CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO usuario VALUES
("1","angel","CEDULA","27836434","El Peru","547821","admin@gmail.com","Administrador","admin","8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918","1681100126.png","1"),
("2","suny","CEDULA","30286304","Marhuanta","054789521","suny@hotmail.com","empleado","suny","e65db08ae84e07d640c871d4aa1f14d4c649cbd062924225cdd4b287194edbca","1681100078.jpeg","1");




CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL,
  PRIMARY KEY (`idusuario_permiso`),
  KEY `fk_u_permiso_usuario_idx` (`idusuario`),
  KEY `fk_usuario_permiso_idx` (`idpermiso`),
  CONSTRAINT `fk_u_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO usuario_permiso VALUES
("99","2","1"),
("100","2","4"),
("101","1","1"),
("102","1","2"),
("103","1","3"),
("104","1","4"),
("105","1","5"),
("106","1","6"),
("107","1","7");




CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) DEFAULT NULL,
  `total_venta` decimal(11,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_persona_idx` (`idcliente`),
  KEY `fk_venta_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_venta_persona` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO venta VALUES
("10","8","1","Boleta","001","0001","2018-01-08 00:00:00","0.00","11800.15","Aceptado"),
("11","8","1","Factura","001","0002","2018-03-05 00:00:00","18.00","3800.00","Aceptado"),
("12","8","1","Ticket","001","0001","2018-04-17 00:00:00","0.00","1000.00","Aceptado"),
("13","8","1","Factura","001","0002","2018-06-09 00:00:00","18.00","240.00","Aceptado"),
("14","8","1","Factura","20","30","2018-07-24 00:00:00","18.00","490.00","Aceptado"),
("15","8","1","Factura","001","0008","2018-08-26 00:00:00","18.00","20.00","Aceptado"),
("16","8","1","Boleta","001","0070","2018-08-26 00:00:00","0.00","245.00","Aceptado"),
("17","8","1","Factura","002","0004","2018-08-26 00:00:00","18.00","245.00","Aceptado"),
("18","8","1","Boleta","001","0006","2018-08-26 00:00:00","0.00","30.00","Aceptado"),
("19","8","1","Factura","001","0009","2018-08-26 00:00:00","18.00","248.00","Aceptado"),
("20","8","1","Factura","001","002","2018-08-26 00:00:00","18.00","50.00","Aceptado"),
("21","8","1","Factura","001","0004","2018-08-27 00:00:00","18.00","25.00","Aceptado"),
("22","11","1","Ticket","001","0004","2018-08-27 00:00:00","0.00","360.00","Aceptado");




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;