CREATE DATABASE  IF NOT EXISTS `perrinchis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `perrinchis`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: perrinchis
-- ------------------------------------------------------
-- Server version	5.5.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `NomCate` varchar(150) NOT NULL COMMENT 'Nombre de la categoría del producto',
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de categoria de productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idClientes` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` int(11) NOT NULL,
  `FechRegi` date NOT NULL,
  PRIMARY KEY (`idClientes`,`idUsuarios`),
  KEY `fk_Clientes_Usuarios1_idx` (`idUsuarios`),
  CONSTRAINT `fk_Clientes_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,19,'2021-04-16'),(2,20,'2021-04-23'),(3,21,'2021-04-23'),(4,22,'2021-04-23');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clientesactivos`
--

DROP TABLE IF EXISTS `clientesactivos`;
/*!50001 DROP VIEW IF EXISTS `clientesactivos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clientesactivos` AS SELECT 
 1 AS `identificador`,
 1 AS `Cédula`,
 1 AS `Nombre Completo`,
 1 AS `Fecha de Ingreso`,
 1 AS `Genero`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `datospersonales`
--

DROP TABLE IF EXISTS `datospersonales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datospersonales` (
  `idDatosPersonales` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` int(11) NOT NULL,
  `idTipoDocus` int(11) NOT NULL,
  `idGeneros` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellidos` varchar(255) NOT NULL,
  `Cedula` varchar(25) NOT NULL,
  `Direccion` text NOT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `CorreElect` varchar(45) NOT NULL COMMENT 'Correo Electrónico del usuario',
  `FechaNace` date NOT NULL COMMENT 'Fecha de Nacimiento',
  PRIMARY KEY (`idDatosPersonales`,`idUsuarios`,`idTipoDocus`,`idGeneros`),
  KEY `fk_DatosPersonales_Usuarios1_idx` (`idUsuarios`),
  KEY `fk_DatosPersonales_TipoDocus1_idx` (`idTipoDocus`),
  KEY `fk_DatosPersonales_Generos1_idx` (`idGeneros`),
  CONSTRAINT `fk_DatosPersonales_Generos1` FOREIGN KEY (`idGeneros`) REFERENCES `generos` (`idGeneros`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DatosPersonales_TipoDocus1` FOREIGN KEY (`idTipoDocus`) REFERENCES `tipodocus` (`idTipoDocus`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DatosPersonales_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datospersonales`
--

LOCK TABLES `datospersonales` WRITE;
/*!40000 ALTER TABLE `datospersonales` DISABLE KEYS */;
INSERT INTO `datospersonales` VALUES (1,1,3,2,'Eder','Lara Trujillo','14399999','Calle 56 # 45 -22','3115780589','eder@mail.com','1982-09-30'),(2,2,3,1,'Maria Camila','Alzate Rodriguez','1000123432','Calle 2 # 3 - 21','3007896655','camila@mail.com','2000-05-31'),(3,3,3,1,'Gabriela','Cardona Cardona','1000789567','Calle 13 # 27 - 13','3014759396','gaby@mail.com','2002-09-28'),(4,4,3,2,'Johan David','Quintero Quintero','1110234658','Cra 45 # 76 - 54','3105429616','johan@mail.com','2001-10-07'),(5,5,4,2,'Juan Diego','Silva Martinez','98234732','Calle 32 # 56 - 22','3219806785','diego@mail.com','1990-03-08'),(6,18,5,2,'Dave','Smith','2643790','Street 5 aveneu # 87 - 9','5234566','dave@mail.com','2001-08-21'),(7,19,3,1,'Mariela','Trujillo Mendoza','7865428','Calle 36 sur # 21 -138','7680934','maye@mail.com','1959-10-19'),(8,20,3,2,'Fernando','Garay','897659402','Calle 54 # 45 - 76','89874329','fernando@mail.com','1994-04-23'),(9,21,3,1,'Liliana Maria','Jaramillo Giraldo','28543856','Calle 50 # 73 - 19','6879809','liliana@mail.com','1995-05-12'),(10,22,3,1,'Natalia Andrea','Bedoya Cardona','32097480','Calle 23 # 45 -12','9846290','natalia@mail.com','1992-06-01'),(11,23,3,1,'Paula','Trujillo','28999999','Calle 43 # 4- 12','3009998789','paula@mail.com','0000-00-00');
/*!40000 ALTER TABLE `datospersonales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `datosusuarios`
--

DROP TABLE IF EXISTS `datosusuarios`;
/*!50001 DROP VIEW IF EXISTS `datosusuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datosusuarios` AS SELECT 
 1 AS `Identificación`,
 1 AS `Nombre Completo`,
 1 AS `genero`,
 1 AS `Usuario de Ingreso`,
 1 AS `Perfil`,
 1 AS `Fecha de Ingreso`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `detafopa`
--

DROP TABLE IF EXISTS `detafopa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detafopa` (
  `idDetaFoPa` int(11) NOT NULL AUTO_INCREMENT,
  `idFoPago` int(11) NOT NULL,
  `idTransacciones` int(11) NOT NULL,
  `ValorPago` decimal(20,2) NOT NULL,
  PRIMARY KEY (`idDetaFoPa`,`idFoPago`,`idTransacciones`),
  KEY `fk_DetaFoPa_FoPago1_idx` (`idFoPago`),
  KEY `fk_DetaFoPa_Transacciones1_idx` (`idTransacciones`),
  CONSTRAINT `fk_DetaFoPa_FoPago1` FOREIGN KEY (`idFoPago`) REFERENCES `fopago` (`idFoPago`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DetaFoPa_Transacciones1` FOREIGN KEY (`idTransacciones`) REFERENCES `transacciones` (`idTransacciones`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de Detalle de Forma De pago';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detafopa`
--

LOCK TABLES `detafopa` WRITE;
/*!40000 ALTER TABLE `detafopa` DISABLE KEYS */;
/*!40000 ALTER TABLE `detafopa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detatran`
--

DROP TABLE IF EXISTS `detatran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detatran` (
  `idDetaTran` int(11) NOT NULL AUTO_INCREMENT,
  `idTransacciones` int(11) NOT NULL,
  `idProductos` int(11) NOT NULL,
  `CantComp` int(11) NOT NULL,
  PRIMARY KEY (`idDetaTran`,`idTransacciones`,`idProductos`),
  KEY `fk_DetaTran_Transacciones1_idx` (`idTransacciones`),
  KEY `fk_DetaTran_Productos1_idx` (`idProductos`),
  CONSTRAINT `fk_DetaTran_Productos1` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DetaTran_Transacciones1` FOREIGN KEY (`idTransacciones`) REFERENCES `transacciones` (`idTransacciones`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de detalle de la transaccion, donde se registran los productos por cada venta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detatran`
--

LOCK TABLES `detatran` WRITE;
/*!40000 ALTER TABLE `detatran` DISABLE KEYS */;
/*!40000 ALTER TABLE `detatran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idEmpleados` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `Feching` date NOT NULL COMMENT 'Fecha de ingreso del empleado',
  `EstaEmpl` varchar(45) NOT NULL DEFAULT 'Activo' COMMENT 'Estado del empleado = ''Activo'' - ''Inactivo''',
  PRIMARY KEY (`idEmpleados`,`idUsuarios`,`idEmpresa`),
  KEY `fk_Empleados_Usuarios1_idx` (`idUsuarios`),
  KEY `fk_Empleados_Empresa1_idx` (`idEmpresa`),
  CONSTRAINT `fk_Empleados_Empresa1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleados_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,18,1,'2021-04-16','Activo'),(2,20,1,'2021-04-23','Activo'),(3,21,1,'2021-04-23','Activo'),(4,22,1,'2021-04-23','Activo');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Numero de iterador de empresa',
  `Nit` int(11) NOT NULL COMMENT 'NIT Numero de registro tributario',
  `Nombre` varchar(255) NOT NULL COMMENT 'Nombre de la Empresa',
  `Direccion` varchar(255) NOT NULL,
  `Telefono` varchar(25) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Logo` varchar(255) DEFAULT NULL,
  `EstaEmpresa` varchar(25) NOT NULL COMMENT 'Estado de la empresa = ''Activo'' - ''Inactivo''',
  PRIMARY KEY (`idEmpresa`),
  UNIQUE KEY `Nit_UNIQUE` (`Nit`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Entidad Empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,800900501,'Tienda Don Perrinchis','Calle 37 # 20a - 50','5550099','info@perrinchis.com','LogoPerrinchis.png','Activo');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fopago`
--

DROP TABLE IF EXISTS `fopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fopago` (
  `idFoPago` int(11) NOT NULL AUTO_INCREMENT,
  `NombFoPa` varchar(255) NOT NULL COMMENT 'Nombre de Forma de Pago = Efectivo, Tarjeta Débito, Tarjeta Crédito, Bonos, Etc..',
  PRIMARY KEY (`idFoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla Forma de Pago';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fopago`
--

LOCK TABLES `fopago` WRITE;
/*!40000 ALTER TABLE `fopago` DISABLE KEYS */;
/*!40000 ALTER TABLE `fopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `idGeneros` int(11) NOT NULL AUTO_INCREMENT,
  `Genero` varchar(45) NOT NULL COMMENT 'Genero= ''Femenino'', ''Masculino'', ''Indeterminado''',
  PRIMARY KEY (`idGeneros`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Femenino'),(2,'Masculino'),(3,'Ineterminado');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfiles` (
  `idPerfiles` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` int(11) NOT NULL,
  `idTipoUsuario` int(11) NOT NULL,
  `FechaIng` date NOT NULL,
  `EstaPerfil` varchar(45) NOT NULL COMMENT 'Estado del perfil = ''Activo'' - ''Inactivo''',
  PRIMARY KEY (`idPerfiles`,`idUsuarios`,`idTipoUsuario`),
  KEY `fk_Perfiles_Usuarios_idx` (`idUsuarios`),
  KEY `fk_Perfiles_TipoUsuario1_idx` (`idTipoUsuario`),
  CONSTRAINT `fk_Perfiles_TipoUsuario1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Perfiles_Usuarios` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Tabla para registrar los perfiles de las personas de mi sistema de información';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,1,1,'2021-01-01','Activo'),(2,1,2,'2021-03-17','Activo'),(3,1,3,'2021-03-17','Activo'),(4,1,4,'2021-03-17','Activo'),(5,2,2,'2021-03-17','Activo'),(6,2,3,'2021-03-17','Activo'),(7,3,3,'2021-03-17','Activo'),(8,4,3,'2021-03-17','Activo'),(9,4,4,'2021-03-17','Activo'),(10,5,3,'2021-03-23','Activo'),(11,18,2,'2021-04-16','Activo'),(12,19,3,'2021-04-16','Activo'),(13,20,2,'2021-04-23','Activo'),(14,21,2,'2021-04-23','Activo'),(15,22,2,'2021-04-23','Activo'),(16,22,3,'2021-04-23','Activo');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del producto',
  `idCategoria` int(11) NOT NULL COMMENT 'Categoria del producto',
  `NombProd` varchar(255) NOT NULL COMMENT 'Nombre del producto',
  `Precio` decimal(20,2) NOT NULL,
  `Marca` varchar(255) NOT NULL,
  `Descripcion` mediumtext NOT NULL,
  `CantProd` int(11) NOT NULL COMMENT 'Cantidad de producto disponible',
  `Imagen` varchar(45) NOT NULL COMMENT 'Nombre de la imagen',
  `EstaProd` varchar(45) NOT NULL DEFAULT 'Disponible' COMMENT 'Estado del producto = ''Disponible'' - ''No Disponible''',
  PRIMARY KEY (`idProductos`,`idCategoria`),
  KEY `fk_Productos_Categoria1_idx` (`idCategoria`),
  CONSTRAINT `fk_Productos_Categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla para productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocus`
--

DROP TABLE IF EXISTS `tipodocus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodocus` (
  `idTipoDocus` int(11) NOT NULL AUTO_INCREMENT,
  `NombTiDoc` varchar(150) NOT NULL COMMENT 'Nombre de tipo de documentos: Registro Civil Tarjeta de Identidad, Cédula de Ciudadania, Cédula de Extrangería, Pasaporte Visa, No Documentado',
  PRIMARY KEY (`idTipoDocus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Tabla para los tipos de documentos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocus`
--

LOCK TABLES `tipodocus` WRITE;
/*!40000 ALTER TABLE `tipodocus` DISABLE KEYS */;
INSERT INTO `tipodocus` VALUES (1,'Registro Civil'),(2,'Tarjeta de Identidad'),(3,'Cédula de Ciudadanía'),(4,'Cédula de Extrangería'),(5,'Pasaporte'),(6,'No Identificado');
/*!40000 ALTER TABLE `tipodocus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotran`
--

DROP TABLE IF EXISTS `tipotran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipotran` (
  `idTipoTran` int(11) NOT NULL AUTO_INCREMENT,
  `NombTran` varchar(45) NOT NULL COMMENT 'Nombre del tipo de transacccion',
  PRIMARY KEY (`idTipoTran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla Tipo de Transaccion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotran`
--

LOCK TABLES `tipotran` WRITE;
/*!40000 ALTER TABLE `tipotran` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipotran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Iterador Llave primaria del tipo de usuario',
  `NombTipo` varchar(45) NOT NULL COMMENT 'Nombre del tipo de usuario Ej : Empleado, Cliente, Proveedor, Administrador,  etc',
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tabla para agrupar a las diferentes PERSONAS que participan en la aplicacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Administrador'),(2,'Empleado'),(3,'Cliente'),(4,'Proveedor');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `idTransacciones` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoTran` int(11) NOT NULL,
  `idEmpleados` int(11) NOT NULL,
  `idClientes` int(11) NOT NULL,
  `NumeTran` int(11) NOT NULL COMMENT 'Numero de transaccion',
  `FechTran` date NOT NULL COMMENT 'Fecha de transaccion',
  `ValorTran` decimal(20,2) NOT NULL COMMENT 'Valor total de la transaccion',
  `EstaTran` varchar(45) NOT NULL DEFAULT 'Causado' COMMENT 'Estado de la transaccion ''Causado'' - ''Anulado''',
  PRIMARY KEY (`idTransacciones`,`idTipoTran`,`idEmpleados`,`idClientes`),
  KEY `fk_Transacciones_TipoTran1_idx` (`idTipoTran`),
  KEY `fk_Transacciones_Empleados1_idx` (`idEmpleados`),
  KEY `fk_Transacciones_Clientes1_idx` (`idClientes`),
  CONSTRAINT `fk_Transacciones_Clientes1` FOREIGN KEY (`idClientes`) REFERENCES `clientes` (`idClientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Transacciones_Empleados1` FOREIGN KEY (`idEmpleados`) REFERENCES `empleados` (`idEmpleados`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Transacciones_TipoTran1` FOREIGN KEY (`idTipoTran`) REFERENCES `tipotran` (`idTipoTran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de transacciones de compra y venta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
/*!50001 DROP VIEW IF EXISTS `userlogin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `userlogin` AS SELECT 
 1 AS `idUsuarios`,
 1 AS `NombreCompleto`,
 1 AS `Identificacion`,
 1 AS `NickName`,
 1 AS `Telefono`,
 1 AS `EstaUser`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `NickName` varchar(45) NOT NULL COMMENT 'Correo electronico para iniciar sesión',
  `PassUser` varchar(100) NOT NULL COMMENT 'Password del usuario',
  `EstaUser` varchar(45) NOT NULL DEFAULT 'Activo' COMMENT 'Estado del usuario = ''Activo'' - ''Inactivo''',
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'eder@mail.com','7e3b59a97eddbfa9ef4d577bd5e2448980660b14','Activo'),(2,'camila@mail.com','230991abcd77e8173edb0af392e1f11120051e29','Activo'),(3,'gaby@mail.com','8cb2237d0679ca88db6464eac60da96345513964','Activo'),(4,'johan@mail.com','230991abcd77e8173edb0af392e1f11120051e29','Activo'),(5,'diego@mail.com','8354336224c63279aadd00a9621757ef4fdf31fc','Inactivo'),(6,'accumsan@pretiumaliquetmetus.co.uk','a385f1de9b5d8bbd48b7e6195b4e7d4c95cbeeba','Activo'),(7,'rutrum.lorem.ac@magna.ca','0862927db599f910498834ae74ffd364d000e2e9','Activo'),(8,'feugiat.metus@Maecenasliberoest.ca','87b135eaed57cf84a968a24604ce5c43b3757296','Activo'),(9,'mauris@mauriselitdictum.edu','54c8c97b901f42f3fdd3135bcec0767692298674','Activo'),(10,'dictum.eu.placerat@id.org','abdcde66d68bf5da210f684db67c663b24a82a9c','Activo'),(11,'mauris.ipsum.porta@liberoProin.org','41cb8bb824253e1e987f1a9f6782a29bcf55aabb','Activo'),(12,'augue@quistristique.net','81a2ab4695f698fa55698b6877060c2d0b8cb0f5','Activo'),(13,'suspendisse@aauctor.org','0c11d463c749db5838e2c0e489bf869d531e5403','Activo'),(14,'non@acurnaUt.com','24ae8a345ddbfffd0cab0a48595a332f0fd9b8c3','Activo'),(15,'eu.arcu@non.com','6312499eda5ae6ce91dd4ae11064b8c44f64175a','Activo'),(16,'john@mail.com','6c074fa94c98638dfe3e3b74240573eb128b3d16','Activo'),(17,'mary@mail.com','8d5004c9c74259ab775f63f7131da077814a7636','Inactivo'),(18,'dave@mail.com','d6b5d32c983b8c4b73c024c07004b01c65aa82b0','Activo'),(19,'maye@mail.com','1ccc4dd144ed83853482a145d713fbf7b7853bd9','Activo'),(20,'fernando@mail.com','de26704edd9f696620f5bc3f1ecf1944d83224fd','Activo'),(21,'liliana@mail.com','6843b7bbb6a1ffd18281c4c2dc23e778975c8635','Activo'),(22,'natalia@mail.com','08e1cb7ce320def7e2e4ac82e87748c484082408','Activo'),(23,'paula@mail.com','1a6ec65cfb324cbab5b70702bf8a8dcd8320502a','Activo');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'perrinchis'
--

--
-- Dumping routines for database 'perrinchis'
--
/*!50003 DROP FUNCTION IF EXISTS `helloworld` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `helloworld`(
 -- Dentro del parentesis van los parámetros
) RETURNS varchar(200) CHARSET utf8
BEGIN
 
# Inicio de la función:
set @mensaje = 'Hello World, Have a greatfull welcome for this course';

RETURN @mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `login`(
-- Parametros de login:
usuario varchar(256),
clave varchar(256)
) RETURNS varchar(256) CHARSET utf8
BEGIN
# 1. Declaramos variables y constantes:
declare mensaje varchar(200);	-- Variable para los mensajes.
set @estado = 'Activo';			-- Constante del estado.

-- Validamos el NickName del parametro 
set @nick = (select ifnull(count(NickName),0) from usuarios where nickname = usuario and EstaUser = @estado);
-- Validamos el Password del parametro:
set @pass = (select ifnull(count(PassUser),0) from usuarios where PassUser = sha(clave) and nickname = usuario);

# 2. Dar la bienvenida si el usuario y la contraseña coinciden:
if @nick != 1 or @pass !=1 then
	-- Si ambos son diferentes de uno, mensaje de error:
    set mensaje = 'Usuario y/o contraseña incorrectos!';
else
	-- Si ambos son iguales a uno quiere decir que los datos son correctos:
    set mensaje = 'Autorizado';
end if;

# 3. Retornamos el mensaje obtenido:
RETURN mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CrudUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CrudUsuario`(
# Tablas del modulo : usuarios, datospersonales, perfiles, clientes y empleados :
in v_idUsuarios int, 
in v_NickName varchar(255), 
in v_PassUser varchar(255), 
# Datos de la tabla datos personales:
in v_idDatosPersonales int,
in v_idTipoDocus int,
in v_idGeneros int,
in v_Nombre varchar(255),
in v_Apellidos varchar(255),
in v_Cedula varchar(25),
in v_Direccion text,
in v_Telefono varchar(45),
in v_FechaNace date,
# Datos de la tabla Perfiles:
in v_idPerfiles int,
in v_idTipoUsuario int,
# Datos de Cliente,
in v_idcliente int,
# Datos de Empleado
in v_idempleado int,
in opcion varchar(20)
# Las opciones pueden ser: 'guardar', 'modificar', 'eliminar'
)
BEGIN
# Declaración de variables y constantes:
declare estado varchar(20);
declare hoy date;
declare resultado varchar(255);

# Asigno valores a variables:
set estado = 'Activo';
set hoy = (select curdate());


# Realizar funciones C-R-UD: create, update an delete(update)
# Condicionamos la opcion, si es guardar => insert, si es modificar => update, y eliminar => update:
-- Uso de condiciones case en mysql:
case
	-- Cuando la opcion sea guardar :
	when opcion = 'guardar' then
    -- 1. Validar si el usuario existe:
    set @usuario = (select count(NickName) from  usuarios where NickName = v_NickName);
    if @usuario = 0 then 
		-- Inserta en la tabla usuarios los parametros de la función:
		insert into usuarios values (0,v_NickName,sha(v_PassUser),estado);
        -- Proceso para Insertar en la tabla datos personales:
        -- Capturar el id de usuario:
        set @idusuario = (select idusuarios from usuarios where NickName = v_NickName);
        -- Insertar los datos en la tabla dataos personales
        insert into datospersonales values (0, @idusuario, v_idTipoDocus, v_idGeneros, v_Nombre, v_Apellidos, v_Cedula, v_Direccion, v_Telefono, v_NickName, v_FechaNace);
        -- Proceso para guardar según el tipo de usuario:
        if v_idTipoUsuario = 2 then
			-- Si el tipo de usuario es empleado:
            -- Insertar datos en la tabla perfiles
			insert into Perfiles values (0, @idusuario, v_idTipoUsuario, hoy, estado);
            insert into Perfiles values (0, @idusuario, 3, hoy, estado);
            insert into empleados values (0, @idusuario, 1, hoy, estado);
            -- Adicionalmente tambien lo agregamos a la tabla usuarios:
            insert into clientes values (0, @idusuario, hoy);
		end if;
        if v_idTipoUsuario = 3 then
            -- Si es Cliente, solo inserta en la tabla cliente:
            insert into Perfiles values (0, @idusuario, v_idTipoUsuario, hoy, estado);
            insert into clientes values (0, @idusuario, hoy);
		end if;
		-- Guardar resultado:
		set resultado = 'Usuario agregado correctamente';
	-- Fin de proceso de guardar.
	else 
		set resultado = 'El usuario ya existe';
	end if;
    -- Muestro mensaje de usuario agregado:
    select resultado;    
    -- Cuando la opción sea Eliminar usuario:
    when opcion = 'eliminar' then
    -- Cambiamos el estado del usuario a inactivo:
    set estado = 'Inactivo';
    update usuarios
    set estauser = estado
    where idusuarios = v_idUsuarios;
    -- Mostramos un mensaje:
    select 'Se ha eliminado al usuario';
    -- Fin de los casos
end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(
-- Parametros de login:
usuario varchar(256),
clave varchar(256)
)
BEGIN
# 1. Declaramos variables y constantes:
declare mensaje varchar(200);	-- Variable para los mensajes.
set @estado = 'Activo';			-- Constante del estado.

-- Validamos el NickName del parametro 
set @nick = (select ifnull(count(NickName),0) from usuarios where NickName = usuario and EstaUser = @estado);

-- Validamos el Password del parametro:
set @pass = (select ifnull(count(PassUser),0) from usuarios where PassUser = sha(clave) and nickname = usuario);

# 2. Dar la bienvenida si el usuario y la contraseña coinciden:
if @nick != 1 or @pass !=1 then
	-- Si ambos son diferentes de uno, mensaje de error:
	set mensaje = 'Usuario y/o contraseña incorrectos!';
    select mensaje;
else
	-- Si ambos son iguales a uno quiere decir que los datos son correctos:
    SELECT * from userlogin where NickName = usuario;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `clientesactivos`
--

/*!50001 DROP VIEW IF EXISTS `clientesactivos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clientesactivos` AS select `datospersonales`.`idUsuarios` AS `identificador`,`datospersonales`.`Cedula` AS `Cédula`,concat(`datospersonales`.`Nombre`,' ',`datospersonales`.`Apellidos`) AS `Nombre Completo`,`clientes`.`FechRegi` AS `Fecha de Ingreso`,`generos`.`Genero` AS `Genero` from ((`datospersonales` join `generos` on((`datospersonales`.`idGeneros` = `generos`.`idGeneros`))) join `clientes` on((`datospersonales`.`idUsuarios` = `clientes`.`idUsuarios`))) group by `datospersonales`.`Cedula` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `datosusuarios`
--

/*!50001 DROP VIEW IF EXISTS `datosusuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datosusuarios` AS select `d`.`Cedula` AS `Identificación`,concat(`d`.`Nombre`,' ',`d`.`Apellidos`) AS `Nombre Completo`,`g`.`Genero` AS `genero`,`u`.`NickName` AS `Usuario de Ingreso`,`t`.`NombTipo` AS `Perfil`,`p`.`FechaIng` AS `Fecha de Ingreso` from ((((`usuarios` `u` join `datospersonales` `d` on((`d`.`idUsuarios` = `u`.`idUsuarios`))) join `generos` `g` on((`d`.`idGeneros` = `g`.`idGeneros`))) join `perfiles` `p` on((`p`.`idUsuarios` = `u`.`idUsuarios`))) join `tipousuario` `t` on((`p`.`idTipoUsuario` = `t`.`idTipoUsuario`))) order by `u`.`idUsuarios`,`t`.`NombTipo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userlogin`
--

/*!50001 DROP VIEW IF EXISTS `userlogin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userlogin` AS select `u`.`idUsuarios` AS `idUsuarios`,concat(`d`.`Nombre`,' ',`d`.`Apellidos`) AS `NombreCompleto`,`d`.`Cedula` AS `Identificacion`,`u`.`NickName` AS `NickName`,`d`.`Telefono` AS `Telefono`,`u`.`EstaUser` AS `EstaUser` from (`usuarios` `u` join `datospersonales` `d` on((`u`.`idUsuarios` = `d`.`idUsuarios`))) where (`u`.`EstaUser` = 'Activo') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-05 22:34:11
