--- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for Linux (x86_64)
-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: RegistrosTec11
-- Host: localhost    Database: registrostec11
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB
-- Server version	10.11.2-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
@ -16,31 +16,29 @@
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `2023`
-- Table structure for table `alumno_aula`
--

DROP TABLE IF EXISTS `2023`;
DROP TABLE IF EXISTS `alumno_aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `2023` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno` int(11) NOT NULL,
  `curso_idcurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alumno` (`alumno`),
  KEY `fk_curso_idcurso` (`curso_idcurso`),
  CONSTRAINT `2023_ibfk_1` FOREIGN KEY (`alumno`) REFERENCES `alumnos` (`dni`),
  CONSTRAINT `fk_curso_idcurso` FOREIGN KEY (`curso_idcurso`) REFERENCES `cursos` (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `alumno_aula` (
  `dni` varchar(255) DEFAULT NULL,
  `id_aula` int(11) DEFAULT NULL,
  KEY `dni` (`dni`),
  KEY `id_aula` (`id_aula`),
  CONSTRAINT `alumno_aula_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `alumnos` (`dni`),
  CONSTRAINT `alumno_aula_ibfk_2` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `2023`
-- Dumping data for table `alumno_aula`
--

LOCK TABLES `2023` WRITE;
/*!40000 ALTER TABLE `2023` DISABLE KEYS */;
/*!40000 ALTER TABLE `2023` ENABLE KEYS */;
LOCK TABLES `alumno_aula` WRITE;
/*!40000 ALTER TABLE `alumno_aula` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_aula` ENABLE KEYS */;
UNLOCK TABLES;

--
@ -51,15 +49,19 @@ DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `dni` int(11) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `libro` int(11) DEFAULT NULL,
  `folio` int(11) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
@ -72,95 +74,192 @@ LOCK TABLES `alumnos` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
-- Table structure for table `alumnos_taller`
--

DROP TABLE IF EXISTS `cursos`;
DROP TABLE IF EXISTS `alumnos_taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `año` int(4) NOT NULL,
  `division` varchar(10) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `grupo` varchar(10) NOT NULL,
  PRIMARY KEY (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `alumnos_taller` (
  `dni` varchar(255) DEFAULT NULL,
  `id_taller` int(11) DEFAULT NULL,
  KEY `dni` (`dni`),
  KEY `id_taller` (`id_taller`),
  CONSTRAINT `alumnos_taller_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `alumnos` (`dni`),
  CONSTRAINT `alumnos_taller_ibfk_2` FOREIGN KEY (`id_taller`) REFERENCES `taller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
-- Dumping data for table `alumnos_taller`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
LOCK TABLES `alumnos_taller` WRITE;
/*!40000 ALTER TABLE `alumnos_taller` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos_taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `espacios`
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `espacios`;
DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `espacios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso` varchar(255) DEFAULT NULL,
CREATE TABLE `aula` (
  `id` int(11) NOT NULL,
  `id_prof` int(11) DEFAULT NULL,
  `id_prece` int(11) DEFAULT NULL,
  `grado_division` varchar(255) DEFAULT NULL,
  `materia` varchar(255) DEFAULT NULL,
  `profesor_id` int(11) DEFAULT NULL,
  `grupo` varchar(50) DEFAULT NULL,
  `diaHora` varchar(255) DEFAULT NULL,
  `turno` varchar(50) DEFAULT NULL,
  `dia` varchar(255) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `grupo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profesor_id` (`profesor_id`),
  CONSTRAINT `espacios_ibfk_1` FOREIGN KEY (`profesor_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
  KEY `id_prof` (`id_prof`),
  KEY `id_prece` (`id_prece`),
  CONSTRAINT `aula_ibfk_1` FOREIGN KEY (`id_prof`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `aula_ibfk_2` FOREIGN KEY (`id_prece`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `espacios`
-- Dumping data for table `aula`
--

LOCK TABLES `espacios` WRITE;
/*!40000 ALTER TABLE `espacios` DISABLE KEYS */;
/*!40000 ALTER TABLE `espacios` ENABLE KEYS */;
LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
-- Table structure for table `faltas_aula`
--

DROP TABLE IF EXISTS `notas`;
DROP TABLE IF EXISTS `faltas_aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
CREATE TABLE `faltas_aula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` int(11) DEFAULT NULL,
  `espacio_id` int(11) DEFAULT NULL,
  `nota1` int(11) DEFAULT NULL,
  `nota2` int(11) DEFAULT NULL,
  `nota3` int(11) DEFAULT NULL,
  `promedio1` char(1) DEFAULT NULL,
  `nota4` int(11) DEFAULT NULL,
  `nota5` int(11) DEFAULT NULL,
  `nota6` int(11) DEFAULT NULL,
  `promedio2` char(1) DEFAULT NULL,
  `id_curso_aula` int(11) DEFAULT NULL,
  `tipo_falta` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `espacio_id` (`espacio_id`),
  KEY `dni` (`dni`),
  CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`espacio_id`) REFERENCES `espacios` (`id`),
  CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`dni`) REFERENCES `alumnos` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
  KEY `id_curso_aula` (`id_curso_aula`),
  CONSTRAINT `faltas_aula_ibfk_1` FOREIGN KEY (`id_curso_aula`) REFERENCES `aula` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faltas_aula`
--

LOCK TABLES `faltas_aula` WRITE;
/*!40000 ALTER TABLE `faltas_aula` DISABLE KEYS */;
/*!40000 ALTER TABLE `faltas_aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faltas_taller`
--

DROP TABLE IF EXISTS `faltas_taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faltas_taller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_curso_taller` int(11) DEFAULT NULL,
  `tipo_falta` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_curso_taller` (`id_curso_taller`),
  CONSTRAINT `faltas_taller_ibfk_1` FOREIGN KEY (`id_curso_taller`) REFERENCES `taller` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faltas_taller`
--

LOCK TABLES `faltas_taller` WRITE;
/*!40000 ALTER TABLE `faltas_taller` DISABLE KEYS */;
/*!40000 ALTER TABLE `faltas_taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_aula`
--

DROP TABLE IF EXISTS `notas_aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas_aula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_curso` int(11) DEFAULT NULL,
  `nota_trimestre1_1` int(11) DEFAULT NULL,
  `nota_trimestre1_2` int(11) DEFAULT NULL,
  `nota_trimestre1_3` int(11) DEFAULT NULL,
  `trimestre1` varchar(255) DEFAULT NULL,
  `nota_trimestre2_1` int(11) DEFAULT NULL,
  `nota_trimestre2_2` int(11) DEFAULT NULL,
  `nota_trimestre2_3` int(11) DEFAULT NULL,
  `trimestre2` varchar(255) DEFAULT NULL,
  `nota_trimestre3_1` int(11) DEFAULT NULL,
  `nota_trimestre3_2` int(11) DEFAULT NULL,
  `nota_trimestre3_3` int(11) DEFAULT NULL,
  `trimestre3` varchar(255) DEFAULT NULL,
  `aprobado` enum('tea','tep','ter') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `notas_aula_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `aula` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_aula`
--

LOCK TABLES `notas_aula` WRITE;
/*!40000 ALTER TABLE `notas_aula` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_taller`
--

DROP TABLE IF EXISTS `notas_taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas_taller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_taller` int(11) DEFAULT NULL,
  `nota_trimestre1_1` int(11) DEFAULT NULL,
  `nota_trimestre1_2` int(11) DEFAULT NULL,
  `nota_trimestre1_3` int(11) DEFAULT NULL,
  `trimestre1` varchar(255) DEFAULT NULL,
  `nota_trimestre2_1` int(11) DEFAULT NULL,
  `nota_trimestre2_2` int(11) DEFAULT NULL,
  `nota_trimestre2_3` int(11) DEFAULT NULL,
  `trimestre2` varchar(255) DEFAULT NULL,
  `nota_trimestre3_1` int(11) DEFAULT NULL,
  `nota_trimestre3_2` int(11) DEFAULT NULL,
  `nota_trimestre3_3` int(11) DEFAULT NULL,
  `trimestre3` varchar(255) DEFAULT NULL,
  `aprobado` enum('tea','tep','ter') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_taller` (`id_taller`),
  CONSTRAINT `notas_taller_ibfk_1` FOREIGN KEY (`id_taller`) REFERENCES `taller` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
-- Dumping data for table `notas_taller`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
LOCK TABLES `notas_taller` WRITE;
/*!40000 ALTER TABLE `notas_taller` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_taller` ENABLE KEYS */;
UNLOCK TABLES;

--
@ -171,11 +270,13 @@ DROP TABLE IF EXISTS `passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwords` (
  `idUsuario` int(11) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `passwords_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
  `id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `passwords_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
@ -184,11 +285,42 @@ CREATE TABLE `passwords` (

LOCK TABLES `passwords` WRITE;
/*!40000 ALTER TABLE `passwords` DISABLE KEYS */;
INSERT INTO `passwords` VALUES
(1,'root');
/*!40000 ALTER TABLE `passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller`
--

DROP TABLE IF EXISTS `taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taller` (
  `id` int(11) NOT NULL,
  `id_prof` int(11) DEFAULT NULL,
  `id_prece` int(11) DEFAULT NULL,
  `grado_division` varchar(255) DEFAULT NULL,
  `materia` varchar(255) DEFAULT NULL,
  `dia` varchar(255) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `grupo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_prof` (`id_prof`),
  KEY `id_prece` (`id_prece`),
  CONSTRAINT `taller_ibfk_1` FOREIGN KEY (`id_prof`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `taller_ibfk_2` FOREIGN KEY (`id_prece`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller`
--

LOCK TABLES `taller` WRITE;
/*!40000 ALTER TABLE `taller` DISABLE KEYS */;
/*!40000 ALTER TABLE `taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--
@ -198,13 +330,12 @@ DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `apellido` varchar(71) NOT NULL,
  `nombre` varchar(71) NOT NULL,
  `mail` varchar(71) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
@ -213,8 +344,6 @@ CREATE TABLE `usuarios` (

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,12345678,'Usuario','Prueba','usuario.prueba@ejemplo.com',123456789);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
@ -227,4 +356,4 @@ UNLOCK TABLES;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-03 12:48:14
-- Dump completed on 2023-05-29 12:08:42