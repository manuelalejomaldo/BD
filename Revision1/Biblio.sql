CREATE DATABASE  IF NOT EXISTS `biblio` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `biblio`;

-- ------------------------------------------------------
-- Server version	5.5.34

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
-- Table structure for table `tbl_auteur_livre`
--

DROP TABLE IF EXISTS `tbl_auteur_livre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_auteur_livre` (
  `id_auteur` int(11) unsigned NOT NULL,
  `id_livre` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_auteur`,`id_livre`),
  KEY `fk_tblauteurs_has_tbl_livres_tbl_livres1` (`id_livre`),
  CONSTRAINT `fk_tblauteurs_has_tbl_livres_tblauteurs1` FOREIGN KEY (`id_auteur`) REFERENCES `tbl_auteurs` (`id_auteur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblauteurs_has_tbl_livres_tbl_livres1` FOREIGN KEY (`id_livre`) REFERENCES `tbl_livres` (`id_livre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_auteur_livre`
--

LOCK TABLES `tbl_auteur_livre` WRITE;
/*!40000 ALTER TABLE `tbl_auteur_livre` DISABLE KEYS */;
INSERT INTO `tbl_auteur_livre` VALUES (1,1),(2,2),(3,3),(4,3),(10,5),(7,6),(11,7),(12,8),(13,9),(14,10),(15,10),(16,10),(17,11),(18,12),(19,13),(20,14),(21,14),(22,16),(22,17);
/*!40000 ALTER TABLE `tbl_auteur_livre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblauteurs`
--

DROP TABLE IF EXISTS `tbl_auteurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_auteurs` (
  `id_auteur` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_auteur`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblauteurs`
--

LOCK TABLES `tbl_auteurs` WRITE;
#/*!40000 ALTER TABLE `tblauteurs` DISABLE KEYS */;
INSERT INTO `tbl_auteurs` VALUES (1,'BOURGAULT J'),(2,'BRUNELLE C.'),(3,'CANTIN J-M.'),(4,'CANTIN I.'),(5,'DRAPAUX, M.'),(6,'GAGNON, M.'),(7,'GAGNON R.'),(8,'et autres'),(9,'HIRATA H.'),(10,'Guérin, Marc-Aimé'),(11,'Weidmann Koop, Marie-Christine'),(12,'Charest, Paul'),(13,'BIANCO'),(14,'VALLOIS, Denis'),(15,'LEVIER, Laurent'),(16,'LLORENS, Cedric'),(17,'FREDDI, Philippe'),(18,'BOUCHAUDY, Jean-Fraçois'),(19,'BERNARD, André'),(20,'BARREAU, Jean-Claude'),(21,'BIGOT, Guillaume');
#/*!40000 ALTER TABLE `tbl_auteurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_editeurs`
--

DROP TABLE IF EXISTS `tbl_editeurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_editeurs` (
  `id_editeur` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom_editeur` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_editeur`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_editeurs`
--

LOCK TABLES `tbl_editeurs` WRITE;
/*!40000 ALTER TABLE `tbl_editeurs` DISABLE KEYS */;
INSERT INTO `tbl_editeurs` VALUES (1,'Édition La Découverte'),(2,'Université Laval'),(3,'Éditions Yvon Blais'),(4,'Gouvernement du Québec ministère du travai'),(5,'Presse Universitaire de France'),(6,'Guérin'),(7,'Les presses de l\'Université Laval'),(8,'Amazon'),(9,'EYROLLES'),(10,'Boréal'),(11,'Livres de poche'),(12,'Wikipédia');
/*!40000 ALTER TABLE `tbl_editeurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_livres`
--

DROP TABLE IF EXISTS `tbl_livres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_livres` (
  `id_livre` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `sous_titre` varchar(255) DEFAULT NULL,
  `annee_publication` smallint(4) DEFAULT NULL,
  `nb_page` varchar(45) DEFAULT NULL,
  `id_editeur` int(11) unsigned NOT NULL,
  `id_sujet` int(11) unsigned NOT NULL,
  `id_type_publication` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_livre`),
  KEY `fk_tbl_livres_tbl_editeurs` (`id_editeur`),
  KEY `fk_tbl_livres_tbl_sujets1` (`id_sujet`),
  KEY `fk_tbl_livres_tbl_type_publications` (`id_type_publication`),
  KEY `Idx_Annee` (`annee_publication`),
  KEY `idx_titre` (`titre`),
  CONSTRAINT `fk_tbl_livres_tbl_editeurs` FOREIGN KEY (`id_editeur`) REFERENCES `tbl_editeurs` (`id_editeur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_livres_tbl_sujets1` FOREIGN KEY (`id_sujet`) REFERENCES `tbl_sujets` (`id_sujet`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_livres_tbl_type_publications1` FOREIGN KEY (`id_type_publication`) REFERENCES `tbl_type_publications` (`id_type_publication`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_livres`
--

LOCK TABLES `tbl_livres` WRITE;
/*!40000 ALTER TABLE `tbl_livres` DISABLE KEYS */;
INSERT INTO `tbl_livres` VALUES (1,'L impact juridique des nouvelles dispositions de la Loi sur les normes du travail',' en matière de harcèlement psychologique sur le régime légal préexistant',2005,NULL,2,7,2),(2,'Les droits et libertés dans le contexte civil',NULL,2005,NULL,3,8,8),(3,' Politiques contre le harcèlement au travail et réflexions sur le harcèlement psychologique',NULL,2004,NULL,3,2,2),(4,'Le harcèelement sexuel au travail',NULL,1991,NULL,3,7,8),(5,'Petit manuel de géographie québécoise',NULL,1977,NULL,6,9,2),(6,'Les normes du travail','dans Collection de droit 2004-05, École du Barreau du Québec, vol. 8',2004,NULL,3,8,2),(7,'Le QuÃ©bec aujourdâ??hui, identitÃ©, sociÃ©tÃ© et culture',NULL,2003,NULL,7,7,2),(8,'À qui appartient la connaissance ?','Conférence prononcée dans le cadre d un colloque de l ACFAS',2002,NULL,2,2,9),(9,'DE LA MACHINE DE TURING aux ordinateurs modernes','Informatique fondamentale:',1999,NULL,8,5,2),(10,'TABLEAUX DE BORD DE LA SECURITÉ RÉSEAU',NULL,2010,NULL,9,5,2),(11,'Windows server 2008',NULL,2009,NULL,9,5,2),(12,'LINUX ADMINISTRATION T03 : SÉCURISER UN SERVEUR LINUX\r\n \r\nAgrandissez cette image \r\nPartagez vos propres images client\r\nEditeur: découvrez commment les clients peuvent feuilleter et chercher au coeur de ce livre.\r\nLINUX ADMINISTRATION T03','SÉCURISER UN SERVEUR LINUX',2010,NULL,9,5,2),(13,'Les Institutions politiques au Québec et au Canada',NULL,2010,NULL,10,1,2),(14,'TOUTE L\'HISTOIRE DU MONDE',NULL,2010,NULL,11,3,2),(15,'Base de données','http://fr.wikipedia.org/wiki/Base_de_donn%C3%A9es',2010,NULL,12,5,1);
/*!40000 ALTER TABLE `tbl_livres` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `tbl_sujets`
--

DROP TABLE IF EXISTS `tbl_sujets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sujets` (
  `id_sujet` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sujet` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_sujet`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sujets`
--

LOCK TABLES `tbl_sujets` WRITE;
/*!40000 ALTER TABLE `tbl_sujets` DISABLE KEYS */;
INSERT INTO `tbl_sujets` VALUES (1,'Politique'),(2,'Antropologie'),(3,'Histoire'),(4,'Physique'),(5,'Informatique'),(6,'Chimie'),(7,'Sociologie'),(8,'Droit'),(9,'Géographie'),(10,'Psychologie');
/*!40000 ALTER TABLE `tbl_sujets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_type_publications`
--

DROP TABLE IF EXISTS `tbl_type_publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_type_publications` (
  `id_type_publication` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_publcation` varchar(45) NOT NULL,
  PRIMARY KEY (`id_type_publication`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_type_publications`
--

LOCK TABLES `tbl_type_publications` WRITE;
/*!40000 ALTER TABLE `tbl_type_publications` DISABLE KEYS */;
INSERT INTO `tbl_type_publications` VALUES (1,'Web'),(2,'Livres'),(3,'Articles de presse'),(4,'Euvres Anciennes'),(5,'Ouvrages de référence'),(6,'CD - DVD'),(7,'Périodique'),(8,'Thèse'),(9,'Conférence'),(10,'Cours');
/*!40000 ALTER TABLE `tbl_type_publications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-19 17:17:08
