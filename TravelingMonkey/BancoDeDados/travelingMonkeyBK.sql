CREATE DATABASE  IF NOT EXISTS `travelingmonkey` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `travelingmonkey`;
-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: travelingmonkey
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avaliacoesguias`
--

DROP TABLE IF EXISTS `avaliacoesguias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacoesguias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAvaliador` int(11) NOT NULL,
  `idGuiaAvaliado` int(11) NOT NULL,
  `nota` int(11) NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `dataAvaliacao` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idAvaliador` (`idAvaliador`),
  KEY `idGuiaAvaliado` (`idGuiaAvaliado`),
  CONSTRAINT `avaliacoesguias_ibfk_1` FOREIGN KEY (`idAvaliador`) REFERENCES `turistas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `avaliacoesguias_ibfk_2` FOREIGN KEY (`idGuiaAvaliado`) REFERENCES `guias` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoesguias`
--

LOCK TABLES `avaliacoesguias` WRITE;
/*!40000 ALTER TABLE `avaliacoesguias` DISABLE KEYS */;
INSERT INTO `avaliacoesguias` VALUES (1,1,1,5,'Guia muito experiente e atencioso.','2024-01-15 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,2,2,4,'Bom guia, mas poderia ser mais entusiasmado.','2024-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,3,1,5,'Excelente conhecimento local e ótimo relacionamento com os turistas.','2024-03-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,2,3,3,'Guia razoável, poderia melhorar nas explicações.','2024-04-20 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,3,2,4,'Bom guia, mas faltou um pouco de paciência.','2024-05-14 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `avaliacoesguias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacoespontos`
--

DROP TABLE IF EXISTS `avaliacoespontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacoespontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAvaliador` int(11) NOT NULL,
  `idPontoAvaliado` int(11) NOT NULL,
  `nota` decimal(2,1) NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `dataAvaliacao` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idAvaliador` (`idAvaliador`),
  KEY `idPontoAvaliado` (`idPontoAvaliado`),
  CONSTRAINT `avaliacoespontos_ibfk_1` FOREIGN KEY (`idAvaliador`) REFERENCES `turistas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoespontos`
--

LOCK TABLES `avaliacoespontos` WRITE;
/*!40000 ALTER TABLE `avaliacoespontos` DISABLE KEYS */;
INSERT INTO `avaliacoespontos` VALUES (1,1,1,5.0,'Ótimo lugar, muito bem conservado e com guias excelentes.','2024-01-15 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,2,2,4.0,'Experiência incrível, mas o acesso poderia ser melhor.','2024-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,3,3,5.0,'Maravilhoso! Perfeito para quem gosta de natureza.','2024-03-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,2,4,3.0,'Bom, mas esperava mais das instalações.','2024-04-20 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,3,5,4.0,'Ótimo passeio de barco, recomendo!','2024-05-14 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,1,6,5.0,'História fascinante e bem preservada.','2024-06-11 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,1,7,4.0,'Cultura rica e guias bem informados.','2024-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,2,8,5.0,'Cachoeira incrível, vale cada minuto!','2024-08-21 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,3,9,4.0,'Museu interessante, mas poderia ser maior.','2024-09-17 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,3,10,5.0,'Vista espetacular, acesso por trilha é um plus.','2024-10-04 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,1,11,3.0,'Lugar bonito, mas a manutenção deixa a desejar.','2024-11-13 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,2,12,4.0,'Parque muito agradável, ótima opção de lazer.','2024-12-01 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,3,13,5.0,'Praia tranquila e limpa, recomendo!','2024-12-21 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `avaliacoespontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriasxpontos`
--

DROP TABLE IF EXISTS `categoriasxpontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriasxpontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modalidade` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriasxpontos`
--

LOCK TABLES `categoriasxpontos` WRITE;
/*!40000 ALTER TABLE `categoriasxpontos` DISABLE KEYS */;
INSERT INTO `categoriasxpontos` VALUES (1,'Locais históricos','Cultura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Museus e galerias de arte','Cultura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Eventos culturais','Cultura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Arte pública','Cultura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Comunidades étnicas','Cultura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'Turismo industrial','Cultura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'Turismo criativo','Cultura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'Edifícios e estruturas','Arquitetura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'Castelos e fortes','Arquitetura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'Templos antigos','Arquitetura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'Pontes e arranha-céus','Arquitetura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'Restaurantes e bares','Gastronomia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'Feiras e mercados','Gastronomia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'Eventos gastronômicos','Gastronomia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'Parques temáticos','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'Parques aquáticos','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,'Carnavais','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'Praias','Paisagem','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'Montanhas','Paisagem','0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,'Desertos','Paisagem','0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'Florestas','Paisagem','0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,'Parques nacionais','Paisagem','0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,'Jardins botânicos','Paisagem','0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,'Eventos esportivos','Eventos','0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,'Corrida de Fórmula 1','Eventos','0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,'Regatas de vela','Eventos','0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,'Centros comerciais','Compras','0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,'Feiras de artesanato','Compras','0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,'Mercados de rua','Compras','0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,'Lojas de fábrica','Compras','0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,'Trens históricos','Cultura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,'Zoológicos','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,'Aquários','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,'Bibliotecas','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,'Antigas prisões','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,'Museus de história viva','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,'Oficinas de artesanato','Cultura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,'Shows e concertos','Eventos','0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,'Feiras e exposições','Eventos','0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,'Eventos religiosos','Eventos','0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,'Caverna','Ecoturismo','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `categoriasxpontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCidade` varchar(255) NOT NULL,
  `ufCidade` varchar(255) NOT NULL,
  `cnpjCidade` varchar(255) DEFAULT NULL,
  `orgRespCidade` varchar(255) NOT NULL,
  `cnpjOrgRespCidade` varchar(255) NOT NULL,
  `endRuaOrgRespCidade` varchar(255) NOT NULL,
  `endNumOrgRespCidade` varchar(255) NOT NULL,
  `endBairroOrgRespCidade` varchar(255) NOT NULL,
  `endCepOrgRespCidade` varchar(255) NOT NULL,
  `telOrgRespCidade` varchar(255) NOT NULL,
  `emailOrgRespCidade` varchar(255) NOT NULL,
  `passwordCidade` varchar(255) NOT NULL,
  `profilePicCidade` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,'Registro','SP','1234567890001','SECRETARIA DE TURISMO','9876543210001','RUA TURISMO','1','Bairro Turista','11900000','1338281000','registro@registro.com','$2b$10$31L1lA30vzOSaTi/nZUFiedns17A7hrcfNqAyjL/PeEI.8iiNgQsO','/imgs/iwazaru.webp','2024-06-11 19:59:07','2024-06-11 19:59:07'),(2,'CAJATI','SP','1122334455','SECRETARIA DE TURISMO DE CAJATI','9988776655','RUA TURISMO CAJATI','2','Bairro Turista 2','119922','1338291001','cajati@cajati.com.br','$2b$10$W1SvsKNfyPzgP.WmF977l.ByDABRpBvGR0Jk/EQ1VQNQHDFSc2dCa','/imgs/iwazaru.webp','2024-06-11 19:59:50','2024-06-11 19:59:50');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidadesxpontos`
--

DROP TABLE IF EXISTS `cidadesxpontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidadesxpontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCidade` int(11) NOT NULL,
  `idPonto` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidadesxpontos`
--

LOCK TABLES `cidadesxpontos` WRITE;
/*!40000 ALTER TABLE `cidadesxpontos` DISABLE KEYS */;
INSERT INTO `cidadesxpontos` VALUES (1,1,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1,11,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `cidadesxpontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodidades`
--

DROP TABLE IF EXISTS `comodidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comodidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comodidade` varchar(255) NOT NULL,
  `tipoComodidade` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodidades`
--

LOCK TABLES `comodidades` WRITE;
/*!40000 ALTER TABLE `comodidades` DISABLE KEYS */;
INSERT INTO `comodidades` VALUES (1,'Rampa de Acesso','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Banheiro Adaptado','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Elevador Acessível','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Sinalização em Braille','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Áudio Descritivo','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'Estacionamento para Deficientes','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'Entrada Sem Degraus','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'Cadeiras de Rodas Disponíveis','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'Serviço de Atendimento para Surdos','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'Corrimão de Apoio','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'Portas Largas','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'Pisos Táteis','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'Telefones Adaptados','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'Academia ao ar livre adaptada','Acessibilidade','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'Parque Infantil','Crianças','0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'Fraldário','Crianças','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,'Cadeiras de Alimentação para Crianças','Crianças','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'Área para Animais','Pets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'Bebedouro para Animais','Pets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,'Enfermaria','Saúde','0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'Wi-Fi Gratuito','Serviços','0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,'Bicicletário','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,'Estacionamento','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,'Estacionamento coberto','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,'Academia ao ar livre','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,'Carregadores de Celular','Serviços','0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,'Cafeteria','Serviços','0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,'Área de Piquenique','Infraestrutura','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `comodidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodidadesxpontos`
--

DROP TABLE IF EXISTS `comodidadesxpontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comodidadesxpontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idComodidade` int(11) NOT NULL,
  `idPontoTuristico` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idComodidade` (`idComodidade`),
  KEY `idPontoTuristico` (`idPontoTuristico`),
  CONSTRAINT `comodidadesxpontos_ibfk_1` FOREIGN KEY (`idComodidade`) REFERENCES `comodidades` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `comodidadesxpontos_ibfk_2` FOREIGN KEY (`idPontoTuristico`) REFERENCES `pontos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodidadesxpontos`
--

LOCK TABLES `comodidadesxpontos` WRITE;
/*!40000 ALTER TABLE `comodidadesxpontos` DISABLE KEYS */;
INSERT INTO `comodidadesxpontos` VALUES (1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,3,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,5,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,8,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,4,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,6,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,10,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,19,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,22,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,26,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,1,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,6,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,7,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,20,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,9,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,21,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,23,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,11,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,13,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,25,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,3,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,5,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,16,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,12,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,14,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,17,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,4,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,18,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,2,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,8,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,22,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,24,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,15,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,27,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,21,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,23,13,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `comodidadesxpontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotosguias`
--

DROP TABLE IF EXISTS `fotosguias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotosguias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idFotografo` int(11) NOT NULL,
  `idGuiaFotografado` int(11) NOT NULL,
  `fotos` varchar(255) NOT NULL,
  `dataFoto` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idFotografo` (`idFotografo`),
  KEY `idGuiaFotografado` (`idGuiaFotografado`),
  CONSTRAINT `fotosguias_ibfk_1` FOREIGN KEY (`idFotografo`) REFERENCES `turistas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fotosguias_ibfk_2` FOREIGN KEY (`idGuiaFotografado`) REFERENCES `guias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotosguias`
--

LOCK TABLES `fotosguias` WRITE;
/*!40000 ALTER TABLE `fotosguias` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotosguias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotospontos`
--

DROP TABLE IF EXISTS `fotospontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotospontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idFotografo` int(11) NOT NULL,
  `idPontoFotografado` int(11) NOT NULL,
  `fotos` varchar(255) NOT NULL,
  `dataFoto` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idFotografo` (`idFotografo`),
  KEY `idPontoFotografado` (`idPontoFotografado`),
  CONSTRAINT `fotospontos_ibfk_1` FOREIGN KEY (`idFotografo`) REFERENCES `turistas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fotospontos_ibfk_2` FOREIGN KEY (`idPontoFotografado`) REFERENCES `pontos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotospontos`
--

LOCK TABLES `fotospontos` WRITE;
/*!40000 ALTER TABLE `fotospontos` DISABLE KEYS */;
INSERT INTO `fotospontos` VALUES (2,1,1,'photo-1718411075553.jpg','2024-06-14 21:24:35','2024-06-14 21:24:35','2024-06-14 21:24:35'),(3,1,6,'photo-1718411299732.jpg','2024-06-14 21:28:19','2024-06-14 21:28:19','2024-06-14 21:28:19'),(4,1,1,'photo-1718411304746.jpg','2024-06-14 21:28:24','2024-06-14 21:28:24','2024-06-14 21:28:24'),(5,1,6,'photo-1718411314065.jpg','2024-06-14 21:28:34','2024-06-14 21:28:34','2024-06-14 21:28:34'),(7,1,8,'photo-1718411648084.jpg','2024-06-14 21:34:08','2024-06-14 21:34:08','2024-06-14 21:34:08'),(8,1,8,'photo-1718411661884.jpg','2024-06-14 21:34:21','2024-06-14 21:34:21','2024-06-14 21:34:21'),(9,1,8,'photo-1718411671250.jpg','2024-06-14 21:34:31','2024-06-14 21:34:31','2024-06-14 21:34:31'),(10,1,8,'photo-1718411679130.jpg','2024-06-14 21:34:39','2024-06-14 21:34:39','2024-06-14 21:34:39'),(11,1,8,'photo-1718411686842.jpg','2024-06-14 21:34:46','2024-06-14 21:34:46','2024-06-14 21:34:46'),(12,1,8,'photo-1718411692443.jpg','2024-06-14 21:34:52','2024-06-14 21:34:52','2024-06-14 21:34:52'),(14,1,2,'photo-1718413648484.jpg','2024-06-14 22:07:28','2024-06-14 22:07:28','2024-06-14 22:07:28'),(15,1,2,'photo-1718413655660.webp','2024-06-14 22:07:35','2024-06-14 22:07:35','2024-06-14 22:07:35'),(17,1,3,'photo-1718414331957.jpg','2024-06-14 22:18:51','2024-06-14 22:18:51','2024-06-14 22:18:51'),(18,1,3,'photo-1718414337302.jpg','2024-06-14 22:18:57','2024-06-14 22:18:57','2024-06-14 22:18:57'),(19,1,5,'photo-1718461191223.jpg','2024-06-15 11:19:51','2024-06-15 11:19:51','2024-06-15 11:19:51'),(20,1,7,'photo-1718474604805.jpg','2024-06-15 15:03:24','2024-06-15 15:03:24','2024-06-15 15:03:24');
/*!40000 ALTER TABLE `fotospontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotosxpontofotografados`
--

DROP TABLE IF EXISTS `fotosxpontofotografados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotosxpontofotografados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idFoto` int(11) NOT NULL,
  `idTurista` int(11) NOT NULL,
  `idPonto` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idFoto` (`idFoto`),
  KEY `idTurista` (`idTurista`),
  KEY `idPonto` (`idPonto`),
  CONSTRAINT `fotosxpontofotografados_ibfk_1` FOREIGN KEY (`idFoto`) REFERENCES `fotospontos` (`id`),
  CONSTRAINT `fotosxpontofotografados_ibfk_2` FOREIGN KEY (`idTurista`) REFERENCES `turistas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fotosxpontofotografados_ibfk_3` FOREIGN KEY (`idPonto`) REFERENCES `pontos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotosxpontofotografados`
--

LOCK TABLES `fotosxpontofotografados` WRITE;
/*!40000 ALTER TABLE `fotosxpontofotografados` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotosxpontofotografados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guias`
--

DROP TABLE IF EXISTS `guias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomeGuia` varchar(255) NOT NULL,
  `cadGuia` varchar(255) NOT NULL,
  `motorGuia` varchar(255) NOT NULL,
  `idiomaGuia` varchar(255) NOT NULL,
  `emailGuia` varchar(255) NOT NULL,
  `passwordGuia` varchar(255) NOT NULL,
  `profilePicGuia` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guias`
--

LOCK TABLES `guias` WRITE;
/*!40000 ALTER TABLE `guias` DISABLE KEYS */;
INSERT INTO `guias` VALUES (1,'GUIA 1','123456','Sim','DE','guia@guia.com.br','$2b$10$HCO5PWZGyc51.ExWYuUzfeM/2z.fExQepAw/VmJQlp4Z.FH9L6F4W','/imgs/kikazaru.webp','2024-06-11 20:00:10','2024-06-11 20:00:10'),(2,'GUIA 2','11223344','Sim','BN','guia2@guia.com.br','$2b$10$BoFpemTEkqsk/h.UvbHrcOjXO7JQSbh20d/ovSTQ927O5tRkMICJC','/imgs/kikazaru.webp','2024-06-11 20:00:26','2024-06-11 20:00:26'),(3,'GUIA 3','1122334455','Não','EN','guia3@guia.com.br','$2b$10$brK7QhKqdgSeO8Qjz7Van.aZImWkUX8Z8PnLB7IuHPj04HxAnYYi.','/imgs/kikazaru.webp','2024-06-11 20:00:47','2024-06-11 20:00:47');
/*!40000 ALTER TABLE `guias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guiasavaliados`
--

DROP TABLE IF EXISTS `guiasavaliados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guiasavaliados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAvaliacao` int(11) NOT NULL,
  `idGuia` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idAvaliacao` (`idAvaliacao`),
  KEY `idGuia` (`idGuia`),
  CONSTRAINT `guiasavaliados_ibfk_1` FOREIGN KEY (`idAvaliacao`) REFERENCES `avaliacoesguias` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `guiasavaliados_ibfk_2` FOREIGN KEY (`idGuia`) REFERENCES `guias` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guiasavaliados`
--

LOCK TABLES `guiasavaliados` WRITE;
/*!40000 ALTER TABLE `guiasavaliados` DISABLE KEYS */;
INSERT INTO `guiasavaliados` VALUES (6,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,2,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,3,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,4,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,5,2,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `guiasavaliados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horariofuncionas`
--

DROP TABLE IF EXISTS `horariofuncionas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horariofuncionas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diaDaSemana` varchar(255) NOT NULL,
  `situacao` varchar(255) NOT NULL,
  `horaAbre` time DEFAULT NULL,
  `horaAlmocoIda` time DEFAULT NULL,
  `horaAlmocoVolta` time DEFAULT NULL,
  `horaFecha` time DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horariofuncionas`
--

LOCK TABLES `horariofuncionas` WRITE;
/*!40000 ALTER TABLE `horariofuncionas` DISABLE KEYS */;
INSERT INTO `horariofuncionas` VALUES (1,'Segunda-feira','Aberto','08:00:00','12:00:00','13:00:00','18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Terça-feira','Aberto','08:00:00','12:00:00','13:00:00','18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Quarta-feira','Aberto','08:00:00','12:00:00','13:00:00','18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Quinta-feira','Aberto','08:00:00','12:00:00','13:00:00','18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Sexta-feira','Aberto','08:00:00','12:00:00','13:00:00','18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'Sábado','Aberto','08:00:00','12:00:00','13:00:00','18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'Domingo','Fechado',NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'Segunda-feira','Fechado',NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'Terça-feira','Fechado',NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'Quarta-feira','Aberto','08:00:00','12:00:00','13:00:00','18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'Quinta-feira','Aberto','08:00:00','12:00:00','13:00:00','18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'Sexta-feira','Aberto','08:00:00','12:00:00','13:00:00','18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'Sábado','Aberto','08:00:00','12:00:00','13:00:00','18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'Domingo','Fechado',NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `horariofuncionas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarioxpontos`
--

DROP TABLE IF EXISTS `horarioxpontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarioxpontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idHorario` int(11) NOT NULL,
  `idPontoTuristico` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`,`idHorario`,`idPontoTuristico`),
  UNIQUE KEY `horarioXpontos_idHorario_idPontoTuristico_unique` (`idHorario`,`idPontoTuristico`),
  KEY `idPontoTuristico` (`idPontoTuristico`),
  CONSTRAINT `horarioxpontos_ibfk_1` FOREIGN KEY (`idHorario`) REFERENCES `horariofuncionas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `horarioxpontos_ibfk_2` FOREIGN KEY (`idPontoTuristico`) REFERENCES `pontos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarioxpontos`
--

LOCK TABLES `horarioxpontos` WRITE;
/*!40000 ALTER TABLE `horarioxpontos` DISABLE KEYS */;
INSERT INTO `horarioxpontos` VALUES (1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,3,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,4,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,5,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,6,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,7,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,2,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,3,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,4,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,5,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,6,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,7,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,1,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,2,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,3,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,4,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,5,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,6,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,7,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,1,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,2,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,3,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,4,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,5,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,6,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,7,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,1,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,2,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,3,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,4,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,5,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,6,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,7,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,1,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,2,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,3,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,4,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,5,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,6,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,7,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,1,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,2,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,3,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,4,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,5,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,6,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(49,7,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,1,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,2,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,3,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,4,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,5,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,6,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,7,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,1,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,2,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,3,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,4,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,5,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,6,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(63,7,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(64,1,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,2,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,3,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,4,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(68,5,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,6,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(70,7,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,8,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,9,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(73,10,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(74,11,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(75,12,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(76,13,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(77,14,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,8,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,9,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,10,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,11,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,12,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,13,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,14,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,8,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(86,9,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,10,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(88,11,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(89,12,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,13,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,14,13,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `horarioxpontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pontos`
--

DROP TABLE IF EXISTS `pontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomePonto` varchar(255) NOT NULL,
  `modalidade` int(11) NOT NULL,
  `valorEntrada` double(6,2) NOT NULL,
  `endRuaPonto` varchar(255) NOT NULL,
  `endBairroPonto` varchar(255) NOT NULL,
  `endNumPonto` varchar(255) NOT NULL,
  `endCidadePonto` varchar(255) NOT NULL,
  `endUfPonto` varchar(255) NOT NULL,
  `endCepPonto` varchar(255) NOT NULL,
  `endReferenciaPonto` varchar(255) NOT NULL,
  `endGeoLatPonto` decimal(10,8) DEFAULT NULL,
  `endGeoLongePonto` decimal(11,8) DEFAULT NULL,
  `profilePicPonto` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pontos`
--

LOCK TABLES `pontos` WRITE;
/*!40000 ALTER TABLE `pontos` DISABLE KEYS */;
INSERT INTO `pontos` VALUES (1,'Parque Estadual Turístico do Alto Ribeira (PETAR)',22,30.00,'Estrada do Ouro Grosso','Iporanga','s/n','Iporanga','SP','18330-000','Próximo ao bairro da Serra',-24.52750000,-48.68250000,'/imgs/profilePics/petar.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Caverna do Diabo',41,50.00,'Rodovia SP-165','Eldorado','km 111','Eldorado','SP','11960-000','Próximo ao Parque Estadual Caverna do Diabo',-24.64670000,-48.40830000,'/imgs/profilePics/caverna_diabo.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Ilha do Cardoso',18,0.00,'Acesso por barco','Cananéia','','Cananéia','SP','11990-000','Saída do Porto de Cananéia',-25.02530000,-47.92080000,'/imgs/profilePics/ilha_cardoso.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Reserva Legado das Águas',22,40.00,'Rodovia SP-079','Tapiraí','km 122','Miracatu','SP','11850-000','Acesso pela Rodovia Régis Bittencourt',-24.27750000,-47.50830000,'/imgs/profilePics/legado_aguas.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Parque Estadual Ilha do Cardoso',22,0.00,'Ilha do Cardoso','Cananéia','','Cananéia','SP','11990-000','Acesso por barco a partir de Cananéia',-25.02700000,-47.91560000,'/imgs/profilePics/parque_ilha_cardoso.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'Centro Histórico de Iguape',1,0.00,'Rua Major Rebelo','Centro','s/n','Iguape','SP','11920-000','Próximo à Praça da Basílica',-24.69800000,-47.55380000,'/imgs/profilePics/centro_historico_iguape.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'Quilombo Ivaporunduva',5,10.00,'Estrada Municipal','Iporanga','s/n','Iporanga','SP','18330-000','Próximo ao Rio Ribeira de Iguape',-24.51420000,-48.59500000,'/imgs/profilePics/quilombo_ivaporunduva.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'Cachoeira do Meu Deus',21,0.00,'Estrada do Bairro da Serra','Iporanga','s/n','Iporanga','SP','18330-000','Dentro do PETAR',-24.53000000,-48.70500000,'/imgs/profilePics/cachoeira_meu_deus.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'Museu Histórico e Arqueológico de Iguape',2,0.00,'Rua XV de Novembro','Centro','s/n','Iguape','SP','11920-000','Próximo à Praça da Basílica',-24.69850000,-47.55330000,'/imgs/profilePics/museu_iguape.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'Mirante do Morro do Espia',21,0.00,'Morro do Espia','Centro','s/n','Cananéia','SP','11990-000','Acesso por trilha',-25.01500000,-47.92750000,'/imgs/profilePics/mirante_morro_espia.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'Cachoeira da Usina',21,0.00,'Estrada da Usina','Centro','s/n','Registro','SP','11900-000','Próximo à Usina Hidrelétrica',-24.49530000,-47.84380000,'/imgs/profilePics/cachoeira_usina.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'Parque Turístico Rocha do Itapu',22,10.00,'Estrada do Turvo','Jardim Caiçara','s/n','Registro','SP','11900-000','Próximo à Serra do Mar',-24.49870000,-47.83320000,'/imgs/profilePics/parque_rocha_itapu.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'Praia do Meio',18,0.00,'Avenida Beira-Mar','Vila Nova','s/n','Registro','SP','11900-000','Próximo à Ponte Tancredo Neves',-24.49210000,-47.82690000,'/imgs/profilePics/praia_meio.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `pontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pontosavaliados`
--

DROP TABLE IF EXISTS `pontosavaliados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pontosavaliados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAvaliacao` int(11) NOT NULL,
  `idPonto` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idAvaliacao` (`idAvaliacao`),
  KEY `idPonto` (`idPonto`),
  CONSTRAINT `pontosavaliados_ibfk_1` FOREIGN KEY (`idAvaliacao`) REFERENCES `avaliacoespontos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `pontosavaliados_ibfk_2` FOREIGN KEY (`idPonto`) REFERENCES `pontos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pontosavaliados`
--

LOCK TABLES `pontosavaliados` WRITE;
/*!40000 ALTER TABLE `pontosavaliados` DISABLE KEYS */;
INSERT INTO `pontosavaliados` VALUES (1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,2,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,3,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,4,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,5,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,6,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,7,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,8,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,9,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,10,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,11,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,12,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,13,13,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `pontosavaliados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turistas`
--

DROP TABLE IF EXISTS `turistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turistas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomeTurista` varchar(255) NOT NULL,
  `cpfTurista` varchar(255) DEFAULT NULL,
  `nascTurista` varchar(255) NOT NULL,
  `endRuaTurista` varchar(255) NOT NULL,
  `endBairroTurista` varchar(255) NOT NULL,
  `endNumTurista` varchar(255) NOT NULL,
  `endCidadeTurista` varchar(255) NOT NULL,
  `endUfTurista` varchar(255) NOT NULL,
  `endCepTurista` varchar(255) NOT NULL,
  `idiomaTurista` varchar(255) NOT NULL,
  `telTurista` varchar(255) NOT NULL,
  `emailTurista` varchar(255) NOT NULL,
  `passwordTurista` varchar(255) NOT NULL,
  `profilePicTurista` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turistas`
--

LOCK TABLES `turistas` WRITE;
/*!40000 ALTER TABLE `turistas` DISABLE KEYS */;
INSERT INTO `turistas` VALUES (1,'TURISTA 1','12345678910','2012-12-12','Rua 1','BAIRRO 2','3','Registro','SP','11900000','DE','13789456123','turista@turismo.com','$2b$10$fgexwD3QRqCIxN52CTH8T.KKWI89foBeMwioDFXjnKQcy.oQq7Va6','/imgs/mizaru.webp','2024-06-11 20:01:27','2024-06-11 20:01:27'),(2,'TURISTA 2','40711006806','2002-02-02','RUA 2','BAIRRO 3','4','Registro','AC','11900000','ES','13997931192','turista2@turismo.com','$2b$10$lnZSwKvxBCvwKTljtc5K/.xcnRl5WgkM4OygCgfRN6nOItD5nJc4a','/imgs/mizaru.webp','2024-06-11 20:02:05','2024-06-11 20:02:05'),(3,'TURISTA 3','12346574','2003-03-03','RUA 3','BAIRRO 4','5','Registro','AL','19999000','RU','1338212233','turista3@turismo.com','$2b$10$tv4xZDlR8.KshK.6FAVydOesjNzUn/2BS9yRgeLdn2IctsZDMgQxu','/imgs/mizaru.webp','2024-06-11 20:02:50','2024-06-11 20:02:50');
/*!40000 ALTER TABLE `turistas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-17 17:13:43
