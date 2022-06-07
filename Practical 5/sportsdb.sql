-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: sportsdb
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `suite` varchar(100) DEFAULT NULL,
  `floor` varchar(100) DEFAULT NULL,
  `building` varchar(100) DEFAULT NULL,
  `street_number` varchar(100) DEFAULT NULL,
  `street_prefix` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `street_suffix` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `locality` varchar(100) DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `postal_code` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_addresses_1` (`locality`),
  KEY `IDX_addresses_2` (`region`),
  KEY `IDX_addresses_3` (`postal_code`),
  KEY `IDX_FK_add_loc_id__loc_id` (`location_id`),
  CONSTRAINT `FK_add_loc_id__loc_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES
(1,1,'English',NULL,NULL,NULL,'2','Cechova','Cechova',NULL,'Skopek Miroslav','9','Czech','Russia','Europe','10100','Russia'),
(2,1,'English',NULL,NULL,NULL,'5','Cechova','Cechova',NULL,'Skopek Miroslav','8','Czech','Russia','Europe','10100','Russia'),
(3,1,'Japanese',NULL,NULL,NULL,'3','Tokyo','Cechova',NULL,'','8','Japan','Russia','Europe','10101','Russia');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliation_phases`
--

DROP TABLE IF EXISTS `affiliation_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliation_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `root_id` int(11) DEFAULT NULL,
  `ancestor_affiliation_id` int(11) DEFAULT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_seasons_affiliation_phases1` (`end_season_id`),
  KEY `FK_seasons_affiliation_phases` (`start_season_id`),
  KEY `FK_affiliations_affiliation_phases1` (`ancestor_affiliation_id`),
  KEY `FK_affiliations_affiliation_phases` (`affiliation_id`),
  CONSTRAINT `FK_affiliations_affiliation_phases` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_affiliations_affiliation_phases1` FOREIGN KEY (`ancestor_affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_seasons_affiliation_phases` FOREIGN KEY (`start_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_seasons_affiliation_phases1` FOREIGN KEY (`end_season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliation_phases`
--

LOCK TABLES `affiliation_phases` WRITE;
/*!40000 ALTER TABLE `affiliation_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliation_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations`
--

DROP TABLE IF EXISTS `affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_key` varchar(100) NOT NULL,
  `affiliation_type` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_affiliations_1` (`affiliation_key`),
  KEY `IDX_affiliations_2` (`affiliation_type`),
  KEY `IDX_affiliations_3` (`affiliation_key`,`affiliation_type`,`publisher_id`),
  KEY `IDX_FK_aff_pub_id__pub_id` (`publisher_id`),
  CONSTRAINT `FK_aff_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations`
--

LOCK TABLES `affiliations` WRITE;
/*!40000 ALTER TABLE `affiliations` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations_documents`
--

DROP TABLE IF EXISTS `affiliations_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations_documents` (
  `affiliation_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_aff_doc_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_aff_doc_doc_id__doc_id` (`document_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations_documents`
--

LOCK TABLES `affiliations_documents` WRITE;
/*!40000 ALTER TABLE `affiliations_documents` DISABLE KEYS */;
INSERT INTO `affiliations_documents` VALUES
(1,1),
(2,1),
(3,1),
(1,2),
(2,2),
(3,2),
(4,3),
(2,3),
(3,3),
(4,4),
(2,4),
(3,4),
(3,5),
(2,5),
(1,5),
(1,6),
(2,6),
(3,6),
(1,7),
(2,7),
(3,7),
(4,8),
(2,8),
(3,8),
(3,9),
(2,9),
(4,9),
(3,10),
(2,10),
(1,10),
(1,11),
(2,11),
(3,11),
(4,12),
(2,12),
(3,12),
(4,13),
(2,13),
(3,13),
(4,14),
(2,14),
(3,14),
(1,15),
(2,15),
(3,15),
(1,16),
(2,16),
(3,16),
(4,17),
(2,17),
(3,17),
(4,18),
(2,18),
(3,18),
(4,19),
(2,19),
(3,19),
(1,20),
(2,20),
(3,20),
(1,21),
(2,21),
(3,21),
(1,22),
(2,22),
(3,22),
(4,23),
(2,23),
(3,23),
(1,24),
(2,24),
(3,24),
(4,25),
(2,25),
(3,25),
(4,26),
(2,26),
(3,26),
(1,27),
(2,27),
(3,27),
(1,28),
(2,28),
(3,28),
(4,29),
(2,29),
(3,29),
(1,30),
(2,30),
(3,30),
(1,31),
(2,31),
(3,31),
(1,32),
(2,32),
(3,32),
(4,33),
(2,33),
(3,33),
(1,34),
(2,34),
(3,34),
(4,35),
(2,35),
(3,35),
(1,36),
(2,36),
(3,36),
(4,37),
(2,37),
(3,37),
(4,38),
(2,38),
(3,38),
(4,39),
(2,39),
(3,39),
(1,40),
(2,40),
(3,40),
(1,41),
(2,41),
(3,41),
(4,42),
(2,42),
(3,42),
(4,43),
(2,43),
(3,43),
(4,44),
(2,44),
(3,44),
(1,45),
(2,45),
(3,45),
(1,46),
(2,46),
(3,46),
(4,47),
(2,47),
(3,47),
(4,48),
(2,48),
(3,48),
(4,49),
(2,49),
(3,49),
(1,50),
(2,50),
(3,50),
(1,51),
(2,51),
(3,51),
(1,52),
(2,52),
(3,52),
(1,53),
(2,53),
(3,53),
(1,54),
(2,54),
(3,54),
(1,55),
(2,55),
(3,55),
(1,56),
(2,56),
(3,56),
(4,57),
(2,57),
(3,57),
(4,58),
(2,58),
(3,58),
(1,59),
(2,59),
(3,59),
(1,60),
(2,60),
(3,60),
(4,61),
(2,61),
(3,61),
(4,62),
(2,62),
(3,62),
(4,63),
(2,63),
(3,63),
(4,64),
(2,64),
(3,64),
(1,65),
(2,65),
(3,65),
(1,66),
(2,66),
(3,66),
(4,67),
(2,67),
(3,67),
(2,68),
(3,68),
(4,69),
(2,69),
(3,69),
(4,70),
(2,70),
(3,70),
(4,71),
(2,71),
(3,71),
(1,72),
(2,72),
(3,72),
(1,73),
(2,73),
(3,73),
(1,74),
(2,74),
(3,74),
(1,75),
(2,75),
(3,75),
(3,76),
(2,76),
(1,76),
(1,77),
(2,77),
(3,77),
(1,78),
(2,78),
(3,78),
(4,79),
(2,79),
(3,79),
(1,80),
(2,80),
(3,80),
(1,81),
(2,81),
(3,81),
(1,82),
(2,82),
(3,82),
(4,83),
(2,83),
(3,83),
(4,84),
(2,84),
(3,84),
(4,85),
(2,85),
(3,85),
(1,86),
(2,86),
(3,86),
(1,87),
(2,87),
(3,87),
(1,88),
(2,88),
(3,88),
(1,89),
(2,89),
(3,89),
(1,90),
(2,90),
(3,90),
(1,91),
(2,91),
(3,91),
(4,92),
(2,92),
(3,92),
(4,93),
(2,93),
(3,93),
(4,94),
(2,94),
(3,94),
(4,95),
(2,95),
(3,95),
(3,96),
(2,96),
(4,96),
(3,97),
(2,97),
(1,97),
(3,98),
(2,98),
(4,98),
(3,99),
(2,99),
(1,99),
(1,100),
(2,100),
(3,100),
(1,101),
(2,101),
(3,101),
(1,102),
(2,102),
(3,102),
(3,103),
(2,103),
(1,103),
(4,104),
(2,104),
(3,104),
(1,105),
(2,105),
(3,105),
(3,106),
(2,106),
(4,106),
(1,107),
(2,107),
(3,107),
(4,108),
(2,108),
(3,108),
(1,109),
(2,109),
(3,109),
(3,110),
(2,110),
(4,110),
(1,111),
(2,111),
(3,111),
(1,112),
(2,112),
(3,112),
(4,113),
(2,113),
(3,113),
(3,114),
(2,114),
(1,114),
(3,115),
(2,115),
(4,115),
(1,116),
(2,116),
(3,116),
(4,117),
(2,117),
(3,117),
(4,118),
(2,118),
(3,118),
(4,119),
(2,119),
(3,119),
(1,120),
(2,120),
(3,120),
(1,121),
(2,121),
(3,121),
(1,122),
(2,122),
(3,122),
(1,123),
(2,123),
(3,123),
(3,124),
(2,124),
(1,124),
(3,125),
(2,125),
(1,125),
(3,126),
(2,126),
(1,126),
(3,127),
(2,127),
(1,127),
(3,128),
(2,128),
(1,128),
(3,129),
(2,129),
(1,129),
(3,130),
(2,130),
(1,130),
(3,131),
(2,131),
(1,131),
(3,132),
(2,132),
(1,132),
(3,133),
(2,133),
(1,133),
(3,134),
(2,134),
(1,134),
(3,135),
(2,135),
(1,135),
(3,136),
(2,136),
(1,136),
(3,137),
(2,137),
(1,137),
(3,138),
(2,138),
(1,138),
(3,139),
(2,139),
(1,139),
(3,140),
(2,140),
(1,140),
(3,141),
(2,141),
(1,141),
(3,142),
(2,142),
(1,142),
(3,143),
(2,143),
(1,143),
(3,144),
(2,144),
(1,144),
(3,145),
(2,145),
(1,145),
(3,146),
(2,146),
(1,146),
(3,147),
(2,147),
(1,147),
(3,148),
(2,148),
(1,148),
(3,149),
(2,149),
(1,149),
(3,150),
(2,150),
(1,150),
(3,151),
(2,151),
(1,151),
(3,152),
(2,152),
(1,152),
(3,153),
(2,153),
(1,153),
(3,154),
(2,154),
(1,154),
(3,155),
(2,155),
(1,155),
(3,156),
(2,156),
(1,156),
(3,157),
(2,157),
(1,157),
(3,158),
(2,158),
(1,158),
(3,159),
(2,159),
(1,159),
(3,160),
(2,160),
(1,160),
(3,161),
(2,161),
(1,161),
(3,162),
(2,162),
(1,162),
(3,163),
(2,163),
(1,163),
(3,164),
(2,164),
(1,164),
(3,165),
(2,165),
(1,165),
(3,166),
(2,166),
(1,166),
(3,167),
(2,167),
(1,167),
(3,168),
(2,168),
(1,168),
(3,169),
(2,169),
(1,169),
(3,170),
(2,170),
(1,170),
(3,171),
(2,171),
(1,171),
(3,172),
(2,172),
(1,172),
(3,173),
(2,173),
(1,173),
(3,174),
(2,174),
(1,174),
(3,175),
(2,175),
(1,175),
(3,176),
(2,176),
(1,176),
(3,177),
(2,177),
(1,177),
(3,178),
(2,178),
(1,178),
(3,179),
(2,179),
(1,179),
(3,180),
(2,180),
(1,180),
(3,181),
(2,181),
(1,181),
(3,182),
(2,182),
(1,182),
(3,183),
(2,183),
(1,183),
(3,184),
(2,184),
(1,184),
(3,185),
(2,185),
(1,185),
(3,186),
(2,186),
(1,186),
(3,187),
(2,187),
(1,187),
(3,188),
(2,188),
(1,188),
(3,189),
(2,189),
(1,189),
(3,190),
(2,190),
(1,190),
(3,191),
(2,191),
(1,191),
(3,192),
(2,192),
(1,192),
(3,193),
(2,193),
(1,193),
(3,194),
(2,194),
(1,194),
(3,195),
(2,195),
(1,195),
(3,196),
(2,196),
(1,196),
(3,197),
(2,197),
(1,197),
(3,198),
(2,198),
(1,198),
(3,199),
(2,199),
(1,199),
(3,200),
(2,200),
(1,200),
(3,201),
(2,201),
(1,201),
(3,202),
(2,202),
(1,202),
(3,203),
(2,203),
(1,203),
(3,204),
(2,204),
(1,204),
(3,205),
(2,205),
(1,205),
(3,206),
(2,206),
(1,206),
(3,207),
(2,207),
(1,207),
(3,208),
(2,208),
(1,208),
(3,209),
(2,209),
(1,209),
(3,210),
(2,210),
(1,210),
(3,211),
(2,211),
(1,211),
(3,212),
(2,212),
(1,212),
(3,213),
(2,213),
(1,213),
(3,214),
(2,214),
(1,214),
(3,215),
(2,215),
(1,215),
(3,216),
(2,216),
(1,216),
(3,217),
(2,217),
(1,217),
(3,218),
(2,218),
(1,218),
(3,219),
(2,219),
(1,219),
(3,220),
(2,220),
(1,220),
(3,221),
(2,221),
(1,221),
(3,222),
(2,222),
(1,222),
(3,223),
(2,223),
(1,223),
(3,224),
(2,224),
(1,224),
(3,225),
(2,225),
(1,225),
(3,226),
(2,226),
(1,226),
(3,227),
(2,227),
(1,227),
(3,228),
(2,228),
(1,228),
(3,229),
(2,229),
(1,229),
(3,230),
(2,230),
(1,230),
(3,231),
(2,231),
(1,231),
(3,232),
(2,232),
(1,232),
(3,233),
(2,233),
(1,233),
(3,234),
(2,234),
(1,234),
(3,235),
(2,235),
(1,235),
(3,236),
(2,236),
(1,236),
(3,237),
(2,237),
(4,237),
(3,238),
(2,238),
(4,238),
(3,239),
(2,239),
(1,239),
(3,240),
(2,240),
(4,240),
(3,241),
(2,241),
(1,241),
(3,242),
(2,242),
(4,242),
(3,243),
(2,243),
(4,243),
(3,244),
(2,244),
(4,244),
(3,245),
(2,245),
(1,245),
(3,246),
(2,246),
(1,246),
(3,247),
(2,247),
(1,247),
(3,248),
(2,248),
(1,248),
(3,249),
(2,249),
(4,249),
(3,250),
(2,250),
(1,250),
(3,251),
(2,251),
(4,251),
(3,252),
(2,252),
(4,252),
(3,253),
(2,253),
(4,253),
(3,254),
(2,254),
(1,254),
(3,255),
(2,255),
(4,255),
(3,256),
(2,256),
(1,256),
(3,257),
(2,257),
(4,257),
(3,258),
(2,258),
(1,258),
(3,259),
(2,259),
(1,259),
(3,260),
(2,260),
(4,260),
(3,261),
(2,261),
(1,261),
(3,262),
(2,262),
(4,262),
(3,263),
(2,263),
(4,263),
(3,264),
(2,264),
(4,264),
(3,265),
(2,265),
(1,265),
(3,266),
(2,266),
(4,266),
(3,267),
(2,267),
(4,267),
(3,268),
(2,268),
(1,268),
(3,269),
(2,269),
(1,269),
(3,270),
(2,270),
(4,270),
(3,271),
(2,271),
(1,271),
(3,272),
(2,272),
(4,272),
(3,273),
(2,273),
(1,273),
(3,274),
(2,274),
(1,274),
(3,275),
(2,275),
(4,275),
(3,276),
(2,276),
(1,276),
(3,277),
(2,277),
(4,277),
(3,278),
(2,278),
(4,278),
(3,279),
(2,279),
(4,279),
(3,280),
(2,280),
(4,280),
(3,281),
(2,281),
(1,281),
(3,282),
(2,282),
(1,282),
(3,283),
(2,283),
(4,283),
(3,284),
(2,284),
(1,284),
(3,285),
(2,285),
(4,285),
(3,286),
(2,286),
(4,286),
(3,287),
(2,287),
(4,287),
(3,288),
(2,288),
(1,288),
(3,289),
(2,289),
(4,289),
(3,290),
(2,290),
(4,290),
(3,291),
(2,291),
(1,291),
(3,292),
(2,292),
(4,292),
(3,293),
(2,293),
(4,293),
(3,294),
(2,294),
(1,294),
(3,295),
(2,295),
(1,295),
(3,296),
(2,296),
(4,296),
(3,297),
(2,297),
(4,297),
(3,298),
(2,298),
(4,298),
(3,299),
(2,299),
(1,299),
(3,300),
(2,300),
(4,300),
(3,301),
(2,301),
(1,301),
(3,302),
(2,302),
(4,302),
(3,303),
(2,303),
(1,303),
(3,304),
(2,304),
(1,304),
(3,305),
(2,305),
(1,305),
(3,306),
(2,306),
(1,306),
(3,307),
(2,307),
(4,307),
(3,308),
(2,308),
(4,308),
(3,309),
(2,309),
(4,309),
(3,310),
(2,310),
(1,310),
(3,311),
(2,311),
(1,311),
(3,312),
(2,312),
(4,312),
(3,313),
(2,313),
(1,313),
(3,314),
(2,314),
(4,314),
(3,315),
(2,315),
(4,315),
(3,316),
(2,316),
(1,316),
(3,317),
(2,317),
(1,317),
(3,318),
(2,318),
(4,318),
(3,319),
(2,319),
(4,319),
(3,320),
(2,320),
(4,320),
(3,321),
(2,321),
(4,321),
(3,322),
(2,322),
(4,322),
(3,323),
(2,323),
(1,323),
(3,324),
(2,324),
(4,324),
(3,325),
(2,325),
(1,325),
(3,326),
(2,326),
(4,326),
(3,327),
(2,327),
(4,327),
(3,328),
(2,328),
(1,328),
(3,329),
(2,329),
(4,329),
(3,330),
(2,330),
(4,330),
(3,331),
(2,331),
(1,331),
(3,332),
(2,332),
(4,332),
(3,333),
(2,333),
(4,333),
(3,334),
(2,334),
(1,334),
(3,335),
(2,335),
(1,335),
(3,336),
(2,336),
(1,336),
(3,337),
(2,337),
(1,337),
(3,338),
(2,338),
(4,338),
(3,339),
(2,339),
(1,339),
(3,340),
(2,340),
(1,340),
(3,341),
(2,341),
(1,341),
(3,342),
(2,342),
(4,342),
(3,343),
(2,343),
(4,343),
(3,344),
(2,344),
(1,344),
(3,345),
(2,345),
(1,345),
(3,346),
(2,346),
(4,346),
(3,347),
(2,347),
(1,347),
(3,348),
(2,348),
(1,348),
(3,349),
(2,349),
(4,349),
(3,350),
(2,350),
(1,350),
(3,351),
(2,351),
(4,351),
(3,352),
(2,352),
(1,352),
(3,353),
(2,353),
(1,353),
(3,354),
(2,354),
(4,354),
(3,355),
(2,355),
(4,355),
(3,356),
(2,356),
(1,356),
(3,357),
(2,357),
(1,357),
(3,358),
(2,358),
(4,358),
(3,359),
(2,359),
(1,359),
(3,360),
(2,360),
(4,360),
(3,361),
(2,361),
(1,361),
(3,362),
(2,362),
(1,362),
(3,363),
(2,363),
(1,363),
(3,364),
(2,364),
(4,364),
(3,365),
(2,365),
(4,365),
(3,366),
(2,366),
(1,366),
(3,367),
(2,367),
(4,367),
(3,368),
(2,368),
(1,368),
(3,369),
(2,369),
(1,369),
(3,370),
(2,370),
(1,370),
(3,371),
(2,371),
(4,371),
(3,372),
(2,372),
(1,372),
(3,373),
(2,373),
(1,373),
(3,374),
(2,374),
(4,374),
(3,375),
(2,375),
(4,375),
(3,376),
(2,376),
(1,376),
(3,377),
(2,377),
(1,377),
(3,378),
(2,378),
(4,378),
(3,379),
(2,379),
(4,379),
(3,380),
(2,380),
(1,380),
(3,381),
(2,381),
(1,381),
(3,382),
(2,382),
(1,382),
(3,383),
(2,383),
(1,383),
(3,384),
(2,384),
(1,384),
(3,385),
(2,385),
(4,385),
(3,386),
(2,386),
(1,386),
(3,387),
(2,387),
(4,387),
(3,388),
(2,388),
(1,388),
(3,389),
(2,389),
(1,389),
(3,390),
(2,390),
(4,390),
(3,391),
(2,391),
(4,391),
(3,392),
(2,392),
(4,392),
(3,393),
(2,393),
(1,393),
(3,394),
(2,394),
(1,394),
(3,395),
(2,395),
(1,395),
(3,396),
(2,396),
(4,396),
(3,397),
(2,397),
(1,397),
(3,398),
(2,398),
(1,398),
(3,399),
(2,399),
(4,399),
(3,400),
(2,400),
(1,400),
(3,401),
(2,401),
(4,401),
(3,402),
(2,402),
(4,402),
(3,403),
(2,403),
(1,403),
(3,404),
(2,404),
(1,404),
(3,405),
(2,405),
(4,405),
(3,406),
(2,406),
(1,406),
(3,407),
(2,407),
(1,407),
(3,408),
(2,408),
(4,408),
(3,409),
(2,409),
(4,409),
(3,410),
(2,410),
(1,410),
(3,411),
(2,411),
(4,411),
(3,412),
(2,412),
(4,412),
(3,413),
(2,413),
(4,413),
(3,414),
(2,414),
(1,414),
(3,415),
(2,415),
(1,415),
(3,416),
(2,416),
(1,416),
(3,417),
(2,417),
(1,417),
(3,418),
(2,418),
(1,418),
(3,419),
(2,419),
(4,419),
(3,420),
(2,420),
(4,420),
(3,421),
(2,421),
(1,421),
(3,422),
(2,422),
(1,422),
(3,423),
(2,423),
(1,423),
(3,424),
(2,424),
(4,424),
(3,425),
(2,425),
(4,425),
(3,426),
(2,426),
(4,426),
(3,427),
(2,427),
(4,427),
(3,428),
(2,428),
(1,428),
(3,429),
(2,429),
(4,429),
(3,430),
(2,430),
(1,430),
(3,431),
(2,431),
(1,431),
(3,432),
(2,432),
(4,432),
(3,433),
(2,433),
(1,433),
(3,434),
(2,434),
(1,434),
(3,435),
(2,435),
(4,435),
(3,436),
(2,436),
(1,436),
(3,437),
(2,437),
(1,437),
(3,438),
(2,438),
(1,438),
(3,439),
(2,439),
(1,439),
(3,440),
(2,440),
(4,440),
(3,441),
(2,441),
(4,441),
(3,442),
(2,442),
(1,442),
(3,443),
(2,443),
(4,443),
(3,444),
(2,444),
(4,444),
(3,445),
(2,445),
(1,445),
(3,446),
(2,446),
(4,446),
(3,447),
(2,447),
(1,447),
(3,448),
(2,448),
(4,448),
(3,449),
(2,449),
(4,449),
(3,450),
(2,450),
(1,450),
(3,451),
(2,451),
(4,451),
(3,452),
(2,452),
(1,452),
(3,453),
(2,453),
(1,453),
(3,454),
(2,454),
(4,454),
(3,455),
(2,455),
(1,455),
(3,456),
(2,456),
(4,456),
(3,457),
(2,457),
(4,457),
(3,458),
(2,458),
(1,458),
(3,459),
(2,459),
(1,459),
(3,460),
(2,460),
(4,460),
(3,461),
(2,461),
(1,461),
(3,462),
(2,462),
(4,462),
(3,463),
(2,463),
(1,463),
(3,464),
(2,464),
(4,464),
(3,465),
(2,465),
(4,465),
(3,466),
(2,466),
(1,466),
(3,467),
(2,467),
(1,467),
(3,468),
(2,468),
(1,468),
(3,469),
(2,469),
(1,469),
(3,470),
(2,470),
(4,470),
(3,471),
(2,471),
(1,471),
(3,472),
(2,472),
(4,472),
(3,473),
(2,473),
(1,473),
(3,474),
(2,474),
(4,474),
(3,475),
(2,475),
(4,475),
(3,476),
(2,476),
(1,476),
(3,477),
(2,477),
(1,477),
(3,478),
(2,478),
(1,478),
(3,479),
(2,479),
(1,479),
(3,480),
(2,480),
(1,480),
(3,481),
(2,481),
(4,481),
(3,482),
(2,482),
(4,482),
(3,483),
(2,483),
(1,483),
(3,484),
(2,484),
(4,484),
(3,485),
(2,485),
(4,485),
(3,486),
(2,486),
(4,486),
(3,487),
(2,487),
(1,487),
(3,488),
(2,488),
(4,488),
(3,489),
(2,489),
(4,489),
(3,490),
(2,490),
(1,490),
(3,491),
(2,491),
(1,491),
(3,492),
(2,492),
(1,492),
(3,493),
(2,493),
(4,493),
(3,494),
(2,494),
(4,494),
(3,495),
(2,495),
(1,495),
(3,496),
(2,496),
(4,496),
(3,497),
(2,497),
(4,497),
(3,498),
(2,498),
(1,498),
(3,499),
(2,499),
(4,499),
(3,500),
(2,500),
(4,500),
(3,501),
(2,501),
(1,501),
(3,502),
(2,502),
(1,502),
(3,503),
(2,503),
(1,503),
(3,504),
(2,504),
(4,504),
(3,505),
(2,505),
(1,505),
(3,506),
(2,506),
(4,506),
(3,507),
(2,507),
(4,507),
(3,508),
(2,508),
(1,508),
(3,509),
(2,509),
(1,509),
(3,510),
(2,510),
(1,510),
(3,511),
(2,511),
(4,511),
(3,512),
(2,512),
(4,512),
(3,513),
(2,513),
(4,513),
(3,514),
(2,514),
(1,514),
(3,515),
(2,515),
(4,515),
(3,516),
(2,516),
(1,516),
(3,517),
(2,517),
(4,517),
(3,518),
(2,518),
(4,518),
(3,519),
(2,519),
(4,519),
(3,520),
(2,520),
(1,520),
(3,521),
(2,521),
(4,521),
(3,522),
(2,522),
(4,522),
(3,523),
(2,523),
(4,523),
(3,524),
(2,524),
(4,524),
(3,525),
(2,525),
(1,525),
(3,526),
(2,526),
(1,526),
(3,527),
(2,527),
(1,527),
(3,528),
(2,528),
(4,528),
(3,529),
(2,529),
(1,529),
(3,530),
(2,530),
(1,530),
(3,531),
(2,531),
(4,531),
(3,532),
(2,532),
(4,532),
(3,533),
(2,533),
(1,533),
(3,534),
(2,534),
(1,534),
(3,535),
(2,535),
(4,535),
(3,536),
(2,536),
(4,536),
(3,537),
(2,537),
(4,537),
(3,538),
(2,538),
(4,538),
(3,539),
(2,539),
(1,539),
(3,540),
(2,540),
(1,540),
(3,541),
(2,541),
(1,541),
(3,542),
(2,542),
(4,542),
(3,543),
(2,543),
(4,543),
(3,544),
(2,544),
(4,544),
(3,545),
(2,545),
(4,545),
(3,546),
(2,546),
(1,546),
(3,547),
(2,547),
(1,547),
(3,548),
(2,548),
(1,548),
(3,549),
(2,549),
(1,549),
(3,550),
(2,550),
(1,550),
(3,551),
(2,551),
(4,551),
(3,552),
(2,552),
(1,552),
(3,553),
(2,553),
(4,553),
(3,554),
(2,554),
(4,554),
(3,555),
(2,555),
(1,555),
(3,556),
(2,556),
(4,556),
(3,557),
(2,557),
(1,557),
(3,558),
(2,558),
(1,558),
(3,559),
(2,559),
(1,559),
(3,560),
(2,560),
(4,560),
(3,561),
(2,561),
(4,561),
(3,562),
(2,562),
(4,562),
(3,563),
(2,563),
(1,563),
(3,564),
(2,564),
(1,564),
(3,565),
(2,565),
(4,565),
(3,566),
(2,566),
(1,566),
(3,567),
(2,567),
(4,567),
(3,568),
(2,568),
(1,568),
(3,569),
(2,569),
(1,569),
(3,570),
(2,570),
(1,570),
(3,571),
(2,571),
(1,571),
(3,572),
(2,572),
(1,572),
(3,573),
(2,573),
(1,573),
(3,574),
(2,574),
(1,574),
(3,575),
(2,575),
(4,575),
(3,576),
(2,576),
(1,576),
(3,577),
(2,577),
(4,577),
(3,578),
(2,578),
(4,578),
(3,579),
(2,579),
(4,579),
(3,580),
(2,580),
(1,580),
(3,581),
(2,581),
(1,581),
(3,582),
(2,582),
(1,582),
(3,583),
(2,583),
(4,583),
(3,584),
(2,584),
(4,584),
(3,585),
(2,585),
(4,585),
(3,586),
(2,586),
(1,586),
(3,587),
(2,587),
(1,587),
(3,588),
(2,588),
(4,588),
(3,589),
(2,589),
(4,589),
(3,590),
(2,590),
(1,590),
(3,591),
(2,591),
(1,591),
(3,592),
(2,592),
(1,592),
(3,593),
(2,593),
(4,593),
(3,594),
(2,594),
(1,594),
(3,595),
(2,595),
(4,595),
(3,596),
(2,596),
(4,596),
(3,597),
(2,597),
(1,597),
(3,598),
(2,598),
(4,598),
(3,599),
(2,599),
(4,599),
(3,600),
(2,600),
(1,600),
(3,601),
(2,601),
(4,601),
(3,602),
(2,602),
(1,602),
(3,603),
(2,603),
(1,603),
(3,604),
(2,604),
(1,604),
(3,605),
(2,605),
(1,605),
(3,606),
(2,606),
(1,606),
(3,607),
(2,607),
(4,607),
(3,608),
(2,608),
(1,608),
(3,609),
(2,609),
(1,609),
(3,610),
(2,610),
(1,610),
(3,611),
(2,611),
(4,611),
(3,612),
(2,612),
(4,612),
(3,613),
(2,613),
(4,613),
(3,614),
(2,614),
(4,614),
(3,615),
(2,615),
(1,615),
(3,616),
(2,616),
(4,616),
(3,617),
(2,617),
(1,617),
(3,618),
(2,618),
(1,618),
(3,619),
(2,619),
(4,619),
(3,620),
(2,620),
(4,620),
(3,621),
(2,621),
(1,621),
(3,622),
(2,622),
(4,622),
(3,623),
(2,623),
(1,623),
(3,624),
(2,624),
(4,624),
(3,625),
(2,625),
(4,625),
(3,626),
(2,626),
(1,626),
(3,627),
(2,627),
(4,627),
(3,628),
(2,628),
(4,628),
(3,629),
(2,629),
(1,629),
(3,630),
(2,630),
(4,630),
(3,631),
(2,631),
(1,631),
(3,632),
(2,632),
(1,632),
(3,633),
(2,633),
(1,633),
(3,634),
(2,634),
(4,634),
(3,635),
(2,635),
(1,635),
(3,636),
(2,636),
(4,636),
(3,637),
(2,637),
(1,637),
(3,638),
(2,638),
(4,638),
(3,639),
(2,639),
(4,639),
(3,640),
(2,640),
(1,640),
(3,641),
(2,641),
(1,641),
(3,642),
(2,642),
(1,642),
(3,643),
(2,643),
(1,643),
(3,644),
(2,644),
(1,644),
(3,645),
(2,645),
(4,645),
(3,646),
(2,646),
(4,646),
(3,647),
(2,647),
(1,647),
(3,648),
(2,648),
(4,648),
(3,649),
(2,649),
(1,649),
(3,650),
(2,650),
(1,650),
(3,651),
(2,651),
(4,651),
(3,652),
(2,652),
(1,652),
(3,653),
(2,653),
(4,653),
(3,654),
(2,654),
(1,654),
(3,655),
(2,655),
(4,655),
(3,656),
(2,656),
(4,656),
(3,657),
(2,657),
(4,657),
(3,658),
(2,658),
(1,658),
(3,659),
(2,659),
(4,659),
(3,660),
(2,660),
(4,660),
(3,661),
(2,661),
(1,661),
(3,662),
(2,662),
(4,662),
(3,663),
(2,663),
(1,663),
(3,664),
(2,664),
(4,664),
(3,665),
(2,665),
(1,665),
(3,666),
(2,666),
(1,666),
(3,667),
(2,667),
(1,667),
(3,668),
(2,668),
(1,668),
(3,669),
(2,669),
(4,669),
(3,670),
(2,670),
(4,670),
(3,671),
(2,671),
(1,671),
(3,672),
(2,672),
(4,672),
(3,673),
(2,673),
(4,673),
(3,674),
(2,674),
(1,674),
(3,675),
(2,675),
(1,675),
(3,676),
(2,676),
(4,676),
(3,677),
(2,677),
(4,677),
(3,678),
(2,678),
(1,678),
(3,679),
(2,679),
(1,679),
(3,680),
(2,680),
(4,680),
(3,681),
(2,681),
(1,681),
(3,682),
(2,682),
(4,682),
(3,683),
(2,683),
(4,683),
(3,684),
(2,684),
(1,684),
(3,685),
(2,685),
(4,685),
(3,686),
(2,686),
(1,686),
(3,687),
(2,687),
(1,687),
(3,688),
(2,688),
(1,688),
(3,689),
(2,689),
(4,689),
(3,690),
(2,690),
(4,690),
(3,691),
(2,691),
(4,691),
(3,692),
(2,692),
(1,692),
(3,693),
(2,693),
(1,693),
(3,694),
(2,694),
(1,694),
(3,695),
(2,695),
(4,695),
(3,696),
(2,696),
(1,696),
(3,697),
(2,697),
(4,697),
(3,698),
(2,698),
(1,698),
(3,699),
(2,699),
(4,699),
(3,700),
(2,700),
(1,700),
(3,701),
(2,701),
(1,701),
(3,702),
(2,702),
(1,702),
(3,703),
(2,703),
(4,703),
(3,704),
(2,704),
(1,704),
(3,705),
(2,705),
(4,705),
(3,706),
(2,706),
(4,706),
(3,707),
(2,707),
(4,707),
(3,708),
(2,708),
(1,708),
(3,709),
(2,709),
(1,709),
(3,710),
(2,710),
(1,710),
(3,711),
(2,711),
(4,711),
(3,712),
(2,712),
(1,712),
(3,713),
(2,713),
(4,713),
(3,714),
(2,714),
(1,714),
(3,715),
(2,715),
(4,715),
(3,716),
(2,716),
(4,716),
(3,717),
(2,717),
(1,717),
(3,718),
(2,718),
(1,718),
(3,719),
(2,719),
(4,719),
(3,720),
(2,720),
(1,720),
(3,721),
(2,721),
(4,721),
(3,722),
(2,722),
(1,722),
(3,723),
(2,723),
(1,723),
(3,724),
(2,724),
(1,724),
(3,725),
(2,725),
(1,725),
(3,726),
(2,726),
(1,726),
(3,727),
(2,727),
(4,727),
(3,728),
(2,728),
(4,728),
(3,729),
(2,729),
(1,729),
(3,730),
(2,730),
(4,730),
(3,731),
(2,731),
(4,731),
(3,732),
(2,732),
(4,732),
(3,733),
(2,733),
(1,733),
(3,734),
(2,734),
(1,734),
(3,735),
(2,735),
(1,735),
(3,736),
(2,736),
(4,736),
(3,737),
(2,737),
(4,737),
(3,738),
(2,738),
(1,738),
(3,739),
(2,739),
(1,739),
(3,740),
(2,740),
(1,740),
(3,741),
(2,741),
(4,741),
(3,742),
(2,742),
(1,742);
/*!40000 ALTER TABLE `affiliations_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations_events`
--

DROP TABLE IF EXISTS `affiliations_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations_events` (
  `affiliation_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  KEY `FK_aff_eve_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_aff_eve_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_aff_eve_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_aff_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations_events`
--

LOCK TABLES `affiliations_events` WRITE;
/*!40000 ALTER TABLE `affiliations_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliations_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations_media`
--

DROP TABLE IF EXISTS `affiliations_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations_media` (
  `affiliation_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_aff_med_med_id__med_id` (`media_id`),
  KEY `FK_aff_med_aff_id__aff_id` (`affiliation_id`),
  CONSTRAINT `FK_aff_med_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_aff_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations_media`
--

LOCK TABLES `affiliations_media` WRITE;
/*!40000 ALTER TABLE `affiliations_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliations_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_action_participants`
--

DROP TABLE IF EXISTS `american_football_action_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_action_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `american_football_action_play_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `participant_role` varchar(100) NOT NULL,
  `score_type` varchar(100) DEFAULT NULL,
  `field_line` int(11) DEFAULT NULL,
  `yardage` int(11) DEFAULT NULL,
  `score_credit` int(11) DEFAULT NULL,
  `yards_gained` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_american_football_action_participants_1` (`participant_role`),
  KEY `IDX_american_football_action_participants_2` (`score_type`),
  KEY `IDX_FK_ame_foo_act_par_ame_foo_act_pla_id__ame_foo_act_pla_id` (`american_football_action_play_id`),
  KEY `IDX_FK_ame_foo_act_par_per_id__per_id` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_action_participants`
--

LOCK TABLES `american_football_action_participants` WRITE;
/*!40000 ALTER TABLE `american_football_action_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_action_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_action_plays`
--

DROP TABLE IF EXISTS `american_football_action_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_action_plays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `american_football_event_state_id` int(11) NOT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `score_attempt_type` varchar(100) DEFAULT NULL,
  `drive_result` varchar(100) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_american_football_action_plays_1` (`play_type`),
  KEY `IDX_american_football_action_plays_2` (`score_attempt_type`),
  KEY `IDX_american_football_action_plays_3` (`drive_result`),
  KEY `IDX_FK_ame_foo_act_pla_ame_foo_eve_sta_id__ame_foo_eve_sta_id` (`american_football_event_state_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_action_plays`
--

LOCK TABLES `american_football_action_plays` WRITE;
/*!40000 ALTER TABLE `american_football_action_plays` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_action_plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_defensive_stats`
--

DROP TABLE IF EXISTS `american_football_defensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_defensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tackles_total` varchar(100) DEFAULT NULL,
  `tackles_solo` varchar(100) DEFAULT NULL,
  `tackles_assists` varchar(100) DEFAULT NULL,
  `interceptions_total` varchar(100) DEFAULT NULL,
  `interceptions_yards` varchar(100) DEFAULT NULL,
  `interceptions_average` varchar(100) DEFAULT NULL,
  `interceptions_longest` varchar(100) DEFAULT NULL,
  `interceptions_touchdown` varchar(100) DEFAULT NULL,
  `quarterback_hurries` varchar(100) DEFAULT NULL,
  `sacks_total` varchar(100) DEFAULT NULL,
  `sacks_yards` varchar(100) DEFAULT NULL,
  `passes_defensed` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_defensive_stats`
--

LOCK TABLES `american_football_defensive_stats` WRITE;
/*!40000 ALTER TABLE `american_football_defensive_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_defensive_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_down_progress_stats`
--

DROP TABLE IF EXISTS `american_football_down_progress_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_down_progress_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_downs_total` varchar(100) DEFAULT NULL,
  `first_downs_pass` varchar(100) DEFAULT NULL,
  `first_downs_run` varchar(100) DEFAULT NULL,
  `first_downs_penalty` varchar(100) DEFAULT NULL,
  `conversions_third_down` varchar(100) DEFAULT NULL,
  `conversions_third_down_attempts` varchar(100) DEFAULT NULL,
  `conversions_third_down_percentage` varchar(100) DEFAULT NULL,
  `conversions_fourth_down` varchar(100) DEFAULT NULL,
  `conversions_fourth_down_attempts` varchar(100) DEFAULT NULL,
  `conversions_fourth_down_percentage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_down_progress_stats`
--

LOCK TABLES `american_football_down_progress_stats` WRITE;
/*!40000 ALTER TABLE `american_football_down_progress_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_down_progress_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_event_states`
--

DROP TABLE IF EXISTS `american_football_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` smallint(6) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `period_value` int(11) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `clock_state` varchar(100) DEFAULT NULL,
  `down` int(11) DEFAULT NULL,
  `team_in_possession_id` int(11) DEFAULT NULL,
  `distance_for_1st_down` int(11) DEFAULT NULL,
  `field_side` varchar(100) DEFAULT NULL,
  `field_line` int(11) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ame_foo_eve_sta_tea_in_pos_id__tea_id` (`team_in_possession_id`),
  KEY `IDX_american_football_event_states_1` (`current_state`),
  KEY `IDX_american_football_event_states_context` (`context`),
  KEY `IDX_american_football_event_states_seq_num` (`sequence_number`),
  KEY `IDX_FK_ame_foo_eve_sta_eve_id__eve_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_event_states`
--

LOCK TABLES `american_football_event_states` WRITE;
/*!40000 ALTER TABLE `american_football_event_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_event_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_fumbles_stats`
--

DROP TABLE IF EXISTS `american_football_fumbles_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_fumbles_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fumbles_committed` varchar(100) DEFAULT NULL,
  `fumbles_forced` varchar(100) DEFAULT NULL,
  `fumbles_recovered` varchar(100) DEFAULT NULL,
  `fumbles_lost` varchar(100) DEFAULT NULL,
  `fumbles_yards_gained` varchar(100) DEFAULT NULL,
  `fumbles_own_committed` varchar(100) DEFAULT NULL,
  `fumbles_own_recovered` varchar(100) DEFAULT NULL,
  `fumbles_own_lost` varchar(100) DEFAULT NULL,
  `fumbles_own_yards_gained` varchar(100) DEFAULT NULL,
  `fumbles_opposing_committed` varchar(100) DEFAULT NULL,
  `fumbles_opposing_recovered` varchar(100) DEFAULT NULL,
  `fumbles_opposing_lost` varchar(100) DEFAULT NULL,
  `fumbles_opposing_yards_gained` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_fumbles_stats`
--

LOCK TABLES `american_football_fumbles_stats` WRITE;
/*!40000 ALTER TABLE `american_football_fumbles_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_fumbles_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_offensive_stats`
--

DROP TABLE IF EXISTS `american_football_offensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_offensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offensive_plays_yards` varchar(100) DEFAULT NULL,
  `offensive_plays_number` varchar(100) DEFAULT NULL,
  `offensive_plays_average_yards_per` varchar(100) DEFAULT NULL,
  `possession_duration` varchar(100) DEFAULT NULL,
  `turnovers_giveaway` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_offensive_stats`
--

LOCK TABLES `american_football_offensive_stats` WRITE;
/*!40000 ALTER TABLE `american_football_offensive_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_offensive_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_passing_stats`
--

DROP TABLE IF EXISTS `american_football_passing_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_passing_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passes_attempts` varchar(100) DEFAULT NULL,
  `passes_completions` varchar(100) DEFAULT NULL,
  `passes_percentage` varchar(100) DEFAULT NULL,
  `passes_yards_gross` varchar(100) DEFAULT NULL,
  `passes_yards_net` varchar(100) DEFAULT NULL,
  `passes_yards_lost` varchar(100) DEFAULT NULL,
  `passes_touchdowns` varchar(100) DEFAULT NULL,
  `passes_touchdowns_percentage` varchar(100) DEFAULT NULL,
  `passes_interceptions` varchar(100) DEFAULT NULL,
  `passes_interceptions_percentage` varchar(100) DEFAULT NULL,
  `passes_longest` varchar(100) DEFAULT NULL,
  `passes_average_yards_per` varchar(100) DEFAULT NULL,
  `passer_rating` varchar(100) DEFAULT NULL,
  `receptions_total` varchar(100) DEFAULT NULL,
  `receptions_yards` varchar(100) DEFAULT NULL,
  `receptions_touchdowns` varchar(100) DEFAULT NULL,
  `receptions_first_down` varchar(100) DEFAULT NULL,
  `receptions_longest` varchar(100) DEFAULT NULL,
  `receptions_average_yards_per` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_passing_stats`
--

LOCK TABLES `american_football_passing_stats` WRITE;
/*!40000 ALTER TABLE `american_football_passing_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_passing_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_penalties_stats`
--

DROP TABLE IF EXISTS `american_football_penalties_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_penalties_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `penalties_total` varchar(100) DEFAULT NULL,
  `penalty_yards` varchar(100) DEFAULT NULL,
  `penalty_first_downs` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_penalties_stats`
--

LOCK TABLES `american_football_penalties_stats` WRITE;
/*!40000 ALTER TABLE `american_football_penalties_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_penalties_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_rushing_stats`
--

DROP TABLE IF EXISTS `american_football_rushing_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_rushing_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rushes_attempts` varchar(100) DEFAULT NULL,
  `rushes_yards` varchar(100) DEFAULT NULL,
  `rushes_touchdowns` varchar(100) DEFAULT NULL,
  `rushing_average_yards_per` varchar(100) DEFAULT NULL,
  `rushes_first_down` varchar(100) DEFAULT NULL,
  `rushes_longest` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_rushing_stats`
--

LOCK TABLES `american_football_rushing_stats` WRITE;
/*!40000 ALTER TABLE `american_football_rushing_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_rushing_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_sacks_against_stats`
--

DROP TABLE IF EXISTS `american_football_sacks_against_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_sacks_against_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sacks_against_yards` varchar(100) DEFAULT NULL,
  `sacks_against_total` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_sacks_against_stats`
--

LOCK TABLES `american_football_sacks_against_stats` WRITE;
/*!40000 ALTER TABLE `american_football_sacks_against_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_sacks_against_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_scoring_stats`
--

DROP TABLE IF EXISTS `american_football_scoring_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_scoring_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `touchdowns_total` varchar(100) DEFAULT NULL,
  `touchdowns_passing` varchar(100) DEFAULT NULL,
  `touchdowns_rushing` varchar(100) DEFAULT NULL,
  `touchdowns_special_teams` varchar(100) DEFAULT NULL,
  `touchdowns_defensive` varchar(100) DEFAULT NULL,
  `extra_points_attempts` varchar(100) DEFAULT NULL,
  `extra_points_made` varchar(100) DEFAULT NULL,
  `extra_points_missed` varchar(100) DEFAULT NULL,
  `extra_points_blocked` varchar(100) DEFAULT NULL,
  `field_goal_attempts` varchar(100) DEFAULT NULL,
  `field_goals_made` varchar(100) DEFAULT NULL,
  `field_goals_missed` varchar(100) DEFAULT NULL,
  `field_goals_blocked` varchar(100) DEFAULT NULL,
  `safeties_against` varchar(100) DEFAULT NULL,
  `two_point_conversions_attempts` varchar(100) DEFAULT NULL,
  `two_point_conversions_made` varchar(100) DEFAULT NULL,
  `touchbacks_total` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_scoring_stats`
--

LOCK TABLES `american_football_scoring_stats` WRITE;
/*!40000 ALTER TABLE `american_football_scoring_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_scoring_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_special_teams_stats`
--

DROP TABLE IF EXISTS `american_football_special_teams_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_special_teams_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `returns_punt_total` varchar(100) DEFAULT NULL,
  `returns_punt_yards` varchar(100) DEFAULT NULL,
  `returns_punt_average` varchar(100) DEFAULT NULL,
  `returns_punt_longest` varchar(100) DEFAULT NULL,
  `returns_punt_touchdown` varchar(100) DEFAULT NULL,
  `returns_kickoff_total` varchar(100) DEFAULT NULL,
  `returns_kickoff_yards` varchar(100) DEFAULT NULL,
  `returns_kickoff_average` varchar(100) DEFAULT NULL,
  `returns_kickoff_longest` varchar(100) DEFAULT NULL,
  `returns_kickoff_touchdown` varchar(100) DEFAULT NULL,
  `returns_total` varchar(100) DEFAULT NULL,
  `returns_yards` varchar(100) DEFAULT NULL,
  `punts_total` varchar(100) DEFAULT NULL,
  `punts_yards_gross` varchar(100) DEFAULT NULL,
  `punts_yards_net` varchar(100) DEFAULT NULL,
  `punts_longest` varchar(100) DEFAULT NULL,
  `punts_inside_20` varchar(100) DEFAULT NULL,
  `punts_inside_20_percentage` varchar(100) DEFAULT NULL,
  `punts_average` varchar(100) DEFAULT NULL,
  `punts_blocked` varchar(100) DEFAULT NULL,
  `touchbacks_total` varchar(100) DEFAULT NULL,
  `touchbacks_total_percentage` varchar(100) DEFAULT NULL,
  `touchbacks_kickoffs` varchar(100) DEFAULT NULL,
  `touchbacks_kickoffs_percentage` varchar(100) DEFAULT NULL,
  `touchbacks_punts` varchar(100) DEFAULT NULL,
  `touchbacks_punts_percentage` varchar(100) DEFAULT NULL,
  `touchbacks_interceptions` varchar(100) DEFAULT NULL,
  `touchbacks_interceptions_percentage` varchar(100) DEFAULT NULL,
  `fair_catches` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_special_teams_stats`
--

LOCK TABLES `american_football_special_teams_stats` WRITE;
/*!40000 ALTER TABLE `american_football_special_teams_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_special_teams_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `american_football_team_stats`
--

DROP TABLE IF EXISTS `american_football_team_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_team_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yards_per_attempt` varchar(100) DEFAULT NULL,
  `average_starting_position` varchar(100) DEFAULT NULL,
  `timeouts` varchar(100) DEFAULT NULL,
  `time_of_possession` varchar(100) DEFAULT NULL,
  `turnover_ratio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `american_football_team_stats`
--

LOCK TABLES `american_football_team_stats` WRITE;
/*!40000 ALTER TABLE `american_football_team_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `american_football_team_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `award_type` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `award_value` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseball_action_contact_details`
--

DROP TABLE IF EXISTS `baseball_action_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_action_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseball_action_pitch_id` int(11) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `strength` varchar(100) DEFAULT NULL,
  `velocity` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `trajectory_coordinates` varchar(100) DEFAULT NULL,
  `trajectory_formula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bas_act_con_det_bas_act_pit_id__bas_act_pit_id` (`baseball_action_pitch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseball_action_contact_details`
--

LOCK TABLES `baseball_action_contact_details` WRITE;
/*!40000 ALTER TABLE `baseball_action_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseball_action_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseball_action_pitches`
--

DROP TABLE IF EXISTS `baseball_action_pitches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_action_pitches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseball_action_play_id` int(11) NOT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `baseball_defensive_group_id` int(11) DEFAULT NULL,
  `umpire_call` varchar(100) DEFAULT NULL,
  `pitch_location` varchar(100) DEFAULT NULL,
  `pitch_type` varchar(100) DEFAULT NULL,
  `pitch_velocity` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `trajectory_coordinates` varchar(512) DEFAULT NULL,
  `trajectory_formula` varchar(100) DEFAULT NULL,
  `ball_type` varchar(40) DEFAULT NULL,
  `strike_type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_baseball_action_plays_baseball_action_pitches` (`baseball_action_play_id`),
  KEY `IDX_baseball_action_pitches_1` (`umpire_call`),
  KEY `IDX_baseball_action_pitches_2` (`pitch_type`),
  KEY `IDX_FK_bas_act_pit_bas_def_gro_id__bas_def_gro_id` (`baseball_defensive_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseball_action_pitches`
--

LOCK TABLES `baseball_action_pitches` WRITE;
/*!40000 ALTER TABLE `baseball_action_pitches` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseball_action_pitches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseball_action_plays`
--

DROP TABLE IF EXISTS `baseball_action_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_action_plays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseball_event_state_id` int(11) NOT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `out_type` varchar(100) DEFAULT NULL,
  `notation` varchar(100) DEFAULT NULL,
  `notation_yaml` text DEFAULT NULL,
  `baseball_defensive_group_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `runner_on_first_advance` varchar(40) DEFAULT NULL,
  `runner_on_second_advance` varchar(40) DEFAULT NULL,
  `runner_on_third_advance` varchar(40) DEFAULT NULL,
  `outs_recorded` int(11) DEFAULT NULL,
  `rbi` int(11) DEFAULT NULL,
  `runs_scored` int(11) DEFAULT NULL,
  `earned_runs_scored` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_baseball_action_plays_1` (`play_type`),
  KEY `IDX_baseball_action_plays_2` (`out_type`),
  KEY `IDX_FK_bas_act_pla_bas_eve_sta_id__bas_eve_sta_id` (`baseball_event_state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=591 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseball_action_plays`
--

LOCK TABLES `baseball_action_plays` WRITE;
/*!40000 ALTER TABLE `baseball_action_plays` DISABLE KEYS */;
INSERT INTO `baseball_action_plays` VALUES
(1,1,'hit-by-pitch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,2,'hit-by-pitch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,3,'hit-by-pitch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,5,'walk',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,6,'hit-by-pitch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,7,'hit-by-pitch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,8,'hit-by-pitch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,10,'walk',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,11,'hit-by-pitch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,12,'hit-by-pitch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11,13,'out','strikeout',NULL,NULL,NULL,'Pinch-Hitter Travis Ishikawa struck out looking to end the game.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(12,15,'double',NULL,NULL,NULL,NULL,'Skip Schumaker doubled to left. Runner on second with none out and Ryan Ludwick due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13,17,'single',NULL,NULL,NULL,NULL,'Ryan Ludwick singled to right center. Runners on first and third with none out and Albert Pujols due up.',NULL,'3',NULL,NULL,NULL,NULL,NULL),
(14,19,'single',NULL,NULL,NULL,NULL,'Albert Pujols singled to left, scoring Skip Schumaker. Runners on first and second with none out and Felipe Lopez due up.','2',NULL,'home',NULL,1,1,'1'),
(15,21,'walk',NULL,NULL,NULL,NULL,'Felipe Lopez walked. Bases loaded with none out and Troy Glaus due up.','2','3',NULL,NULL,NULL,NULL,NULL),
(16,23,'out','fly-ball','8',NULL,NULL,'Troy Glaus flied out to center. Bases loaded with one out and Adam Kennedy due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(17,25,'home-run',NULL,NULL,NULL,NULL,'Adam Kennedy one-out, Grand Slam (2) to left, scoring Ryan Ludwick, Albert Pujols and Felipe Lopez. Aaron Miles due up.','home','home','home',NULL,4,4,'4'),
(18,27,'out','throw-out','3-',NULL,NULL,'Aaron Miles grounded out first to pitcher.  None on with two outs and Adam Wainwright due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(19,29,'out','strikeout',NULL,NULL,NULL,'Adam Wainwright struck out looking to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(20,31,'single',NULL,NULL,NULL,NULL,'Alfonso Soriano singled to left. Runner on first with none out and Ryan Theriot due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(21,34,'out','foul-out','9',NULL,NULL,'Ryan Theriot fouled out to right. Runner on first with one out and Derrek Lee due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(22,36,'walk',NULL,NULL,NULL,NULL,'Derrek Lee walked. Runners on first and second with one out and Aramis Ramirez due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(23,38,'out',NULL,'5',NULL,NULL,'Aramis Ramirez popped out to third on the infield fly rule. Runners on first and second and with two outs and Jim Edmonds due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(24,40,'out','throw-out','3-',NULL,NULL,'Jim Edmonds grounded out first to pitcher to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(25,42,'double',NULL,NULL,NULL,NULL,'Jason LaRue ground-rule double to left center. Runner on second with none out and Skip Schumaker due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(26,44,'out','fly-ball','7',NULL,NULL,'Skip Schumaker flied out to left. Runner on second with one out and Ryan Ludwick due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(27,46,'walk',NULL,NULL,NULL,NULL,'Ryan Ludwick walked. Runners on first and second with one out and Albert Pujols due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(28,48,'out','throw-out','6-3',NULL,NULL,'Albert Pujols grounded out short to first. Runners on second and third and with two outs and Felipe Lopez due up.','2','3',NULL,1,NULL,NULL,NULL),
(29,50,'error-wild-pitch',NULL,NULL,NULL,NULL,'Jason LaRue scored on a Carlos Zambrano wild pitch. Ryan Ludwick advances to third. Runner on third with two outs and Felipe Lopez at the plate.',NULL,'3','home',NULL,1,1,'1'),
(30,52,'single',NULL,NULL,NULL,NULL,'Felipe Lopez singled to right, scoring Ryan Ludwick. Runner on first with two outs and Troy Glaus due up.',NULL,NULL,'home',NULL,1,1,'1'),
(31,54,'walk',NULL,NULL,NULL,NULL,'Troy Glaus walked. Runners on first and second with two outs and Adam Kennedy due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(32,56,'single',NULL,NULL,NULL,NULL,'Adam Kennedy singled to center, scoring Felipe Lopez. Runners on first and third with two outs and Aaron Miles due up.','3','home',NULL,NULL,1,1,NULL),
(33,59,'out','strikeout',NULL,NULL,NULL,'Aaron Miles struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(34,61,'out','throw-out','-3',NULL,NULL,'Mark DeRosa grounded out pitcher to first.  None on with one out and Mike Fontenot due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(35,63,'out','strikeout',NULL,NULL,NULL,'Mike Fontenot struck out swinging.  None on with two outs and Henry Blanco due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(36,65,'out','throw-out','5-3',NULL,NULL,'Henry Blanco grounded out third to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(37,67,'walk',NULL,NULL,NULL,NULL,'Adam Wainwright walked. Runner on first with none out and Jason LaRue due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(38,69,'out','fly-ball','9',NULL,NULL,'Jason LaRue flied out to right. Runner on first with one out and Skip Schumaker due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(39,71,'out','strikeout',NULL,NULL,NULL,'Skip Schumaker struck out swinging. Runner on first with two outs and Ryan Ludwick due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(40,73,'walk',NULL,NULL,NULL,NULL,'Ryan Ludwick walked. Runners on first and second with two outs and Albert Pujols due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(41,75,'out','fly-ball','8',NULL,NULL,'Albert Pujols flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(42,77,'out','strikeout',NULL,NULL,NULL,'Sean Marshall struck out looking.  None on with one out and Alfonso Soriano due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(43,79,'single',NULL,'6',NULL,NULL,'Alfonso Soriano reached first on Aaron Miles\' throwing error. Runner on first with one out and Ryan Theriot due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(44,81,'out','fly-ball','9',NULL,NULL,'Ryan Theriot flied out to right. Runner on first with two outs and Derrek Lee due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(45,83,'walk',NULL,NULL,NULL,NULL,'Derrek Lee walked. Runners on first and second with two outs and Aramis Ramirez due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(46,85,'out','fly-ball','9',NULL,NULL,'Aramis Ramirez flied out to right to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(47,87,'out','fly-ball','7',NULL,NULL,'Felipe Lopez flied out to left.  None on with one out and Troy Glaus due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(48,90,'out','throw-out','2-3',NULL,NULL,'Troy Glaus grounded out pitcher to first.  None on with two outs and Adam Kennedy due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(49,92,'single',NULL,NULL,NULL,NULL,'Adam Kennedy singled to center. Runner on first with two outs and Aaron Miles due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(50,94,'double',NULL,NULL,NULL,NULL,'Aaron Miles doubled to left center, scoring Adam Kennedy. Runner on second with two outs and Adam Wainwright due up.','home',NULL,NULL,NULL,1,1,'1'),
(51,96,'out','throw-out','4-3',NULL,NULL,'Adam Wainwright grounded out second to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(52,98,'out','strikeout',NULL,NULL,NULL,'Jim Edmonds struck out looking.  None on with one out and Mark DeRosa due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(53,101,'out','strikeout',NULL,NULL,NULL,'Mark DeRosa struck out swinging.  None on with two outs and Mike Fontenot due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(54,103,'double',NULL,NULL,NULL,NULL,'Mike Fontenot doubled to right center. Runner on second with two outs and Henry Blanco due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(55,105,'out','foul-out','1',NULL,NULL,'Henry Blanco fouled out to catcher to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(56,107,'single',NULL,NULL,NULL,NULL,'Jason LaRue singled to center. Runner on first with none out and Skip Schumaker due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(57,110,'out','throw-out','4-3',NULL,NULL,'Skip Schumaker grounded out second to first. Runner on second with one out and Ryan Ludwick due up.','2',NULL,NULL,1,NULL,NULL,NULL),
(58,112,'home-run',NULL,NULL,NULL,NULL,'Ryan Ludwick one-out, two-run Home Run (34) to right, scoring Jason LaRue. Albert Pujols due up.',NULL,'home',NULL,NULL,2,2,'1'),
(59,114,'out','strikeout',NULL,NULL,NULL,'Albert Pujols struck out swinging.  None on with two outs and Felipe Lopez due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(60,116,'out','fly-ball','8',NULL,NULL,'Felipe Lopez flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(61,118,'out','strikeout',NULL,NULL,NULL,'Pinch-Hitter Koyie Hill struck out looking.  None on with one out and Micah Hoffpauir due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(62,121,'single',NULL,NULL,NULL,NULL,'Micah Hoffpauir singled to center. Runner on first with one out and Ronny Cedeno due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(63,123,'walk',NULL,NULL,NULL,NULL,'Ronny Cedeno walked. Runners on first and second with one out and Daryle Ward due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(64,125,'double',NULL,NULL,NULL,NULL,'Daryle Ward doubled to right, scoring Micah Hoffpauir. Runners on second and third with one out and Casey McGehee due up.','3','home',NULL,NULL,1,1,'1'),
(65,127,'out','throw-out','4-3',NULL,NULL,'Casey McGehee grounded out, second to first, scoring Ronny Cedeno. Runner on third with two outs and Felix Pie due up.',NULL,'3','home',1,1,1,'1'),
(66,129,'out','fly-ball','8',NULL,NULL,'Felix Pie flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(67,131,'out','throw-out','5-3',NULL,NULL,'Troy Glaus grounded out third to first.  None on with one out and Adam Kennedy due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(68,134,'double',NULL,NULL,NULL,NULL,'Adam Kennedy doubled to left center. Runner on second with one out and Cesar Izturis due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(69,136,'out','line-out','8',NULL,NULL,'Cesar Izturis lined out to center. Runner on second with two outs and Adam Wainwright due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(70,138,'double',NULL,NULL,NULL,NULL,'Pinch-Hitter Brian Barden singled to center, scoring Adam Kennedy. On the play, Barden advanced to second on the throw. Runner on second with two outs and Jason LaRue due up.',NULL,'home',NULL,NULL,1,1,'1'),
(71,141,'walk',NULL,NULL,NULL,NULL,'Jason LaRue walked. Runners on first and second with two outs and Skip Schumaker due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(72,143,'out','throw-out','4-3',NULL,NULL,'Skip Schumaker grounded out second to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(73,145,'out','throw-out','5-3',NULL,NULL,'Reed Johnson grounded out third to first.  None on with one out and Mike Fontenot due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(74,148,'out','strikeout',NULL,NULL,NULL,'Mike Fontenot struck out looking.  None on with two outs and Kevin Hart due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(75,150,'out','strikeout',NULL,NULL,NULL,'Kevin Hart struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(76,152,'out','strikeout',NULL,NULL,NULL,'Pinch-Hitter Brian Barton struck out swinging.  None on with one out and Albert Pujols due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(77,155,'out','strikeout',NULL,NULL,NULL,'Pinch-Hitter Mark Johnson struck out swinging.  None on with two outs and Felipe Lopez due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(78,158,'single',NULL,NULL,NULL,NULL,'Felipe Lopez singled to center. Runner on first with two outs and Josh Kinney due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(79,160,'single',NULL,NULL,NULL,NULL,'Pinch-Hitter Nick Stavinoha infield single to short. Runners on first and second with two outs and Adam Kennedy due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(80,163,'out','strikeout',NULL,NULL,NULL,'Adam Kennedy struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(81,165,'out','throw-out','4-3',NULL,NULL,'Koyie Hill grounded out second to first.  None on with one out and Micah Hoffpauir due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(82,168,'walk',NULL,NULL,NULL,NULL,'Micah Hoffpauir walked. Runner on first with one out and Ronny Cedeno due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(83,170,'single',NULL,NULL,NULL,NULL,'Ronny Cedeno singled to center. Runners on first and second with one out and Daryle Ward due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(84,172,'out','double-play','4-6-3',NULL,NULL,'Daryle Ward grounded into a double play, second to short to first to end the inning.','out',NULL,NULL,2,NULL,NULL,NULL),
(85,174,'single',NULL,NULL,NULL,NULL,'Cesar Izturis singled to left. Runner on first with none out and Brian Barden due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(86,177,'out','strikeout',NULL,NULL,NULL,'Brian Barden struck out swinging. Runner on first with one out and Jason LaRue due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(87,179,'out','double-play','5-4-3',NULL,NULL,'Jason LaRue grounded into a double play, third to second to first to end the inning.','out',NULL,NULL,2,NULL,NULL,NULL),
(88,181,'out','throw-out','4-3',NULL,NULL,'Casey McGehee grounded out second to first.  None on with one out and Felix Pie due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(89,183,'out','throw-out','5-3',NULL,NULL,'Felix Pie grounded out third to first.  None on with two outs and Reed Johnson due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(90,185,'single',NULL,NULL,NULL,NULL,'Reed Johnson singled to right. Runner on first with two outs and Mike Fontenot due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(91,187,'walk',NULL,NULL,NULL,NULL,'Mike Fontenot walked. Runners on first and second with two outs and Michael Wuertz due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(92,189,'single',NULL,NULL,NULL,NULL,'Pinch-Hitter Kosuke Fukudome singled to center, scoring Reed Johnson. Runners on first and second with two outs and Koyie Hill due up.','2','home',NULL,NULL,1,1,'1'),
(93,192,'error-wild-pitch',NULL,NULL,NULL,NULL,'Mike Fontenot advances to third on a Kelvin Jimenez wild pitch. Kosuke Fukudome advances to second.  Runners on second and third and with two outs and Koyie Hill at the plate.','2','3',NULL,NULL,NULL,NULL,NULL),
(94,194,'error-wild-pitch',NULL,NULL,NULL,NULL,'Mike Fontenot scored on a Kelvin Jimenez wild pitch. Kosuke Fukudome advances to third.  Runner on third with two outs and Koyie Hill at the plate.',NULL,'3','home',NULL,1,1,'1'),
(95,196,'out','strikeout',NULL,NULL,NULL,'Koyie Hill struck out swinging on a foul tip to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(96,198,'out','throw-out','4-3',NULL,NULL,'Skip Schumaker grounded out second to first.  None on with one out and Brian Barton due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(97,201,'single',NULL,NULL,NULL,NULL,'Brian Barton singled to center. Runner on first with one out and Mark Johnson due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(98,203,'single',NULL,NULL,NULL,NULL,'Mark Johnson singled to right. Runners on first and second with one out and Kelvin Jimenez due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(99,205,'out','strikeout',NULL,NULL,NULL,'Kelvin Jimenez struck out looking. Runners on first and second and with two outs and Nick Stavinoha due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(100,207,'out','fielders-choice','6-4',NULL,NULL,'Nick Stavinoha grounded into a fielder\'s choice, short to second to end the inning.','out',NULL,NULL,1,NULL,NULL,NULL),
(101,209,'out','strikeout',NULL,NULL,NULL,'Micah Hoffpauir struck out swinging.  None on with one out and Ronny Cedeno due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(102,211,'walk',NULL,NULL,NULL,NULL,'Ronny Cedeno walked. Runner on first with one out and Daryle Ward due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(103,213,'double',NULL,NULL,NULL,NULL,'Daryle Ward doubled to right. Runners on second and third with one out and Casey McGehee due up.','3',NULL,NULL,NULL,NULL,NULL,NULL),
(104,215,'out','throw-out','3',NULL,NULL,'Casey McGehee grounded out to first, scoring Ronny Cedeno. Runner on third with two outs and Felix Pie due up.',NULL,'3','home',1,1,1,'1'),
(105,217,'double',NULL,NULL,NULL,NULL,'Felix Pie doubled to left, scoring Daryle Ward. Runner on second with two outs and Reed Johnson due up.',NULL,NULL,'home',NULL,1,1,'1'),
(106,219,'out','strikeout',NULL,NULL,NULL,'Reed Johnson struck out swinging to end the game.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(107,221,'out','strikeout',NULL,NULL,NULL,'Curtis Granderson struck out swinging.  None on with one out and Placido Polanco due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(108,223,'out','throw-out','5-3',NULL,NULL,'Placido Polanco grounded out third to first.  None on with two outs and Magglio Ordonez due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(109,225,'out','throw-out','5-3',NULL,NULL,'Kazuo Matsui grounded out third to first.  None on with one out and Michael Bourn due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(110,227,'double',NULL,NULL,NULL,NULL,'Brian Roberts doubled to right. Runner on second with none out and Nick Markakis due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(111,229,'out','throw-out','4-3',NULL,NULL,'Michael Bourn grounded out second to first.  None on with two outs and Miguel Tejada due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(112,231,'walk',NULL,NULL,NULL,NULL,'Denard Span walked. Runner on first with none out and Alexi Casilla due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(113,233,'out','fly-ball','9',NULL,NULL,'Magglio Ordonez flied out to right to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(114,235,'out','strikeout',NULL,NULL,NULL,'Jacoby Ellsbury struck out swinging.  None on with one out and Dustin Pedroia due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(115,237,'out','fly-ball','8',NULL,NULL,'Jimmy Rollins flied out to center.  None on with one out and Chase Utley due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(116,239,'out','strikeout',NULL,NULL,NULL,'Mike Cameron struck out swinging.  None on with one out and Ray Durham due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(117,241,'out','strikeout',NULL,NULL,NULL,'Miguel Tejada struck out looking to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(118,243,'walk',NULL,NULL,NULL,NULL,'Chase Utley walked. Runner on first with one out and Jayson Werth due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(119,245,'walk',NULL,NULL,NULL,NULL,'Dustin Pedroia walked. Runner on first with one out and David Ortiz due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(120,247,'single',NULL,NULL,NULL,NULL,'Ray Durham singled to right. Runner on first with one out and Ryan Braun due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(121,249,'out','foul-out','3',NULL,NULL,'Alexi Casilla fouled out to first. Runner on first with one out and Joe Mauer due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(122,251,'out','throw-out','6-3',NULL,NULL,'Grady Sizemore grounded out short to first.  None on with one out and David Dellucci due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(123,253,'walk',NULL,NULL,NULL,NULL,'Nick Markakis walked. Runners on first and second with none out and Melvin Mora due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(124,255,'out','fly-ball','7',NULL,NULL,'Nyjer Morgan flied out to left.  None on with one out and Freddy Sanchez due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(125,257,'out','fly-ball','5',NULL,NULL,'David Ortiz popped out to third. Runner on first with two outs and Kevin Youkilis due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(126,259,'out','caught-stealing','1-4-',NULL,NULL,'Ray Durham caught stealing second.  None on with two outs and Ryan Braun at the plate.','out',NULL,NULL,1,NULL,NULL,NULL),
(127,262,'single',NULL,NULL,NULL,NULL,'Jayson Werth reached first on an infield single to short. Runners on first and second with one out and Ryan Howard due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(128,265,'single',NULL,NULL,NULL,NULL,'Joe Mauer singled to left. Runners on first and second with one out and Justin Morneau due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(129,267,'out','throw-out','6-3',NULL,NULL,'Ryan Braun grounded out short to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(130,269,'out','sacrifice-bunt','5-3',NULL,NULL,'Melvin Mora sacrifice bunt to third. Runners on second and third with one out and Aubrey Huff due up.','2','3',NULL,1,NULL,NULL,NULL),
(131,271,'out','fly-ball','9',NULL,NULL,'Kevin Youkilis flied out to right to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(132,273,'out','strikeout',NULL,NULL,NULL,'Justin Morneau struck out swinging. Runners on first and second and with two outs and Jason Kubel due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(133,275,'single',NULL,'3',NULL,NULL,'Ryan Howard reached first on Mike Jacobs\'s fielding error scoring Chase Utley with one out. Runners on first and third and Pat Burrell due up.','3','home',NULL,NULL,1,1,NULL),
(134,277,'out','throw-out','3',NULL,NULL,'David Dellucci grounded out to first.  None on with two outs and Shin-Soo Choo due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(135,279,'out','throw-out','4-3',NULL,NULL,'Joe Inglett grounded out second to first.  None on with one out and Marco Scutaro due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(136,281,'out','strikeout',NULL,NULL,NULL,'Freddy Sanchez struck out looking.  None on with two outs and Nate McLouth due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(137,283,'single',NULL,NULL,NULL,NULL,'Nate McLouth singled to left. Runner on first with two outs and Ryan Doumit due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(138,285,'single',NULL,'8-1',NULL,NULL,'Aubrey Huff singled to center scoring Brian Roberts with one out. Nick Markakis thrown out at home. Runner on first with two outs and Luke Scott due up.',NULL,'out','home',1,1,1,'1'),
(139,287,'error-wild-pitch',NULL,NULL,NULL,NULL,'Josh Johnson\'s wild pitch scored Jayson Werth with one out. On the play, Ryan Howard advanced to second. Runner on second and Pat Burrell at the plate.','2',NULL,'home',NULL,1,1,'1'),
(140,290,'out','fly-ball','9',NULL,NULL,'Pat Burrell flied out to right. Runner on second with two outs and Shane Victorino due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(141,292,'single',NULL,NULL,NULL,NULL,'Jerry Hairston Jr. singled to left. Runner on first with none out and Wilkin Castillo due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(142,294,'double',NULL,NULL,NULL,NULL,'Marco Scutaro doubled to left. Runner on second with one out and Alex Rios due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(143,297,'home-run',NULL,NULL,NULL,NULL,'Shin-Soo Choo two-out, solo Home Run (12) to left. Jhonny Peralta due up.',NULL,NULL,NULL,NULL,1,1,'1'),
(144,299,'out','line-out','4',NULL,NULL,'Jason Kubel lined out to second to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(145,301,'out','fly-ball','7',NULL,NULL,'Alex Rios flied out to left. Runner on second with two outs and Vernon Wells due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(146,303,'out','strikeout',NULL,NULL,NULL,'Luke Scott struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(147,305,'out','throw-out','4-3',NULL,NULL,'Shane Victorino grounded out second to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(148,307,'out','fielders-choice','6-4',NULL,NULL,'Ryan Doumit grounded into a fielder\'s choice, short to second to end the inning.','out',NULL,NULL,1,NULL,NULL,NULL),
(149,309,'out','fly-ball','1',NULL,NULL,'Vernon Wells popped out to catcher to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(150,311,'single',NULL,NULL,NULL,NULL,'Wilkin Castillo singled to first. Runners on first and second with none out and Joey Votto due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(151,313,'triple',NULL,NULL,NULL,NULL,'Akinori Iwamura tripled to left. Runner on third with none out and Jason Bartlett due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(152,315,'out','strikeout',NULL,NULL,NULL,'Jhonny Peralta struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(153,317,'out','fly-ball','9',NULL,NULL,'Johnny Damon flied out to right.  None on with one out and Derek Jeter due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(154,319,'home-run',NULL,NULL,NULL,NULL,'Joey Votto none-out, three-run Home Run (20) to right scoring Jerry Hairston Jr. and Wilkin Castillo. Jolbert Cabrera due up.','home','home',NULL,NULL,3,3,'3'),
(155,323,'single',NULL,NULL,NULL,NULL,'Jolbert Cabrera singled to right. Runner on first with none out and Jay Bruce due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(156,325,'out','throw-out','6-3',NULL,NULL,'Jason Bartlett grounded out short to first scoring Akinori Iwamura.  None on with one out and Carlos Pena due up.',NULL,NULL,'home',1,1,1,'1'),
(157,327,'out','fly-ball','8',NULL,NULL,'Derek Jeter flied out to center.  None on with two outs and Bobby Abreu due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(158,329,'single',NULL,NULL,NULL,NULL,'Cameron Maybin reached first on an infield single to short. Runner on first with none out and John Baker due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(159,332,'out','fly-ball','4',NULL,NULL,'Miguel Cabrera popped out to second.  None on with one out and Matt Joyce due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(160,334,'out','throw-out','6-3',NULL,NULL,'Bobby Abreu grounded out short to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(161,336,'single',NULL,NULL,NULL,NULL,'Matt Joyce singled to right. Runner on first with one out and Gary Sheffield due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(162,338,'stolen-base',NULL,'-1',NULL,NULL,'Cameron Maybin stole second.  Runner on second with none out and John Baker at the plate.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(163,340,'out','strikeout',NULL,NULL,NULL,'Sean Casey struck out swinging.  None on with one out and Jason Bay due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(164,342,'stolen-base',NULL,'-1',NULL,NULL,'Jolbert Cabrera stole second.  Runner on second with none out and Jay Bruce at the plate.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(165,344,'double',NULL,NULL,NULL,NULL,'Carlos Pena doubled to right. Runner on second with one out and Evan Longoria due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(166,346,'single',NULL,NULL,NULL,NULL,'John Baker singled to center scoring Cameron Maybin with none out. Runner on first and Jorge Cantu due up.',NULL,'home',NULL,NULL,1,1,'1'),
(167,348,'walk',NULL,NULL,NULL,NULL,'Lance Berkman walked. Runner on first with none out and Geoff Blum due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(168,350,'home-run',NULL,NULL,NULL,NULL,'Jay Bruce none-out, two-run Home Run (20) to right scoring Jolbert Cabrera. Adam Rosales due up.',NULL,'home',NULL,NULL,2,2,'1'),
(169,352,'single',NULL,NULL,NULL,NULL,'Jorge Cantu singled to left. Runners on first and second with none out and Mike Jacobs due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(170,354,'out','double-play','5-4-3',NULL,NULL,'Gary Sheffield grounded into a double play, third to second to first to end the inning.','out',NULL,NULL,2,NULL,NULL,NULL),
(171,356,'double',NULL,NULL,NULL,NULL,'Evan Longoria ground-rule doubled to right scoring Carlos Pena.  Runner on second with one out and Cliff Floyd due up.',NULL,'home',NULL,NULL,1,1,'1'),
(172,358,'single',NULL,NULL,NULL,NULL,'Adam Jones singled to center. Runner on first with none out and Ramon Hernandez due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(173,360,'out','throw-out','6-3',NULL,NULL,'Adam Rosales grounded out short to first.  None on with one out and Corey Patterson due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(174,362,'double',NULL,NULL,NULL,NULL,'Mike Jacobs doubled to right scoring John Baker and Jorge Cantu with none out. Runner on second and Dan Uggla due up.','home','home',NULL,NULL,2,2,'2'),
(175,364,'single',NULL,NULL,NULL,NULL,'Cliff Floyd singled to left center scoring Evan Longoria.  Runner on first with one out and Dioner Navarro due up.',NULL,'home',NULL,NULL,1,1,'1'),
(176,366,'out','strikeout',NULL,NULL,NULL,'Corey Patterson struck out looking.  None on with two outs and Ryan Hanigan due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(177,368,'stolen-base',NULL,'-1',NULL,NULL,'Adam Jones stole second.  Runner on second with none out and Ramon Hernandez at the plate.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(178,370,'out','fly-ball','8',NULL,NULL,'Victor Martinez flied out to center.  None on with one out and Travis Hafner due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(179,372,'out','fly-ball','8',NULL,NULL,'Geoff Blum flied out to center. Runner on first with one out and Hunter Pence due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(180,374,'walk',NULL,NULL,NULL,NULL,'Hunter Pence walked. Runners on first and second with one out and Ty Wigginton due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(181,376,'single',NULL,NULL,NULL,NULL,'Ramon Hernandez singled to right. Runners on first and third with none out and Lou Montanez due up.',NULL,'3',NULL,NULL,NULL,NULL,NULL),
(182,378,'single',NULL,NULL,NULL,NULL,'Jason Bay reached first on A.J. Burnett\'s error. Runner on first with one out and Mark Kotsay due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(183,380,'out','line-out','8',NULL,NULL,'Mark Kotsay lined out to center. Runner on first with two outs and Jed Lowrie due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(184,382,'single',NULL,NULL,NULL,NULL,'Jed Lowrie singled to left. Runners on first and second with two outs and Jason Varitek due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(185,384,'hit-by-pitch',NULL,NULL,NULL,NULL,'Travis Hafner was hit-by-pitch. Runner on first with one out and Michael Aubrey due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(186,386,'home-run',NULL,NULL,NULL,NULL,'Dan Uggla none-out, two-run Home Run (31) to left scored Mike Jacobs. Luis Gonzalez due up.',NULL,'home',NULL,NULL,2,2,NULL),
(187,388,'out','fly-ball','1',NULL,NULL,'Jason Varitek fouled out to catcher to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(188,390,'out','fly-ball','4',NULL,NULL,'Ryan Hanigan popped out to second to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(189,392,'out','fielders-choice','6-4',NULL,NULL,'Michael Aubrey grounded into a fielder\'s choice, short to second. Runner on first with two outs and Andy Marte due up.','out',NULL,NULL,1,NULL,NULL,NULL),
(190,394,'out','sacrifice-fly','7',NULL,NULL,'Lou Montanez sacrifice fly to left scored Adam Jones with one out. Runner on first and Juan Castro due up.',NULL,NULL,'home',1,1,1,'1'),
(191,396,'out','double-play','5-4-3',NULL,NULL,'Ty Wigginton grounded into a double play, third to second to first to end the inning.','out',NULL,NULL,2,NULL,NULL,NULL),
(192,398,'out','double-play','4-6-3',NULL,NULL,'Dioner Navarro grounded into a double play, second to short to first to end the inning.','out',NULL,NULL,2,NULL,NULL,NULL),
(193,400,'out','fly-ball','8',NULL,NULL,'Andy Marte flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(194,402,'out','strikeout',NULL,NULL,NULL,'Luis Gonzalez struck out swinging.  None on with one out and Cody Ross due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(195,404,'out','fly-ball','7',NULL,NULL,'Juan Castro flied out to left. Runner on first with two outs and Brian Roberts due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(196,406,'out','throw-out','4-3',NULL,NULL,'Lyle Overbay grounded out second to first.  None on with one out and Adam Lind due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(197,408,'out','fly-ball','7',NULL,NULL,'Cody Ross flied out to left.  None on with two outs and Alfredo Amezaga due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(198,410,'out','fly-ball','7',NULL,NULL,'Adam LaRoche flied out to left.  None on with one out and Steve Pearce due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(199,412,'single',NULL,NULL,NULL,NULL,'Prince Fielder singled to left. Runner on first with none out and J.J. Hardy due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(200,414,'out','throw-out','4-3',NULL,NULL,'Alfredo Amezaga grounded out second to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(201,416,'out','throw-out','5-3',NULL,NULL,'Brandon Inge grounded out third to first.  None on with one out and Ramon Santiago due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(202,418,'out','fly-ball','8',NULL,NULL,'Will Venable flied out to center.  None on with one out and Matt Antonelli due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(203,420,'home-run',NULL,NULL,NULL,NULL,'Jose Reyes lead-off Home Run (16) to left. Luis Castillo due up.',NULL,NULL,NULL,NULL,1,1,'1'),
(204,422,'out','strikeout',NULL,NULL,NULL,'Steve Pearce struck out swinging.  None on with two outs and Andy LaRoche due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(205,424,'out','throw-out','3',NULL,NULL,'Ramon Santiago grounded out to first.  None on with two outs and Dusty Ryan due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(206,426,'out','fly-ball','7',NULL,NULL,'Brian Roberts flied out to left to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(207,428,'out','throw-out','6-3',NULL,NULL,'Andy LaRoche grounded out short to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(208,430,'out','throw-out','4-3',NULL,NULL,'Luis Castillo grounded out second to first.  None on with one out and David Wright due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(209,432,'out','strikeout',NULL,NULL,NULL,'Delmon Young struck out swinging.  None on with one out and Matt Tolbert due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(210,434,'out','throw-out','6-3',NULL,NULL,'Matt Antonelli grounded out short to first.  None on with two outs and Brian Giles due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(211,436,'home-run',NULL,NULL,NULL,NULL,'Greg Dobbs lead-off Home Run (9) to right. Chris Coste due up.',NULL,NULL,NULL,NULL,1,1,NULL),
(212,438,'out','fly-ball','8',NULL,NULL,'Adam Lind flied out to center.  None on with two outs and Scott Rolen due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(213,440,'out','fly-ball','9',NULL,NULL,'J.J. Hardy flied out to right. Runner on first with one out and Corey Hart due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(214,442,'out','strikeout',NULL,NULL,NULL,'Dusty Ryan struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(215,444,'out','throw-out','6-3',NULL,NULL,'David Wright grounded out short to first.  None on with two outs and Carlos Beltran due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(216,446,'single',NULL,NULL,NULL,NULL,'Chris Coste singled to center. Runner on first with none out and Brett Myers due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(217,448,'double',NULL,NULL,NULL,NULL,'Scott Rolen doubled to left. Runner on second with two outs and Gregg Zaun due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(218,450,'out','throw-out','5-3',NULL,NULL,'Alex Rodriguez grounded out third to first.  None on with one out and Jason Giambi due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(219,452,'out','fly-ball','8',NULL,NULL,'Corey Hart flied out to center. Runner on first with two outs and Craig Counsell due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(220,454,'out','fly-ball','5',NULL,NULL,'Brian Giles popped out to third to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(221,456,'out','throw-out','3',NULL,NULL,'Matt Tolbert grounded out to first.  None on with two outs and Nick Punto due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(222,458,'out','sacrifice-bunt','3-4',NULL,NULL,'Brett Myers sacrifice bunt to first. Runner on second with one out and Jimmy Rollins due up.','2',NULL,NULL,1,NULL,NULL,NULL),
(223,460,'out','throw-out','5-3',NULL,NULL,'Nick Punto grounded out third to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(224,462,'out','strikeout',NULL,NULL,NULL,'Carlos Beltran struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(225,464,'out','foul-out','4',NULL,NULL,'Craig Counsell fouled out to second to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(226,466,'double',NULL,NULL,NULL,NULL,'Jimmy Rollins singled to right. Runners on second and third with one out and Chase Utley due up.',NULL,'3',NULL,NULL,NULL,NULL,NULL),
(227,468,'single',NULL,NULL,NULL,NULL,'Jason Giambi singled to left. Runner on first with one out and Xavier Nady due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(228,470,'double',NULL,NULL,NULL,NULL,'Gregg Zaun double to left scored Scott Rolen with two out. Runner on second with two outs and Travis Snider due up.',NULL,'home',NULL,NULL,1,1,'1'),
(229,472,'walk',NULL,NULL,NULL,NULL,'Emilio Bonifacio walked. Runner on first with none out and Cristian Guzman due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(230,474,'double',NULL,NULL,NULL,NULL,'Travis Snider double to left center scored Gregg Zaun with two out. Runner on second with two outs and Joe Inglett due up.',NULL,'home',NULL,NULL,1,1,'1'),
(231,476,'out','fly-ball','9',NULL,NULL,'Martin Prado flied out to right.  None on with one out and Kelly Johnson due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(232,480,'out','strikeout',NULL,NULL,NULL,'Asdrubal Cabrera struck out swinging.  None on with one out and Grady Sizemore due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(233,482,'out','strikeout',NULL,NULL,NULL,'Ramon Ramirez struck out swinging.  None on with one out and Jerry Hairston Jr. due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(234,484,'out','sacrifice-fly','9',NULL,NULL,'Chase Utley sacrifice fly to right scored Chris Coste with two out. Runner on third and Jayson Werth due up.',NULL,'3','home',1,1,1,'1'),
(235,486,'out','throw-out','4-3',NULL,NULL,'Grady Sizemore grounded out second to first.  None on with two outs and David Dellucci due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(236,488,'out','double-play','5-4-3',NULL,NULL,'Xavier Nady grounded into a double play, third to second to first to end the inning. Jason Giambi out at second.','out',NULL,NULL,2,NULL,NULL,NULL),
(237,490,'out','strikeout',NULL,NULL,NULL,'Kelly Johnson struck out swinging.  None on with two outs and Chipper Jones due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(238,492,'out','strikeout',NULL,NULL,NULL,'Jayson Werth struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(239,494,'walk',NULL,NULL,NULL,NULL,'Joe Inglett walked. Runners on first and second with two outs and Marco Scutaro due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(240,496,'single',NULL,NULL,NULL,NULL,'Gabe Gross singled to short. Runner on first with none out and Eric Hinske due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(241,498,'stolen-base',NULL,'-1',NULL,NULL,'Emilio Bonifacio stole second.  Runner on second with none out and Cristian Guzman at the plate.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(242,500,'out','fly-ball','4',NULL,NULL,'Jerry Hairston Jr. popped out to second.  None on with two outs and Wilkin Castillo due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(243,502,'walk',NULL,NULL,NULL,NULL,'Humberto Quintero walked. Runner on first with none out and Randy Wolf due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(244,504,'out','throw-out','4-3',NULL,NULL,'Cristian Guzman grounded out second to first. Runner on third with one out and Ryan Zimmerman due up.',NULL,'3',NULL,1,NULL,NULL,NULL),
(245,506,'out','fly-ball','8',NULL,NULL,'Chipper Jones flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(246,508,'out','strikeout',NULL,NULL,NULL,'David Dellucci struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(247,510,'out','sacrifice-bunt','-4',NULL,NULL,'Randy Wolf sacrifice bunt to pitcher. Runner on second with one out and Kazuo Matsui due up.','2',NULL,NULL,1,NULL,NULL,NULL),
(248,512,'out','fly-ball','4',NULL,NULL,'Nick Markakis popped out to second.  None on with one out and Melvin Mora due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(249,514,'out','fly-ball','6',NULL,NULL,'Wilkin Castillo popped out to short to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(250,516,'out','throw-out','4-3',NULL,NULL,'Ryan Zimmerman grounded out second to first scoring Emilio Bonifacio with two outs.  None on with two outs and Lastings Milledge due up.',NULL,NULL,'home',1,1,1,'1'),
(251,518,'walk',NULL,NULL,NULL,NULL,'Eric Hinske walked. Runners on first and second with none out and Fernando Perez due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(252,520,'out','line-out','8',NULL,NULL,'Marco Scutaro lined out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(253,522,'out','throw-out','5-3',NULL,NULL,'Melvin Mora grounded out third to first.  None on with two outs and Aubrey Huff due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(254,524,'out','fly-ball','8',NULL,NULL,'Lastings Milledge flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(255,526,'out','fly-ball','8',NULL,NULL,'Kazuo Matsui flied out to center. Runner on second with two outs and Michael Bourn due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(256,528,'out','strikeout',NULL,NULL,NULL,'Josh Johnson struck out looking.  None on with one out and Cameron Maybin due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(257,530,'out','foul-out','3',NULL,NULL,'Aubrey Huff fouled out to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(258,532,'walk',NULL,NULL,NULL,NULL,'Jason Kendall walked. Runner on first with none out and Jeff Suppan due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(259,534,'out','throw-out','4-3',NULL,NULL,'Carlos Delgado grounded out second to first.  None on with one out and Ramon Castro due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(260,536,'double',NULL,NULL,NULL,NULL,'Curtis Granderson doubled to right. Runner on second with none out and Placido Polanco due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(261,538,'out','fly-ball','7',NULL,NULL,'Michael Bourn flied out to left to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(262,540,'out','sacrifice-bunt','-4',NULL,NULL,'Fernando Perez sacrifice bunt pitcher to second. Runners on second and third and with one out and Akinori Iwamura due up.','2','3',NULL,1,NULL,NULL,NULL),
(263,542,'walk',NULL,NULL,NULL,NULL,'Akinori Iwamura intentionally walked. Bases loaded with one out and Jason Bartlett due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(264,544,'single',NULL,NULL,NULL,NULL,'Cameron Maybin reached first on an infield single to second. Runner on first with one out and John Baker due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(265,546,'out','strikeout',NULL,NULL,NULL,'Pinch-Hitter Rickie Weeks struck out swinging. Runner on first with one out and Mike Cameron due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(266,548,'out','throw-out','-3',NULL,NULL,'Jacoby Ellsbury grounded out on a bunt attempt pitcher to first.  None on with one out and Dustin Pedroia due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(267,550,'out','fielders-choice','3-6',NULL,NULL,'John Baker grounded into a fielder\'s choice, first to short. Runner on first with two outs and Jorge Cantu due up.','out',NULL,NULL,1,NULL,NULL,NULL),
(268,552,'out','strikeout',NULL,NULL,NULL,'Adrian Gonzalez struck out swinging.  None on with one out and Kevin Kouzmanoff due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(269,554,'out','strikeout',NULL,NULL,NULL,'Placido Polanco struck out swinging. Runner on second with one out and Magglio Ordonez due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(270,556,'single',NULL,NULL,NULL,NULL,'Jason Bartlett singled to left scoring Gabe Gross.  Bases loaded with one out and Carlos Pena due up.','2','3','home',NULL,1,1,'1'),
(271,558,'double',NULL,NULL,NULL,NULL,'Ramon Castro doubled to center. Runner on second with one out and Ryan Church due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(272,560,'out','throw-out','4-3',NULL,NULL,'Magglio Ordonez grounded out second to first. Runner on third with two outs and Miguel Cabrera due up.',NULL,'3',NULL,1,NULL,NULL,NULL),
(273,562,'out','strikeout',NULL,NULL,NULL,'Dustin Pedroia struck out looking.  None on with two outs and David Ortiz due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(274,564,'home-run',NULL,NULL,NULL,NULL,'Robinson Cano lead-off Home Run (14) to right. Ivan Rodriguez due up.',NULL,NULL,NULL,NULL,1,1,'1'),
(275,566,'out','strikeout',NULL,NULL,NULL,'Ryan Church struck out swinging. Runner on second with two outs and Nick Evans due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(276,568,'walk',NULL,NULL,NULL,NULL,'Luis Cruz walked. Runner on first with none out and Ian Snell due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(277,571,'out','foul-out','7',NULL,NULL,'Jorge Cantu fouled out to left to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(278,573,'out','fly-ball','6',NULL,NULL,'Kevin Kouzmanoff popped out to short.  None on with two outs and Chase Headley due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(279,575,'home-run',NULL,NULL,NULL,NULL,'Miguel Cabrera two-out, two-run Home Run (35) to left scoring Curtis Granderson. Matt Joyce due up.',NULL,NULL,'home',NULL,2,2,'2'),
(280,577,'single',NULL,NULL,NULL,NULL,'Ivan Rodriguez singled to left. Runner on first with none out and Brett Gardner due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(281,579,'single',NULL,NULL,NULL,NULL,'Chase Headley singled to left. Runner on first with two outs and Nick Hundley due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(282,581,'out','fly-ball','6',NULL,NULL,'Mike Cameron popped out to short. Runner on first with two outs and Ray Durham due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(283,583,'out','throw-out','4-3',NULL,NULL,'Nick Hundley grounded out second to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(284,585,'out','fly-ball','8',NULL,NULL,'Matt Joyce flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(285,587,'out','strikeout',NULL,NULL,NULL,'David Ortiz struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(286,589,'walk',NULL,NULL,NULL,NULL,'Carlos Pena walked and Eric Hinske scored on the play. Bases loaded with one out and Evan Longoria due up.','2','3','home',NULL,1,1,'1'),
(287,591,'stolen-base',NULL,'-1',NULL,NULL,'Ivan Rodriguez stole second.  Runner on second with none out and Brett Gardner at the plate.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(288,593,'out','strikeout',NULL,NULL,NULL,'Ray Durham struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(289,595,'out','sacrifice-fly','7-5',NULL,NULL,'Evan Longoria sacrifice fly out to third scored Akinori Iwamura.  On the play, Jason Bartlett was thrown out trying to advance to third, left to first to third to end the inning.',NULL,'out','home',2,1,1,NULL),
(290,597,'out','sacrifice-bunt','1-3',NULL,NULL,'Ian Snell sacrifice bunt to catcher. Runner on second with one out and Nyjer Morgan due up.','2',NULL,NULL,1,NULL,NULL,NULL),
(291,599,'out','strikeout',NULL,NULL,NULL,'Ryan Howard struck out swinging.  None on with one out and Pat Burrell due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(292,601,'double',NULL,NULL,NULL,NULL,'Brett Gardner doubled to center scoring Ivan Rodriguez with none out. Runner on second and Johnny Damon due up.',NULL,'home',NULL,NULL,1,1,'1'),
(293,603,'single',NULL,NULL,NULL,NULL,'Elijah Dukes singled to center. Runner on first with none out and Kory Casto due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(294,605,'out','foul-out','7',NULL,NULL,'Nick Evans fouled out to left to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(295,607,'out','fly-ball','8',NULL,NULL,'Alex Rios flied out to center.  None on with one out and Vernon Wells due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(296,609,'out','strikeout',NULL,NULL,NULL,'Pat Burrell struck out swinging.  None on with two outs and Shane Victorino due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(297,611,'home-run',NULL,NULL,NULL,NULL,'Joey Votto lead off Home Run 2 (21) to right. Jolbert Cabrera due up.',NULL,NULL,NULL,NULL,1,1,'1'),
(298,613,'out','strikeout',NULL,NULL,NULL,'Kory Casto struck out swinging. Runner on first with one out and Luke Montz due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(299,615,'out','throw-out','4-3',NULL,NULL,'Shane Victorino grounded out second to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(300,617,'out','strikeout',NULL,NULL,NULL,'Johnny Damon struck out swinging. Runner on second with one out and Derek Jeter due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(301,619,'out','throw-out','3',NULL,NULL,'Vernon Wells grounded out to first.  None on with two outs and Lyle Overbay due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(302,622,'out','throw-out','3',NULL,NULL,'Shin-Soo Choo grounded out to first.  None on with one out and Jhonny Peralta due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(303,624,'out','throw-out','3',NULL,NULL,'Lyle Overbay grounded out to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(304,626,'walk',NULL,NULL,NULL,NULL,'Luke Montz walked. Runners on first and second with one out and Roger Bernadina due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(305,628,'out','throw-out','5-3',NULL,NULL,'Jhonny Peralta grounded out third to first.  None on with two outs and Victor Martinez due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(306,630,'double',NULL,'-6-5',NULL,NULL,'Nyjer Morgan reached second on a fielder\'s choice. On the play, Luis Cruz was out at third,  pitcher, short to third. Runner on second with two outs and Freddy Sanchez due up.',NULL,'out',NULL,1,NULL,NULL,NULL),
(307,633,'out','fly-ball','7',NULL,NULL,'Victor Martinez flied out to left to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(308,635,'single',NULL,NULL,NULL,NULL,'Roger Bernadina singled to right scoring Elijah Dukes with one out. Runners on first and third with one out and Collin Balester due up.','3','home',NULL,NULL,1,1,'1'),
(309,637,'out','fly-ball','8',NULL,NULL,'Carlos Gomez flied out to center.  None on with one out and Denard Span due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(310,639,'out','throw-out','6-3',NULL,NULL,'Mike Jacobs grounded out short to first.  None on with one out and Dan Uggla due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(311,641,'out','fly-ball','8',NULL,NULL,'Jolbert Cabrera flied out to center.  None on with one out and Jay Bruce due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(312,643,'out','fly-ball','9',NULL,NULL,'Erick Aybar flied out to right.  None on with one out and Garret Anderson due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(313,645,'single',NULL,NULL,NULL,NULL,'Omar Infante singled to third. Runner on first with none out and Casey Kotchman due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(314,647,'out','fly-ball','8',NULL,NULL,'Derek Jeter flied out to center. Runner on second with two outs and Bobby Abreu due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(315,649,'out','foul-out','5',NULL,NULL,'Denard Span fouled out to third.  None on with two outs and Alexi Casilla due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(316,651,'out','throw-out','4-3',NULL,NULL,'Casey Kotchman grounded out second to first. Runner on second with one out and Jeff Francoeur due up.','2',NULL,NULL,1,NULL,NULL,NULL),
(317,653,'out','throw-out','6-3',NULL,NULL,'Dan Uggla grounded out short to first.  None on with two outs and Luis Gonzalez due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(318,655,'single',NULL,NULL,NULL,NULL,'Kevin Youkilis singled to left. Runner on first with none out and Sean Casey due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(319,657,'out','throw-out','3',NULL,NULL,'Jay Bruce grounded out to first.  None on with two outs and Adam Rosales due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(320,659,'out','fly-ball','4',NULL,NULL,'Gary Sheffield popped out to second.  None on with one out and Brandon Inge due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(321,661,'out','strikeout,caught-stealing','1-6-',NULL,NULL,'Collin Balester struck out on missed bunt attempt. On the play, Roger Bernadina was caught stealing second, catcher to short, to end the inning.','out',NULL,NULL,2,NULL,NULL,NULL),
(322,663,'out','fly-ball','8',NULL,NULL,'Sean Casey popped out to center. Runner on first with one out and Jason Bay due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(323,665,'out','fly-ball','8',NULL,NULL,'Alexi Casilla flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(324,667,'out','strikeout',NULL,NULL,NULL,'Freddy Sanchez struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(325,669,'single',NULL,NULL,NULL,NULL,'Adam Rosales singled to right. Runner on first with two outs and Corey Patterson due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(326,671,'walk',NULL,NULL,NULL,NULL,'Jeff Francoeur walked. Runners on first and second with one out and Clint Sammons due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(327,673,'out','strikeout',NULL,NULL,NULL,'Stephen Drew struck out swinging. None on with one out and Chris Young due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(328,675,'single',NULL,NULL,NULL,NULL,'Garret Anderson singled to center. Runner on first with one out and Mark Teixeira due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(329,677,'out','throw-out','3',NULL,NULL,'Corey Patterson grounded out to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(330,679,'walk',NULL,NULL,NULL,NULL,'Mark Teixeira walked. Runners on first and second with one out and Torii Hunter due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(331,681,'out','foul-out','5',NULL,NULL,'Luis Gonzalez fouled out to third to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(332,683,'out','strikeout',NULL,NULL,NULL,'Brandon Inge struck out swinging.  None on with two outs and Ramon Santiago due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(333,685,'walk',NULL,NULL,NULL,NULL,'Bobby Abreu walked. Runners on first and second with two outs and Alex Rodriguez due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(334,687,'out','fly-ball','4',NULL,NULL,'Sean Kazmar popped out to second.  None on with one out and Dirk Hayhurst due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(335,689,'out','fly-ball','9',NULL,NULL,'Clint Sammons flied out to right. Runners on first and third with two outs and Josh Anderson due up.',NULL,'3',NULL,1,NULL,NULL,NULL),
(336,691,'out','throw-out','6-3',NULL,NULL,'Miguel Tejada grounded out short to first.  None on with one out and Lance Berkman due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(337,693,'out','strikeout',NULL,NULL,NULL,'Chris Young struck out looking. None on with two outs and Conor Jackson due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(338,695,'walk',NULL,NULL,NULL,NULL,'Lance Berkman walked. Runner on first with one out and Geoff Blum due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(339,697,'out','fielders-choice','6-4',NULL,NULL,'Alex Rodriguez grounded into a fielder\'s choice, short to second to end the inning. Bobby Abreu out at second.','out',NULL,NULL,1,NULL,NULL,NULL),
(340,699,'home-run',NULL,NULL,NULL,NULL,'Torii Hunter one-out, three-run Home Run (21) to left scoring Garret Anderson and Mark Teixeira. Gary Matthews due up.','home','home',NULL,NULL,3,3,'3'),
(341,701,'out','strikeout',NULL,NULL,NULL,'Dirk Hayhurst struck out swinging.  None on with two outs and Will Venable due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(342,703,'out','fielders-choice','5-4',NULL,NULL,'Jason Bay grounded into a fielder\'s choice, third to second. Runner on first with two outs and Mark Kotsay due up.','out',NULL,NULL,1,NULL,NULL,NULL),
(343,705,'out','throw-out','4-3',NULL,NULL,'Ramon Santiago grounded out second to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(344,707,'out','throw-out','-3',NULL,NULL,'Orlando Cabrera grounded out pitcher to first.  None on with one out and Dewayne Wise due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(345,709,'out','throw-out','4-3',NULL,NULL,'Conor Jackson grounded out second to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(346,711,'out','throw-out','3',NULL,NULL,'Cliff Floyd grounded out to first.  None on with one out and Dioner Navarro due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(347,713,'double',NULL,NULL,NULL,NULL,'Gary Matthews doubled to left. Runner on second with one out and Robb Quinlan due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(348,715,'double',NULL,NULL,NULL,NULL,'Greg Dobbs doubled to center. Runner on second with none out and Chris Coste due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(349,717,'out','fly-ball','8',NULL,NULL,'Ryan Braun flied out to center.  None on with one out and Prince Fielder due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(350,719,'home-run',NULL,NULL,NULL,NULL,'Will Venable two-out, solo Home Run (2) to right. Matt Antonelli due up.',NULL,NULL,NULL,NULL,1,1,'1'),
(351,721,'single',NULL,NULL,NULL,NULL,'Mark Kotsay singled to center. Runners on first and second with two outs and Jed Lowrie due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(352,723,'out','fly-ball','6',NULL,NULL,'Dewayne Wise popped out to short.  None on with two outs and Jermaine Dye due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(353,725,'walk',NULL,NULL,NULL,NULL,'Geoff Blum walked. Runners on first and second with one out and Hunter Pence due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(354,727,'single',NULL,NULL,NULL,NULL,'Robb Quinlan singled to center. Runners on first and third with one out and Kendry Morales due up.',NULL,'3',NULL,NULL,NULL,NULL,NULL),
(355,729,'out','fly-ball','8',NULL,NULL,'Jermaine Dye flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(356,731,'out','foul-out','5',NULL,NULL,'Matt Antonelli fouled out to third to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(357,733,'out','strikeout',NULL,NULL,NULL,'Jed Lowrie struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(358,735,'out','fly-ball','7',NULL,NULL,'Dioner Navarro flied out to left.  None on with two outs and Gabe Gross due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(359,737,'single',NULL,NULL,NULL,NULL,'Willy Taveras singled to right. Runner on first with none out and Troy Tulowitzki due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(360,739,'out','fly-ball','8',NULL,NULL,'Prince Fielder flied out to center.  None on with two outs and J.J. Hardy due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(361,742,'out','line-out','6',NULL,NULL,'Travis Hafner lined out to short.  None on with one out and Michael Aubrey due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(362,744,'single',NULL,NULL,NULL,NULL,'J.J. Hardy singled to third. Runner on first with two outs and Corey Hart due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(363,746,'out','double-play','6-4-3',NULL,NULL,'Kendry Morales grounded into a double play, short to second to first to end the inning.','out',NULL,NULL,2,NULL,NULL,NULL),
(364,748,'out','fly-ball','8',NULL,NULL,'Luke Scott flied out to center.  None on with one out and Adam Jones due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(365,750,'out','throw-out','4-3',NULL,NULL,'Emilio Bonifacio grounded out second to first.  None on with one out and Cristian Guzman due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(366,752,'double',NULL,'5',NULL,NULL,'Hunter Pence singled to left scoring Lance Berkman. On the play, Hunter Pence advances to second on Andy LaRoche\'s throwing error. Runners on second and third with one out and Ty Wigginton due up.','3','home',NULL,NULL,1,1,'1'),
(367,754,'out','strikeout',NULL,NULL,NULL,'Chris Coste struck out swinging. Runner on second with one out and Brett Myers due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(368,756,'out','throw-out','-3',NULL,NULL,'Joaquin Arias grounded out pitcher to first.  None on with one out and Michael Young due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(369,758,'out','throw-out','4-3',NULL,NULL,'David DeJesus grounded out second to first.  None on with one out and Mike Aviles due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(370,760,'out','fly-ball','4',NULL,NULL,'Gabe Gross popped out to second to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(371,762,'out','throw-out','4-3',NULL,NULL,'Brett Myers grounded out second to first. Runner on third with two outs and Jimmy Rollins due up.',NULL,'3',NULL,1,NULL,NULL,NULL),
(372,764,'out','fly-ball','4',NULL,NULL,'Michael Aubrey popped out to second.  None on with two outs and Andy Marte due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(373,766,'out','fly-ball','7',NULL,NULL,'Cristian Guzman flied out to left.  None on with two outs and Ryan Zimmerman due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(374,768,'out','fly-ball','4',NULL,NULL,'Andy Marte popped out to second to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(375,771,'out','throw-out','5-3',NULL,NULL,'Adam Lind grounded out third to first.  None on with one out and Scott Rolen due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(376,773,'out','strikeout',NULL,NULL,NULL,'Corey Hart struck out looking to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(377,776,'out','strikeout',NULL,NULL,NULL,'Adam Jones struck out swinging.  None on with two outs and Ramon Hernandez due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(378,778,'out','throw-out','6-3',NULL,NULL,'Scott Rolen grounded out short to first.  None on with two outs and Gregg Zaun due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(379,780,'single',NULL,NULL,NULL,NULL,'Mike Aviles singled to right. Runner on first with one out and Jose Guillen due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(380,782,'out','throw-out','6-3',NULL,NULL,'Ty Wigginton grounded out short to first scoring Geoff Blum. Runner on third with two outs and Humberto Quintero due up.',NULL,'3','home',1,1,1,'1'),
(381,784,'double',NULL,'3-1-4-5',NULL,NULL,'Josh Anderson singled to third scoring Omar Infante. On the play, Jeff Francoeur advances to home on David Wright\'s throwing error. Josh Anderson is tagged out at second to end the inning.','home',NULL,'home',1,2,2,'1'),
(382,786,'out','strikeout',NULL,NULL,NULL,'Humberto Quintero struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(383,788,'single',NULL,NULL,NULL,NULL,'Ramon Hernandez infield single to short. Runner on first with two outs and Lou Montanez due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(384,790,'out','fly-ball','8',NULL,NULL,'Troy Tulowitzki flied out to center. Runner on first with one out and Matt Holliday due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(385,792,'out','fly-ball','8',NULL,NULL,'Ryan Zimmerman flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(386,794,'out','fly-ball','9',NULL,NULL,'Lou Montanez flied out to right to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(387,796,'single',NULL,NULL,NULL,NULL,'Michael Young singled to center. Runner on first with one out and Josh Hamilton due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(388,798,'out','fly-ball','9',NULL,NULL,'Jimmy Rollins flied out to right to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(389,800,'single',NULL,NULL,NULL,NULL,'Ryan Hanigan singled to left. Runner on first with none out and Ramon Ramirez due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(390,802,'out','fly-ball','7',NULL,NULL,'Joe Mauer flied out to left.  None on with one out and Justin Morneau due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(391,804,'out','fly-ball','7',NULL,NULL,'Gregg Zaun flied out to left to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(392,806,'out','strikeout',NULL,NULL,NULL,'Dusty Ryan struck out swinging.  None on with one out and Curtis Granderson due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(393,808,'out','double-play','6-4-3',NULL,NULL,'Jose Guillen grounded into a double play, short to second to first to end the inning.','out',NULL,NULL,2,NULL,NULL,NULL),
(394,810,'out','fly-ball','7',NULL,NULL,'Oliver Perez flied out to left.  None on with one out and Jose Reyes due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(395,812,'out','fielders-choice','1-6',NULL,NULL,'Ramon Ramirez bunt grounded into a fielder\'s choice, catcher to short. Runner on first with one out and Jerry Hairston Jr. due up.','out',NULL,NULL,1,NULL,NULL,NULL),
(396,814,'double',NULL,NULL,NULL,NULL,'Brian Giles doubled to right center. Runner on second with none out and Adrian Gonzalez due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(397,816,'out','throw-out','4-3',NULL,NULL,'Curtis Granderson grounded out second to first.  None on with two outs and Placido Polanco due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(398,818,'single',NULL,NULL,NULL,NULL,'Justin Morneau singled to right center. Runner on first with one out and Jason Kubel due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(399,820,'single',NULL,NULL,NULL,NULL,'Josh Hamilton singled to right. Runners on first and second with one out and Milton Bradley due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(400,822,'out','throw-out','5-3',NULL,NULL,'Placido Polanco grounded out third to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(401,825,'out','strikeout',NULL,NULL,NULL,'Nate McLouth struck out swinging.  None on with one out and Ryan Doumit due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(402,827,'home-run',NULL,NULL,NULL,NULL,'Jerry Hairston Jr. one-out, two-run Home Run (4) to left scoring Ramon Ramirez. Wilkin Castillo due up.','home',NULL,NULL,NULL,2,2,'1'),
(403,829,'out','fielders-choice','6-4',NULL,NULL,'Matt Holliday grounded into a fielder\'s choice, short to second. Runner on first with two outs and Brad Hawpe due up.','out',NULL,NULL,1,NULL,NULL,NULL),
(404,831,'walk',NULL,NULL,NULL,NULL,'Jose Reyes walked. Runner on first with one out and Luis Castillo due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(405,833,'out','throw-out','6-3',NULL,NULL,'Jim Thome grounded out short to first.  None on with one out and Paul Konerko due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(406,835,'out','fly-ball','6',NULL,NULL,'Cody Ross popped out to short.  None on with one out and Alfredo Amezaga due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(407,837,'double',NULL,NULL,NULL,NULL,'Jason Varitek doubled to left. Runner on second with none out and Jacoby Ellsbury due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(408,839,'out','double-play','4-6-3',NULL,NULL,'Jason Kubel grounded into a double play, second to short to first to end the inning.','out',NULL,NULL,2,NULL,NULL,NULL),
(409,841,'out','throw-out','5-3',NULL,NULL,'Ryan Doumit grounded out third to first.  None on with two outs and Adam LaRoche due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(410,843,'out','fly-ball','7',NULL,NULL,'Paul Konerko flied out to left.  None on with two outs and AJ Pierzynski due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(411,845,'out','strikeout',NULL,NULL,NULL,'Wilkin Castillo struck out swinging.  None on with two outs and Joey Votto due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(412,848,'single',NULL,NULL,NULL,NULL,'Brad Hawpe singled to left. Runners on first and third with two outs and Garrett Atkins due up.','3',NULL,NULL,NULL,NULL,NULL,NULL),
(413,850,'out','throw-out','3',NULL,NULL,'AJ Pierzynski grounded out to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(414,852,'walk',NULL,NULL,NULL,NULL,'Jason Giambi walked. Runner on first with none out and Xavier Nady due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(415,854,'out','strikeout',NULL,NULL,NULL,'Milton Bradley struck out swinging. Runners on first and second with two outs and Marlon Byrd due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(416,856,'out','throw-out','4-3',NULL,NULL,'Alfredo Amezaga grounded out second to first.  None on with two outs and Josh Johnson due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(417,858,'single',NULL,NULL,NULL,NULL,'Adrian Gonzalez singled to right scoring Brian Giles with none out. Runner on first with none out and Kevin Kouzmanoff due up.',NULL,'home',NULL,NULL,1,1,'1'),
(418,860,'out','fly-ball','9',NULL,NULL,'Asdrubal Cabrera flied out to right.  None on with one out and Grady Sizemore due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(419,862,'out','throw-out','3',NULL,NULL,'Joey Votto grounded out to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(420,864,'single',NULL,NULL,NULL,NULL,'Jacoby Ellsbury bunt single to pitcher. Runners on first and third with none out and Dustin Pedroia due up.',NULL,'3',NULL,NULL,NULL,NULL,NULL),
(421,866,'out','strikeout',NULL,NULL,NULL,'Josh Johnson struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(422,868,'home-run',NULL,NULL,NULL,NULL,'Adam LaRoche two-out, solo Home Run (23) to center. Steve Pearce due up.',NULL,NULL,NULL,NULL,1,1,'1'),
(423,870,'single',NULL,NULL,NULL,NULL,'Garrett Atkins singled to center scoring Matt Holliday. Runners on first and third with two outs and Ian Stewart due up.','3',NULL,'home',NULL,1,1,'1'),
(424,872,'home-run',NULL,NULL,NULL,NULL,'Kevin Kouzmanoff none-out, two-run Home Run (22) to left center scored Adrian Gonzalez. Chase Headley due up.','home',NULL,NULL,NULL,2,2,'1'),
(425,874,'out','throw-out','4-3',NULL,NULL,'Luis Castillo grounded out second to first. Runner on second with one out and David Wright due up.','2',NULL,NULL,1,NULL,NULL,NULL),
(426,876,'stolen-base',NULL,'-1',NULL,NULL,'Jose Reyes stole third.  Runner on third with two outs and David Wright at the plate.',NULL,'3',NULL,NULL,NULL,NULL,NULL),
(427,878,'out','fly-ball','9',NULL,NULL,'Ian Stewart flied out to right to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(428,880,'out','pick-off','-3-4',NULL,NULL,'Jacoby Ellsbury picked off at first.  Runner on third with one out and Dustin Pedroia at the plate.','out',NULL,NULL,1,NULL,NULL,NULL),
(429,882,'double',NULL,NULL,NULL,NULL,'David Wright doubled to right scoring Jose Reyes with one out. Runner on second and Carlos Beltran due up.',NULL,NULL,'home',NULL,1,1,'1'),
(430,884,'walk',NULL,NULL,NULL,NULL,'Eric Hinske walked. Runner on first with none out and Fernando Perez due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(431,886,'single',NULL,NULL,NULL,NULL,'Xavier Nady singled to left. Runners on first and second with none out and Robinson Cano due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(432,888,'out','throw-out','4-3',NULL,NULL,'Ryan Shealy grounded out second to first.  None on with one out and Mark Teahen due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(433,890,'double',NULL,NULL,NULL,NULL,'Carlos Beltran doubled to left scoring David Wright with one out. Runner on second and Carlos Delgado due up.',NULL,'home',NULL,NULL,1,1,'1'),
(434,892,'single',NULL,NULL,NULL,NULL,'Steve Pearce singled to center. Runner on first with two outs and Andy LaRoche due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(435,894,'out','strikeout',NULL,NULL,NULL,'Chase Headley struck out swinging.  None on with one out and Nick Hundley due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(436,896,'out',NULL,NULL,NULL,NULL,'Dustin Pedroia grounded into a fielder\'s choice. Runners on first and third with one out and David Ortiz due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(437,898,'single',NULL,NULL,NULL,NULL,'Mark Teahen singled to center. Runner on first with one out and Billy Butler due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(438,900,'home-run',NULL,NULL,NULL,NULL,'Grady Sizemore one-out, solo Home Run (33) to center. David Dellucci due up.',NULL,NULL,NULL,NULL,1,1,'1'),
(439,902,'single',NULL,NULL,NULL,NULL,'Carlos Delgado singled to right scoring Carlos Beltran with one out. Runner on first and Ramon Castro due up.',NULL,'home',NULL,NULL,1,1,'1'),
(440,904,'walk',NULL,NULL,NULL,NULL,'Craig Counsell walked. Runner on first with none out and Jason Kendall due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(441,906,'out','strikeout',NULL,NULL,NULL,'Fernando Perez struck out swinging. Runner on first with one out and Akinori Iwamura due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(442,908,'out','double-play','3',NULL,NULL,'Robinson Cano lined into a double play to first. Xavier Nady doubled off first. Runner on second with two outs and Ivan Rodriguez due up.','out',NULL,NULL,2,NULL,NULL,NULL),
(443,911,'out','fly-ball','9',NULL,NULL,'Ryan Church flied out to right to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(444,913,'hit-by-pitch',NULL,NULL,NULL,NULL,'Jason Kendall was hit-by-pitch. Runners on first and second with none out and Manny Parra due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(445,915,'out','line-out','5',NULL,NULL,'Billy Butler lined out to third. Runner on first with two outs and Alberto Callaspo due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(446,917,'single',NULL,NULL,NULL,NULL,'Chase Utley singled to center. Runner on first with none out and Jayson Werth due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(447,919,'out','strikeout',NULL,NULL,NULL,'David Ortiz struck out swinging. Runners on first and third with two outs and Kevin Youkilis due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(448,921,'out','throw-out','4-3',NULL,NULL,'David Dellucci grounded out second to first.  None on with two outs and Shin-Soo Choo due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(449,923,'out','strikeout',NULL,NULL,NULL,'Adam Dunn struck out swinging. None on with one out and Justin Upton due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(450,925,'out','line-out','3',NULL,NULL,'Ivan Rodriguez lined out to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(451,927,'out','strikeout',NULL,NULL,NULL,'Marlon Byrd struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(452,929,'single',NULL,'5',NULL,NULL,'Nick Hundley reached first on Ryan Zimmerman\'s fielding error. Runner on first with one out and Sean Kazmar due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(453,931,'single',NULL,NULL,NULL,NULL,'Shin-Soo Choo singled to left. Runner on first with two outs and Jhonny Peralta due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(454,933,'out','fly-ball','8',NULL,NULL,'Sean Kazmar flied out to center. Runner on first with two outs and Dirk Hayhurst due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(455,935,'single',NULL,NULL,NULL,NULL,'Justin Upton infield single to short. Runner on first with one out and Mark Reynolds due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(456,937,'out','strikeout',NULL,NULL,NULL,'Andy LaRoche struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(457,939,'out','strikeout',NULL,NULL,NULL,'Dirk Hayhurst struck out looking to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(458,941,'double',NULL,NULL,NULL,NULL,'Jo-Jo Reyes doubled to left. Runner on second with none out and Martin Prado due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(459,943,'out','fly-ball','3',NULL,NULL,'Alberto Callaspo popped out to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(460,945,'out','double-play','4-6-3',NULL,NULL,'Manny Parra grounded into a double play, second to short to first. Runner on third with two outs and Mike Cameron due up.','out','3',NULL,2,NULL,NULL,NULL),
(461,947,'out','strikeout',NULL,NULL,NULL,'Jayson Werth struck out swinging. Runner on first with one out and Ryan Howard due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(462,949,'out','fly-ball','8',NULL,NULL,'Mark Reynolds flied out to center. Runner on first with two outs and Chris Snyder due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(463,951,'double',NULL,NULL,NULL,NULL,'Juan Castro doubled to left. Runner on second with none out and Brian Roberts due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(464,953,'out','strikeout',NULL,NULL,NULL,'Mike Napoli struck out swinging.  None on with one out and Sean Rodriguez due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(465,955,'walk',NULL,NULL,NULL,NULL,'Akinori Iwamura walked. Runners on first and second with one out and Jason Bartlett due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(466,957,'single',NULL,NULL,NULL,NULL,'Kevin Youkilis single to center scored Jason Varitek with two out. Runners on first and third with two outs and Sean Casey due up.','3',NULL,'home',NULL,1,1,'1'),
(467,959,'out','throw-out','4-3',NULL,NULL,'Martin Prado grounded out second to first. Runner on third with one out and Kelly Johnson due up.',NULL,'3',NULL,1,NULL,NULL,NULL),
(468,961,'walk',NULL,NULL,NULL,NULL,'Alexei Ramirez walked. Runner on first with none out and Nick Swisher due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(469,963,'out','strikeout',NULL,NULL,NULL,'Chris Snyder struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(470,965,'single',NULL,NULL,NULL,NULL,'Mike Cameron singled to left scoring Craig Counsell with two out. Runner on first with Bill Hall due up.',NULL,NULL,'home',NULL,1,1,'1'),
(471,967,'out','strikeout',NULL,NULL,NULL,'Jhonny Peralta struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(472,969,'out','strikeout',NULL,NULL,NULL,'Jason Bartlett struck out swinging. Runners on first and second and with two outs and Carlos Pena due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(473,971,'double',NULL,NULL,NULL,NULL,'Lastings Milledge doubled to left on fan interference. Runner on second with none out and Elijah Dukes due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(474,973,'double',NULL,NULL,NULL,NULL,'Sean Casey double to right scored Dustin Pedroia and Kevin Youkilis with two out. Runner on second with two outs and Jason Bay due up.','home',NULL,'home',NULL,2,2,'2'),
(475,975,'single',NULL,NULL,NULL,NULL,'Randy Wolf singled to center. Runner on first with none out and Kazuo Matsui due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(476,977,'out','fly-ball','7',NULL,NULL,'Nick Swisher flied out to left. Runner on first with one out and Juan Uribe due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(477,979,'double',NULL,'5',NULL,NULL,'Sean Rodriguez infield single to third, advances to second on Chris Davis\'s throwing error. Runner on second with one out and Erick Aybar due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(478,981,'home-run',NULL,NULL,NULL,NULL,'Ryan Howard one-out, two-run Home Run (46) to right scored Chase Utley. Pat Burrell due up.','home',NULL,NULL,NULL,2,2,NULL),
(479,983,'single',NULL,NULL,NULL,NULL,'Magglio Ordonez singled to right. Runner on first with none out and Miguel Cabrera due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(480,985,'out','throw-out','5-3',NULL,NULL,'Jason Bay grounded out third to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(481,987,'walk',NULL,NULL,NULL,NULL,'Kelly Johnson walked. Runners on first and third with one out and Chipper Jones due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(482,989,'out','sacrifice-bunt','-3',NULL,NULL,'Brian Roberts sacrifice bunt to pitcher. Runner on third with one out and Nick Markakis due up.',NULL,'3',NULL,1,NULL,NULL,NULL),
(483,991,'out','throw-out','6-3',NULL,NULL,'Pat Burrell grounded out short to first.  None on with two outs and Shane Victorino due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(484,993,'out','strikeout',NULL,NULL,NULL,'Bill Hall struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(485,995,'out','double-play','1-6-3',NULL,NULL,'Kazuo Matsui bunt ground into a double play, catcher to short to first.  None on with two outs and Michael Bourn due up.','out',NULL,NULL,2,NULL,NULL,NULL),
(486,997,'double',NULL,NULL,NULL,NULL,'Erick Aybar doubled to left scoring Sean Rodriguez. Runner on second with one out and Garret Anderson due up.',NULL,'home',NULL,NULL,1,1,'1'),
(487,999,'out','strikeout',NULL,NULL,NULL,'Elijah Dukes struck out swinging. Runner on second with one out and Kory Casto due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(488,1001,'out','throw-out','4-3',NULL,NULL,'Nick Markakis grounded out second to first. Runner on third with two outs and Melvin Mora due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(489,1003,'single',NULL,NULL,NULL,NULL,'Michael Bourn singled to right. Runner on first with two outs and Miguel Tejada due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(490,1005,'out','throw-out','4-3',NULL,NULL,'Melvin Mora grounded out second to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(491,1007,'home-run',NULL,NULL,NULL,NULL,'Miguel Cabrera none-out, two-run Home Run 2 (36) to center scoring Magglio Ordonez. Matt Joyce due up.','home',NULL,NULL,NULL,2,2,'1'),
(492,1009,'single',NULL,NULL,NULL,NULL,'Kory Casto singled to right. Runners on first and third with one out and Luke Montz due up.',NULL,'3',NULL,NULL,NULL,NULL,NULL),
(493,1011,'home-run',NULL,NULL,NULL,NULL,'Chris Iannetta lead-off Home Run (18) to right. Clint Barmes due up.',NULL,NULL,NULL,NULL,1,1,NULL),
(494,1013,'out','strikeout',NULL,NULL,NULL,'Shane Victorino struck out looking to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(495,1015,'out','caught-stealing','1-4-',NULL,NULL,'Michael Bourn caught stealing second to end the inning.','out',NULL,NULL,1,NULL,NULL,NULL),
(496,1017,'out','fly-ball','7',NULL,NULL,'Clint Barmes flied out to left. None on with one out and Jorge De La Rosa due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(497,1019,'out','fly-ball','7',NULL,NULL,'Juan Uribe flied out to left. Runner on first with two outs and Orlando Cabrera due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(498,1021,'double',NULL,NULL,NULL,NULL,'Garret Anderson doubled to center scoring Erick Aybar. Runner on second with one out and Mark Teixeira due up.',NULL,'home',NULL,NULL,1,1,'1'),
(499,1023,'single',NULL,NULL,NULL,NULL,'Jorge De La Rosa singled to center. Runner on first with one out and Willy Taveras due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(500,1025,'out','line-out','5',NULL,NULL,'Mark Teixeira lined out to third. Runner on second with two outs and Torii Hunter due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(501,1027,'out','fly-ball','9',NULL,NULL,'Chipper Jones flied out to right. Runners on first and third with two outs and Omar Infante due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(502,1029,'walk',NULL,NULL,NULL,NULL,'Luke Montz walked. Bases loaded with one out and Roger Bernadina due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(503,1031,'out','throw-out','6-3',NULL,NULL,'Matt Joyce grounded out short to first.  None on with one out and Gary Sheffield due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(504,1033,'home-run',NULL,NULL,NULL,NULL,'Jolbert Cabrera lead-off Home Run (3) to left. Jay Bruce due up.',NULL,NULL,NULL,NULL,1,1,'1'),
(505,1035,'out','strikeout',NULL,NULL,NULL,'Travis Snider struck out swinging.  None on with one out and Joe Inglett due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(506,1037,'out','double-play','5-4-3',NULL,NULL,'Willy Taveras grounded into a double play, third to second to first, to end the inning.','out',NULL,NULL,2,NULL,NULL,NULL),
(507,1039,'walk',NULL,NULL,NULL,NULL,'Torii Hunter intentionally walked. Runners on first and second with two outs and Gary Matthews due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(508,1041,'single',NULL,NULL,NULL,NULL,'Joe Inglett singled to center. Runner on first with one out and Marco Scutaro due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(509,1043,'single','throw-out','9-4-1',NULL,NULL,'Orlando Cabrera singled to right.  On the play, Alexei Ramirez was thrown out attempting to score to end the inning.','out',NULL,NULL,1,NULL,NULL,NULL),
(510,1045,'out','fly-ball','4',NULL,NULL,'Luis Cruz popped out to second.  None on with one out and Ian Snell due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(511,1047,'out','fly-ball','9',NULL,NULL,'Gary Matthews flied out to right to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(512,1049,'hit-by-pitch',NULL,NULL,NULL,NULL,'Gary Sheffield was hit-by-pitch. Runner on first with one out and Brandon Inge due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(513,1051,'out','throw-out','3',NULL,NULL,'Jay Bruce grounded out to first.  None on with one out and Adam Rosales due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(514,1053,'home-run',NULL,NULL,NULL,NULL,'Carlos Pena two-out, three-run Home Run (31) to right center scoring Eric Hinske and Akinori Iwamura. Evan Longoria due up.','home','home',NULL,NULL,3,3,'3'),
(515,1055,'single',NULL,NULL,NULL,NULL,'Cameron Maybin singled to right. Runner on first with none out and John Baker due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(516,1057,'out','fly-ball','8',NULL,NULL,'Brett Gardner flied out to center.  None on with one out and Johnny Damon due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(517,1059,'out','foul-out','3',NULL,NULL,'Adam Rosales fouled out to first.  None on with two outs and Corey Patterson due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(518,1061,'double',NULL,NULL,NULL,NULL,'Omar Infante doubled to right scoring Jo-Jo Reyes with two out. Runners on second and third and Casey Kotchman due up.','3',NULL,'home',NULL,1,1,'1'),
(519,1063,'out','strikeout',NULL,NULL,NULL,'Roger Bernadina struck out swinging. Bases loaded with two outs and Collin Balester due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(520,1065,'single',NULL,NULL,NULL,NULL,'Corey Patterson singled to left. Runner on first with two outs and Ryan Hanigan due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(521,1067,'double',NULL,NULL,NULL,NULL,'Marco Scutaro double to left center scored Joe Inglett with one out. Runner on second with one out and Alex Rios due up.','home',NULL,NULL,NULL,1,1,'1'),
(522,1069,'single',NULL,NULL,NULL,NULL,'Johnny Damon singled to right. Runner on first with one out and Derek Jeter due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(523,1071,'out','strikeout',NULL,NULL,NULL,'Ian Snell struck out swinging.  None on with two outs and Nyjer Morgan due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(524,1073,'out','strikeout',NULL,NULL,NULL,'John Buck struck out looking.  None on with one out and Mitch Maier due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(525,1075,'out','fly-ball','9',NULL,NULL,'Hank Blalock flied out to right.  None on with one out and Nelson Cruz due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(526,1077,'stolen-base',NULL,'-1',NULL,NULL,'Cameron Maybin stole second.  Runner on second with none out and John Baker at the plate.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(527,1079,'out','throw-out','6-3',NULL,NULL,'Casey Kotchman grounded out short to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(528,1081,'out','foul-out','5',NULL,NULL,'Alex Rios fouled out to third. Runner on second with two outs and Vernon Wells due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(529,1083,'out','line-out','4',NULL,NULL,'Evan Longoria lined out to second to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(530,1085,'out','fly-ball','4',NULL,NULL,'David Eckstein popped out to second. None on with one out and Max Scherzer due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(531,1088,'stolen-base',NULL,'-1',NULL,NULL,'Johnny Damon stole second.  Runner on second with one out and Derek Jeter at the plate.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(532,1090,'walk',NULL,NULL,NULL,NULL,'John Baker walked. Runners on first and second with none out and Jorge Cantu due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(533,1092,'out','fly-ball','9',NULL,NULL,'Mitch Maier flied out to right.  None on with two outs and David DeJesus due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(534,1094,'single',NULL,NULL,NULL,NULL,'Derek Jeter singled to right. Runners on first and third with one out and Bobby Abreu due up.',NULL,'3',NULL,NULL,NULL,NULL,NULL),
(535,1096,'out','strikeout',NULL,NULL,NULL,'Max Scherzer struck out swinging. None on with two outs and Stephen Drew due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(536,1098,'out','throw-out','-3',NULL,NULL,'David DeJesus grounded out pitcher to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(537,1100,'out','fly-ball','9',NULL,NULL,'Ryan Hanigan flied out to right to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(538,1102,'out','fly-ball','8',NULL,NULL,'Stephen Drew flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(539,1104,'out',NULL,'1-3',NULL,NULL,'Nyjer Morgan out on batter\'s intereference to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(540,1106,'out','strikeout',NULL,NULL,NULL,'Nelson Cruz struck out looking.  None on with two outs and Gerald Laird due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(541,1108,'single',NULL,NULL,NULL,NULL,'Delmon Young singled to center. Runner on first with none out and Matt Tolbert due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(542,1110,'out','foul-out','5',NULL,NULL,'Bobby Abreu fouled out to third. Runners on first and third with two outs and Alex Rodriguez due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(543,1112,'home-run',NULL,NULL,NULL,NULL,'Nick Evans lead-off Home Run (2) to center. Oliver Perez due up.',NULL,NULL,NULL,NULL,1,1,'1'),
(544,1114,'single',NULL,NULL,NULL,NULL,'Collin Balester singled to second scoring Lastings Milledge with two outs. Bases loaded with two outs and Emilio Bonifacio due up.','2','3','home',NULL,1,1,NULL),
(545,1116,'double',NULL,NULL,NULL,NULL,'Jorge Cantu doubled to left scoring Cameron Maybin with none out. Runners on second and third and Mike Jacobs due up.','3','home',NULL,NULL,1,1,'1'),
(546,1118,'out','throw-out','4-3',NULL,NULL,'Dewayne Wise grounded out second to first.  None on with one out and Jermaine Dye due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(547,1120,'out','throw-out','4-3',NULL,NULL,'Oliver Perez grounded out second to first.  None on with one out and Jose Reyes due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(548,1122,'out','fly-ball','9',NULL,NULL,'Gerald Laird flied out to right to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(549,1124,'out','strikeout',NULL,NULL,NULL,'Troy Tulowitzki struck out looking. None on with one out and Matt Holliday due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(550,1126,'double',NULL,NULL,NULL,NULL,'Jermaine Dye doubled to left. Runner on second with one out and Jim Thome due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(551,1128,'walk',NULL,NULL,NULL,NULL,'Mike Jacobs was intentionally walked. Bases loaded with none out and Dan Uggla due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(552,1130,'single',NULL,NULL,NULL,NULL,'Jose Reyes singled to right. Runner on first with one out and Luis Castillo due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(553,1132,'out','strikeout',NULL,NULL,NULL,'Miguel Tejada struck out swinging.  None on with one out and Lance Berkman due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(554,1134,'error-wild-pitch',NULL,NULL,NULL,NULL,'Radhames Liz wild pitch scored Johnny Damon with two out. Derek Jeter advanced to second. Runner on second and Alex Rodriguez at the plate.','2',NULL,'home',NULL,1,1,'1'),
(555,1136,'single',NULL,NULL,NULL,NULL,'Ryan Braun singled to right. Runner on first with none out and Prince Fielder due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(556,1138,'out','double-play','4-3',NULL,NULL,'Matt Tolbert lined into a double play, second to first.  None on with two outs and Nick Punto due up.','out',NULL,NULL,2,NULL,NULL,NULL),
(557,1140,'hit-by-pitch',NULL,NULL,NULL,NULL,'NOTE: Detroit Tigers designated hitter Gary Sheffield ejected by 2B umpire Jerry Layne for charging the mound.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(558,1142,'out','throw-out','5',NULL,NULL,'Vernon Wells grounded out to third to end the inning. On the play runner on second tagged out trying to advance to third.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(559,1144,'out','strikeout',NULL,NULL,NULL,'Matt Holliday struck out swinging. None on with two outs and Brad Hawpe due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(560,1146,'out','fly-ball','7',NULL,NULL,'Lance Berkman flied out to left.  None on with two outs and Geoff Blum due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(561,1148,'out','fly-ball','8',NULL,NULL,'Geoff Blum flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(562,1150,'walk',NULL,NULL,NULL,NULL,'Alex Rodriguez walked. Runners on first and second with two outs and Jason Giambi due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(563,1152,'single',NULL,NULL,NULL,NULL,'Prince Fielder singled to right. Runners on first and second with none out and J.J. Hardy due up.','2',NULL,NULL,NULL,NULL,NULL,NULL),
(564,1154,'out','strikeout',NULL,NULL,NULL,'Nick Punto struck out swinging to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(565,1156,'single',NULL,NULL,NULL,NULL,'Dan Uggla singled to left scoring John Baker with none out. Bases loaded and Luis Gonzalez due up.','2','3','home',NULL,1,1,'1'),
(566,1158,'single',NULL,NULL,NULL,NULL,'Jim Thome singled to second. Runners on first and third with one out and Paul Konerko due up.',NULL,'3',NULL,NULL,NULL,NULL,NULL),
(567,1160,'out','throw-out','4-3',NULL,NULL,'Mark Kotsay grounded out second to first.  None on with one out and Jed Lowrie due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(568,1162,'out','fly-ball','3',NULL,NULL,'J.J. Hardy popped out to first. Runners on first and second with one out and Corey Hart due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(569,1164,'out','double-play','6-3',NULL,NULL,'Luis Castillo grounded into a double play, short to first to end the inning.','out',NULL,NULL,2,NULL,NULL,NULL),
(570,1166,'out','throw-out','4-3',NULL,NULL,'Robb Quinlan grounded out second to first.  None on with one out and Kendry Morales due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(571,1168,'walk',NULL,NULL,NULL,NULL,'Emilio Bonifacio walked, scoring Kory Casto with two outs. Bases loaded with two outs and Cristian Guzman due up.','2','3','home',NULL,1,1,NULL),
(572,1170,'out','throw-out','3',NULL,NULL,'Jason Giambi grounded out to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(573,1172,'out','fielders-choice','6-4',NULL,NULL,'Luis Gonzalez grounded into a fielder\'s choice, short to second scoring Jorge Cantu with one out. Runners on first and third and Cody Ross due up.','out','3','home',1,1,1,NULL),
(574,1174,'single',NULL,'3',NULL,NULL,'Brad Hawpe reached first on Adam Dunn\'s fielding error. Runner on first with two outs and Garrett Atkins due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(575,1176,'out','throw-out','-3',NULL,NULL,'Garrett Atkins grounded out pitcher to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(576,1178,'single',NULL,NULL,NULL,NULL,'Corey Hart singled to center scoring Ryan Braun with one out. Runners on first and second with Craig Counsell due up.','2','home',NULL,NULL,1,1,'1'),
(577,1180,'out','line-out','8',NULL,NULL,'Freddy Sanchez lined out to center.  None on with one out and Nate McLouth due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(578,1182,'out','foul-out','5',NULL,NULL,'Paul Konerko fouled out to third. Runners on first and third with two outs and AJ Pierzynski due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(579,1184,'double',NULL,NULL,NULL,NULL,'Jed Lowrie doubled to left. Runner on second with one out and Jason Varitek due up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(580,1186,'out','throw-out','3',NULL,NULL,'Nate McLouth grounded out to first.  None on with two outs and Ryan Doumit due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(581,1188,'out','strikeout',NULL,NULL,NULL,'Aubrey Huff struck out swinging.  None on with one out and Luke Scott due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(582,1190,'out','throw-out','4-3',NULL,NULL,'Cliff Floyd grounded out second to first.  None on with one out and Dioner Navarro due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(583,1192,'home-run',NULL,NULL,NULL,NULL,'Kendry Morales one-out, solo Home Run (3) to center. Mike Napoli due up.',NULL,NULL,NULL,NULL,1,1,'1'),
(584,1194,'out','fly-ball','8',NULL,NULL,'Cristian Guzman flied out to center to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(585,1196,'out','fly-ball','8',NULL,NULL,'Craig Counsell flied out to center. Runners on first and second with two outs and Jason Kendall due up.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(586,1199,'out','throw-out','4-3',NULL,NULL,'Jason Varitek grounded out second to first. Runner on third with two outs and Jacoby Ellsbury due up.',NULL,'3',NULL,1,NULL,NULL,NULL),
(587,1201,'home-run',NULL,NULL,NULL,NULL,'Mike Napoli one-out, solo Home Run (18) to left. Sean Rodriguez due up.',NULL,NULL,NULL,NULL,1,1,'1'),
(588,1204,'out','foul-out','3',NULL,NULL,'Jason Kendall fouled out to first to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(589,1206,'out','fly-ball','6',NULL,NULL,'Ryan Doumit popped out to short to end the inning.',NULL,NULL,NULL,1,NULL,NULL,NULL),
(590,1209,'out','throw-out','6-3',NULL,NULL,'Chris Young grounded out short to first. None on with one out and Conor Jackson due up.',NULL,NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `baseball_action_plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseball_action_substitutions`
--

DROP TABLE IF EXISTS `baseball_action_substitutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_action_substitutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseball_event_state_id` int(11) NOT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `person_type` varchar(100) DEFAULT NULL,
  `person_original_id` int(11) DEFAULT NULL,
  `person_original_position_id` int(11) DEFAULT NULL,
  `person_original_lineup_slot` int(11) DEFAULT NULL,
  `person_replacing_id` int(11) DEFAULT NULL,
  `person_replacing_position_id` int(11) DEFAULT NULL,
  `person_replacing_lineup_slot` int(11) DEFAULT NULL,
  `substitution_reason` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bas_act_sub_per_rep_pos_id__pos_id` (`person_replacing_position_id`),
  KEY `FK_bas_act_sub_per_ori_pos_id__pos_id` (`person_original_position_id`),
  KEY `FK_bas_act_sub_bas_eve_sta_id__bas_eve_sta_id` (`baseball_event_state_id`),
  KEY `FK_bas_act_sub_per_rep_id__per_id` (`person_replacing_id`),
  KEY `FK_bas_act_sub_per_ori_id__per_id` (`person_original_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseball_action_substitutions`
--

LOCK TABLES `baseball_action_substitutions` WRITE;
/*!40000 ALTER TABLE `baseball_action_substitutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseball_action_substitutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseball_defensive_group`
--

DROP TABLE IF EXISTS `baseball_defensive_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_defensive_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseball_defensive_group`
--

LOCK TABLES `baseball_defensive_group` WRITE;
/*!40000 ALTER TABLE `baseball_defensive_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseball_defensive_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseball_defensive_players`
--

DROP TABLE IF EXISTS `baseball_defensive_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_defensive_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseball_defensive_group_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bas_def_pla_bas_def_gro_id__bas_def_gro_id` (`baseball_defensive_group_id`),
  KEY `FK_bas_def_pla_pla_id__per_id` (`player_id`),
  KEY `FK_bas_def_pla_pos_id__pos_id` (`position_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseball_defensive_players`
--

LOCK TABLES `baseball_defensive_players` WRITE;
/*!40000 ALTER TABLE `baseball_defensive_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseball_defensive_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseball_defensive_stats`
--

DROP TABLE IF EXISTS `baseball_defensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_defensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `double_plays` int(11) DEFAULT NULL,
  `triple_plays` int(11) DEFAULT NULL,
  `putouts` int(11) DEFAULT NULL,
  `assists` int(11) DEFAULT NULL,
  `errors` int(11) DEFAULT NULL,
  `fielding_percentage` float DEFAULT NULL,
  `defensive_average` float DEFAULT NULL,
  `errors_passed_ball` int(11) DEFAULT NULL,
  `errors_catchers_interference` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8054 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseball_defensive_stats`
--

LOCK TABLES `baseball_defensive_stats` WRITE;
/*!40000 ALTER TABLE `baseball_defensive_stats` DISABLE KEYS */;
INSERT INTO `baseball_defensive_stats` VALUES
(1,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(2,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(3,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(4,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(5,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(6,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(7,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(8,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(9,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(10,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(11,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(12,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(13,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(14,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(15,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(16,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(17,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(18,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(19,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(20,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(21,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(22,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(23,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(24,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(25,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(26,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(27,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(28,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(29,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(30,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(31,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(32,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(33,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(34,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(35,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(36,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(37,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(38,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(39,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(40,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(41,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(42,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(43,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(44,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(45,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(46,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(47,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(48,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(49,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(50,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(51,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL),
(52,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(53,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(54,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(55,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(56,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(57,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(58,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(59,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(60,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(61,NULL,NULL,NULL,NULL,0,NULL,NULL,1,NULL),
(62,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(63,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(64,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(65,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(66,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(67,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(68,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(69,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(70,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(71,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(72,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(73,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(74,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(75,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(76,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(77,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(78,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(79,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(80,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(81,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(82,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(83,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(84,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(85,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(86,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(87,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(88,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(89,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(90,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(91,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(92,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(93,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(94,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(95,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(96,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(97,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(98,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(99,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(100,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(101,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(102,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(103,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(104,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(105,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(106,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(107,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(108,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(109,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(110,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(111,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(112,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(113,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(114,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(115,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(116,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(117,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(118,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(119,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(120,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(121,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(122,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(123,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(124,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(125,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(126,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(127,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(128,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(129,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(130,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(131,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(132,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(133,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(134,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(135,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(136,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(137,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(138,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(139,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(140,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(141,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(142,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(143,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(144,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(145,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(146,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(147,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(148,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(149,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(150,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(151,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(152,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(153,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(154,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(155,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(156,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(157,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(158,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(159,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(160,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(161,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(162,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(163,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(164,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(165,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(166,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(167,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(168,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(169,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(170,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(171,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(172,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(173,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(174,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(175,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(176,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(177,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(178,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(179,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(180,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(181,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(182,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(183,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(184,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(185,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(186,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(187,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(188,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(189,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(190,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(191,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(192,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(193,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(194,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(195,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(196,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(197,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(198,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(199,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(200,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(201,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(202,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(203,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(204,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(205,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(206,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(207,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(208,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(209,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(210,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(211,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(212,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(213,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(214,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(215,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(216,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(217,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(218,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(219,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(220,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(221,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(222,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(223,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(224,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(225,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(226,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(227,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(228,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(229,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(230,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(231,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(232,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(233,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(234,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(235,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(236,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(237,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(238,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(239,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(240,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(241,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(242,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(243,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(244,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(245,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(246,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(247,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(248,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(249,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(250,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(251,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(252,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(253,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(254,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(255,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(256,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(257,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(258,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(259,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(260,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(261,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(262,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(263,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(264,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(265,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(266,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(267,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(268,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(269,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(270,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(271,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(272,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(273,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(274,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(275,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(276,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(277,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(278,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(279,NULL,NULL,NULL,NULL,2,NULL,NULL,0,NULL),
(280,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(281,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(282,NULL,NULL,NULL,NULL,2,NULL,NULL,0,NULL),
(283,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(284,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(285,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(286,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(287,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(288,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(289,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(290,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(291,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(292,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(293,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(294,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(295,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(296,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(297,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(298,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(299,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(300,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(301,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(302,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(303,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(304,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(305,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(306,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(307,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(308,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(309,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(310,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(311,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(312,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(313,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(314,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(315,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(316,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(317,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(318,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(319,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(320,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(321,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(322,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(323,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(324,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(325,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(326,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(327,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(328,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(329,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(330,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(331,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(332,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(333,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(334,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(335,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(336,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(337,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(338,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(339,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(340,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(341,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(342,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(343,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(344,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(345,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(346,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(347,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(348,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(349,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(350,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(351,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(352,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(353,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(354,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(355,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(356,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(357,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(358,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(359,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(360,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(361,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(362,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(363,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(364,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL),
(365,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(366,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(367,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(368,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(369,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(370,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(371,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(372,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(373,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(374,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(375,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(376,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(377,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(378,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(379,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(380,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(381,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(382,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(383,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(384,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),
(385,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(386,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
(387,0,0,3,0,0,NULL,NULL,0,0),
(388,0,0,3,3,0,NULL,NULL,0,0),
(389,0,0,1,0,0,NULL,NULL,0,0),
(390,0,0,0,3,0,NULL,NULL,0,0),
(391,0,0,8,0,0,NULL,NULL,0,0),
(392,0,0,2,0,0,NULL,NULL,0,0),
(393,0,0,1,0,0,NULL,NULL,0,0),
(394,0,0,0,1,0,NULL,NULL,0,0),
(395,0,0,0,1,0,NULL,NULL,0,0),
(396,0,0,0,2,0,NULL,NULL,0,0),
(397,0,0,1,3,0,NULL,NULL,0,0),
(398,0,0,1,1,0,NULL,NULL,0,0),
(399,1,0,12,0,0,NULL,NULL,0,0),
(400,0,0,2,0,0,NULL,NULL,0,0),
(401,0,0,2,0,0,NULL,NULL,0,0),
(402,1,0,4,4,0,NULL,NULL,0,0),
(403,0,0,0,0,1,NULL,NULL,0,0),
(2240,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
(2241,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(2258,0,0,2,0,0,NULL,NULL,0,0),
(2255,0,0,3,1,0,NULL,NULL,0,0),
(2262,0,0,1,0,0,NULL,NULL,0,0),
(2246,1,0,0,3,0,NULL,NULL,0,0),
(2245,0,0,1,1,0,NULL,NULL,0,0),
(2243,0,0,4,1,0,NULL,NULL,0,0),
(2249,0,0,1,1,0,NULL,NULL,0,0),
(2252,0,0,2,0,0,NULL,NULL,0,0),
(2253,0,0,0,1,0,NULL,NULL,0,0),
(2260,0,0,1,0,0,NULL,NULL,0,0),
(2247,0,0,0,0,1,NULL,NULL,0,0),
(2263,0,0,0,1,0,NULL,NULL,0,0),
(2261,1,0,2,4,0,NULL,NULL,0,0),
(2251,1,0,5,0,0,NULL,NULL,0,0),
(2256,1,0,5,0,0,NULL,NULL,0,0),
(2259,0,0,2,0,0,NULL,NULL,0,0),
(2244,0,0,0,1,0,NULL,NULL,0,0),
(2242,0,0,1,0,0,NULL,NULL,0,0),
(2257,1,0,0,2,0,NULL,NULL,0,0),
(2250,0,0,0,2,0,NULL,NULL,0,0),
(2248,1,0,1,0,0,NULL,NULL,0,0),
(2254,0,0,0,1,0,NULL,NULL,0,0),
(7491,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7492,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7503,1,0,9,0,0,NULL,NULL,0,0),
(7504,1,0,0,4,0,NULL,NULL,0,0),
(8004,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(8005,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
(8018,2,0,6,0,0,NULL,NULL,0,0),
(8019,1,0,0,2,1,NULL,NULL,0,0),
(8022,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(8023,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(8015,1,0,3,1,0,NULL,NULL,0,0),
(7878,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7879,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7501,0,0,1,0,0,NULL,NULL,0,0),
(7946,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7947,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL),
(7932,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7933,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
(7941,0,0,1,0,0,NULL,NULL,0,0),
(7988,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7989,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7888,2,0,5,0,0,NULL,NULL,0,0),
(7959,0,0,1,2,0,NULL,NULL,0,0),
(7998,1,0,2,1,0,NULL,NULL,0,0),
(8002,0,0,0,1,0,NULL,NULL,0,0),
(8003,0,0,0,0,0,NULL,NULL,0,0),
(7496,0,0,6,0,0,NULL,NULL,0,0),
(7499,0,0,1,2,0,NULL,NULL,0,0),
(8011,0,0,2,0,0,NULL,NULL,0,0),
(7997,1,0,2,1,0,NULL,NULL,0,0),
(7999,1,0,4,0,0,NULL,NULL,0,0),
(8033,0,0,0,2,0,NULL,NULL,0,0),
(8034,0,0,6,0,0,NULL,NULL,0,0),
(7956,0,0,1,0,0,NULL,NULL,0,0),
(7942,0,0,4,1,1,NULL,NULL,0,0),
(8037,0,0,1,0,0,NULL,NULL,0,0),
(8038,0,0,1,1,0,NULL,NULL,0,0),
(7949,0,0,0,2,0,NULL,NULL,0,0),
(7951,0,0,6,0,0,NULL,NULL,0,0),
(7944,0,0,3,0,0,NULL,NULL,0,0),
(7886,2,0,2,1,0,NULL,NULL,0,0),
(7952,0,0,2,0,0,NULL,NULL,0,0),
(7943,0,0,1,3,0,NULL,NULL,0,0),
(8006,0,0,2,0,0,NULL,NULL,0,0),
(8008,0,0,1,3,0,NULL,NULL,0,0),
(7954,0,0,1,0,0,NULL,NULL,0,0),
(8025,0,0,1,0,0,NULL,NULL,0,0),
(7881,1,0,4,0,0,NULL,NULL,0,0),
(7884,1,0,1,1,0,NULL,NULL,0,0),
(8028,0,0,3,0,0,NULL,NULL,0,0),
(7505,1,0,3,3,0,NULL,NULL,0,0),
(8027,2,0,6,0,0,NULL,NULL,0,0),
(8030,0,0,0,2,0,NULL,NULL,0,0),
(7939,0,0,0,0,0,NULL,NULL,0,0),
(7940,0,0,0,0,0,NULL,NULL,0,0),
(7995,0,0,0,1,0,NULL,NULL,0,0),
(7996,0,0,0,0,0,NULL,NULL,0,0),
(7992,0,0,6,0,0,NULL,NULL,0,0),
(7993,0,0,2,1,0,NULL,NULL,0,0),
(8039,0,0,0,1,0,NULL,NULL,0,0),
(7493,0,0,2,0,0,NULL,NULL,0,0),
(8016,0,0,3,0,0,NULL,NULL,0,0),
(7961,0,0,0,2,1,NULL,NULL,0,0),
(7957,0,0,2,0,0,NULL,NULL,0,0),
(7960,0,0,1,0,0,NULL,NULL,0,0),
(7991,0,0,2,0,0,NULL,NULL,0,0),
(7494,0,0,3,2,0,NULL,NULL,0,0),
(8035,0,0,3,0,0,NULL,NULL,0,0),
(7880,1,0,3,2,0,NULL,NULL,0,0),
(7937,0,0,2,0,0,NULL,NULL,0,0),
(7935,0,0,1,2,0,NULL,NULL,0,0),
(7936,0,0,4,1,0,NULL,NULL,0,0),
(7902,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7903,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
(7914,0,0,2,0,0,NULL,NULL,0,0),
(7972,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
(7973,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(8009,0,0,5,0,0,NULL,NULL,0,0),
(7982,0,0,0,4,0,NULL,NULL,0,0),
(7984,1,0,6,0,0,NULL,NULL,0,0),
(7912,0,0,1,1,0,NULL,NULL,0,0),
(7915,0,0,2,0,0,NULL,NULL,0,0),
(7948,0,0,3,0,0,NULL,NULL,0,0),
(8000,0,0,1,0,0,NULL,NULL,0,0),
(7983,1,0,1,1,0,NULL,NULL,0,0),
(8026,1,0,1,2,0,NULL,NULL,0,0),
(8001,0,0,4,0,0,NULL,NULL,0,0),
(7913,0,0,2,0,1,NULL,NULL,0,0),
(7889,0,0,1,1,0,NULL,NULL,0,0),
(7980,0,0,3,0,0,NULL,NULL,0,0),
(8024,1,0,2,0,0,NULL,NULL,0,0),
(7908,0,0,0,1,0,NULL,NULL,0,0),
(7910,0,0,0,0,0,NULL,NULL,0,0),
(7905,0,0,0,3,0,NULL,NULL,0,0),
(7906,0,0,3,0,0,NULL,NULL,0,0),
(7977,0,0,1,0,0,NULL,NULL,0,0),
(8021,0,0,0,1,0,NULL,NULL,0,0),
(8036,0,0,1,2,0,NULL,NULL,0,0),
(7904,0,0,3,0,0,NULL,NULL,0,0),
(8014,0,0,2,0,0,NULL,NULL,0,0),
(7885,0,0,0,1,0,NULL,NULL,0,0),
(7958,0,0,4,1,0,NULL,NULL,0,0),
(7934,0,0,2,3,0,NULL,NULL,0,0),
(7911,0,0,1,1,0,NULL,NULL,0,0),
(7500,0,0,1,0,0,NULL,NULL,0,0),
(8029,0,0,0,0,0,NULL,NULL,0,0),
(8031,0,0,0,0,0,NULL,NULL,0,0),
(8012,0,0,0,2,0,NULL,NULL,0,0),
(7981,0,0,2,0,0,NULL,NULL,0,0),
(7498,0,0,0,1,0,NULL,NULL,0,0),
(8010,0,0,1,1,0,NULL,NULL,0,0),
(8013,0,0,0,1,0,NULL,NULL,0,0),
(7882,0,0,3,0,0,NULL,NULL,0,0),
(7883,0,0,1,0,0,NULL,NULL,0,0),
(7497,0,0,1,0,0,NULL,NULL,0,0),
(7891,0,0,2,0,0,NULL,NULL,0,0),
(7990,0,0,1,0,0,NULL,NULL,0,0),
(7962,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7963,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
(7970,0,0,2,0,0,NULL,NULL,0,0),
(7975,0,0,1,2,0,NULL,NULL,0,0),
(7978,0,0,3,1,0,NULL,NULL,0,0),
(7909,0,0,1,0,0,NULL,NULL,0,0),
(8040,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
(8041,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7938,0,0,1,0,0,NULL,NULL,0,0),
(8020,1,0,1,2,0,NULL,NULL,0,0),
(7955,0,0,2,2,0,NULL,NULL,0,0),
(7809,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7810,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7820,0,0,4,0,0,NULL,NULL,0,0),
(7825,0,0,0,1,0,NULL,NULL,0,0),
(8052,0,0,2,0,0,NULL,NULL,0,0),
(8053,0,0,1,1,0,NULL,NULL,0,0),
(7818,0,0,1,1,0,NULL,NULL,0,0),
(7824,0,0,1,0,0,NULL,NULL,0,0),
(7967,1,0,1,1,0,NULL,NULL,0,0),
(7968,1,0,0,1,0,NULL,NULL,0,0),
(7969,1,0,2,0,0,NULL,NULL,0,0),
(7907,0,0,1,0,0,NULL,NULL,0,0),
(7964,0,0,1,0,0,NULL,NULL,0,0),
(7966,0,0,0,1,0,NULL,NULL,0,0),
(7950,0,0,2,1,0,NULL,NULL,0,0),
(7813,1,0,5,0,0,NULL,NULL,0,0),
(7814,1,0,1,2,0,NULL,NULL,0,0),
(7953,0,0,0,1,0,NULL,NULL,0,0),
(7976,0,0,0,0,1,NULL,NULL,0,0),
(7979,0,0,0,1,0,NULL,NULL,0,0),
(8043,0,0,1,0,0,NULL,NULL,0,0),
(8032,0,0,1,0,0,NULL,NULL,0,0),
(7890,0,0,1,0,0,NULL,NULL,0,0),
(7811,1,0,0,1,0,NULL,NULL,0,0),
(8042,0,0,0,1,0,NULL,NULL,0,0),
(8048,1,0,2,0,0,NULL,NULL,0,0),
(7887,1,0,1,0,0,NULL,NULL,0,0),
(7817,0,0,3,0,0,NULL,NULL,0,0),
(7495,0,0,1,0,0,NULL,NULL,0,0),
(7986,0,0,0,0,0,NULL,NULL,0,0),
(7987,0,0,0,0,0,NULL,NULL,0,0),
(8046,0,0,1,0,0,NULL,NULL,0,0),
(7985,0,0,1,0,0,NULL,NULL,0,0),
(7815,0,0,1,0,0,NULL,NULL,0,0),
(8050,0,0,2,0,0,NULL,NULL,0,0),
(7971,0,0,1,0,1,NULL,NULL,0,0),
(7945,0,0,0,1,0,NULL,NULL,0,0),
(8017,1,0,0,2,0,NULL,NULL,0,0),
(8044,0,0,1,0,0,NULL,NULL,0,0),
(7502,0,0,0,1,0,NULL,NULL,0,0),
(8045,1,0,2,0,1,NULL,NULL,0,0),
(8047,1,0,0,1,0,NULL,NULL,0,0),
(7819,0,0,0,1,0,NULL,NULL,0,0),
(7822,0,0,0,2,0,NULL,NULL,0,0),
(7823,0,0,1,0,0,NULL,NULL,0,0),
(7965,0,0,2,0,0,NULL,NULL,0,0),
(7974,0,0,0,1,0,NULL,NULL,0,0),
(7812,0,0,1,0,0,NULL,NULL,0,0),
(7816,0,0,0,1,0,NULL,NULL,0,0),
(7994,0,0,1,0,0,NULL,NULL,0,0),
(8049,0,0,0,1,0,NULL,NULL,0,0),
(8007,0,0,1,0,0,NULL,NULL,0,0),
(7821,0,0,1,0,0,NULL,NULL,0,0),
(8051,0,0,0,1,0,NULL,NULL,0,0);
/*!40000 ALTER TABLE `baseball_defensive_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseball_event_states`
--

DROP TABLE IF EXISTS `baseball_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` smallint(6) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `at_bat_number` int(11) DEFAULT NULL,
  `inning_value` int(11) DEFAULT NULL,
  `inning_half` varchar(100) DEFAULT NULL,
  `outs` int(11) DEFAULT NULL,
  `balls` int(11) DEFAULT NULL,
  `strikes` int(11) DEFAULT NULL,
  `runner_on_first_id` int(11) DEFAULT NULL,
  `runner_on_second_id` int(11) DEFAULT NULL,
  `runner_on_third_id` int(11) DEFAULT NULL,
  `runner_on_first` smallint(6) DEFAULT NULL,
  `runner_on_second` smallint(6) DEFAULT NULL,
  `runner_on_third` smallint(6) DEFAULT NULL,
  `runs_this_inning_half` int(11) DEFAULT NULL,
  `pitcher_id` int(11) DEFAULT NULL,
  `batter_id` int(11) DEFAULT NULL,
  `batter_side` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bas_eve_sta_run_on_sec_id__per_id` (`runner_on_second_id`),
  KEY `FK_bas_eve_sta_run_on_thi_id__per_id` (`runner_on_third_id`),
  KEY `FK_bas_eve_sta_run_on_fir_id__per_id` (`runner_on_first_id`),
  KEY `FK_bas_eve_sta_bat_id__per_id` (`batter_id`),
  KEY `FK_bas_eve_sta_pit_id__per_id` (`pitcher_id`),
  KEY `IDX_baseball_event_states_1` (`current_state`),
  KEY `IDX_baseball_event_states_context` (`context`),
  KEY `IDX_baseball_event_states_seq_num` (`sequence_number`),
  KEY `IDX_FK_bas_eve_sta_eve_id__eve_id` (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1210 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseball_event_states`
--

LOCK TABLES `baseball_event_states` WRITE;
/*!40000 ALTER TABLE `baseball_event_states` DISABLE KEYS */;
INSERT INTO `baseball_event_states` VALUES
(1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,227,209,NULL,'event'),
(2,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,243,247,NULL,'event'),
(3,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,272,281,NULL,'event'),
(4,9,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,678,637,NULL,'event'),
(5,15,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,819,943,NULL,'event'),
(6,19,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1761,1938,NULL,'event'),
(7,12,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1196,NULL,'event'),
(8,16,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2117,285,NULL,'event'),
(9,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1387,NULL,'event'),
(10,14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1981,493,NULL,'event'),
(11,17,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2955,3066,NULL,'event'),
(12,8,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3298,3197,NULL,'event'),
(13,1,0,69,NULL,9,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,222,215,'left','event-play'),
(15,9,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,693,644,'left','event-play'),
(25,9,0,6,NULL,1,'top',1,NULL,NULL,636,616,637,1,1,1,0,693,621,'left','event-play'),
(17,9,0,2,NULL,1,'top',0,NULL,NULL,NULL,644,NULL,NULL,1,NULL,NULL,693,637,'right','event-play'),
(19,9,0,3,NULL,1,'top',0,NULL,NULL,637,NULL,644,1,NULL,1,0,693,616,'right','event-play'),
(21,9,0,4,NULL,1,'top',0,NULL,NULL,616,637,NULL,1,1,NULL,0,693,636,'left','event-play'),
(27,9,0,7,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,693,622,'left','event-play'),
(23,9,0,5,NULL,1,'top',0,NULL,NULL,636,616,637,1,1,1,0,693,625,'right','event-play'),
(29,9,0,8,NULL,1,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,693,599,'right','event-play'),
(31,9,0,9,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,599,743,'right','event-play'),
(42,9,0,14,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,693,607,'right','event-play'),
(34,9,0,10,NULL,1,'bottom',0,NULL,NULL,743,NULL,NULL,1,NULL,NULL,NULL,599,732,'right','event-play'),
(40,9,0,13,NULL,1,'bottom',2,NULL,NULL,708,743,NULL,1,1,NULL,0,599,733,'left','event-play'),
(36,9,0,11,NULL,1,'bottom',1,NULL,NULL,743,NULL,NULL,1,NULL,NULL,NULL,599,708,'right','event-play'),
(38,9,0,12,NULL,1,'bottom',1,NULL,NULL,708,743,NULL,1,1,NULL,NULL,599,723,'right','event-play'),
(59,9,0,22,NULL,2,'top',2,NULL,NULL,621,NULL,625,1,NULL,1,0,692,622,'left','event-play'),
(44,9,0,15,NULL,2,'top',0,NULL,NULL,NULL,607,NULL,NULL,1,NULL,NULL,693,644,'left','event-play'),
(46,9,0,16,NULL,2,'top',1,NULL,NULL,NULL,607,NULL,NULL,1,NULL,NULL,693,637,'right','event-play'),
(48,9,0,17,NULL,2,'top',1,NULL,NULL,637,607,NULL,1,1,NULL,NULL,693,616,'right','event-play'),
(50,9,0,18,NULL,2,'top',2,NULL,NULL,NULL,637,607,NULL,1,1,0,693,636,'left','event-play'),
(52,9,0,19,NULL,2,'top',2,NULL,NULL,NULL,NULL,637,NULL,NULL,1,0,693,636,'left','event-play'),
(61,9,0,23,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,599,712,'right','event-play'),
(54,9,0,20,NULL,2,'top',2,NULL,NULL,636,NULL,NULL,1,NULL,NULL,0,693,625,'right','event-play'),
(56,9,0,21,NULL,2,'top',2,NULL,NULL,625,636,NULL,1,1,NULL,0,692,621,'left','event-play'),
(63,9,0,24,NULL,2,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,599,714,'left','event-play'),
(65,9,0,25,NULL,2,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,599,696,'right','event-play'),
(67,9,0,26,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,692,599,'right','event-play'),
(77,9,0,31,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,599,692,'left','event-play'),
(69,9,0,27,NULL,3,'top',0,NULL,NULL,599,NULL,NULL,1,NULL,NULL,NULL,692,607,'right','event-play'),
(71,9,0,28,NULL,3,'top',1,NULL,NULL,599,NULL,NULL,1,NULL,NULL,NULL,692,644,'left','event-play'),
(73,9,0,29,NULL,3,'top',2,NULL,NULL,599,NULL,NULL,1,NULL,NULL,NULL,692,637,'right','event-play'),
(75,9,0,30,NULL,3,'top',2,NULL,NULL,637,599,NULL,1,1,NULL,0,692,616,'right','event-play'),
(87,9,0,36,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,678,636,'left','event-play'),
(79,9,0,32,NULL,3,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,599,743,'right','event-play'),
(81,9,0,33,NULL,3,'bottom',1,NULL,NULL,743,NULL,NULL,1,NULL,NULL,NULL,599,732,'right','event-play'),
(83,9,0,34,NULL,3,'bottom',2,NULL,NULL,743,NULL,NULL,1,NULL,NULL,NULL,599,708,'right','event-play'),
(85,9,0,35,NULL,3,'bottom',2,NULL,NULL,708,743,NULL,1,1,NULL,0,599,723,'right','event-play'),
(90,9,0,37,NULL,4,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,678,625,'right','event-play'),
(96,9,0,40,NULL,4,'top',2,NULL,NULL,NULL,622,NULL,NULL,1,NULL,0,678,599,'right','event-play'),
(92,9,0,38,NULL,4,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,678,621,'left','event-play'),
(94,9,0,39,NULL,4,'top',2,NULL,NULL,621,NULL,NULL,1,NULL,NULL,0,678,622,'left','event-play'),
(98,9,0,41,NULL,4,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,599,733,'left','event-play'),
(101,9,0,42,NULL,4,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,599,712,'right','event-play'),
(107,9,0,45,NULL,5,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,678,607,'right','event-play'),
(103,9,0,43,NULL,4,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,599,714,'left','event-play'),
(105,9,0,44,NULL,4,'bottom',2,NULL,NULL,NULL,714,NULL,NULL,1,NULL,0,599,696,'right','event-play'),
(114,9,0,48,NULL,5,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,678,616,'right','event-play'),
(110,9,0,46,NULL,5,'top',0,NULL,NULL,607,NULL,NULL,1,NULL,NULL,NULL,678,644,'left','event-play'),
(112,9,0,47,NULL,5,'top',1,NULL,NULL,NULL,607,NULL,NULL,1,NULL,0,678,637,'right','event-play'),
(116,9,0,49,NULL,5,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,678,636,'left','event-play'),
(118,9,0,50,NULL,5,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,599,700,'left','event-play'),
(129,9,0,55,NULL,5,'bottom',2,NULL,NULL,NULL,NULL,710,NULL,NULL,1,0,599,739,'left','event-play'),
(121,9,0,51,NULL,5,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,599,741,'left','event-play'),
(131,9,0,56,NULL,6,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,679,625,'right','event-play'),
(123,9,0,52,NULL,5,'bottom',1,NULL,NULL,741,NULL,NULL,1,NULL,NULL,NULL,599,728,'right','event-play'),
(125,9,0,53,NULL,5,'bottom',1,NULL,NULL,728,741,NULL,1,1,NULL,0,599,710,'left','event-play'),
(127,9,0,54,NULL,5,'bottom',1,NULL,NULL,NULL,710,728,NULL,1,1,0,599,722,'right','event-play'),
(145,9,0,62,NULL,6,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,584,736,'right','event-play'),
(134,9,0,57,NULL,6,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,679,621,'left','event-play'),
(136,9,0,58,NULL,6,'top',1,NULL,NULL,NULL,621,NULL,NULL,1,NULL,NULL,679,629,'left','event-play'),
(138,9,0,59,NULL,6,'top',2,NULL,NULL,NULL,621,NULL,NULL,1,NULL,0,679,623,'right','event-play'),
(141,9,0,60,NULL,6,'top',2,NULL,NULL,NULL,623,NULL,NULL,1,NULL,0,679,607,'right','event-play'),
(143,9,0,61,NULL,6,'top',2,NULL,NULL,607,623,NULL,1,1,NULL,0,679,644,'left','event-play'),
(148,9,0,63,NULL,6,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,584,714,'left','event-play'),
(150,9,0,64,NULL,6,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,584,679,'right','event-play'),
(152,9,0,65,NULL,7,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,679,633,'right','event-play'),
(155,9,0,66,NULL,7,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,679,605,'left','event-play'),
(165,9,0,70,NULL,7,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,583,700,'left','event-play'),
(158,9,0,67,NULL,7,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,679,636,'left','event-play'),
(160,9,0,68,NULL,7,'top',2,NULL,NULL,636,NULL,NULL,1,NULL,NULL,NULL,679,645,'right','event-play'),
(163,9,0,69,NULL,7,'top',2,NULL,NULL,645,636,NULL,1,1,NULL,0,679,621,'left','event-play'),
(172,9,0,73,NULL,7,'bottom',1,NULL,NULL,728,741,NULL,1,1,NULL,0,583,710,'left','event-play'),
(168,9,0,71,NULL,7,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,583,741,'left','event-play'),
(174,9,0,74,NULL,8,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,687,629,'left','event-play'),
(170,9,0,72,NULL,7,'bottom',1,NULL,NULL,741,NULL,NULL,1,NULL,NULL,NULL,583,728,'right','event-play'),
(181,9,0,77,NULL,8,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,583,722,'right','event-play'),
(177,9,0,75,NULL,8,'top',0,NULL,NULL,629,NULL,NULL,1,NULL,NULL,NULL,687,623,'right','event-play'),
(179,9,0,76,NULL,8,'top',1,NULL,NULL,629,NULL,NULL,1,NULL,NULL,0,687,607,'right','event-play'),
(183,9,0,78,NULL,8,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,583,739,'left','event-play'),
(196,9,0,84,NULL,8,'bottom',2,NULL,NULL,NULL,NULL,765,NULL,NULL,1,0,583,700,'left','event-play'),
(185,9,0,79,NULL,8,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,583,736,'right','event-play'),
(198,9,0,85,NULL,9,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,680,644,'left','event-play'),
(187,9,0,80,NULL,8,'bottom',2,NULL,NULL,736,NULL,NULL,1,NULL,NULL,NULL,583,714,'left','event-play'),
(189,9,0,81,NULL,8,'bottom',2,NULL,NULL,714,736,NULL,1,1,NULL,0,583,765,'left','event-play'),
(192,9,0,82,NULL,8,'bottom',2,NULL,NULL,765,714,NULL,1,1,NULL,0,583,700,'left','event-play'),
(194,9,0,83,NULL,8,'bottom',2,NULL,NULL,NULL,765,714,NULL,1,1,0,583,700,'left','event-play'),
(209,9,0,90,NULL,9,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,583,741,'left','event-play'),
(201,9,0,86,NULL,9,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,680,633,'right','event-play'),
(203,9,0,87,NULL,9,'top',1,NULL,NULL,633,NULL,NULL,1,NULL,NULL,NULL,680,605,'left','event-play'),
(205,9,0,88,NULL,9,'top',1,NULL,NULL,605,633,NULL,1,1,NULL,NULL,680,583,'right','event-play'),
(207,9,0,89,NULL,9,'top',2,NULL,NULL,605,633,NULL,1,1,NULL,0,680,645,'right','event-play'),
(211,9,0,91,NULL,9,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,583,728,'right','event-play'),
(218,9,1,NULL,NULL,9,'bottom',2,NULL,NULL,NULL,739,NULL,NULL,1,NULL,2,591,NULL,NULL,'event-play'),
(213,9,0,92,NULL,9,'bottom',1,NULL,NULL,728,NULL,NULL,1,NULL,NULL,NULL,583,710,'left','event-play'),
(215,9,0,93,NULL,9,'bottom',1,NULL,NULL,NULL,710,728,NULL,1,1,0,583,722,'right','event-play'),
(217,9,0,94,NULL,9,'bottom',2,NULL,NULL,NULL,NULL,710,NULL,NULL,1,0,583,739,'left','event-play'),
(219,9,0,95,NULL,9,'bottom',2,NULL,NULL,NULL,739,NULL,NULL,1,NULL,0,591,736,'right','event-play'),
(221,12,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1073,'left','event-play'),
(223,12,0,2,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1054,'right','event-play'),
(1205,10,1,NULL,NULL,6,'bottom',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1255,NULL,NULL,'event-play'),
(225,10,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364,261,'left','event-play'),
(1207,15,1,NULL,NULL,6,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,899,NULL,NULL,'event-play'),
(227,15,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,160,232,'left','event-play'),
(229,10,0,2,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364,1281,'left','event-play'),
(1189,14,1,NULL,NULL,5,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1981,NULL,NULL,'event-play'),
(231,14,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,475,2056,'left','event-play'),
(233,12,0,3,NULL,1,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1142,1095,'right','event-play'),
(235,7,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1656,1571,'left','event-play'),
(237,16,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2238,2151,'left','event-play'),
(239,19,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1885,1812,'right','event-play'),
(241,10,0,3,NULL,1,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1364,263,'right','event-play'),
(329,16,0,8,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2117,279,'right','event-play'),
(243,16,0,2,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2238,2139,'left','event-play'),
(271,7,0,4,NULL,1,'top',2,NULL,NULL,1551,NULL,NULL,1,NULL,NULL,0,1656,1547,'right','event-play'),
(245,7,0,2,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1656,1551,'right','event-play'),
(267,19,0,4,NULL,1,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1885,1814,'right','event-play'),
(247,19,0,2,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1885,1795,'left','event-play'),
(313,14,0,6,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1993,496,'left','event-play'),
(249,14,0,2,NULL,1,'top',0,NULL,NULL,2056,NULL,NULL,1,NULL,NULL,NULL,475,2016,'left','event-play'),
(251,12,0,4,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1196,'left','event-play'),
(317,15,0,6,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,819,162,'left','event-play'),
(253,15,0,2,NULL,1,'top',0,NULL,NULL,NULL,232,NULL,NULL,1,NULL,NULL,160,236,'left','event-play'),
(255,10,0,4,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1423,'left','event-play'),
(257,7,0,3,NULL,1,'top',1,NULL,NULL,1551,NULL,NULL,1,NULL,NULL,NULL,1656,1608,'left','event-play'),
(259,19,0,3,NULL,1,'top',1,NULL,NULL,1795,NULL,NULL,1,NULL,NULL,NULL,1885,1814,'right','event-play'),
(332,12,0,8,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1044,'right','event-play'),
(305,16,0,7,NULL,1,'top',2,NULL,NULL,NULL,2130,NULL,NULL,1,NULL,0,2238,2159,'left','event-play'),
(262,16,0,3,NULL,1,'top',1,NULL,NULL,2139,NULL,NULL,1,NULL,NULL,NULL,2238,2185,'right','event-play'),
(538,10,0,18,NULL,3,'top',2,NULL,NULL,NULL,271,NULL,NULL,1,NULL,0,1364,1281,'left','event-play'),
(265,14,0,3,NULL,1,'top',1,NULL,NULL,2056,NULL,NULL,1,NULL,NULL,NULL,475,2007,'left','event-play'),
(269,15,0,3,NULL,1,'top',0,NULL,NULL,236,232,NULL,1,1,NULL,NULL,160,122,'right','event-play'),
(273,14,0,4,NULL,1,'top',1,NULL,NULL,2007,2056,NULL,1,1,NULL,NULL,475,2014,'left','event-play'),
(275,16,0,4,NULL,1,'top',1,NULL,NULL,2185,2139,NULL,1,1,NULL,0,2238,2130,'left','event-play'),
(277,12,0,5,NULL,1,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1216,'left','event-play'),
(279,7,0,5,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1516,1677,'left','event-play'),
(281,10,0,5,NULL,1,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1400,'right','event-play'),
(348,10,0,8,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364,264,'left','event-play'),
(283,10,0,6,NULL,1,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1422,'left','event-play'),
(285,15,0,4,NULL,1,'top',1,NULL,NULL,NULL,236,232,NULL,1,1,0,160,237,'left','event-play'),
(287,16,0,5,NULL,1,'top',1,NULL,NULL,2130,NULL,2185,1,NULL,1,0,2238,2162,'right','event-play'),
(340,7,0,9,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1656,1542,'left','event-play'),
(290,16,0,6,NULL,1,'top',1,NULL,NULL,NULL,2130,NULL,NULL,1,NULL,0,2238,2162,'right','event-play'),
(292,19,0,5,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1773,1920,'right','event-play'),
(309,7,0,8,NULL,1,'bottom',2,NULL,NULL,NULL,246,NULL,NULL,1,NULL,0,1516,250,'right','event-play'),
(294,7,0,6,NULL,1,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1516,246,'right','event-play'),
(319,19,0,7,NULL,1,'bottom',0,NULL,NULL,1909,1920,NULL,1,1,NULL,0,1773,1903,'left','event-play'),
(297,12,0,6,NULL,1,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1027,1209,'left','event-play'),
(299,14,0,5,NULL,1,'top',2,NULL,NULL,2007,2056,NULL,1,1,NULL,0,475,2057,'left','event-play'),
(301,7,0,7,NULL,1,'bottom',1,NULL,NULL,NULL,246,NULL,NULL,1,NULL,NULL,1516,249,'right','event-play'),
(303,15,0,5,NULL,1,'top',2,NULL,NULL,237,NULL,NULL,1,NULL,NULL,0,160,239,'left','event-play'),
(307,10,0,7,NULL,1,'bottom',2,NULL,NULL,1422,NULL,NULL,1,NULL,NULL,0,1255,1371,'left','event-play'),
(611,19,0,25,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1771,1903,'left','event-play'),
(311,19,0,6,NULL,1,'bottom',0,NULL,NULL,1920,NULL,NULL,1,NULL,NULL,NULL,1773,1909,'left','event-play'),
(315,12,0,7,NULL,1,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1027,1191,'right','event-play'),
(350,19,0,10,NULL,1,'bottom',0,NULL,NULL,NULL,1914,NULL,NULL,1,NULL,0,1773,1938,'left','event-play'),
(323,19,0,8,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1773,1914,'right','event-play'),
(398,14,0,11,NULL,1,'bottom',1,NULL,NULL,541,NULL,NULL,1,NULL,NULL,0,1993,488,'left','event-play'),
(325,14,0,7,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,496,NULL,NULL,1,0,1993,501,'right','event-play'),
(327,15,0,7,NULL,1,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,819,955,'right','event-play'),
(492,16,0,22,NULL,2,'top',2,NULL,NULL,NULL,NULL,2151,NULL,NULL,1,0,2238,2185,'right','event-play'),
(334,15,0,8,NULL,1,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,819,231,'left','event-play'),
(416,12,0,15,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1036,'right','event-play'),
(336,12,0,9,NULL,2,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1079,'left','event-play'),
(338,16,0,9,NULL,1,'bottom',0,NULL,NULL,279,NULL,NULL,1,NULL,NULL,NULL,2117,280,'left','event-play'),
(342,19,0,9,NULL,1,'bottom',0,NULL,NULL,1914,NULL,NULL,1,NULL,NULL,0,1773,1938,'left','event-play'),
(432,14,0,12,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,475,2040,'right','event-play'),
(344,14,0,8,NULL,1,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1993,493,'left','event-play'),
(402,16,0,14,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2117,290,'left','event-play'),
(346,16,0,10,NULL,1,'bottom',0,NULL,NULL,NULL,279,NULL,NULL,1,NULL,0,2117,280,'left','event-play'),
(352,16,0,11,NULL,1,'bottom',0,NULL,NULL,280,NULL,NULL,1,NULL,NULL,0,2117,281,'right','event-play'),
(354,12,0,10,NULL,2,'top',1,NULL,NULL,1079,NULL,NULL,1,NULL,NULL,0,1142,1099,'right','event-play'),
(356,14,0,9,NULL,1,'bottom',1,NULL,NULL,NULL,493,NULL,NULL,1,NULL,0,1993,500,'right','event-play'),
(358,15,0,9,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,160,234,'right','event-play'),
(360,19,0,11,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1773,1902,'right','event-play'),
(362,16,0,12,NULL,1,'bottom',0,NULL,NULL,281,280,NULL,1,1,NULL,0,2117,283,'left','event-play'),
(364,14,0,10,NULL,1,'bottom',1,NULL,NULL,NULL,500,NULL,NULL,1,NULL,0,1993,541,'left','event-play'),
(366,19,0,12,NULL,1,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1773,1922,'left','event-play'),
(368,15,0,10,NULL,2,'top',0,NULL,NULL,234,NULL,NULL,1,NULL,NULL,NULL,160,827,'right','event-play'),
(370,12,0,11,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1160,'left','event-play'),
(372,10,0,9,NULL,2,'top',0,NULL,NULL,264,NULL,NULL,1,NULL,NULL,NULL,1364,1269,'left','event-play'),
(410,10,0,12,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1387,'left','event-play'),
(374,10,0,10,NULL,2,'top',1,NULL,NULL,264,NULL,NULL,1,NULL,NULL,NULL,1364,265,'right','event-play'),
(450,15,0,15,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,819,952,'right','event-play'),
(376,15,0,11,NULL,2,'top',0,NULL,NULL,NULL,234,NULL,NULL,1,NULL,NULL,160,827,'right','event-play'),
(520,7,0,20,NULL,2,'bottom',2,NULL,NULL,1677,256,NULL,1,1,NULL,0,1516,246,'right','event-play'),
(378,7,0,10,NULL,2,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1656,125,'right','event-play'),
(380,7,0,11,NULL,2,'top',1,NULL,NULL,125,NULL,NULL,1,NULL,NULL,NULL,1656,1602,'left','event-play'),
(406,7,0,14,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1516,253,'left','event-play'),
(382,7,0,12,NULL,2,'top',2,NULL,NULL,125,NULL,NULL,1,NULL,NULL,NULL,1656,1564,'left','event-play'),
(400,12,0,14,NULL,2,'bottom',2,NULL,NULL,1168,NULL,NULL,1,NULL,NULL,0,1027,1186,'right','event-play'),
(384,12,0,12,NULL,2,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1217,'left','event-play'),
(386,16,0,13,NULL,1,'bottom',0,NULL,NULL,NULL,283,NULL,NULL,1,NULL,0,2117,285,'right','event-play'),
(388,7,0,13,NULL,2,'top',2,NULL,NULL,1564,125,NULL,1,1,NULL,0,1656,1539,'left','event-play'),
(390,19,0,13,NULL,1,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1773,1892,'right','event-play'),
(392,12,0,13,NULL,2,'bottom',1,NULL,NULL,1217,NULL,NULL,1,NULL,NULL,NULL,1027,1168,'left','event-play'),
(394,15,0,12,NULL,2,'top',0,NULL,NULL,827,NULL,234,1,NULL,1,0,160,855,'right','event-play'),
(396,10,0,11,NULL,2,'top',1,NULL,NULL,265,264,NULL,1,1,NULL,0,1364,267,'right','event-play'),
(404,15,0,13,NULL,2,'top',1,NULL,NULL,827,NULL,NULL,1,NULL,NULL,0,160,845,'right','event-play'),
(408,16,0,15,NULL,1,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2117,287,'right','event-play'),
(412,19,0,14,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1885,1788,'left','event-play'),
(414,16,0,16,NULL,1,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2117,288,'left','event-play'),
(418,11,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2597,2525,'left','event-play'),
(420,13,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2358,400,'left','event-play'),
(422,10,0,13,NULL,2,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1458,'right','event-play'),
(424,12,0,16,NULL,3,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1070,'left','event-play'),
(426,15,0,14,NULL,2,'top',2,NULL,NULL,827,NULL,NULL,1,NULL,NULL,0,160,232,'left','event-play'),
(428,10,0,14,NULL,2,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1255,1405,'right','event-play'),
(605,13,0,11,NULL,2,'top',2,NULL,NULL,NULL,357,NULL,NULL,1,NULL,0,2358,413,'right','event-play'),
(430,13,0,2,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2358,381,'left','event-play'),
(434,11,0,2,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2597,2503,'right','event-play'),
(436,16,0,17,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2238,2140,'left','event-play'),
(438,7,0,15,NULL,2,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1516,251,'left','event-play'),
(440,19,0,15,NULL,2,'top',0,NULL,NULL,1788,NULL,NULL,1,NULL,NULL,NULL,1885,1810,'right','event-play'),
(442,12,0,17,NULL,3,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1142,1039,'right','event-play'),
(444,13,0,3,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2358,395,'right','event-play'),
(446,16,0,18,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2238,2118,'right','event-play'),
(448,7,0,16,NULL,2,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1516,252,'right','event-play'),
(452,19,0,16,NULL,2,'top',1,NULL,NULL,1788,NULL,NULL,1,NULL,NULL,NULL,1885,1833,'right','event-play'),
(454,11,0,3,NULL,1,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2597,2549,'left','event-play'),
(456,14,0,13,NULL,2,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,475,2032,'left','event-play'),
(599,16,0,27,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2238,2130,'left','event-play'),
(458,16,0,19,NULL,2,'top',0,NULL,NULL,2118,NULL,NULL,1,NULL,NULL,0,2238,2117,'right','event-play'),
(460,14,0,14,NULL,2,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,475,2031,'left','event-play'),
(462,13,0,4,NULL,1,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2358,403,'left','event-play'),
(464,19,0,17,NULL,2,'top',2,NULL,NULL,1788,NULL,NULL,1,NULL,NULL,0,1885,1807,'left','event-play'),
(466,16,0,20,NULL,2,'top',1,NULL,NULL,NULL,2118,NULL,NULL,1,NULL,0,2238,2151,'left','event-play'),
(512,15,0,18,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,160,236,'left','event-play'),
(468,15,0,16,NULL,2,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,819,939,'left','event-play'),
(470,7,0,17,NULL,2,'bottom',2,NULL,NULL,NULL,252,NULL,NULL,1,NULL,0,1516,255,'left','event-play'),
(472,11,0,4,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2472,2629,'left','event-play'),
(474,7,0,18,NULL,2,'bottom',2,NULL,NULL,NULL,255,NULL,NULL,1,NULL,0,1516,256,'left','event-play'),
(476,13,0,5,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,349,2374,'right','event-play'),
(573,11,0,10,NULL,2,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2597,2512,'right','event-play'),
(683,12,0,30,NULL,5,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1036,'right','event-play'),
(480,12,0,18,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1174,'left','event-play'),
(482,19,0,18,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1773,1885,'right','event-play'),
(484,16,0,21,NULL,2,'top',1,NULL,NULL,NULL,2151,2118,NULL,1,1,0,2238,2139,'left','event-play'),
(486,12,0,19,NULL,3,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1196,'left','event-play'),
(488,15,0,17,NULL,2,'bottom',1,NULL,NULL,939,NULL,NULL,1,NULL,NULL,0,819,967,'right','event-play'),
(490,13,0,6,NULL,1,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,349,2378,'left','event-play'),
(548,7,0,21,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1656,1571,'left','event-play'),
(494,7,0,19,NULL,2,'bottom',2,NULL,NULL,NULL,256,NULL,NULL,1,NULL,0,1516,1677,'left','event-play'),
(496,14,0,15,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1993,536,'left','event-play'),
(498,11,0,5,NULL,1,'bottom',0,NULL,NULL,2629,NULL,NULL,1,NULL,NULL,NULL,2472,2647,'left','event-play'),
(500,19,0,19,NULL,2,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1773,1920,'right','event-play'),
(502,10,0,15,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364,271,'right','event-play'),
(524,11,0,8,NULL,1,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2472,2652,'right','event-play'),
(504,11,0,6,NULL,1,'bottom',0,NULL,NULL,NULL,2629,NULL,NULL,1,NULL,NULL,2472,2647,'left','event-play'),
(506,13,0,7,NULL,1,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,349,2381,'left','event-play'),
(508,12,0,20,NULL,3,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1027,1216,'left','event-play'),
(510,10,0,16,NULL,3,'top',0,NULL,NULL,271,NULL,NULL,1,NULL,NULL,NULL,1364,1255,'left','event-play'),
(514,19,0,20,NULL,2,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1773,1909,'left','event-play'),
(516,11,0,7,NULL,1,'bottom',1,NULL,NULL,NULL,NULL,2629,NULL,NULL,1,0,2472,2643,'right','event-play'),
(633,12,0,28,NULL,4,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1027,1160,'left','event-play'),
(518,14,0,16,NULL,2,'bottom',0,NULL,NULL,536,NULL,NULL,1,NULL,NULL,NULL,1993,517,'left','event-play'),
(522,15,0,19,NULL,3,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,160,122,'right','event-play'),
(526,10,0,17,NULL,3,'top',1,NULL,NULL,NULL,271,NULL,NULL,1,NULL,NULL,1364,261,'left','event-play'),
(528,16,0,23,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2117,2238,'left','event-play'),
(530,15,0,20,NULL,3,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,160,237,'left','event-play'),
(532,19,0,21,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1885,1777,'right','event-play'),
(534,13,0,8,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2358,376,'left','event-play'),
(536,12,0,21,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1073,'left','event-play'),
(637,14,0,22,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,475,2034,'right','event-play'),
(540,14,0,17,NULL,2,'bottom',0,NULL,NULL,517,536,NULL,1,1,NULL,NULL,1993,513,'left','event-play'),
(542,14,0,18,NULL,2,'bottom',1,NULL,NULL,NULL,517,536,NULL,1,1,NULL,1993,496,'left','event-play'),
(571,16,0,26,NULL,2,'bottom',2,NULL,NULL,280,NULL,NULL,1,NULL,NULL,0,2117,281,'right','event-play'),
(544,16,0,24,NULL,2,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2117,279,'right','event-play'),
(546,19,0,22,NULL,3,'top',0,NULL,NULL,1777,NULL,NULL,1,NULL,NULL,NULL,1885,1798,'right','event-play'),
(550,16,0,25,NULL,2,'bottom',1,NULL,NULL,279,NULL,NULL,1,NULL,NULL,NULL,2117,280,'left','event-play'),
(552,11,0,9,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2597,2495,'left','event-play'),
(554,12,0,22,NULL,4,'top',0,NULL,NULL,NULL,1073,NULL,NULL,1,NULL,NULL,1142,1054,'right','event-play'),
(556,14,0,19,NULL,2,'bottom',1,NULL,NULL,496,517,536,1,1,1,0,1993,501,'right','event-play'),
(558,13,0,9,NULL,2,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2358,357,'right','event-play'),
(560,12,0,23,NULL,4,'top',1,NULL,NULL,NULL,1073,NULL,NULL,1,NULL,NULL,1142,1095,'right','event-play'),
(562,7,0,22,NULL,3,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1656,1551,'right','event-play'),
(564,15,0,21,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,819,943,'left','event-play'),
(566,13,0,10,NULL,2,'top',1,NULL,NULL,NULL,357,NULL,NULL,1,NULL,NULL,2358,426,'left','event-play'),
(691,10,0,23,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364,263,'right','event-play'),
(568,10,0,19,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1414,'right','event-play'),
(575,12,0,24,NULL,4,'top',2,NULL,NULL,NULL,NULL,1073,NULL,NULL,1,0,1142,1044,'right','event-play'),
(697,15,0,28,NULL,3,'bottom',2,NULL,NULL,231,963,NULL,1,1,NULL,0,819,952,'right','event-play'),
(577,15,0,22,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,819,932,'right','event-play'),
(661,11,0,17,NULL,2,'bottom',1,NULL,NULL,2663,NULL,2615,1,NULL,1,0,2472,2597,'right','event-play'),
(579,11,0,11,NULL,2,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2597,2528,'left','event-play'),
(581,19,0,23,NULL,3,'top',1,NULL,NULL,1777,NULL,NULL,1,NULL,NULL,NULL,1885,1812,'right','event-play'),
(583,11,0,12,NULL,2,'top',2,NULL,NULL,2528,NULL,NULL,1,NULL,NULL,0,2597,2484,'right','event-play'),
(585,12,0,25,NULL,4,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1142,1079,'left','event-play'),
(587,7,0,23,NULL,3,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1656,1608,'left','event-play'),
(589,14,0,20,NULL,2,'bottom',1,NULL,NULL,501,496,517,1,1,1,0,1993,493,'left','event-play'),
(591,15,0,23,NULL,3,'bottom',0,NULL,NULL,932,NULL,NULL,1,NULL,NULL,0,819,963,'left','event-play'),
(593,19,0,24,NULL,3,'top',2,NULL,NULL,1777,NULL,NULL,1,NULL,NULL,0,1885,1795,'left','event-play'),
(595,14,0,21,NULL,2,'bottom',1,NULL,NULL,493,501,496,1,1,1,0,1981,500,'right','event-play'),
(667,10,0,22,NULL,3,'bottom',2,NULL,NULL,NULL,1423,NULL,NULL,1,NULL,0,1255,1400,'right','event-play'),
(597,10,0,20,NULL,3,'bottom',0,NULL,NULL,1414,NULL,NULL,1,NULL,NULL,NULL,1255,1364,'right','event-play'),
(601,15,0,24,NULL,3,'bottom',0,NULL,NULL,NULL,932,NULL,NULL,1,NULL,0,819,963,'left','event-play'),
(603,11,0,13,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2472,2665,'right','event-play'),
(985,7,0,42,NULL,5,'top',2,NULL,NULL,NULL,1542,NULL,NULL,1,NULL,0,1656,125,'right','event-play'),
(607,7,0,24,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1516,249,'right','event-play'),
(609,16,0,28,NULL,3,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2238,2162,'right','event-play'),
(687,11,0,18,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2597,2517,'right','event-play'),
(613,11,0,14,NULL,2,'bottom',0,NULL,NULL,2665,NULL,NULL,1,NULL,NULL,NULL,2472,2624,'left','event-play'),
(615,16,0,29,NULL,3,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2238,2159,'left','event-play'),
(748,15,0,29,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,160,239,'left','event-play'),
(617,15,0,25,NULL,3,'bottom',0,NULL,NULL,NULL,963,NULL,NULL,1,NULL,0,819,162,'left','event-play'),
(619,7,0,25,NULL,3,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1516,250,'right','event-play'),
(677,19,0,29,NULL,3,'bottom',2,NULL,NULL,1902,NULL,NULL,1,NULL,NULL,0,1771,1922,'left','event-play'),
(622,12,0,26,NULL,4,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1209,'left','event-play'),
(624,7,0,26,NULL,3,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1516,253,'left','event-play'),
(626,11,0,15,NULL,2,'bottom',1,NULL,NULL,2665,NULL,NULL,1,NULL,NULL,NULL,2472,2615,'right','event-play'),
(628,12,0,27,NULL,4,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1191,'right','event-play'),
(630,10,0,21,NULL,3,'bottom',1,NULL,NULL,NULL,1414,NULL,NULL,1,NULL,NULL,1255,1423,'left','event-play'),
(635,11,0,16,NULL,2,'bottom',1,NULL,NULL,2615,2665,NULL,1,1,NULL,0,2472,2663,'left','event-play'),
(798,16,0,36,NULL,4,'top',2,NULL,NULL,NULL,NULL,2140,NULL,NULL,1,0,2238,2151,'left','event-play'),
(639,16,0,30,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2117,283,'left','event-play'),
(641,19,0,26,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1771,1914,'right','event-play'),
(643,6,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2836,2739,'left','event-play'),
(784,13,0,16,NULL,2,'bottom',2,NULL,NULL,2411,NULL,2380,1,NULL,1,0,349,2389,'left','event-play'),
(645,13,0,12,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,349,2380,'right','event-play'),
(647,15,0,26,NULL,3,'bottom',1,NULL,NULL,NULL,963,NULL,NULL,1,NULL,0,819,955,'right','event-play'),
(649,14,0,23,NULL,3,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,475,2056,'left','event-play'),
(810,13,0,17,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2358,349,'left','event-play'),
(651,13,0,13,NULL,2,'bottom',0,NULL,NULL,2380,NULL,NULL,1,NULL,NULL,NULL,349,2373,'left','event-play'),
(653,16,0,31,NULL,3,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2117,285,'right','event-play'),
(655,7,0,27,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1656,1547,'right','event-play'),
(657,19,0,27,NULL,3,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1771,1938,'left','event-play'),
(659,12,0,29,NULL,5,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1099,'right','event-play'),
(663,7,0,28,NULL,4,'top',0,NULL,NULL,1547,NULL,NULL,1,NULL,NULL,NULL,1656,1542,'left','event-play'),
(665,14,0,24,NULL,3,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,475,2016,'left','event-play'),
(717,19,0,30,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1885,1814,'right','event-play'),
(669,19,0,28,NULL,3,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1771,1902,'right','event-play'),
(671,13,0,14,NULL,2,'bottom',1,NULL,NULL,NULL,2380,NULL,NULL,1,NULL,NULL,349,2411,'right','event-play'),
(1208,17,1,NULL,NULL,4,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3051,NULL,NULL,'event-play'),
(673,17,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3051,216,'left','event-play'),
(699,6,0,4,NULL,1,'top',1,NULL,NULL,2737,2762,NULL,1,1,NULL,0,2836,153,'right','event-play'),
(675,6,0,2,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2836,2762,'left','event-play'),
(927,6,0,12,NULL,1,'bottom',2,NULL,NULL,2879,193,NULL,1,1,NULL,0,2716,2881,'right','event-play'),
(679,6,0,3,NULL,1,'top',1,NULL,NULL,2762,NULL,NULL,1,NULL,NULL,NULL,2836,2737,'left','event-play'),
(681,16,0,32,NULL,3,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2117,290,'left','event-play'),
(685,15,0,27,NULL,3,'bottom',2,NULL,NULL,NULL,963,NULL,NULL,1,NULL,0,819,231,'left','event-play'),
(689,13,0,15,NULL,2,'bottom',1,NULL,NULL,2411,2380,NULL,1,1,NULL,NULL,349,2367,'right','event-play'),
(693,17,0,2,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3051,223,'right','event-play'),
(786,10,0,28,NULL,4,'top',2,NULL,NULL,NULL,NULL,265,NULL,NULL,1,0,1364,271,'right','event-play'),
(695,10,0,24,NULL,4,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364,264,'left','event-play'),
(701,11,0,19,NULL,3,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2597,2472,'left','event-play'),
(733,7,0,31,NULL,4,'top',2,NULL,NULL,1602,125,NULL,1,1,NULL,0,1656,1564,'left','event-play'),
(703,7,0,29,NULL,4,'top',1,NULL,NULL,1547,NULL,NULL,1,NULL,NULL,NULL,1656,125,'right','event-play'),
(705,12,0,31,NULL,5,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1142,1070,'left','event-play'),
(707,8,0,1,NULL,1,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3298,3203,'right','event-play'),
(709,17,0,3,NULL,1,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3051,218,'right','event-play'),
(711,14,0,25,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1981,541,'left','event-play'),
(746,6,0,7,NULL,1,'top',1,NULL,NULL,2751,NULL,2782,1,NULL,1,0,2836,2735,'left','event-play'),
(713,6,0,5,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2836,2782,'left','event-play'),
(715,16,0,33,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2238,2140,'left','event-play'),
(1194,11,0,39,NULL,4,'bottom',2,NULL,NULL,2629,2597,2615,1,1,1,0,2457,2647,'left','event-play'),
(719,11,0,20,NULL,3,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2597,2525,'left','event-play'),
(721,7,0,30,NULL,4,'top',2,NULL,NULL,125,NULL,NULL,1,NULL,NULL,NULL,1656,1602,'left','event-play'),
(723,8,0,2,NULL,1,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3298,3217,'left','event-play'),
(937,10,0,33,NULL,4,'bottom',2,NULL,NULL,1458,NULL,NULL,1,NULL,NULL,0,1255,1405,'right','event-play'),
(725,10,0,25,NULL,4,'top',1,NULL,NULL,264,NULL,NULL,1,NULL,NULL,NULL,1364,1269,'left','event-play'),
(727,6,0,6,NULL,1,'top',1,NULL,NULL,NULL,2782,NULL,NULL,1,NULL,0,2836,2751,'right','event-play'),
(729,8,0,3,NULL,1,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3298,3234,'right','event-play'),
(731,11,0,21,NULL,3,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2597,2503,'right','event-play'),
(735,14,0,26,NULL,3,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1981,488,'left','event-play'),
(737,17,0,4,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2955,3100,'right','event-play'),
(739,19,0,31,NULL,4,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1885,1788,'left','event-play'),
(923,17,0,10,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3051,219,'left','event-play'),
(816,12,0,36,NULL,6,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1073,'left','event-play'),
(742,12,0,32,NULL,5,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1217,'left','event-play'),
(1100,19,0,48,NULL,5,'bottom',2,NULL,NULL,1922,NULL,NULL,1,NULL,NULL,0,1771,1892,'right','event-play'),
(744,19,0,32,NULL,4,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1885,1810,'right','event-play'),
(750,11,0,22,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2472,2629,'left','event-play'),
(752,10,0,26,NULL,4,'top',1,NULL,NULL,1269,264,NULL,1,1,NULL,0,1364,265,'right','event-play'),
(754,16,0,34,NULL,4,'top',0,NULL,NULL,NULL,2140,NULL,NULL,1,NULL,NULL,2238,2118,'right','event-play'),
(756,6,0,8,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2716,2859,'right','event-play'),
(758,8,0,4,NULL,1,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3169,3346,'left','event-play'),
(760,14,0,27,NULL,3,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1981,536,'left','event-play'),
(762,16,0,35,NULL,4,'top',1,NULL,NULL,NULL,2140,NULL,NULL,1,NULL,NULL,2238,2117,'right','event-play'),
(764,12,0,33,NULL,5,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1168,'left','event-play'),
(766,11,0,23,NULL,3,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2472,2647,'left','event-play'),
(768,12,0,34,NULL,5,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1027,1186,'right','event-play'),
(771,7,0,32,NULL,4,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1516,251,'left','event-play'),
(773,19,0,33,NULL,4,'top',2,NULL,NULL,1810,NULL,NULL,1,NULL,NULL,0,1885,1833,'right','event-play'),
(808,8,0,6,NULL,1,'bottom',1,NULL,NULL,3334,NULL,NULL,1,NULL,NULL,0,3169,3350,'right','event-play'),
(776,15,0,30,NULL,4,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,160,234,'right','event-play'),
(778,7,0,33,NULL,4,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1516,252,'right','event-play'),
(833,8,0,7,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3298,3242,'left','event-play'),
(780,8,0,5,NULL,1,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3169,3334,'right','event-play'),
(782,10,0,27,NULL,4,'top',1,NULL,NULL,NULL,265,1269,NULL,1,1,0,1364,267,'right','event-play'),
(852,15,0,33,NULL,4,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,819,939,'left','event-play'),
(788,15,0,31,NULL,4,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,160,827,'right','event-play'),
(878,17,0,9,NULL,1,'bottom',2,NULL,NULL,3072,NULL,3114,1,NULL,1,0,2955,3090,'left','event-play'),
(790,17,0,5,NULL,1,'bottom',0,NULL,NULL,3100,NULL,NULL,1,NULL,NULL,NULL,2955,3095,'right','event-play'),
(792,11,0,24,NULL,3,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2472,2643,'right','event-play'),
(794,15,0,32,NULL,4,'top',2,NULL,NULL,827,NULL,NULL,1,NULL,NULL,0,160,855,'right','event-play'),
(953,6,0,13,NULL,2,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2836,2731,'right','event-play'),
(796,6,0,9,NULL,1,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2716,193,'right','event-play'),
(800,19,0,34,NULL,4,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1771,1892,'right','event-play'),
(802,14,0,28,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,475,2007,'left','event-play'),
(804,7,0,34,NULL,4,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1516,255,'left','event-play'),
(806,12,0,35,NULL,6,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1039,'right','event-play'),
(812,19,0,35,NULL,4,'bottom',0,NULL,NULL,1892,NULL,NULL,1,NULL,NULL,NULL,1771,1885,'right','event-play'),
(814,11,0,25,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2597,2549,'left','event-play'),
(884,14,0,31,NULL,4,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1981,517,'left','event-play'),
(818,14,0,29,NULL,4,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,475,2014,'left','event-play'),
(820,6,0,10,NULL,1,'bottom',1,NULL,NULL,193,NULL,NULL,1,NULL,NULL,NULL,2716,2879,'left','event-play'),
(822,12,0,37,NULL,6,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1142,1054,'right','event-play'),
(845,19,0,37,NULL,4,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1771,1909,'left','event-play'),
(825,10,0,29,NULL,4,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1422,'left','event-play'),
(827,19,0,36,NULL,4,'bottom',1,NULL,NULL,1885,NULL,NULL,1,NULL,NULL,0,1771,1920,'right','event-play'),
(829,17,0,6,NULL,1,'bottom',1,NULL,NULL,3100,NULL,NULL,1,NULL,NULL,NULL,2955,3104,'right','event-play'),
(1112,13,0,32,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2358,413,'right','event-play'),
(831,13,0,18,NULL,3,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2358,400,'left','event-play'),
(835,16,0,37,NULL,4,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2117,287,'right','event-play'),
(837,7,0,35,NULL,5,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1656,1539,'left','event-play'),
(839,14,0,30,NULL,4,'top',1,NULL,NULL,2014,NULL,NULL,1,NULL,NULL,0,475,2057,'left','event-play'),
(841,10,0,30,NULL,4,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1371,'left','event-play'),
(843,8,0,8,NULL,2,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3298,3192,'right','event-play'),
(848,17,0,7,NULL,1,'bottom',2,NULL,NULL,3104,NULL,NULL,1,NULL,NULL,NULL,2955,3114,'left','event-play'),
(850,8,0,9,NULL,2,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3298,3184,'left','event-play'),
(854,6,0,11,NULL,1,'bottom',1,NULL,NULL,2879,193,NULL,1,1,NULL,NULL,2716,191,'left','event-play'),
(856,16,0,38,NULL,4,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2117,288,'left','event-play'),
(858,11,0,26,NULL,4,'top',0,NULL,NULL,NULL,2549,NULL,NULL,1,NULL,0,2597,2495,'left','event-play'),
(967,12,0,42,NULL,6,'bottom',2,NULL,NULL,1209,NULL,NULL,1,NULL,NULL,0,1027,1191,'right','event-play'),
(860,12,0,38,NULL,6,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1027,1174,'left','event-play'),
(862,19,0,38,NULL,4,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1771,1903,'left','event-play'),
(864,7,0,36,NULL,5,'top',0,NULL,NULL,NULL,1539,NULL,NULL,1,NULL,NULL,1656,1571,'left','event-play'),
(866,16,0,39,NULL,4,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2117,2238,'left','event-play'),
(868,10,0,31,NULL,4,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1255,1387,'left','event-play'),
(870,17,0,8,NULL,1,'bottom',2,NULL,NULL,3114,NULL,3104,1,NULL,1,0,2955,3072,'right','event-play'),
(872,11,0,27,NULL,4,'top',0,NULL,NULL,2495,NULL,NULL,1,NULL,NULL,0,2597,2512,'right','event-play'),
(874,13,0,19,NULL,3,'top',1,NULL,NULL,400,NULL,NULL,1,NULL,NULL,NULL,2358,381,'left','event-play'),
(876,13,0,20,NULL,3,'top',2,NULL,NULL,NULL,400,NULL,NULL,1,NULL,NULL,2358,395,'right','event-play'),
(1142,7,0,47,NULL,5,'bottom',2,NULL,NULL,NULL,246,NULL,NULL,1,NULL,0,1516,250,'right','event-play'),
(880,7,0,37,NULL,5,'top',0,NULL,NULL,1571,NULL,1539,1,NULL,1,NULL,1656,1551,'right','event-play'),
(911,13,0,25,NULL,3,'top',2,NULL,NULL,357,376,NULL,1,1,NULL,0,2358,426,'left','event-play'),
(882,13,0,21,NULL,3,'top',2,NULL,NULL,NULL,NULL,400,NULL,NULL,1,0,2358,395,'right','event-play'),
(925,15,0,36,NULL,4,'bottom',2,NULL,NULL,NULL,939,NULL,NULL,1,NULL,0,819,932,'right','event-play'),
(886,15,0,34,NULL,4,'bottom',0,NULL,NULL,939,NULL,NULL,1,NULL,NULL,NULL,819,967,'right','event-play'),
(888,8,0,10,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3169,3319,'right','event-play'),
(890,13,0,22,NULL,3,'top',2,NULL,NULL,NULL,395,NULL,NULL,1,NULL,0,2358,403,'left','event-play'),
(1146,10,0,42,NULL,6,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364,264,'left','event-play'),
(892,10,0,32,NULL,4,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1255,1458,'right','event-play'),
(894,11,0,28,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2597,2528,'left','event-play'),
(896,7,0,38,NULL,5,'top',1,NULL,NULL,NULL,NULL,1539,NULL,NULL,1,NULL,1656,1551,'right','event-play'),
(943,8,0,13,NULL,2,'bottom',2,NULL,NULL,3362,NULL,NULL,1,NULL,NULL,0,3169,3321,'left','event-play'),
(898,8,0,11,NULL,2,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3169,3362,'left','event-play'),
(900,12,0,39,NULL,6,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1027,1196,'left','event-play'),
(902,13,0,23,NULL,3,'top',2,NULL,NULL,NULL,403,NULL,NULL,1,NULL,0,2358,376,'left','event-play'),
(904,19,0,39,NULL,5,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1885,1807,'left','event-play'),
(1190,14,0,40,NULL,5,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1981,541,'left','event-play'),
(906,14,0,32,NULL,4,'bottom',0,NULL,NULL,517,NULL,NULL,1,NULL,NULL,NULL,1981,513,'left','event-play'),
(908,15,0,35,NULL,4,'bottom',0,NULL,NULL,967,939,NULL,1,1,NULL,NULL,819,943,'left','event-play'),
(913,19,0,40,NULL,5,'top',0,NULL,NULL,1807,NULL,NULL,1,NULL,NULL,NULL,1885,1777,'right','event-play'),
(915,8,0,12,NULL,2,'bottom',1,NULL,NULL,3362,NULL,NULL,1,NULL,NULL,NULL,3169,3363,'right','event-play'),
(917,16,0,40,NULL,5,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2238,2139,'left','event-play'),
(919,7,0,39,NULL,5,'top',1,NULL,NULL,1551,NULL,1539,1,NULL,1,NULL,1656,1608,'left','event-play'),
(921,12,0,40,NULL,6,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1027,1216,'left','event-play'),
(939,11,0,31,NULL,4,'top',2,NULL,NULL,2484,NULL,NULL,1,NULL,NULL,0,2597,2472,'left','event-play'),
(929,11,0,29,NULL,4,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2597,2484,'right','event-play'),
(931,12,0,41,NULL,6,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1027,1209,'left','event-play'),
(933,11,0,30,NULL,4,'top',1,NULL,NULL,2484,NULL,NULL,1,NULL,NULL,0,2597,2517,'right','event-play'),
(963,17,0,13,NULL,2,'top',2,NULL,NULL,220,NULL,NULL,1,NULL,NULL,0,3051,228,'right','event-play'),
(935,17,0,11,NULL,2,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3051,220,'right','event-play'),
(941,13,0,26,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,349,2358,'left','event-play'),
(993,19,0,43,NULL,5,'top',2,NULL,NULL,1812,NULL,NULL,1,NULL,NULL,0,1885,1803,'right','event-play'),
(945,19,0,41,NULL,5,'top',0,NULL,NULL,1777,1807,NULL,1,1,NULL,NULL,1885,1771,'left','event-play'),
(947,16,0,41,NULL,5,'top',0,NULL,NULL,2139,NULL,NULL,1,NULL,NULL,NULL,2238,2185,'right','event-play'),
(949,17,0,12,NULL,2,'top',1,NULL,NULL,220,NULL,NULL,1,NULL,NULL,NULL,3051,2980,'right','event-play'),
(951,15,0,37,NULL,5,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,160,845,'right','event-play'),
(1053,14,0,35,NULL,4,'bottom',2,NULL,NULL,496,517,NULL,1,1,NULL,0,1981,493,'left','event-play'),
(955,14,0,33,NULL,4,'bottom',1,NULL,NULL,517,NULL,NULL,1,NULL,NULL,NULL,1981,496,'left','event-play'),
(957,7,0,40,NULL,5,'top',2,NULL,NULL,1551,NULL,1539,1,NULL,1,0,1656,1547,'right','event-play'),
(1079,13,0,31,NULL,3,'bottom',2,NULL,NULL,NULL,2380,2378,NULL,1,1,0,349,2373,'left','event-play'),
(959,13,0,27,NULL,3,'bottom',0,NULL,NULL,NULL,2358,NULL,NULL,1,NULL,NULL,349,2374,'right','event-play'),
(961,8,0,14,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3298,3197,'right','event-play'),
(965,19,0,42,NULL,5,'top',2,NULL,NULL,NULL,NULL,1807,NULL,NULL,1,0,1885,1812,'right','event-play'),
(969,14,0,34,NULL,4,'bottom',1,NULL,NULL,496,517,NULL,1,1,NULL,NULL,1981,501,'right','event-play'),
(971,11,0,32,NULL,4,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2472,2652,'right','event-play'),
(973,7,0,41,NULL,5,'top',2,NULL,NULL,1547,NULL,1551,1,NULL,1,0,1656,1542,'left','event-play'),
(975,10,0,34,NULL,5,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364,1255,'left','event-play'),
(977,8,0,15,NULL,3,'top',0,NULL,NULL,3197,NULL,NULL,1,NULL,NULL,NULL,3298,3216,'left','event-play'),
(1200,6,1,NULL,NULL,3,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2836,NULL,NULL,'event-play'),
(979,6,0,14,NULL,2,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2836,2745,'right','event-play'),
(981,16,0,42,NULL,5,'top',1,NULL,NULL,2139,NULL,NULL,1,NULL,NULL,0,2238,2130,'left','event-play'),
(983,12,0,43,NULL,7,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1142,1095,'right','event-play'),
(987,13,0,28,NULL,3,'bottom',1,NULL,NULL,NULL,NULL,2358,NULL,NULL,1,NULL,349,2378,'left','event-play'),
(1005,15,0,40,NULL,5,'top',2,NULL,NULL,NULL,NULL,845,NULL,NULL,1,0,160,122,'right','event-play'),
(989,15,0,38,NULL,5,'top',0,NULL,NULL,NULL,845,NULL,NULL,1,NULL,NULL,160,232,'left','event-play'),
(991,16,0,43,NULL,5,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2238,2162,'right','event-play'),
(995,10,0,35,NULL,5,'top',0,NULL,NULL,1255,NULL,NULL,1,NULL,NULL,NULL,1364,261,'left','event-play'),
(1047,6,0,19,NULL,2,'top',2,NULL,NULL,153,2762,NULL,1,1,NULL,0,2836,2782,'left','event-play'),
(997,6,0,15,NULL,2,'top',1,NULL,NULL,NULL,2745,NULL,NULL,1,NULL,0,2836,2739,'left','event-play'),
(999,11,0,33,NULL,4,'bottom',0,NULL,NULL,NULL,2652,NULL,NULL,1,NULL,NULL,2472,2665,'right','event-play'),
(1001,15,0,39,NULL,5,'top',1,NULL,NULL,NULL,NULL,845,NULL,NULL,1,NULL,160,236,'left','event-play'),
(1003,10,0,36,NULL,5,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364,1281,'left','event-play'),
(1007,12,0,44,NULL,7,'top',0,NULL,NULL,1095,NULL,NULL,1,NULL,NULL,0,1142,1044,'right','event-play'),
(1009,11,0,34,NULL,4,'bottom',1,NULL,NULL,NULL,2652,NULL,NULL,1,NULL,NULL,2472,2624,'left','event-play'),
(1085,17,0,18,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3051,224,'right','event-play'),
(1011,17,0,14,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2955,3066,'right','event-play'),
(1013,16,0,44,NULL,5,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2238,2159,'left','event-play'),
(1015,10,0,37,NULL,5,'top',2,NULL,NULL,1281,NULL,NULL,1,NULL,NULL,0,1364,263,'right','event-play'),
(1017,17,0,15,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2955,3076,'right','event-play'),
(1019,8,0,16,NULL,3,'top',1,NULL,NULL,3197,NULL,NULL,1,NULL,NULL,NULL,3298,3202,'right','event-play'),
(1021,6,0,16,NULL,2,'top',1,NULL,NULL,NULL,2739,NULL,NULL,1,NULL,0,2836,2762,'left','event-play'),
(1023,17,0,16,NULL,2,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2955,3051,'left','event-play'),
(1025,6,0,17,NULL,2,'top',1,NULL,NULL,NULL,2762,NULL,NULL,1,NULL,0,2836,2737,'left','event-play'),
(1027,13,0,29,NULL,3,'bottom',1,NULL,NULL,2378,NULL,2358,1,NULL,1,NULL,349,2381,'left','event-play'),
(1193,11,1,NULL,NULL,4,'bottom',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2457,NULL,NULL,'event-play'),
(1029,11,0,35,NULL,4,'bottom',1,NULL,NULL,2624,NULL,2652,1,NULL,1,NULL,2472,2615,'right','event-play'),
(1031,12,0,45,NULL,7,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1142,1079,'left','event-play'),
(1033,19,0,44,NULL,5,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1771,1914,'right','event-play'),
(1035,7,0,43,NULL,5,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1516,256,'left','event-play'),
(1037,17,0,17,NULL,2,'bottom',1,NULL,NULL,3051,NULL,NULL,1,NULL,NULL,0,2955,3100,'right','event-play'),
(1039,6,0,18,NULL,2,'top',2,NULL,NULL,NULL,2762,NULL,NULL,1,NULL,0,2836,153,'right','event-play'),
(1160,7,0,48,NULL,6,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1656,1602,'left','event-play'),
(1041,7,0,44,NULL,5,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1516,1677,'left','event-play'),
(1043,8,0,17,NULL,3,'top',2,NULL,NULL,3197,NULL,NULL,1,NULL,NULL,0,3298,3203,'right','event-play'),
(1045,10,0,38,NULL,5,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1414,'right','event-play'),
(1139,12,1,NULL,NULL,7,'top',1,NULL,NULL,1099,NULL,NULL,1,NULL,NULL,2,1142,NULL,NULL,'event-play'),
(1049,12,0,46,NULL,7,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1142,1099,'right','event-play'),
(1051,19,0,45,NULL,5,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1771,1938,'left','event-play'),
(1055,16,0,45,NULL,5,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2117,279,'right','event-play'),
(1057,15,0,41,NULL,5,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,819,963,'left','event-play'),
(1059,19,0,46,NULL,5,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1771,1902,'right','event-play'),
(1061,13,0,30,NULL,3,'bottom',2,NULL,NULL,2378,NULL,2358,1,NULL,1,0,349,2380,'right','event-play'),
(1063,11,0,36,NULL,4,'bottom',1,NULL,NULL,2615,2624,2652,1,1,1,NULL,2457,2663,'left','event-play'),
(1065,19,0,47,NULL,5,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1771,1922,'left','event-play'),
(1067,7,0,45,NULL,5,'bottom',1,NULL,NULL,1677,NULL,NULL,1,NULL,NULL,0,1516,246,'right','event-play'),
(1069,15,0,42,NULL,5,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,819,162,'left','event-play'),
(1071,10,0,39,NULL,5,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1364,'right','event-play'),
(1073,8,0,18,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3169,3304,'right','event-play'),
(1075,6,0,20,NULL,2,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2716,2854,'left','event-play'),
(1077,16,0,46,NULL,5,'bottom',0,NULL,NULL,279,NULL,NULL,1,NULL,NULL,NULL,2117,280,'left','event-play'),
(1081,7,0,46,NULL,5,'bottom',1,NULL,NULL,NULL,246,NULL,NULL,1,NULL,0,1516,249,'right','event-play'),
(1083,14,0,36,NULL,4,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1981,500,'right','event-play'),
(1088,15,0,43,NULL,5,'bottom',1,NULL,NULL,162,NULL,NULL,1,NULL,NULL,NULL,819,955,'right','event-play'),
(1090,16,0,47,NULL,5,'bottom',0,NULL,NULL,NULL,279,NULL,NULL,1,NULL,NULL,2117,280,'left','event-play'),
(1092,8,0,19,NULL,3,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3169,3360,'left','event-play'),
(1170,15,0,48,NULL,5,'bottom',2,NULL,NULL,952,955,NULL,1,1,NULL,0,819,939,'left','event-play'),
(1094,15,0,44,NULL,5,'bottom',1,NULL,NULL,NULL,162,NULL,NULL,1,NULL,NULL,819,955,'right','event-play'),
(1096,17,0,19,NULL,3,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3051,2955,'right','event-play'),
(1098,8,0,20,NULL,3,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3169,3346,'left','event-play'),
(1102,17,0,20,NULL,3,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3051,216,'left','event-play'),
(1104,10,0,40,NULL,5,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1255,1423,'left','event-play'),
(1106,6,0,21,NULL,2,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2716,2891,'right','event-play'),
(1108,14,0,37,NULL,5,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,475,2040,'right','event-play'),
(1110,15,0,45,NULL,5,'bottom',1,NULL,NULL,955,NULL,162,1,NULL,1,NULL,819,231,'left','event-play'),
(1114,11,0,37,NULL,4,'bottom',2,NULL,NULL,2615,2624,2652,1,1,1,0,2457,2597,'right','event-play'),
(1116,16,0,48,NULL,5,'bottom',0,NULL,NULL,280,279,NULL,1,1,NULL,0,2117,281,'right','event-play'),
(1118,8,0,21,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3298,3217,'left','event-play'),
(1202,13,1,NULL,NULL,4,'top',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2331,NULL,NULL,'event-play'),
(1120,13,0,33,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2358,349,'left','event-play'),
(1122,6,0,22,NULL,2,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2716,2846,'right','event-play'),
(1209,17,0,25,NULL,4,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3051,223,'right','event-play'),
(1124,17,0,21,NULL,3,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2955,3095,'right','event-play'),
(1126,8,0,22,NULL,4,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3298,3234,'right','event-play'),
(1197,16,1,NULL,NULL,5,'bottom',1,NULL,NULL,290,285,283,1,1,1,3,2108,NULL,NULL,'event-play'),
(1128,16,0,49,NULL,5,'bottom',0,NULL,NULL,NULL,281,280,NULL,1,1,0,2117,283,'left','event-play'),
(1204,19,0,54,NULL,6,'top',2,NULL,NULL,1833,1788,NULL,1,1,NULL,0,1885,1777,'right','event-play'),
(1130,13,0,34,NULL,4,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2358,400,'left','event-play'),
(1132,10,0,41,NULL,6,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364,263,'right','event-play'),
(1134,15,0,46,NULL,5,'bottom',2,NULL,NULL,955,NULL,162,1,NULL,1,0,819,952,'right','event-play'),
(1136,19,0,49,NULL,6,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1885,1814,'right','event-play'),
(1138,14,0,38,NULL,5,'top',0,NULL,NULL,2040,NULL,NULL,1,NULL,NULL,NULL,475,2032,'left','event-play'),
(1140,12,0,47,NULL,7,'top',1,NULL,NULL,1099,NULL,NULL,1,NULL,NULL,0,1142,1036,'right','event-play'),
(1144,17,0,22,NULL,3,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2955,3104,'right','event-play'),
(1148,10,0,43,NULL,6,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1364,1269,'left','event-play'),
(1150,15,0,47,NULL,5,'bottom',2,NULL,NULL,NULL,955,NULL,NULL,1,NULL,0,819,952,'right','event-play'),
(1152,19,0,50,NULL,6,'top',0,NULL,NULL,1814,NULL,NULL,1,NULL,NULL,NULL,1885,1788,'left','event-play'),
(1154,14,0,39,NULL,5,'top',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,475,2031,'left','event-play'),
(1156,16,0,50,NULL,5,'bottom',0,NULL,NULL,283,281,280,1,1,1,0,2117,285,'right','event-play'),
(1181,8,1,NULL,NULL,4,'top',2,NULL,NULL,3242,NULL,3234,1,NULL,1,NULL,3298,NULL,NULL,'event-play'),
(1158,8,0,23,NULL,4,'top',1,NULL,NULL,NULL,3234,NULL,NULL,1,NULL,NULL,3298,3242,'left','event-play'),
(1203,19,1,NULL,NULL,6,'top',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1885,NULL,NULL,'event-play'),
(1162,19,0,51,NULL,6,'top',0,NULL,NULL,1788,1814,NULL,1,1,NULL,NULL,1885,1810,'right','event-play'),
(1164,13,0,35,NULL,4,'top',1,NULL,NULL,400,NULL,NULL,1,NULL,NULL,0,2331,381,'left','event-play'),
(1166,6,0,23,NULL,3,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2836,2751,'right','event-play'),
(1168,11,0,38,NULL,4,'bottom',2,NULL,NULL,2597,2615,2624,1,1,1,0,2457,2629,'left','event-play'),
(1172,16,0,51,NULL,5,'bottom',0,NULL,NULL,285,283,281,1,1,1,0,2108,290,'left','event-play'),
(1174,17,0,23,NULL,3,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2955,3114,'left','event-play'),
(1176,17,0,24,NULL,3,'bottom',2,NULL,NULL,3114,NULL,NULL,1,NULL,NULL,0,2955,3072,'right','event-play'),
(1178,19,0,52,NULL,6,'top',1,NULL,NULL,1788,1814,NULL,1,1,NULL,0,1885,1833,'right','event-play'),
(1180,10,0,44,NULL,6,'bottom',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1400,'right','event-play'),
(1182,8,0,24,NULL,4,'top',1,NULL,NULL,3242,NULL,3234,1,NULL,1,NULL,3298,3192,'right','event-play'),
(1198,7,1,NULL,NULL,6,'top',2,NULL,NULL,NULL,NULL,1564,NULL,NULL,1,NULL,1656,NULL,NULL,'event-play'),
(1184,7,0,49,NULL,6,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1656,1564,'left','event-play'),
(1186,10,0,45,NULL,6,'bottom',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1255,1422,'left','event-play'),
(1188,15,0,49,NULL,6,'top',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,899,237,'left','event-play'),
(1192,6,0,24,NULL,3,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2836,2735,'left','event-play'),
(1196,19,0,53,NULL,6,'top',1,NULL,NULL,1833,1788,NULL,1,1,NULL,0,1885,1807,'left','event-play'),
(1199,7,0,50,NULL,6,'top',1,NULL,NULL,NULL,1564,NULL,NULL,1,NULL,NULL,1656,1539,'left','event-play'),
(1201,6,0,25,NULL,3,'top',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2836,2731,'right','event-play'),
(1206,10,0,46,NULL,6,'bottom',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1255,1371,'left','event-play');
/*!40000 ALTER TABLE `baseball_event_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseball_offensive_stats`
--

DROP TABLE IF EXISTS `baseball_offensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_offensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `average` float DEFAULT NULL,
  `runs_scored` int(11) DEFAULT NULL,
  `at_bats` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `rbi` int(11) DEFAULT NULL,
  `total_bases` int(11) DEFAULT NULL,
  `slugging_percentage` float DEFAULT NULL,
  `bases_on_balls` int(11) DEFAULT NULL,
  `strikeouts` int(11) DEFAULT NULL,
  `left_on_base` int(11) DEFAULT NULL,
  `left_in_scoring_position` int(11) DEFAULT NULL,
  `singles` int(11) DEFAULT NULL,
  `doubles` int(11) DEFAULT NULL,
  `triples` int(11) DEFAULT NULL,
  `home_runs` int(11) DEFAULT NULL,
  `grand_slams` int(11) DEFAULT NULL,
  `at_bats_per_rbi` float DEFAULT NULL,
  `plate_appearances_per_rbi` float DEFAULT NULL,
  `at_bats_per_home_run` float DEFAULT NULL,
  `plate_appearances_per_home_run` float DEFAULT NULL,
  `sac_flies` int(11) DEFAULT NULL,
  `sac_bunts` int(11) DEFAULT NULL,
  `grounded_into_double_play` int(11) DEFAULT NULL,
  `moved_up` int(11) DEFAULT NULL,
  `on_base_percentage` float DEFAULT NULL,
  `stolen_bases` int(11) DEFAULT NULL,
  `stolen_bases_caught` int(11) DEFAULT NULL,
  `stolen_bases_average` float DEFAULT NULL,
  `hit_by_pitch` int(11) DEFAULT NULL,
  `defensive_interferance_reaches` int(11) DEFAULT NULL,
  `on_base_plus_slugging` float DEFAULT NULL,
  `plate_appearances` int(11) DEFAULT NULL,
  `hits_extra_base` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13888 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseball_offensive_stats`
--

LOCK TABLES `baseball_offensive_stats` WRITE;
/*!40000 ALTER TABLE `baseball_offensive_stats` DISABLE KEYS */;
INSERT INTO `baseball_offensive_stats` VALUES
(1,NULL,2,34,9,2,NULL,NULL,1,7,7,NULL,NULL,0,0,1,0,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(2,NULL,3,29,7,3,NULL,NULL,0,6,5,NULL,NULL,3,1,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,1,0,NULL,1,NULL,NULL,NULL,NULL),
(3,0.313,1,4,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(4,0.214,0,4,2,0,NULL,NULL,0,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(5,0.287,0,3,1,0,NULL,NULL,1,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(6,0.286,1,4,2,1,NULL,NULL,0,0,NULL,NULL,1,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(7,0.339,0,3,0,1,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(8,0.274,0,4,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(9,0.252,0,4,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(10,0.205,0,4,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(11,0.162,0,3,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(12,0.301,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13,0.286,1,4,1,0,NULL,NULL,0,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(14,0.245,0,3,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(15,0.296,2,3,2,0,NULL,NULL,0,0,NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,1,0,NULL,1,NULL,NULL,NULL,NULL),
(16,0.236,0,4,1,1,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(17,0.255,0,4,1,2,NULL,NULL,0,2,NULL,NULL,0,0,1,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(18,0.254,0,3,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(19,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(20,0.244,0,3,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(21,0.2,0,3,2,0,NULL,NULL,0,1,NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(22,0.156,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(23,0.167,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(24,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(25,0.244,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(26,NULL,2,32,5,2,NULL,NULL,5,8,8,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(27,NULL,3,28,6,3,NULL,NULL,4,1,7,NULL,NULL,2,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(28,0.298,0,4,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(29,0.281,0,3,2,2,NULL,NULL,0,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(30,0.27,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(31,0.229,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(32,0.302,0,4,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(33,0.313,0,4,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(34,0.235,0,3,0,0,NULL,NULL,1,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(35,0.27,0,4,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(36,0.259,1,2,1,0,NULL,NULL,2,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(37,0.248,1,3,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(38,0,0,3,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(39,0.284,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(40,0.262,0,3,1,0,NULL,NULL,0,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(41,0.209,1,4,1,1,NULL,NULL,0,1,NULL,NULL,0,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(42,0.212,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(43,0.293,0,3,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(44,0.298,0,3,1,0,NULL,NULL,1,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(45,0.291,1,4,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(46,0.256,0,3,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(47,0.28,1,4,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(48,0.125,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(49,0.228,0,1,1,2,NULL,NULL,0,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(50,0.348,0,2,1,0,NULL,NULL,1,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(51,NULL,1,31,4,1,NULL,NULL,1,11,4,NULL,NULL,2,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(52,NULL,8,38,14,8,NULL,NULL,5,9,12,NULL,NULL,4,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(53,0.284,1,4,1,0,NULL,NULL,0,1,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(54,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(55,0.284,0,4,1,0,NULL,NULL,0,1,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(56,0.318,0,4,0,1,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(57,0.269,0,4,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(58,0.275,0,3,1,0,NULL,NULL,1,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(59,0.288,0,3,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(60,0.302,0,3,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(61,0.139,0,2,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(62,0.278,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(63,0.217,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(64,0,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(65,0.136,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(66,0.167,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(67,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(68,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(69,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(70,0.247,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(71,0.833,2,4,4,0,NULL,NULL,1,0,NULL,NULL,4,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(72,0.29,2,5,3,4,NULL,NULL,0,0,NULL,NULL,1,2,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(73,0.277,1,4,1,1,NULL,NULL,0,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(74,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(75,0.25,0,3,2,1,NULL,NULL,1,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(76,0.246,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(77,0.264,1,5,2,0,NULL,NULL,0,3,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(78,0.251,0,4,0,0,NULL,NULL,1,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(79,0.265,1,4,2,2,NULL,NULL,1,1,NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(80,0.261,1,4,0,0,NULL,NULL,1,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(81,0.138,0,3,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(82,0.264,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(83,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(84,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(85,NULL,12,44,18,11,NULL,NULL,6,9,11,NULL,NULL,4,0,2,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(86,NULL,6,36,9,5,NULL,NULL,6,10,9,NULL,NULL,4,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(87,0.302,1,6,1,0,NULL,NULL,0,1,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(88,0.294,3,2,2,2,NULL,NULL,2,0,NULL,NULL,1,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(89,0.283,0,2,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(90,0.353,1,4,1,1,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(91,0.375,0,2,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(92,0.265,2,4,2,1,NULL,NULL,1,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(93,0,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(94,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(95,0.267,0,3,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(96,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(97,0.196,0,2,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(98,0.272,3,5,4,5,NULL,NULL,0,1,NULL,NULL,2,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(99,0.313,0,3,1,1,NULL,NULL,0,1,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(100,0.247,0,2,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(101,0.276,0,2,0,0,NULL,NULL,1,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(102,0.25,0,2,1,1,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(103,0.236,2,4,2,0,NULL,NULL,1,0,NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(104,0.29,0,2,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(105,0.314,1,2,1,0,NULL,NULL,1,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(106,0.3,0,2,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(107,0.279,2,1,1,0,NULL,NULL,2,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(108,0.293,0,0,0,0,NULL,NULL,2,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(109,0.233,1,3,2,1,NULL,NULL,0,0,NULL,NULL,0,2,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(110,0.286,0,2,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(111,0,0,3,0,2,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(112,0.235,0,2,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(113,0.229,0,3,1,1,NULL,NULL,0,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(114,0.28,0,2,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(115,0.298,1,3,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(116,0.289,1,3,1,0,NULL,NULL,1,2,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(117,0.28,0,2,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(118,0,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(119,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(120,0.259,0,1,1,1,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(121,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(122,0.354,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(123,0.385,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(124,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(125,0.286,0,3,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(126,NULL,2,32,8,2,NULL,NULL,2,9,8,NULL,NULL,2,0,0,0,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,NULL),
(127,NULL,3,31,9,2,NULL,NULL,5,1,9,NULL,NULL,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,2,0,NULL,0,NULL,NULL,NULL,NULL),
(128,0.298,1,4,1,0,NULL,NULL,0,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(129,0.301,0,3,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(130,0.282,0,3,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(131,0.313,0,4,1,1,NULL,NULL,0,2,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(132,0.267,0,4,0,0,NULL,NULL,0,3,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(133,0.271,1,3,1,0,NULL,NULL,1,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,NULL),
(134,0.258,0,4,2,0,NULL,NULL,0,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(135,0.311,0,3,1,1,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(136,0.206,0,3,1,0,NULL,NULL,0,1,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(137,0.273,0,1,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(138,0.229,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(139,0.31,1,4,2,0,NULL,NULL,0,1,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,NULL),
(140,0.305,0,4,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(141,0.298,0,2,0,0,NULL,NULL,2,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(142,0.302,0,3,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(143,0.251,0,3,2,0,NULL,NULL,1,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(144,0.243,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(145,0.277,0,4,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(146,0.333,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(147,0.264,1,4,1,1,NULL,NULL,0,0,NULL,NULL,0,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(148,0.279,1,3,1,0,NULL,NULL,1,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,NULL),
(149,0.19,0,4,1,1,NULL,NULL,0,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(150,NULL,2,33,10,2,NULL,NULL,5,5,10,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,3,NULL,NULL,1,1,NULL,1,NULL,NULL,NULL,NULL),
(151,NULL,11,40,15,11,NULL,NULL,1,5,6,NULL,NULL,0,0,7,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,NULL),
(152,0.243,0,4,1,1,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(153,0.195,0,1,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(154,0.291,0,2,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL),
(155,0.225,0,1,0,0,NULL,NULL,1,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,NULL),
(156,1,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(157,0,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(158,0.287,1,4,1,0,NULL,NULL,1,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(159,0.273,0,4,2,0,NULL,NULL,0,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(160,0.284,0,4,2,0,NULL,NULL,0,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(161,0.667,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(162,0.274,0,4,1,1,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(163,0.226,1,2,0,0,NULL,NULL,2,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(164,0.246,0,1,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(165,0.306,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(166,0.143,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(167,0.232,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(168,0.226,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(169,0.25,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(170,0.222,0,1,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(171,0.332,2,5,3,2,NULL,NULL,0,0,NULL,NULL,2,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(172,0.346,1,4,1,0,NULL,NULL,0,2,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(173,0.167,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(174,0.287,2,4,2,4,NULL,NULL,1,0,NULL,NULL,0,0,0,2,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(175,0.263,2,5,2,1,NULL,NULL,0,0,NULL,NULL,1,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,NULL),
(176,0.26,2,5,2,3,NULL,NULL,0,0,NULL,NULL,0,0,0,2,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(177,0.182,0,4,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(178,0.205,0,4,1,0,NULL,NULL,0,2,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(179,0.286,0,4,2,0,NULL,NULL,0,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(180,0.125,1,2,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(181,0.225,1,1,1,1,NULL,NULL,0,0,NULL,NULL,0,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(182,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(183,0.296,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(184,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(185,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(186,NULL,5,30,6,5,NULL,NULL,0,10,0,NULL,NULL,1,1,2,0,NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL,NULL),
(187,NULL,6,32,7,6,NULL,NULL,1,6,4,NULL,NULL,1,0,3,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,2,NULL,NULL,NULL,NULL),
(188,0.29,1,4,1,0,NULL,NULL,0,2,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(189,0.306,0,3,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(190,0.269,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(191,0.326,1,4,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(192,0.298,2,4,2,4,NULL,NULL,0,0,NULL,NULL,0,0,0,2,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(193,0.267,0,4,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(194,0.22,0,2,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(195,0.226,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL),
(196,0.211,0,3,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(197,0.28,1,3,1,0,NULL,NULL,0,0,NULL,NULL,0,0,1,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(198,0.364,0,2,0,1,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(199,0.274,2,4,2,1,NULL,NULL,0,0,NULL,NULL,0,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(200,0.239,0,3,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(201,0.267,1,0,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(202,0.307,2,4,3,4,NULL,NULL,0,0,NULL,NULL,1,0,0,2,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(203,0.274,0,4,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(204,0.273,0,2,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(205,0.269,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(206,0.077,1,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(207,0.211,0,3,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(208,0.2,0,3,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(209,0.259,0,1,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(210,0.217,0,2,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(211,0.274,0,2,1,1,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(212,0.245,0,3,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(213,NULL,8,34,9,6,NULL,NULL,4,10,7,NULL,NULL,1,0,3,0,NULL,NULL,NULL,NULL,2,NULL,0,NULL,NULL,2,0,NULL,1,NULL,NULL,NULL,NULL),
(214,NULL,14,37,14,14,NULL,NULL,3,4,2,NULL,NULL,2,0,3,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,2,0,NULL,0,NULL,NULL,NULL,NULL),
(215,0.28,1,4,2,0,NULL,NULL,1,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,NULL),
(216,0.288,2,2,1,1,NULL,NULL,2,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,NULL),
(217,0.282,1,5,1,0,NULL,NULL,0,4,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(218,0.248,1,4,1,3,NULL,NULL,0,2,NULL,NULL,0,0,0,1,0,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(219,0.25,0,4,0,0,NULL,NULL,1,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(220,0.288,1,5,1,1,NULL,NULL,0,2,NULL,NULL,0,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(221,0.299,1,2,2,1,NULL,NULL,0,0,NULL,NULL,0,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(222,0.222,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(223,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(224,0.198,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(225,0.244,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(226,0.102,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(227,0.269,1,3,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(228,0.07,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(229,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(230,0.249,0,2,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(231,0.818,3,5,4,0,NULL,NULL,0,0,NULL,NULL,4,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,2,0,NULL,0,NULL,NULL,NULL,NULL),
(232,0.291,3,3,1,1,NULL,NULL,2,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(233,0.279,3,5,3,2,NULL,NULL,0,0,NULL,NULL,1,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(234,0.253,2,3,2,4,NULL,NULL,1,0,NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(235,0.067,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(236,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(237,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(238,0.244,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(239,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(240,0.265,1,4,2,3,NULL,NULL,0,0,NULL,NULL,1,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(241,0.261,1,4,0,1,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(242,0.059,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(243,0.264,0,4,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(244,0.261,1,4,1,3,NULL,NULL,0,0,NULL,NULL,0,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(245,0.148,0,2,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(246,0,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(247,0.257,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(248,0.245,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(249,NULL,5,28,6,5,NULL,NULL,8,5,5,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,2,NULL,NULL,0,2,NULL,0,NULL,NULL,NULL,NULL),
(250,NULL,1,30,4,1,NULL,NULL,2,7,5,NULL,NULL,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(251,0.284,1,4,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(252,0.278,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(253,0.22,0,4,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL),
(254,0.282,0,4,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(255,0.317,2,1,0,0,NULL,NULL,3,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(256,0.231,2,3,1,1,NULL,NULL,1,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(257,0.271,0,2,2,3,NULL,NULL,2,0,NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL),
(258,0.285,0,4,0,1,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(259,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(260,0.167,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(261,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(262,0.214,0,2,0,0,NULL,NULL,2,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(263,0.143,0,2,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(264,0.2,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(265,0.275,0,4,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(266,0.264,0,4,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(267,0.282,0,4,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(268,0.318,0,4,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(269,0.273,1,4,2,1,NULL,NULL,0,1,NULL,NULL,1,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(270,0.226,0,4,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(271,0.169,0,3,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(272,0.256,0,1,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(273,0.282,0,0,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(274,0.16,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(275,0.13,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(276,0.2,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(277,0.22,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(278,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(279,NULL,1,31,7,1,NULL,NULL,1,6,5,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(280,NULL,11,31,10,10,NULL,NULL,7,4,5,NULL,NULL,2,1,1,0,NULL,NULL,NULL,NULL,1,NULL,2,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(281,0.301,1,3,2,0,NULL,NULL,1,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(282,0.293,0,4,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(283,0.328,0,2,1,1,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(284,0,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(285,0.311,0,3,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(286,0.324,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(287,0.274,0,2,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(288,0.274,0,2,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(289,0.289,0,2,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(290,0,0,2,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(291,0.277,0,3,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(292,0.286,0,2,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(293,0.263,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(294,0.255,0,3,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(295,0.276,4,2,1,0,NULL,NULL,2,0,NULL,NULL,0,0,1,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(296,0.231,0,1,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(297,0.28,0,3,1,2,NULL,NULL,2,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(298,0.249,2,3,2,4,NULL,NULL,1,1,NULL,NULL,0,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(299,0.273,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(300,0.281,1,3,1,3,NULL,NULL,0,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(301,0.25,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(302,0.275,0,3,1,1,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(303,0.261,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(304,0.287,0,4,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(305,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(306,0.257,1,4,2,0,NULL,NULL,0,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(307,0.243,2,1,0,0,NULL,NULL,2,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(308,0.214,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(309,0.244,1,3,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(310,NULL,4,36,9,4,NULL,NULL,5,7,10,NULL,NULL,3,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL),
(311,NULL,3,34,7,3,NULL,NULL,2,4,6,NULL,NULL,5,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(312,0.27,0,5,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL),
(313,0.324,1,4,0,0,NULL,NULL,1,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(314,0.262,0,4,0,0,NULL,NULL,1,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(315,0.311,1,4,2,1,NULL,NULL,1,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(316,0.333,0,5,1,2,NULL,NULL,0,2,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(317,0.283,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(318,0.299,1,4,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(319,0.206,0,3,1,0,NULL,NULL,1,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(320,0.275,0,3,2,0,NULL,NULL,1,1,NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(321,0.224,1,4,1,1,NULL,NULL,0,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(322,0.304,1,2,1,0,NULL,NULL,2,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(323,0.264,0,4,2,1,NULL,NULL,0,0,NULL,NULL,0,2,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(324,0.291,0,4,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(325,0.295,0,4,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(326,0.278,0,4,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(327,0.29,0,4,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(328,0.215,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(329,0.256,1,4,1,0,NULL,NULL,0,1,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(330,0.228,1,4,1,1,NULL,NULL,0,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(331,0.34,0,4,1,1,NULL,NULL,0,3,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(332,NULL,2,32,7,2,NULL,NULL,4,11,9,NULL,NULL,0,0,2,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(333,NULL,3,31,8,3,NULL,NULL,3,10,8,NULL,NULL,0,0,2,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(334,0.284,0,4,0,0,NULL,NULL,1,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(335,0.244,0,5,1,0,NULL,NULL,0,2,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(336,0.294,0,4,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(337,0.238,1,4,2,1,NULL,NULL,0,2,NULL,NULL,1,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(338,0.256,0,3,1,0,NULL,NULL,1,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(339,0.242,1,3,1,1,NULL,NULL,1,1,NULL,NULL,0,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(340,0.244,0,4,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(341,0.233,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(342,0.191,0,2,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(343,0.245,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(344,0,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(345,0.261,0,1,1,0,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(346,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(347,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(348,0.228,0,1,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(349,0.253,0,3,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(350,0.247,0,4,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(351,0.323,1,4,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(352,0.29,0,3,1,0,NULL,NULL,1,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(353,0.291,0,4,3,1,NULL,NULL,0,0,NULL,NULL,3,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(354,0.274,0,4,0,0,NULL,NULL,0,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(355,0.272,1,3,1,1,NULL,NULL,1,1,NULL,NULL,0,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(356,0.29,1,4,1,1,NULL,NULL,0,2,NULL,NULL,0,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(357,0.135,0,2,1,0,NULL,NULL,0,1,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(358,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(359,0.244,0,0,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(360,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(361,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(362,NULL,9,36,11,8,NULL,NULL,4,5,4,NULL,NULL,2,0,4,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(363,NULL,4,33,8,4,NULL,NULL,1,3,4,NULL,NULL,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL,NULL),
(364,0.283,0,5,2,1,NULL,NULL,0,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(365,0.296,2,5,2,2,NULL,NULL,0,0,NULL,NULL,0,0,0,2,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(366,0.29,1,5,1,0,NULL,NULL,0,2,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(367,0.245,2,5,2,1,NULL,NULL,0,1,NULL,NULL,1,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(368,0.243,0,3,0,0,NULL,NULL,1,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(369,0.237,0,0,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(370,0.282,1,3,0,0,NULL,NULL,1,1,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(371,0.297,1,3,1,4,NULL,NULL,1,0,NULL,NULL,0,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(372,0.222,1,4,2,0,NULL,NULL,0,1,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(373,0.253,1,3,1,0,NULL,NULL,1,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(374,0.3,0,4,1,1,NULL,NULL,0,0,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(375,0.322,0,4,2,0,NULL,NULL,0,1,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL),
(376,0.265,1,4,2,0,NULL,NULL,0,0,NULL,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(377,0.333,1,3,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,1,NULL,NULL,NULL,NULL),
(378,0.258,1,3,2,3,NULL,NULL,1,0,NULL,NULL,1,0,0,1,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(379,0.266,0,4,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(380,0.309,1,4,1,0,NULL,NULL,0,0,NULL,NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(381,0.223,0,3,0,0,NULL,NULL,0,2,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(382,0.333,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(383,0.297,0,2,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(384,0.255,0,1,0,0,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL),
(385,NULL,2,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(386,NULL,3,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(387,0.313,1,4,1,0,NULL,0.433,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.369,0,0,NULL,0,NULL,NULL,NULL,NULL),
(388,0.214,0,4,2,0,NULL,0.286,0,0,NULL,NULL,2,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.261,0,0,NULL,0,NULL,NULL,NULL,NULL),
(389,0.287,0,3,1,0,NULL,0.424,1,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.334,0,0,NULL,0,NULL,NULL,NULL,NULL),
(390,0.286,1,4,2,1,NULL,0.431,0,0,NULL,NULL,1,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.315,0,0,NULL,0,NULL,NULL,NULL,NULL),
(391,0.339,0,3,0,1,NULL,0.484,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,1,NULL,0,NULL,0.353,0,0,NULL,0,NULL,NULL,NULL,NULL),
(392,0.274,0,4,1,0,NULL,0.416,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.343,0,0,NULL,0,NULL,NULL,NULL,NULL),
(393,0.252,0,4,1,0,NULL,0.378,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.29,0,0,NULL,0,NULL,NULL,NULL,NULL),
(394,0.205,0,4,1,0,NULL,0.246,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.269,0,0,NULL,0,NULL,NULL,NULL,NULL),
(395,0.162,0,3,0,0,NULL,0.206,0,2,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.197,0,0,NULL,0,NULL,NULL,NULL,NULL),
(396,0.301,0,1,0,0,NULL,0.493,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.37,0,0,NULL,0,NULL,NULL,NULL,NULL),
(397,0.286,1,4,1,0,NULL,0.489,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.323,0,0,NULL,0,NULL,NULL,NULL,NULL),
(398,0.245,0,3,0,0,NULL,0.307,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.348,0,0,NULL,0,NULL,NULL,NULL,NULL),
(399,0.296,2,3,2,0,NULL,0.449,0,0,NULL,NULL,1,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.378,1,0,NULL,1,NULL,NULL,NULL,NULL),
(400,0.236,0,4,1,1,NULL,0.506,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.384,0,0,NULL,0,NULL,NULL,NULL,NULL),
(401,0.255,0,4,1,2,NULL,0.468,0,2,NULL,NULL,0,0,1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.36,0,0,NULL,0,NULL,NULL,NULL,NULL),
(402,0.254,0,3,0,0,NULL,0.416,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.323,0,0,NULL,0,NULL,NULL,NULL,NULL),
(403,0,0,0,0,0,NULL,0,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(404,0.244,0,3,0,0,NULL,0.432,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.31,0,0,NULL,0,NULL,NULL,NULL,NULL),
(405,0.2,0,3,2,0,NULL,0.289,0,1,NULL,NULL,1,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.26,0,0,NULL,0,NULL,NULL,NULL,NULL),
(406,0.156,0,1,0,0,NULL,0.178,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.224,0,0,NULL,0,NULL,NULL,NULL,NULL),
(407,0.167,0,1,0,0,NULL,0.167,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.167,0,0,NULL,0,NULL,NULL,NULL,NULL),
(408,0,0,0,0,0,NULL,0,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(409,0.244,0,0,0,0,NULL,0.473,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.357,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3627,NULL,12,NULL,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3628,NULL,6,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3629,0.302,1,6,1,0,NULL,0.411,0,1,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.361,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3630,0.294,3,2,2,2,NULL,0.578,2,0,NULL,NULL,1,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.369,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3632,0.353,1,4,1,1,NULL,0.641,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.457,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3634,0.265,2,4,2,1,NULL,0.362,1,0,NULL,NULL,2,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.329,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3637,0.267,0,3,0,0,NULL,0.472,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.368,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3640,0.272,3,5,4,5,NULL,0.347,0,1,NULL,NULL,2,1,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.311,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3641,0.313,0,3,1,1,NULL,0.398,0,1,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.351,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3643,0.276,0,2,0,0,NULL,0.362,1,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.295,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3645,0.236,2,4,2,0,NULL,0.389,1,0,NULL,NULL,1,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.311,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3646,0.29,0,2,1,0,NULL,0.554,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.353,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3648,0.3,0,2,0,0,NULL,0.354,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.377,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3650,0.293,0,0,0,0,NULL,0.462,2,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.362,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3652,0.286,0,2,0,0,NULL,0.514,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.377,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3654,0.235,0,2,0,0,NULL,0.477,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.345,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3656,0.28,0,2,0,0,NULL,0.47,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.373,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3658,0.289,1,3,1,0,NULL,0.511,1,2,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.383,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3659,0.28,0,2,0,0,NULL,0.393,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.319,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3664,0.354,0,0,0,0,NULL,0.582,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.354,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3665,0.385,0,1,0,0,NULL,0.385,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.385,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3666,0,0,0,0,0,NULL,0,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3642,0.247,0,2,1,0,NULL,0.291,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.308,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3647,0.314,1,2,1,0,NULL,0.431,1,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.375,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3649,0.279,2,1,1,0,NULL,0.363,2,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.344,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3651,0.233,1,3,2,1,NULL,0.411,0,0,NULL,NULL,0,2,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.34,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3653,0,0,3,0,2,NULL,0,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3655,0.229,0,3,1,1,NULL,0.3,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.304,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3657,0.298,1,3,1,0,NULL,0.422,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.352,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3667,0.286,0,3,0,0,NULL,0.429,0,2,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.286,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3660,0,0,1,0,0,NULL,0,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3644,0.25,0,2,1,1,NULL,0.25,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.25,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3638,0,0,0,0,0,NULL,0,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3631,0.283,0,2,1,0,NULL,0.42,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.367,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3633,0.375,0,2,1,0,NULL,0.375,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.375,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3639,0.196,0,2,1,0,NULL,0.217,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.224,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3635,0,0,1,0,0,NULL,0,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3661,0,0,0,0,0,NULL,0,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3662,0.259,0,1,1,1,NULL,0.377,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.36,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3663,0,0,0,0,0,NULL,0,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(3636,0,0,0,0,0,NULL,0,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13127,NULL,4,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13128,NULL,2,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13129,0.291,1,3,1,0,NULL,0.5,0,1,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.373,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13130,0.306,0,3,0,0,NULL,0.411,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.348,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13131,0.326,1,3,1,0,NULL,0.508,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.383,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13132,0.298,2,3,2,4,NULL,0.551,0,0,NULL,NULL,0,0,0,2,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.358,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13133,0.268,0,3,1,0,NULL,0.527,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.356,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13134,0.22,0,2,0,0,NULL,0.386,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.32,0,0,NULL,1,NULL,NULL,NULL,NULL),
(13135,0.212,0,2,0,0,NULL,0.383,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.31,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13136,0.274,0,2,0,0,NULL,0.377,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.403,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13137,0.364,0,2,0,0,NULL,0.591,0,2,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.44,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13138,0.273,1,3,1,1,NULL,0.517,0,0,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.38,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13139,0.239,0,3,0,0,NULL,0.409,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.307,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13140,0.304,1,3,2,1,NULL,0.545,0,0,NULL,NULL,1,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.392,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13141,0.274,0,3,0,0,NULL,0.473,0,2,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.325,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13142,0.273,0,2,0,0,NULL,0.357,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.331,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13143,0.213,0,1,0,0,NULL,0.348,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.322,0,0,NULL,1,NULL,NULL,NULL,NULL),
(13144,0.205,0,2,0,0,NULL,0.341,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.286,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13145,0.217,0,2,0,0,NULL,0.313,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.262,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13146,0.246,0,2,0,0,NULL,0.356,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.336,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13828,NULL,2,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13829,NULL,1,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13830,0.282,0,3,0,0,NULL,0.411,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.343,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13831,0.221,0,3,1,0,NULL,0.293,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.284,0,1,NULL,0,NULL,NULL,NULL,NULL),
(13832,0.282,0,3,0,0,NULL,0.417,0,2,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.313,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13833,0.317,1,1,0,0,NULL,0.578,2,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.425,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13834,0.228,1,2,0,0,NULL,0.409,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.272,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13835,0.27,0,1,1,1,NULL,0.467,1,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.313,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13836,0.286,0,2,0,1,NULL,0.538,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.354,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13837,0.216,0,1,0,0,NULL,0.288,1,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.255,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13838,0.145,0,1,1,0,NULL,0.164,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.203,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13839,0.277,0,3,0,0,NULL,0.362,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.335,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13840,0.265,0,3,0,0,NULL,0.364,0,2,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.292,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13841,0.282,0,3,1,0,NULL,0.515,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.362,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13842,0.319,0,3,0,0,NULL,0.499,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.358,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13843,0.272,1,2,1,1,NULL,0.498,0,0,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.344,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13844,0.232,0,2,1,0,NULL,0.341,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.293,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13845,0.17,0,2,0,0,NULL,0.273,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.258,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13846,0.256,0,1,0,0,NULL,0.279,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.319,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13847,0.13,0,1,0,0,NULL,0.152,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.167,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13848,NULL,2,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13849,NULL,3,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13850,0.299,1,2,1,0,NULL,0.457,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.379,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13851,0.301,0,2,0,0,NULL,0.493,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.404,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13852,0.283,0,2,0,0,NULL,0.485,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.342,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13853,0.313,0,3,1,1,NULL,0.573,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.37,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13854,0.268,0,2,0,0,NULL,0.494,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.349,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13855,0.271,1,2,1,0,NULL,0.404,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.313,1,0,NULL,0,NULL,NULL,NULL,NULL),
(13856,0.259,0,2,2,0,NULL,0.414,0,0,NULL,NULL,2,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.31,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13857,0.307,0,1,0,1,NULL,0.455,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,1,NULL,0,NULL,0.326,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13858,0.207,0,2,1,0,NULL,0.286,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.252,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13859,0.308,1,3,1,0,NULL,0.462,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.38,1,0,NULL,0,NULL,NULL,NULL,NULL),
(13860,0.306,0,3,1,0,NULL,0.415,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.368,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13861,0.298,0,2,0,0,NULL,0.474,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.371,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13862,0.303,0,2,0,0,NULL,0.583,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.393,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13863,0.249,0,2,1,0,NULL,0.513,1,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.377,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13864,0.28,0,2,1,0,NULL,0.497,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.33,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13865,0.265,1,2,1,1,NULL,0.405,0,0,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.299,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13866,0.28,1,2,1,0,NULL,0.399,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.321,1,0,NULL,0,NULL,NULL,NULL,NULL),
(13867,0.194,0,2,1,1,NULL,0.255,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.259,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13639,NULL,0,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13640,NULL,9,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13641,0.297,0,1,0,0,NULL,0.432,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.387,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13642,0.292,0,2,0,0,NULL,0.396,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.339,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13643,0.328,0,2,1,0,NULL,0.448,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.416,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13644,0.311,0,2,1,0,NULL,0.519,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.383,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13645,0.274,0,2,0,0,NULL,0.463,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.338,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13646,0.289,0,2,1,0,NULL,0.403,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.334,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13647,0.27,0,2,0,0,NULL,0.378,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.311,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13648,0.286,0,2,0,0,NULL,0.392,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.343,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13649,0.256,0,1,0,0,NULL,0.355,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.294,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13650,0.277,3,1,1,0,NULL,0.383,2,0,NULL,NULL,0,0,1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.353,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13651,0.28,0,3,1,2,NULL,0.35,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.317,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13652,0.249,2,2,2,4,NULL,0.505,1,0,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.377,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13653,0.282,1,2,1,2,NULL,0.547,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,1,NULL,0,NULL,0.353,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13654,0.275,0,3,1,1,NULL,0.463,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.355,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13655,0.289,0,2,0,0,NULL,0.402,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.346,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13656,0.255,1,2,1,0,NULL,0.464,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.344,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13657,0.244,2,0,0,0,NULL,0.463,2,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.33,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13658,0.231,0,1,0,0,NULL,0.41,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.302,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13744,NULL,3,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13745,NULL,3,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13746,0.333,0,3,1,0,NULL,10,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.907,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13747,0,1,2,0,0,NULL,27,1,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.862,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13748,0,0,3,0,0,NULL,9.667,0,2,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.919,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13749,0.667,1,3,2,1,NULL,17,0,0,NULL,NULL,2,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.872,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13750,0.333,0,3,1,2,NULL,5,0,1,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.905,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13751,0,0,3,0,0,NULL,5,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.727,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13752,0.333,0,3,1,0,NULL,2.667,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.778,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13753,0.667,0,3,2,0,NULL,10.333,0,1,NULL,NULL,1,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.8,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13754,0.333,1,3,1,0,NULL,7,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.948,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13755,0.304,1,2,1,0,NULL,0.416,1,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.359,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13756,0.265,0,3,2,1,NULL,0.355,0,0,NULL,NULL,0,2,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.342,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13757,0.292,0,3,0,0,NULL,0.467,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.336,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13758,0.296,0,3,0,0,NULL,0.481,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.341,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13759,0.279,0,2,0,0,NULL,0.428,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.365,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13760,0.289,0,2,0,0,NULL,0.456,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.321,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13761,0.257,1,2,1,0,NULL,0.42,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.35,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13762,0.23,1,2,1,1,NULL,0.358,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.34,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13763,0.354,0,2,1,1,NULL,0.583,0,1,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.396,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13723,NULL,6,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13724,NULL,8,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13725,0.278,0,3,1,0,NULL,0.439,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.347,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13726,0.288,2,1,1,1,NULL,0.528,1,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,1,NULL,0,NULL,0.377,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13727,0.283,1,3,1,0,NULL,0.519,0,2,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.379,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13728,0.249,1,3,1,3,NULL,0.539,0,1,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.337,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13729,0.25,0,3,0,0,NULL,0.507,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.365,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13730,0.287,0,3,0,0,NULL,0.431,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.35,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13731,0.299,1,2,2,1,NULL,0.491,0,0,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.333,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13732,0.27,1,2,1,0,NULL,0.434,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.328,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13733,0.07,0,1,0,0,NULL,0.088,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.131,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13735,0.889,2,3,3,0,NULL,0.889,0,0,NULL,NULL,3,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.909,2,0,NULL,0,NULL,NULL,NULL,NULL),
(13736,0.292,2,2,1,1,NULL,0.444,1,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.383,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13737,0.279,2,3,2,1,NULL,0.485,0,0,NULL,NULL,1,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.328,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13738,0.251,1,2,1,2,NULL,0.526,1,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.3,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13739,0.266,1,3,2,3,NULL,0.53,0,0,NULL,NULL,1,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.364,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13740,0.262,0,3,0,1,NULL,0.417,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.336,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13741,0.263,0,2,0,0,NULL,0.499,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.319,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13742,0.259,0,2,0,0,NULL,0.358,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.309,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13743,0.148,0,2,0,0,NULL,0.222,0,2,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.179,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13805,NULL,2,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13806,NULL,9,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13807,0.243,0,3,1,1,NULL,0.491,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.332,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13808,0.291,0,2,1,0,NULL,0.433,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.381,0,1,NULL,0,NULL,NULL,NULL,NULL),
(13810,0.287,1,3,1,0,NULL,0.554,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.334,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13811,0.274,0,3,2,0,NULL,0.503,0,0,NULL,NULL,2,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.372,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13812,0.283,0,3,1,0,NULL,0.481,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.344,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13813,0.274,0,3,1,1,NULL,0.475,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.309,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13814,0.226,1,2,0,0,NULL,0.302,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.341,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13815,0.246,0,1,0,0,NULL,0.324,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.33,0,0,NULL,1,NULL,NULL,NULL,NULL),
(13816,0.143,0,0,0,0,NULL,0.163,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.192,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13819,0.33,2,3,2,2,NULL,0.482,0,0,NULL,NULL,1,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.39,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13820,0.36,1,3,1,0,NULL,0.4,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.385,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13821,0.287,2,3,2,4,NULL,0.483,0,0,NULL,NULL,0,0,0,2,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.361,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13822,0.269,2,3,2,1,NULL,0.452,0,0,NULL,NULL,1,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.317,1,0,NULL,0,NULL,NULL,NULL,NULL),
(13823,0.259,1,3,1,2,NULL,0.459,0,0,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.319,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13824,0.19,0,3,1,0,NULL,0.238,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.227,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13825,0.205,0,3,1,0,NULL,0.342,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.238,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13826,0.274,0,3,1,0,NULL,0.403,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.375,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13827,0.125,1,2,0,0,NULL,0.125,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.125,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13679,NULL,4,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13680,NULL,4,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13681,0.296,1,2,1,1,NULL,0.465,0,0,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.375,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13682,0.205,0,2,0,0,NULL,0.308,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.311,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13683,0.305,1,2,1,0,NULL,0.447,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.396,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13684,0.278,1,2,1,1,NULL,0.506,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.36,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13685,0.267,1,2,1,2,NULL,0.44,0,0,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.305,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13686,0.263,0,2,1,0,NULL,0.414,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.334,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13687,0.223,0,2,0,0,NULL,0.343,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.261,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13688,0.226,0,2,0,0,NULL,0.258,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.286,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13689,0,0,2,0,0,NULL,0,0,2,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.25,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13691,0.242,1,1,0,1,NULL,0.329,2,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.296,1,0,NULL,0,NULL,NULL,NULL,NULL),
(13692,0.314,0,3,0,0,NULL,0.44,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.344,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13693,0.283,0,2,0,1,NULL,0.433,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.334,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13694,0.266,1,2,1,0,NULL,0.406,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.331,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13695,0.278,1,2,1,0,NULL,0.51,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.388,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13696,0.225,1,2,1,0,NULL,0.31,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.313,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13697,0.083,0,0,0,0,NULL,0.083,2,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.353,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13698,0.172,0,2,1,1,NULL,0.207,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.238,0,1,NULL,0,NULL,NULL,NULL,NULL),
(13699,0.2,0,2,1,1,NULL,0.2,0,1,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.294,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13784,NULL,5,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13785,NULL,3,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13786,0.302,2,2,2,1,NULL,0.486,1,0,NULL,NULL,1,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.363,1,0,NULL,0,NULL,NULL,NULL,NULL),
(13787,0.249,0,3,0,0,NULL,0.312,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.349,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13788,0.294,1,2,1,1,NULL,0.527,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.381,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13789,0.283,1,2,1,1,NULL,0.506,0,1,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.375,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13790,0.266,0,2,1,1,NULL,0.513,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.348,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13791,0.254,0,1,1,0,NULL,0.469,1,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.326,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13792,0.286,0,2,0,0,NULL,0.463,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.348,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13793,0.275,1,1,1,1,NULL,0.431,1,0,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.315,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13794,0.113,0,2,0,0,NULL,0.132,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.175,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13795,0.313,0,2,0,0,NULL,0.458,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.373,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13796,0.284,0,1,0,0,NULL,0.444,1,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.349,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13797,0.363,0,2,0,0,NULL,0.568,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.467,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13798,0.3,1,2,2,1,NULL,0.427,0,0,NULL,NULL,1,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.345,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13799,0.227,0,2,0,0,NULL,0.303,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.331,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13800,0.235,1,0,0,0,NULL,0.352,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.294,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13801,0.159,0,1,0,0,NULL,0.227,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.229,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13802,0.267,0,1,1,1,NULL,0.356,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.321,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13803,0.143,1,1,1,0,NULL,0.214,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.172,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13817,0.232,0,1,0,0,NULL,0.385,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.339,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13818,0.226,0,1,0,0,NULL,0.358,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.255,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13764,NULL,7,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13765,NULL,0,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13766,0.277,1,2,1,1,NULL,0.385,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.315,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13767,0.291,1,2,2,1,NULL,0.432,0,0,NULL,NULL,1,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.324,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13768,0.35,1,1,0,0,NULL,0.619,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.446,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13769,0.284,1,1,1,3,NULL,0.481,1,0,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.347,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13770,0.241,0,2,1,0,NULL,0.355,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.316,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13771,0.263,0,2,1,0,NULL,0.314,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.326,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13772,0.256,1,2,1,1,NULL,0.488,0,0,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.289,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13773,0.228,1,2,1,1,NULL,0.515,0,1,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.344,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13774,0.197,1,1,1,0,NULL,0.299,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.261,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13775,0.276,0,1,0,0,NULL,0.356,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.344,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13776,0.277,0,1,1,0,NULL,0.394,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.332,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13777,0.304,0,1,1,0,NULL,0.536,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.37,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13778,0.323,0,1,0,0,NULL,0.576,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.441,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13779,0.295,0,1,0,0,NULL,0.465,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.378,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13780,0.258,0,1,0,0,NULL,0.416,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.311,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13781,0.325,0,1,0,0,NULL,0.584,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.441,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13782,0.281,0,1,0,0,NULL,0.407,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.329,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13783,0.278,0,0,0,0,NULL,0.541,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.328,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13868,NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13869,NULL,2,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13870,0.285,0,2,0,0,NULL,0.487,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.322,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13871,0.243,0,2,0,0,NULL,0.431,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.309,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13872,0.296,0,1,0,0,NULL,0.448,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.377,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13873,0.235,0,1,0,0,NULL,0.505,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.384,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13874,0.258,0,1,1,0,NULL,0.469,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.362,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13875,0.241,0,1,0,0,NULL,0.465,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.321,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13876,0.244,0,1,0,0,NULL,0.471,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.356,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13877,0.196,0,1,0,0,NULL,0.283,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.255,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13878,0,0,1,0,0,NULL,0,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13879,0.254,0,2,1,0,NULL,0.3,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.311,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13880,0.249,0,2,0,0,NULL,0.386,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.322,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13881,0.324,1,2,0,0,NULL,0.544,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.41,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13882,0.29,0,2,1,0,NULL,0.51,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.387,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13883,0.288,0,2,1,1,NULL,0.451,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.331,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13884,0.277,0,1,0,0,NULL,0.483,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.371,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13885,0.274,1,1,1,1,NULL,0.528,0,0,NULL,NULL,0,0,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.396,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13886,0.29,0,1,0,0,NULL,0.453,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.321,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13887,0.139,0,1,1,0,NULL,0.139,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.135,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13559,NULL,0,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13560,NULL,0,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13561,0.283,0,2,1,0,NULL,0.372,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.338,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13562,0.284,0,2,0,0,NULL,0.495,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.314,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13563,0.292,0,2,1,0,NULL,0.547,0,0,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.347,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13564,0.245,0,2,1,0,NULL,0.506,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.363,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13565,0.243,0,2,0,0,NULL,0.419,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.349,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13566,0.283,0,1,0,0,NULL,0.418,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.314,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13567,0.296,0,0,0,0,NULL,0.477,1,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.32,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13568,0.219,0,1,0,0,NULL,0.415,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.333,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13569,0.251,0,1,0,0,NULL,0.402,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.298,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13570,0.299,0,2,0,0,NULL,0.437,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.357,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13571,0.322,0,1,1,0,NULL,0.469,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.353,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13572,0.263,0,1,0,0,NULL,0.444,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,0.297,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13573,0.349,0,1,0,0,NULL,0.767,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.364,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13574,0.257,0,1,1,0,NULL,0.404,0,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.316,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13575,0.268,0,1,0,0,NULL,0.39,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.317,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13576,0.309,0,1,0,0,NULL,0.372,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.364,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13577,0.224,0,1,0,0,NULL,0.369,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.302,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13578,0.301,0,1,0,0,NULL,0.315,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.329,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13809,0.225,0,1,0,0,NULL,0.399,0,1,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.292,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13690,0,0,0,0,0,NULL,0,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13804,0.25,0,0,0,0,NULL,0.25,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.333,0,0,NULL,0,NULL,NULL,NULL,NULL),
(13734,0,0,0,0,0,NULL,0,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `baseball_offensive_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseball_pitching_stats`
--

DROP TABLE IF EXISTS `baseball_pitching_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_pitching_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `runs_allowed` int(11) DEFAULT NULL,
  `singles_allowed` int(11) DEFAULT NULL,
  `doubles_allowed` int(11) DEFAULT NULL,
  `triples_allowed` int(11) DEFAULT NULL,
  `home_runs_allowed` int(11) DEFAULT NULL,
  `innings_pitched` varchar(20) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `earned_runs` int(11) DEFAULT NULL,
  `unearned_runs` int(11) DEFAULT NULL,
  `bases_on_balls` int(11) DEFAULT NULL,
  `bases_on_balls_intentional` int(11) DEFAULT NULL,
  `strikeouts` int(11) DEFAULT NULL,
  `strikeout_to_bb_ratio` float DEFAULT NULL,
  `number_of_pitches` int(11) DEFAULT NULL,
  `era` float DEFAULT NULL,
  `inherited_runners_scored` int(11) DEFAULT NULL,
  `pick_offs` int(11) DEFAULT NULL,
  `errors_hit_with_pitch` int(11) DEFAULT NULL,
  `errors_wild_pitch` int(11) DEFAULT NULL,
  `balks` int(11) DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `losses` int(11) DEFAULT NULL,
  `saves` int(11) DEFAULT NULL,
  `shutouts` int(11) DEFAULT NULL,
  `games_complete` int(11) DEFAULT NULL,
  `games_finished` int(11) DEFAULT NULL,
  `winning_percentage` float DEFAULT NULL,
  `event_credit` varchar(40) DEFAULT NULL,
  `save_credit` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1767 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseball_pitching_stats`
--

LOCK TABLES `baseball_pitching_stats` WRITE;
/*!40000 ALTER TABLE `baseball_pitching_stats` DISABLE KEYS */;
INSERT INTO `baseball_pitching_stats` VALUES
(1,3,NULL,NULL,NULL,0,NULL,7,3,NULL,0,NULL,6,NULL,118,3,NULL,NULL,1,0,0,0,1,NULL,0,1,NULL,NULL,NULL,NULL),
(2,2,NULL,NULL,NULL,1,NULL,9,2,NULL,1,NULL,7,NULL,124,2,NULL,NULL,1,0,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(3,3,NULL,NULL,NULL,0,'8',7,3,NULL,0,NULL,6,NULL,118,2.46,NULL,NULL,1,0,0,17,4,0,0,1,NULL,NULL,'loss',NULL),
(4,1,NULL,NULL,NULL,0,'7',8,1,NULL,1,NULL,4,NULL,92,3.99,NULL,NULL,NULL,0,0,10,9,0,0,NULL,NULL,NULL,NULL,NULL),
(5,1,NULL,NULL,NULL,1,'1',1,1,NULL,0,NULL,2,NULL,14,2.77,NULL,NULL,NULL,0,0,3,0,0,0,NULL,NULL,NULL,'win',NULL),
(6,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,1,NULL,18,2.97,NULL,NULL,NULL,0,0,4,8,5,0,NULL,NULL,NULL,'save',NULL),
(7,3,NULL,NULL,NULL,1,NULL,6,3,NULL,4,NULL,1,NULL,142,3,NULL,NULL,1,1,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(8,2,NULL,NULL,NULL,0,NULL,5,2,NULL,5,NULL,8,NULL,152,2,NULL,NULL,1,0,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(9,3,NULL,NULL,NULL,1,'5.2',4,3,NULL,3,NULL,1,NULL,99,6.75,NULL,NULL,1,0,0,9,9,0,0,NULL,NULL,NULL,'loss',NULL),
(10,0,NULL,NULL,NULL,0,'1.1',2,0,NULL,1,NULL,0,NULL,27,0,NULL,NULL,NULL,1,0,0,1,1,0,NULL,NULL,NULL,NULL,NULL),
(11,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,0,NULL,16,5.97,NULL,NULL,NULL,0,0,1,2,0,0,NULL,NULL,NULL,NULL,NULL),
(12,2,NULL,NULL,NULL,0,'6',4,2,NULL,4,NULL,6,NULL,107,3.72,NULL,NULL,NULL,0,0,12,8,0,0,NULL,NULL,NULL,'win',NULL),
(13,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,1,NULL,13,2.57,NULL,NULL,NULL,0,0,0,2,0,0,NULL,NULL,NULL,NULL,NULL),
(14,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,0,NULL,9,1.77,NULL,NULL,NULL,0,0,7,1,2,0,NULL,NULL,NULL,NULL,NULL),
(15,0,NULL,NULL,NULL,0,'1',1,0,NULL,1,NULL,1,NULL,23,3,NULL,NULL,NULL,0,0,2,4,31,0,NULL,NULL,NULL,'save',NULL),
(16,8,NULL,NULL,NULL,0,NULL,14,6,NULL,5,NULL,9,NULL,180,6,NULL,NULL,1,0,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(17,1,NULL,NULL,NULL,0,NULL,4,1,NULL,1,NULL,11,NULL,127,1,NULL,NULL,1,0,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(18,2,NULL,NULL,NULL,0,'2.2',5,2,NULL,3,NULL,2,NULL,69,2.53,NULL,NULL,1,0,0,1,1,0,0,NULL,NULL,NULL,'loss',NULL),
(19,2,NULL,NULL,NULL,0,'1.1',3,2,NULL,1,NULL,2,NULL,30,4.35,NULL,NULL,NULL,0,0,6,4,0,0,NULL,NULL,NULL,NULL,NULL),
(20,2,NULL,NULL,NULL,0,'1.1',3,2,NULL,0,NULL,2,NULL,29,5.16,NULL,NULL,NULL,0,0,4,3,1,0,NULL,NULL,NULL,NULL,NULL),
(21,0,NULL,NULL,NULL,0,'.2',0,0,NULL,1,NULL,1,NULL,16,4.11,NULL,NULL,NULL,0,0,7,5,2,0,NULL,NULL,NULL,NULL,NULL),
(22,0,NULL,NULL,NULL,0,'1',1,0,NULL,0,NULL,0,NULL,9,2.36,NULL,NULL,NULL,0,0,2,3,0,0,NULL,NULL,NULL,NULL,NULL),
(23,2,NULL,NULL,NULL,0,'1',2,0,NULL,0,NULL,2,NULL,27,0,NULL,NULL,NULL,0,0,2,0,1,0,NULL,NULL,NULL,NULL,NULL),
(24,1,NULL,NULL,NULL,0,'7',3,1,NULL,1,NULL,7,NULL,101,4.2,NULL,NULL,NULL,0,0,8,10,0,0,NULL,NULL,NULL,'win',NULL),
(25,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,2,NULL,13,3.6,NULL,NULL,NULL,0,0,7,8,29,0,NULL,NULL,NULL,NULL,NULL),
(26,0,NULL,NULL,NULL,0,'1',1,0,NULL,0,NULL,2,NULL,13,3.31,NULL,NULL,NULL,0,0,3,3,4,0,NULL,NULL,NULL,NULL,NULL),
(27,6,NULL,NULL,NULL,0,NULL,9,6,NULL,6,NULL,10,NULL,180,6,NULL,NULL,NULL,2,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(28,12,NULL,NULL,NULL,2,NULL,18,12,NULL,6,NULL,9,NULL,186,12,NULL,NULL,NULL,1,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(29,2,NULL,NULL,NULL,0,'5',4,2,NULL,3,NULL,5,NULL,107,3.21,NULL,NULL,NULL,0,0,10,3,0,0,NULL,NULL,NULL,'win',NULL),
(30,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,2,NULL,9,0,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
(31,4,NULL,NULL,NULL,0,'2.2',5,4,NULL,3,NULL,2,NULL,58,5.48,NULL,NULL,NULL,2,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
(32,0,NULL,NULL,NULL,0,'.1',0,0,NULL,0,NULL,1,NULL,6,4.84,NULL,NULL,NULL,0,0,1,2,1,0,NULL,NULL,NULL,NULL,NULL),
(33,8,NULL,NULL,NULL,1,'1.2',6,8,NULL,3,NULL,1,NULL,45,3.77,NULL,NULL,NULL,1,0,14,6,0,0,NULL,NULL,NULL,'loss',NULL),
(34,0,NULL,NULL,NULL,0,'1.1',1,0,NULL,2,NULL,2,NULL,35,3.62,NULL,NULL,NULL,0,0,3,4,1,0,NULL,NULL,NULL,NULL,NULL),
(35,3,NULL,NULL,NULL,1,'2',4,3,NULL,0,NULL,1,NULL,36,9.53,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
(36,1,NULL,NULL,NULL,0,'2',4,1,NULL,1,NULL,3,NULL,42,7.33,NULL,NULL,NULL,0,0,2,1,0,0,NULL,NULL,NULL,NULL,NULL),
(37,0,NULL,NULL,NULL,0,'1',1,0,NULL,0,NULL,1,NULL,13,3.83,NULL,NULL,NULL,0,0,1,1,0,0,NULL,NULL,NULL,NULL,NULL),
(38,0,NULL,NULL,NULL,0,'1',2,0,NULL,0,NULL,1,NULL,15,5.35,NULL,NULL,NULL,0,0,6,4,1,0,NULL,NULL,NULL,NULL,NULL),
(39,3,NULL,NULL,NULL,1,NULL,9,3,NULL,5,NULL,1,NULL,139,3,NULL,NULL,NULL,2,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(40,2,NULL,NULL,NULL,0,NULL,8,2,NULL,2,NULL,9,NULL,136,2,NULL,NULL,NULL,0,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(41,3,NULL,NULL,NULL,1,'6.1',8,3,NULL,3,NULL,1,NULL,106,6.69,NULL,NULL,NULL,1,0,6,6,0,0,NULL,NULL,NULL,'loss',NULL),
(42,0,NULL,NULL,NULL,0,'1',1,0,NULL,1,NULL,0,NULL,20,3.88,NULL,NULL,NULL,1,0,3,3,1,0,NULL,NULL,NULL,NULL,NULL),
(43,0,NULL,NULL,NULL,0,'.2',0,0,NULL,1,NULL,0,NULL,13,4.91,NULL,NULL,NULL,0,0,3,5,31,0,NULL,NULL,NULL,NULL,NULL),
(44,2,NULL,NULL,NULL,0,'5',6,2,NULL,1,NULL,2,NULL,73,4.99,NULL,NULL,NULL,0,0,4,1,0,0,NULL,NULL,NULL,'win',NULL),
(45,0,NULL,NULL,NULL,0,'.2',0,0,NULL,1,NULL,2,NULL,17,0,NULL,NULL,NULL,0,0,1,0,0,0,NULL,NULL,NULL,NULL,NULL),
(46,0,NULL,NULL,NULL,0,'.2',0,0,NULL,0,NULL,2,NULL,8,1.99,NULL,NULL,NULL,0,0,3,0,1,0,NULL,NULL,NULL,NULL,NULL),
(47,0,NULL,NULL,NULL,0,'.2',0,0,NULL,0,NULL,0,NULL,5,5.19,NULL,NULL,NULL,0,0,1,3,0,0,NULL,NULL,NULL,NULL,NULL),
(48,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,3,NULL,15,2.51,NULL,NULL,NULL,0,0,4,3,0,0,NULL,NULL,NULL,NULL,NULL),
(49,0,NULL,NULL,NULL,0,'1',2,0,NULL,0,NULL,0,NULL,18,1.49,NULL,NULL,NULL,0,0,5,5,37,0,NULL,NULL,NULL,'save',NULL),
(50,11,NULL,NULL,NULL,7,NULL,15,11,NULL,1,NULL,5,NULL,137,11,NULL,NULL,1,0,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(51,2,NULL,NULL,NULL,0,NULL,10,2,NULL,5,NULL,5,NULL,146,2,NULL,NULL,1,0,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(52,5,NULL,NULL,NULL,2,'2',5,5,NULL,0,NULL,2,NULL,38,5.06,NULL,NULL,NULL,0,0,10,10,0,0,NULL,NULL,NULL,'loss',NULL),
(53,5,NULL,NULL,NULL,4,'4',7,5,NULL,0,NULL,2,NULL,63,4.45,NULL,NULL,NULL,0,0,10,8,0,0,NULL,NULL,NULL,NULL,NULL),
(54,1,NULL,NULL,NULL,1,'2',3,1,NULL,1,NULL,1,NULL,36,4.4,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
(55,2,NULL,NULL,NULL,0,'6',7,2,NULL,2,NULL,5,NULL,94,2.45,NULL,NULL,1,0,0,1,0,0,0,NULL,NULL,NULL,'win',NULL),
(56,0,NULL,NULL,NULL,0,'1',0,0,NULL,2,NULL,0,NULL,22,4.57,NULL,NULL,NULL,0,0,2,5,0,0,NULL,NULL,NULL,NULL,NULL),
(57,0,NULL,NULL,NULL,0,'1',1,0,NULL,1,NULL,0,NULL,19,0,NULL,NULL,NULL,0,0,1,0,0,0,NULL,NULL,NULL,NULL,NULL),
(58,0,NULL,NULL,NULL,0,'1',2,0,NULL,0,NULL,0,NULL,11,3.53,NULL,NULL,NULL,0,0,1,1,0,0,NULL,NULL,NULL,NULL,NULL),
(59,6,NULL,NULL,NULL,3,NULL,7,6,NULL,1,NULL,6,NULL,124,6,NULL,NULL,3,0,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(60,5,NULL,NULL,NULL,2,NULL,6,5,NULL,0,NULL,10,NULL,122,5,NULL,NULL,3,0,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(61,3,NULL,NULL,NULL,2,'7.2',4,3,NULL,0,NULL,5,NULL,110,3.58,NULL,NULL,1,0,0,12,6,0,0,NULL,NULL,NULL,NULL,NULL),
(62,2,NULL,NULL,NULL,1,'0',1,2,NULL,1,NULL,0,NULL,6,5.4,NULL,NULL,NULL,0,0,3,1,0,0,NULL,NULL,NULL,NULL,NULL),
(63,1,NULL,NULL,NULL,0,'.1',0,1,NULL,0,NULL,0,NULL,3,4.09,NULL,NULL,1,0,0,1,5,2,0,NULL,NULL,NULL,'loss',NULL),
(64,0,NULL,NULL,NULL,0,'.1',0,0,NULL,0,NULL,1,NULL,3,4.03,NULL,NULL,NULL,0,0,1,2,0,0,NULL,NULL,NULL,NULL,NULL),
(65,0,NULL,NULL,NULL,0,'0',2,0,NULL,0,NULL,0,NULL,2,5.55,NULL,NULL,NULL,0,0,2,3,0,0,NULL,NULL,NULL,NULL,NULL),
(66,4,NULL,NULL,NULL,2,'6.1',5,4,NULL,0,NULL,5,NULL,82,5.19,NULL,NULL,1,0,0,8,7,0,0,NULL,NULL,NULL,NULL,NULL),
(67,1,NULL,NULL,NULL,0,'1.2',1,1,NULL,0,NULL,3,NULL,23,6.94,NULL,NULL,NULL,0,0,3,2,0,0,NULL,NULL,NULL,NULL,NULL),
(68,0,NULL,NULL,NULL,0,'.2',0,0,NULL,0,NULL,1,NULL,9,5.16,NULL,NULL,NULL,0,0,3,4,4,0,NULL,NULL,NULL,NULL,NULL),
(69,0,NULL,NULL,NULL,0,'.1',0,0,NULL,0,NULL,1,NULL,8,3.15,NULL,NULL,NULL,0,0,4,3,2,0,NULL,NULL,NULL,'win',NULL),
(70,14,NULL,NULL,NULL,3,NULL,14,14,NULL,3,NULL,4,NULL,165,14,NULL,NULL,1,1,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(71,8,NULL,NULL,NULL,3,NULL,9,7,NULL,4,NULL,10,NULL,165,7,NULL,NULL,1,1,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(72,10,NULL,NULL,NULL,1,'4',9,10,NULL,2,NULL,3,NULL,97,4.46,NULL,NULL,NULL,0,0,10,12,0,0,NULL,NULL,NULL,'loss',NULL),
(73,1,NULL,NULL,NULL,1,'1',1,1,NULL,0,NULL,0,NULL,14,3.73,NULL,NULL,NULL,0,0,5,4,0,0,NULL,NULL,NULL,NULL,NULL),
(74,2,NULL,NULL,NULL,0,'2',3,2,NULL,1,NULL,1,NULL,31,7.56,NULL,NULL,NULL,1,0,0,1,0,0,NULL,NULL,NULL,NULL,NULL),
(75,1,NULL,NULL,NULL,1,'1',1,1,NULL,0,NULL,0,NULL,23,5.46,NULL,NULL,NULL,0,0,11,9,0,0,NULL,NULL,NULL,NULL,NULL),
(76,6,NULL,NULL,NULL,2,'5',7,5,NULL,1,NULL,6,NULL,98,3.65,NULL,NULL,NULL,1,0,6,1,0,0,NULL,NULL,NULL,'win',NULL),
(77,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,0,NULL,12,5.55,NULL,NULL,NULL,0,0,7,8,0,0,NULL,NULL,NULL,NULL,NULL),
(78,2,NULL,NULL,NULL,1,'1',1,2,NULL,2,NULL,1,NULL,23,5.74,NULL,NULL,NULL,0,0,6,9,0,0,NULL,NULL,NULL,NULL,NULL),
(79,0,NULL,NULL,NULL,0,'.2',1,0,NULL,0,NULL,0,NULL,8,4.09,NULL,NULL,1,0,0,3,1,0,0,NULL,NULL,NULL,NULL,NULL),
(80,0,NULL,NULL,NULL,0,'.1',0,0,NULL,0,NULL,0,NULL,7,0,NULL,NULL,NULL,0,0,2,0,1,0,NULL,NULL,NULL,NULL,NULL),
(81,0,NULL,NULL,NULL,0,'1',0,0,NULL,1,NULL,3,NULL,17,1.82,NULL,NULL,NULL,0,0,2,1,1,0,NULL,NULL,NULL,NULL,NULL),
(82,1,NULL,NULL,NULL,1,NULL,4,1,NULL,2,NULL,7,NULL,136,1,NULL,NULL,NULL,0,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(83,5,NULL,NULL,NULL,0,NULL,6,4,NULL,8,NULL,5,NULL,167,4,NULL,NULL,NULL,0,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(84,1,NULL,NULL,NULL,1,'7',3,1,NULL,1,NULL,7,NULL,111,4.46,NULL,NULL,NULL,0,0,11,12,0,0,NULL,NULL,NULL,'win',NULL),
(85,0,NULL,NULL,NULL,0,'1',0,0,NULL,1,NULL,0,NULL,14,0,NULL,NULL,NULL,0,0,2,0,1,0,NULL,NULL,NULL,NULL,NULL),
(86,0,NULL,NULL,NULL,0,'.2',1,0,NULL,0,NULL,0,NULL,8,4.08,NULL,NULL,NULL,0,0,2,1,0,0,NULL,NULL,NULL,NULL,NULL),
(87,0,NULL,NULL,NULL,0,'.1',0,0,NULL,0,NULL,0,NULL,3,3.42,NULL,NULL,NULL,0,0,5,3,42,0,NULL,NULL,NULL,NULL,NULL),
(88,2,NULL,NULL,NULL,0,'6',3,1,NULL,5,NULL,3,NULL,108,5.54,NULL,NULL,NULL,0,0,6,12,0,0,NULL,NULL,NULL,'loss',NULL),
(89,3,NULL,NULL,NULL,0,'2',3,3,NULL,3,NULL,0,NULL,44,6.41,NULL,NULL,NULL,0,0,4,3,0,0,NULL,NULL,NULL,NULL,NULL),
(90,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,2,NULL,15,4.5,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
(91,11,NULL,NULL,NULL,1,NULL,10,9,NULL,7,NULL,4,NULL,143,9,NULL,NULL,NULL,0,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(92,1,NULL,NULL,NULL,0,NULL,7,1,NULL,1,NULL,6,NULL,127,1,NULL,NULL,NULL,0,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(93,6,NULL,NULL,NULL,0,'1.1',6,6,NULL,3,NULL,0,NULL,42,4.15,NULL,NULL,NULL,0,0,10,10,0,0,NULL,NULL,NULL,'loss',NULL),
(94,3,NULL,NULL,NULL,1,'3.2',2,3,NULL,2,NULL,3,NULL,56,5.96,NULL,NULL,NULL,0,0,3,7,0,0,NULL,NULL,NULL,NULL,NULL),
(95,2,NULL,NULL,NULL,0,'1',1,0,NULL,1,NULL,1,NULL,21,2.01,NULL,NULL,NULL,0,0,0,2,1,0,NULL,NULL,NULL,NULL,NULL),
(96,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,0,NULL,8,1.8,NULL,NULL,NULL,0,0,0,1,0,0,NULL,NULL,NULL,NULL,NULL),
(97,0,NULL,NULL,NULL,0,'1',1,0,NULL,1,NULL,0,NULL,16,5.17,NULL,NULL,NULL,0,0,2,0,0,0,NULL,NULL,NULL,NULL,NULL),
(98,1,NULL,NULL,NULL,0,'7.2',7,1,NULL,1,NULL,5,NULL,114,4.19,NULL,NULL,NULL,0,0,12,11,0,0,NULL,NULL,NULL,'win',NULL),
(99,0,NULL,NULL,NULL,0,'1.1',0,0,NULL,0,NULL,1,NULL,13,5.06,NULL,NULL,NULL,0,0,1,1,0,0,NULL,NULL,NULL,NULL,NULL),
(100,3,NULL,NULL,NULL,0,NULL,6,3,NULL,2,NULL,4,NULL,143,3,NULL,NULL,NULL,0,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(101,4,NULL,NULL,NULL,0,NULL,9,4,NULL,5,NULL,7,NULL,158,4,NULL,NULL,NULL,0,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(102,3,NULL,NULL,NULL,0,'6',6,3,NULL,1,NULL,2,NULL,98,4.53,NULL,NULL,NULL,0,0,11,12,0,0,NULL,NULL,NULL,NULL,NULL),
(103,0,NULL,NULL,NULL,0,'.2',0,0,NULL,1,NULL,1,NULL,14,2.48,NULL,NULL,NULL,0,0,2,0,0,0,NULL,NULL,NULL,NULL,NULL),
(104,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,0,NULL,7,3.44,NULL,NULL,NULL,0,0,1,2,1,0,NULL,NULL,NULL,'win',NULL),
(105,0,NULL,NULL,NULL,0,'.1',0,0,NULL,0,NULL,0,NULL,4,2.81,NULL,NULL,NULL,0,0,3,2,1,0,NULL,NULL,NULL,NULL,NULL),
(106,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,1,NULL,20,2.08,NULL,NULL,NULL,0,0,5,4,39,0,NULL,NULL,NULL,'save',NULL),
(107,3,NULL,NULL,NULL,0,'7',8,3,NULL,2,NULL,6,NULL,121,4.18,NULL,NULL,NULL,0,0,18,10,0,0,NULL,NULL,NULL,NULL,NULL),
(108,1,NULL,NULL,NULL,0,'.1',1,1,NULL,1,NULL,1,NULL,13,3.1,NULL,NULL,NULL,0,0,1,2,0,0,NULL,NULL,NULL,'loss',NULL),
(109,0,NULL,NULL,NULL,0,'.1',0,0,NULL,1,NULL,0,NULL,7,4.12,NULL,NULL,NULL,0,0,3,1,0,0,NULL,NULL,NULL,NULL,NULL),
(110,0,NULL,NULL,NULL,0,'1.1',0,0,NULL,1,NULL,0,NULL,17,4.33,NULL,NULL,NULL,0,0,1,0,0,0,NULL,NULL,NULL,NULL,NULL),
(111,3,NULL,NULL,NULL,2,NULL,8,3,NULL,3,NULL,10,NULL,134,3,NULL,NULL,1,1,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(112,2,NULL,NULL,NULL,2,NULL,7,2,NULL,4,NULL,11,NULL,155,2,NULL,NULL,1,1,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(113,3,NULL,NULL,NULL,2,'6',7,3,NULL,1,NULL,8,NULL,98,3,NULL,NULL,NULL,1,0,0,3,0,0,NULL,NULL,NULL,'loss',NULL),
(114,0,NULL,NULL,NULL,0,'1',0,0,NULL,1,NULL,0,NULL,13,3.95,NULL,NULL,NULL,0,0,4,8,18,0,NULL,NULL,NULL,NULL,NULL),
(115,0,NULL,NULL,NULL,0,'1',1,0,NULL,1,NULL,2,NULL,23,5.04,NULL,NULL,NULL,0,0,2,5,26,0,NULL,NULL,NULL,NULL,NULL),
(116,1,NULL,NULL,NULL,1,'6',3,1,NULL,3,NULL,6,NULL,100,5.2,NULL,NULL,NULL,1,0,9,8,0,0,NULL,NULL,NULL,'win',NULL),
(117,0,NULL,NULL,NULL,0,'1',1,0,NULL,0,NULL,1,NULL,21,2.76,NULL,NULL,NULL,0,0,3,1,1,0,NULL,NULL,NULL,NULL,NULL),
(118,0,NULL,NULL,NULL,0,'1',1,0,NULL,0,NULL,1,NULL,8,4.01,NULL,NULL,NULL,0,0,3,3,4,0,NULL,NULL,NULL,NULL,NULL),
(119,1,NULL,NULL,NULL,1,'1',2,1,NULL,1,NULL,3,NULL,26,2.52,NULL,NULL,1,0,0,1,4,29,0,NULL,NULL,NULL,'save',NULL),
(120,4,NULL,NULL,NULL,1,NULL,8,4,NULL,1,NULL,3,NULL,132,4,NULL,NULL,1,0,0,1,0,NULL,0,0,NULL,NULL,NULL,NULL),
(121,9,NULL,NULL,NULL,4,NULL,11,9,NULL,4,NULL,5,NULL,159,9,NULL,NULL,1,2,0,0,1,NULL,0,0,NULL,NULL,NULL,NULL),
(122,3,NULL,NULL,NULL,1,'6',6,3,NULL,1,NULL,2,NULL,93,3.87,NULL,NULL,1,0,0,14,11,0,0,NULL,NULL,NULL,'win',NULL),
(123,1,NULL,NULL,NULL,0,'1',2,1,NULL,0,NULL,0,NULL,12,2.7,NULL,NULL,NULL,0,0,5,3,0,0,NULL,NULL,NULL,NULL,NULL),
(124,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,1,NULL,13,3.94,NULL,NULL,NULL,0,0,4,4,1,0,NULL,NULL,NULL,NULL,NULL),
(125,0,NULL,NULL,NULL,0,'1',0,0,NULL,0,NULL,0,NULL,14,3.07,NULL,NULL,NULL,0,0,2,2,1,0,NULL,NULL,NULL,NULL,NULL),
(126,7,NULL,NULL,NULL,2,'5',8,7,NULL,2,NULL,1,NULL,93,5.96,NULL,NULL,NULL,1,0,8,16,0,0,NULL,NULL,NULL,'loss',NULL),
(127,1,NULL,NULL,NULL,1,'1.2',2,1,NULL,2,NULL,1,NULL,37,3.97,NULL,NULL,NULL,1,0,2,2,0,0,NULL,NULL,NULL,NULL,NULL),
(128,0,NULL,NULL,NULL,0,'1.1',0,0,NULL,0,NULL,2,NULL,12,4.91,NULL,NULL,NULL,0,0,1,3,0,0,NULL,NULL,NULL,NULL,NULL),
(129,1,NULL,NULL,NULL,1,'1',1,1,NULL,0,NULL,1,NULL,17,7.36,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
(130,3,NULL,3,1,0,'8.0',7,3,NULL,0,0,6,NULL,NULL,2.44,NULL,NULL,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(131,0,NULL,0,0,0,'1.0',0,0,NULL,0,0,1,NULL,NULL,2.6,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(132,1,NULL,0,0,0,'7.0',8,1,NULL,1,0,4,NULL,NULL,3.9,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(133,1,NULL,0,0,1,'1.0',1,1,NULL,0,0,2,NULL,NULL,2.38,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(687,8,NULL,2,0,1,'1.2',6,8,NULL,3,0,1,NULL,NULL,3.64,NULL,NULL,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(688,0,NULL,0,0,0,'1.1',1,0,NULL,2,0,2,NULL,NULL,3.24,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(689,3,NULL,1,0,1,'2.0',4,3,NULL,0,0,1,NULL,NULL,9.53,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(683,2,NULL,2,0,0,'5.0',4,2,NULL,3,0,5,NULL,NULL,3.16,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(682,0,NULL,0,0,0,'1.0',0,0,NULL,0,0,2,NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(684,1,NULL,1,0,0,'2.0',4,1,NULL,1,0,3,NULL,NULL,6.26,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(685,0,NULL,0,0,0,'1.0',1,0,NULL,0,0,1,NULL,NULL,3.22,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(680,4,NULL,2,0,0,'2.2',5,4,NULL,3,0,2,NULL,NULL,5.04,NULL,NULL,0,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(686,0,NULL,0,0,0,'1.0',2,0,NULL,0,0,1,NULL,NULL,4.54,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(681,0,NULL,0,0,0,'0.1',0,0,NULL,0,0,1,NULL,NULL,3.58,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1679,4,NULL,1,0,2,'6.1',5,4,NULL,0,0,5,NULL,NULL,5.02,NULL,NULL,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1761,2,NULL,0,0,0,'6.0',3,2,NULL,5,0,3,NULL,NULL,5.56,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1763,2,NULL,2,0,0,'5.0',6,2,NULL,1,0,2,NULL,NULL,4.99,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1747,8,NULL,2,0,1,'4.0',9,8,NULL,2,0,3,NULL,NULL,4.27,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1678,2,NULL,0,0,2,'6.0',3,2,NULL,0,0,4,NULL,NULL,3.46,NULL,NULL,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1759,2,NULL,0,0,0,'6.0',7,2,NULL,2,0,5,NULL,NULL,2.45,NULL,NULL,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1738,0,NULL,0,0,0,'5.0',3,0,NULL,1,0,3,NULL,NULL,4.13,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1757,5,NULL,0,0,2,'2.0',5,5,NULL,0,0,2,NULL,NULL,4.94,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1754,3,NULL,2,0,0,'3.0',4,2,NULL,2,0,1,NULL,NULL,3.97,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1755,5,NULL,3,0,2,'3.0',7,5,NULL,3,0,2,NULL,NULL,5.56,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1750,3,NULL,5,0,0,'5.0',6,3,NULL,1,0,1,NULL,NULL,4.4,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1741,4,NULL,1,0,0,'3.1',4,4,NULL,3,0,3,NULL,NULL,7.31,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1736,6,NULL,2,1,0,'1.1',6,6,NULL,3,0,0,NULL,NULL,3.95,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1762,3,NULL,1,0,1,'5.0',7,3,NULL,3,0,1,NULL,NULL,6.4,NULL,NULL,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1752,0,NULL,0,0,0,'2.0',2,0,NULL,0,0,3,NULL,NULL,4.35,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1753,7,NULL,3,0,3,'2.1',9,7,NULL,2,0,1,NULL,NULL,5.44,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1766,0,NULL,0,0,0,'3.1',1,0,NULL,0,0,5,NULL,NULL,4.99,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1728,0,NULL,1,0,0,'3.2',3,0,NULL,1,0,0,NULL,NULL,5.46,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1749,6,NULL,1,0,2,'5.0',7,5,NULL,1,0,6,NULL,NULL,3.56,NULL,NULL,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1727,0,NULL,0,0,0,'3.0',2,0,NULL,0,0,1,NULL,NULL,3.68,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1743,4,NULL,1,0,2,'4.0',5,4,NULL,0,0,4,NULL,NULL,4.65,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1751,3,NULL,3,0,0,'5.2',8,3,NULL,1,0,6,NULL,NULL,4.07,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1758,4,NULL,0,0,3,'3.0',6,4,NULL,0,0,1,NULL,NULL,4.29,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1760,1,NULL,0,0,1,'6.0',3,1,NULL,1,0,6,NULL,NULL,4.44,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1765,2,NULL,0,0,1,'3.0',5,2,NULL,0,0,2,NULL,NULL,2.88,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1737,3,NULL,0,0,1,'3.0',1,3,NULL,2,0,2,NULL,NULL,5.74,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1742,0,NULL,0,0,0,'0.2',1,0,NULL,1,0,1,NULL,NULL,2.25,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1756,0,NULL,0,0,0,'0.2',0,0,NULL,0,0,0,NULL,NULL,3.38,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1748,0,NULL,0,0,0,'0.1',0,0,NULL,0,0,0,NULL,NULL,3.11,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1764,0,NULL,0,0,0,'0.1',0,0,NULL,0,0,1,NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `baseball_pitching_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basketball_defensive_stats`
--

DROP TABLE IF EXISTS `basketball_defensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basketball_defensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steals_total` varchar(100) DEFAULT NULL,
  `steals_per_game` varchar(100) DEFAULT NULL,
  `blocks_total` varchar(100) DEFAULT NULL,
  `blocks_per_game` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basketball_defensive_stats`
--

LOCK TABLES `basketball_defensive_stats` WRITE;
/*!40000 ALTER TABLE `basketball_defensive_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `basketball_defensive_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basketball_event_states`
--

DROP TABLE IF EXISTS `basketball_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basketball_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` tinyint(4) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_basketball_event_states_context` (`context`),
  KEY `IDX_basketball_event_states_seq_num` (`sequence_number`),
  KEY `IDX_FK_events_basketball_event_states` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basketball_event_states`
--

LOCK TABLES `basketball_event_states` WRITE;
/*!40000 ALTER TABLE `basketball_event_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `basketball_event_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basketball_offensive_stats`
--

DROP TABLE IF EXISTS `basketball_offensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basketball_offensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_goals_made` int(11) DEFAULT NULL,
  `field_goals_attempted` int(11) DEFAULT NULL,
  `field_goals_percentage` varchar(100) DEFAULT NULL,
  `field_goals_per_game` varchar(100) DEFAULT NULL,
  `field_goals_attempted_per_game` varchar(100) DEFAULT NULL,
  `field_goals_percentage_adjusted` varchar(100) DEFAULT NULL,
  `three_pointers_made` int(11) DEFAULT NULL,
  `three_pointers_attempted` int(11) DEFAULT NULL,
  `three_pointers_percentage` varchar(100) DEFAULT NULL,
  `three_pointers_per_game` varchar(100) DEFAULT NULL,
  `three_pointers_attempted_per_game` varchar(100) DEFAULT NULL,
  `free_throws_made` varchar(100) DEFAULT NULL,
  `free_throws_attempted` varchar(100) DEFAULT NULL,
  `free_throws_percentage` varchar(100) DEFAULT NULL,
  `free_throws_per_game` varchar(100) DEFAULT NULL,
  `free_throws_attempted_per_game` varchar(100) DEFAULT NULL,
  `points_scored_total` varchar(100) DEFAULT NULL,
  `points_scored_per_game` varchar(100) DEFAULT NULL,
  `assists_total` varchar(100) DEFAULT NULL,
  `assists_per_game` varchar(100) DEFAULT NULL,
  `turnovers_total` varchar(100) DEFAULT NULL,
  `turnovers_per_game` varchar(100) DEFAULT NULL,
  `points_scored_off_turnovers` varchar(100) DEFAULT NULL,
  `points_scored_in_paint` varchar(100) DEFAULT NULL,
  `points_scored_on_second_chance` varchar(100) DEFAULT NULL,
  `points_scored_on_fast_break` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basketball_offensive_stats`
--

LOCK TABLES `basketball_offensive_stats` WRITE;
/*!40000 ALTER TABLE `basketball_offensive_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `basketball_offensive_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basketball_rebounding_stats`
--

DROP TABLE IF EXISTS `basketball_rebounding_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basketball_rebounding_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rebounds_total` varchar(100) DEFAULT NULL,
  `rebounds_per_game` varchar(100) DEFAULT NULL,
  `rebounds_defensive` varchar(100) DEFAULT NULL,
  `rebounds_offensive` varchar(100) DEFAULT NULL,
  `team_rebounds_total` varchar(100) DEFAULT NULL,
  `team_rebounds_per_game` varchar(100) DEFAULT NULL,
  `team_rebounds_defensive` varchar(100) DEFAULT NULL,
  `team_rebounds_offensive` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basketball_rebounding_stats`
--

LOCK TABLES `basketball_rebounding_stats` WRITE;
/*!40000 ALTER TABLE `basketball_rebounding_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `basketball_rebounding_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basketball_team_stats`
--

DROP TABLE IF EXISTS `basketball_team_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basketball_team_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeouts_left` varchar(100) DEFAULT NULL,
  `largest_lead` varchar(100) DEFAULT NULL,
  `fouls_total` varchar(100) DEFAULT NULL,
  `turnover_margin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basketball_team_stats`
--

LOCK TABLES `basketball_team_stats` WRITE;
/*!40000 ALTER TABLE `basketball_team_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `basketball_team_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmakers`
--

DROP TABLE IF EXISTS `bookmakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmakers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_key` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_boo_loc_id__loc_id` (`location_id`),
  KEY `FK_boo_pub_id__pub_id` (`publisher_id`),
  CONSTRAINT `FK_boo_loc_id__loc_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_boo_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmakers`
--

LOCK TABLES `bookmakers` WRITE;
/*!40000 ALTER TABLE `bookmakers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_stats`
--

DROP TABLE IF EXISTS `core_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` varchar(100) DEFAULT NULL,
  `score_opposing` varchar(100) DEFAULT NULL,
  `score_attempts` varchar(100) DEFAULT NULL,
  `score_attempts_opposing` varchar(100) DEFAULT NULL,
  `score_percentage` varchar(100) DEFAULT NULL,
  `score_percentage_opposing` varchar(100) DEFAULT NULL,
  `time_played_event` varchar(40) DEFAULT NULL,
  `time_played_total` varchar(40) DEFAULT NULL,
  `time_played_event_average` varchar(40) DEFAULT NULL,
  `events_played` varchar(40) DEFAULT NULL,
  `events_started` varchar(40) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_stats`
--

LOCK TABLES `core_stats` WRITE;
/*!40000 ALTER TABLE `core_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_info`
--

DROP TABLE IF EXISTS `db_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_info` (
  `version` varchar(100) NOT NULL DEFAULT '16',
  KEY `IDX_db_info_1` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_info`
--

LOCK TABLES `db_info` WRITE;
/*!40000 ALTER TABLE `db_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `display_names`
--

DROP TABLE IF EXISTS `display_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `display_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(100) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_display_names_1` (`entity_id`),
  KEY `IDX_display_names_2` (`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display_names`
--

LOCK TABLES `display_names` WRITE;
/*!40000 ALTER TABLE `display_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `display_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_classes`
--

DROP TABLE IF EXISTS `document_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_document_classes_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_classes`
--

LOCK TABLES `document_classes` WRITE;
/*!40000 ALTER TABLE `document_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_contents`
--

DROP TABLE IF EXISTS `document_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `sportsml` varchar(200) DEFAULT NULL,
  `sportsml_blob` text DEFAULT NULL,
  `abstract` text DEFAULT NULL,
  `abstract_blob` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_doc_con_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_con_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_contents`
--

LOCK TABLES `document_contents` WRITE;
/*!40000 ALTER TABLE `document_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_fixtures`
--

DROP TABLE IF EXISTS `document_fixtures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_fixtures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fixture_key` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `document_class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_document_fixtures_1` (`fixture_key`),
  KEY `IDX_FK_doc_fix_doc_cla_id__doc_cla_id` (`document_class_id`),
  KEY `IDX_FK_doc_fix_pub_id__pub_id` (`publisher_id`),
  CONSTRAINT `FK_doc_fix_doc_cla_id__doc_cla_id` FOREIGN KEY (`document_class_id`) REFERENCES `document_classes` (`id`),
  CONSTRAINT `FK_doc_fix_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_fixtures`
--

LOCK TABLES `document_fixtures` WRITE;
/*!40000 ALTER TABLE `document_fixtures` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_fixtures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_fixtures_events`
--

DROP TABLE IF EXISTS `document_fixtures_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_fixtures_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_doc_fix_eve_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_doc_fix_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_fixtures_events`
--

LOCK TABLES `document_fixtures_events` WRITE;
/*!40000 ALTER TABLE `document_fixtures_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_fixtures_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_package_entry`
--

DROP TABLE IF EXISTS `document_package_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_package_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_package_id` int(11) NOT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `document_id` int(11) NOT NULL,
  `headline` varchar(100) DEFAULT NULL,
  `short_headline` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_doc_pac_ent_doc_pac_id__doc_pac_id` (`document_package_id`),
  KEY `FK_doc_pac_ent_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_pac_ent_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_doc_pac_ent_doc_pac_id__doc_pac_id` FOREIGN KEY (`document_package_id`) REFERENCES `document_packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_package_entry`
--

LOCK TABLES `document_package_entry` WRITE;
/*!40000 ALTER TABLE `document_package_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_package_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_packages`
--

DROP TABLE IF EXISTS `document_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_key` varchar(100) DEFAULT NULL,
  `package_name` varchar(100) DEFAULT NULL,
  `date_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_packages`
--

LOCK TABLES `document_packages` WRITE;
/*!40000 ALTER TABLE `document_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(75) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `revision_id` varchar(255) DEFAULT NULL,
  `stats_coverage` varchar(100) DEFAULT NULL,
  `document_fixture_id` int(11) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `db_loading_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_documents_1` (`doc_id`),
  KEY `IDX_documents_3` (`date_time`),
  KEY `IDX_documents_4` (`priority`),
  KEY `IDX_documents_5` (`revision_id`),
  KEY `IDX_FK_doc_doc_fix_id__doc_fix_id` (`document_fixture_id`),
  KEY `IDX_FK_doc_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_FK_doc_sou_id__pub_id` (`source_id`),
  CONSTRAINT `FK_doc_doc_fix_id__doc_fix_id` FOREIGN KEY (`document_fixture_id`) REFERENCES `document_fixtures` (`id`),
  CONSTRAINT `FK_doc_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `FK_doc_sou_id__pub_id` FOREIGN KEY (`source_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_media`
--

DROP TABLE IF EXISTS `documents_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `media_caption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_doc_med_med_cap_id__med_cap_id` (`media_caption_id`),
  KEY `FK_doc_med_med_id__med_id` (`media_id`),
  KEY `FK_doc_med_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_med_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_doc_med_med_cap_id__med_cap_id` FOREIGN KEY (`media_caption_id`) REFERENCES `media_captions` (`id`),
  CONSTRAINT `FK_doc_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_media`
--

LOCK TABLES `documents_media` WRITE;
/*!40000 ALTER TABLE `documents_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_action_fouls`
--

DROP TABLE IF EXISTS `event_action_fouls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_action_fouls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `foul_name` varchar(100) DEFAULT NULL,
  `foul_result` varchar(100) DEFAULT NULL,
  `foul_type` varchar(100) DEFAULT NULL,
  `fouler_id` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_fouls` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_fouls` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_action_fouls`
--

LOCK TABLES `event_action_fouls` WRITE;
/*!40000 ALTER TABLE `event_action_fouls` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_action_fouls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_action_participants`
--

DROP TABLE IF EXISTS `event_action_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_action_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `event_action_play_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `participant_role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_action_plays_event_action_participants` (`event_action_play_id`),
  KEY `FK_persons_event_action_participants` (`person_id`),
  KEY `FK_event_states_event_action_participants` (`event_state_id`),
  CONSTRAINT `FK_event_action_plays_event_action_participants` FOREIGN KEY (`event_action_play_id`) REFERENCES `event_action_plays` (`id`),
  CONSTRAINT `FK_event_states_event_action_participants` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`),
  CONSTRAINT `FK_persons_event_action_participants` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_action_participants`
--

LOCK TABLES `event_action_participants` WRITE;
/*!40000 ALTER TABLE `event_action_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_action_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_action_penalties`
--

DROP TABLE IF EXISTS `event_action_penalties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_action_penalties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `penalty_type` varchar(100) DEFAULT NULL,
  `penalty_level` varchar(100) DEFAULT NULL,
  `caution_level` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_penalties` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_penalties` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_action_penalties`
--

LOCK TABLES `event_action_penalties` WRITE;
/*!40000 ALTER TABLE `event_action_penalties` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_action_penalties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_action_plays`
--

DROP TABLE IF EXISTS `event_action_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_action_plays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `score_attempt_type` varchar(100) DEFAULT NULL,
  `play_result` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_plays` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_plays` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_action_plays`
--

LOCK TABLES `event_action_plays` WRITE;
/*!40000 ALTER TABLE `event_action_plays` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_action_plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_action_substitutions`
--

DROP TABLE IF EXISTS `event_action_substitutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_action_substitutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `person_original_id` int(11) NOT NULL,
  `person_original_position_id` int(11) NOT NULL,
  `person_replacing_id` int(11) NOT NULL,
  `person_replacing_position_id` int(11) NOT NULL,
  `substitution_reason` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_persons_event_action_substitutions1` (`person_replacing_id`),
  KEY `FK_persons_event_action_substitutions` (`person_original_id`),
  KEY `FK_event_states_event_action_substitutions` (`event_state_id`),
  KEY `FK_positions_event_action_substitutions1` (`person_replacing_position_id`),
  KEY `FK_positions_event_action_substitutions` (`person_original_position_id`),
  CONSTRAINT `FK_event_states_event_action_substitutions` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`),
  CONSTRAINT `FK_persons_event_action_substitutions` FOREIGN KEY (`person_original_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_persons_event_action_substitutions1` FOREIGN KEY (`person_replacing_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_positions_event_action_substitutions` FOREIGN KEY (`person_original_position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_positions_event_action_substitutions1` FOREIGN KEY (`person_replacing_position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_action_substitutions`
--

LOCK TABLES `event_action_substitutions` WRITE;
/*!40000 ALTER TABLE `event_action_substitutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_action_substitutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_states`
--

DROP TABLE IF EXISTS `event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` int(11) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `minutes_elapsed` varchar(100) DEFAULT NULL,
  `period_minutes_elapsed` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_events_event_states` (`event_id`),
  KEY `IDX_event_states_context` (`context`),
  KEY `IDX_event_states_seq_num` (`sequence_number`),
  CONSTRAINT `FK_events_event_states` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_states`
--

LOCK TABLES `event_states` WRITE;
/*!40000 ALTER TABLE `event_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `site_alignment` varchar(100) DEFAULT NULL,
  `event_status` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `attendance` varchar(100) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `event_number` varchar(32) DEFAULT NULL,
  `round_number` varchar(32) DEFAULT NULL,
  `time_certainty` varchar(100) DEFAULT NULL,
  `broadcast_listing` varchar(255) DEFAULT NULL,
  `start_date_time_local` datetime DEFAULT NULL,
  `medal_event` varchar(100) DEFAULT NULL,
  `series_index` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_events_1` (`event_key`),
  KEY `IDX_FK_eve_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_FK_eve_sit_id__sit_id` (`site_id`),
  CONSTRAINT `FK_eve_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `FK_eve_sit_id__sit_id` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_documents`
--

DROP TABLE IF EXISTS `events_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_documents` (
  `event_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_eve_doc_doc_id__doc_id` (`document_id`),
  KEY `FK_eve_doc_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_eve_doc_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_documents`
--

LOCK TABLES `events_documents` WRITE;
/*!40000 ALTER TABLE `events_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_media`
--

DROP TABLE IF EXISTS `events_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_media` (
  `event_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_eve_med_med_id__med_id` (`media_id`),
  KEY `FK_eve_med_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_med_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_eve_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_media`
--

LOCK TABLES `events_media` WRITE;
/*!40000 ALTER TABLE `events_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_sub_seasons`
--

DROP TABLE IF EXISTS `events_sub_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_sub_seasons` (
  `event_id` int(11) NOT NULL,
  `sub_season_id` int(11) NOT NULL,
  KEY `FK_eve_sub_sea_sub_sea_id__sub_sea_id` (`sub_season_id`),
  KEY `FK_eve_sub_sea_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_sub_sea_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_eve_sub_sea_sub_sea_id__sub_sea_id` FOREIGN KEY (`sub_season_id`) REFERENCES `sub_seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_sub_seasons`
--

LOCK TABLES `events_sub_seasons` WRITE;
/*!40000 ALTER TABLE `events_sub_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_sub_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_location`
--

DROP TABLE IF EXISTS `game_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tournament_name` varchar(45) DEFAULT NULL,
  `game_location` varchar(100) DEFAULT NULL,
  `player_1_name` varchar(120) DEFAULT NULL,
  `player_2_name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tournamentName_idx` (`tournament_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_location`
--

LOCK TABLES `game_location` WRITE;
/*!40000 ALTER TABLE `game_location` DISABLE KEYS */;
INSERT INTO `game_location` VALUES
(1,'Setka','Pretoria','Ma','Liang'),
(2,'World Table Tennis Championships','Hatfield','Hugo','Liang'),
(3,'olympics','Hatfield','Hugo','Liang');
/*!40000 ALTER TABLE `game_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ice_hockey_action_participants`
--

DROP TABLE IF EXISTS `ice_hockey_action_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_action_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ice_hockey_action_play_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `participant_role` varchar(100) DEFAULT NULL,
  `point_credit` int(11) DEFAULT NULL,
  `goals_to_date` int(11) DEFAULT NULL,
  `assists_to_date` int(11) DEFAULT NULL,
  `points_to_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ice_hockey_action_plays_ice_hockey_action_participants` (`ice_hockey_action_play_id`),
  KEY `FK_persons_ice_hockey_action_participants` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ice_hockey_action_participants`
--

LOCK TABLES `ice_hockey_action_participants` WRITE;
/*!40000 ALTER TABLE `ice_hockey_action_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `ice_hockey_action_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ice_hockey_action_plays`
--

DROP TABLE IF EXISTS `ice_hockey_action_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_action_plays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ice_hockey_event_state_id` int(11) NOT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `score_attempt_type` varchar(100) DEFAULT NULL,
  `play_result` varchar(100) DEFAULT NULL,
  `penalty_type` varchar(100) DEFAULT NULL,
  `penalty_length` varchar(100) DEFAULT NULL,
  `penalty_code` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `strength` varchar(100) DEFAULT NULL,
  `location_x` varchar(100) DEFAULT NULL,
  `location_y` varchar(100) DEFAULT NULL,
  `location_zone` varchar(100) DEFAULT NULL,
  `shootout_shot_order` int(11) DEFAULT NULL,
  `goal_order` int(11) DEFAULT NULL,
  `shot_type` varchar(100) DEFAULT NULL,
  `shot_distance` varchar(100) DEFAULT NULL,
  `goal_zone` varchar(100) DEFAULT NULL,
  `empty_net` varchar(100) DEFAULT NULL,
  `goal_awarded` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ice_hockey_event_states_ice_hockey_action_plays` (`ice_hockey_event_state_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ice_hockey_action_plays`
--

LOCK TABLES `ice_hockey_action_plays` WRITE;
/*!40000 ALTER TABLE `ice_hockey_action_plays` DISABLE KEYS */;
/*!40000 ALTER TABLE `ice_hockey_action_plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ice_hockey_defensive_stats`
--

DROP TABLE IF EXISTS `ice_hockey_defensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_defensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shots_power_play_allowed` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_allowed` varchar(100) DEFAULT NULL,
  `goals_power_play_allowed` varchar(100) DEFAULT NULL,
  `goals_penalty_shot_allowed` varchar(100) DEFAULT NULL,
  `goals_against_average` varchar(100) DEFAULT NULL,
  `saves` varchar(100) DEFAULT NULL,
  `save_percentage` varchar(100) DEFAULT NULL,
  `penalty_killing_amount` varchar(100) DEFAULT NULL,
  `penalty_killing_percentage` varchar(100) DEFAULT NULL,
  `shots_blocked` varchar(100) DEFAULT NULL,
  `takeaways` varchar(100) DEFAULT NULL,
  `shutouts` varchar(100) DEFAULT NULL,
  `minutes_penalty_killing` varchar(100) DEFAULT NULL,
  `hits` varchar(100) DEFAULT NULL,
  `goals_empty_net_allowed` varchar(100) DEFAULT NULL,
  `goals_short_handed_allowed` varchar(100) DEFAULT NULL,
  `goals_shootout_allowed` varchar(100) DEFAULT NULL,
  `shots_shootout_allowed` varchar(100) DEFAULT NULL,
  `goaltender_wins` int(11) DEFAULT NULL,
  `goaltender_losses` int(11) DEFAULT NULL,
  `goaltender_ties` int(11) DEFAULT NULL,
  `goals_allowed` int(11) DEFAULT NULL,
  `shots_allowed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ice_hockey_defensive_stats`
--

LOCK TABLES `ice_hockey_defensive_stats` WRITE;
/*!40000 ALTER TABLE `ice_hockey_defensive_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `ice_hockey_defensive_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ice_hockey_event_states`
--

DROP TABLE IF EXISTS `ice_hockey_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` tinyint(4) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `action_key` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ice_hoc_eve_sta_eve_id__eve_id` (`event_id`),
  KEY `IDX_ice_hockey_event_states_context` (`context`),
  KEY `IDX_ice_hockey_event_states_seq_num` (`sequence_number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ice_hockey_event_states`
--

LOCK TABLES `ice_hockey_event_states` WRITE;
/*!40000 ALTER TABLE `ice_hockey_event_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `ice_hockey_event_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ice_hockey_offensive_stats`
--

DROP TABLE IF EXISTS `ice_hockey_offensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_offensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goals_game_winning` varchar(100) DEFAULT NULL,
  `goals_game_tying` varchar(100) DEFAULT NULL,
  `goals_power_play` varchar(100) DEFAULT NULL,
  `goals_short_handed` varchar(100) DEFAULT NULL,
  `goals_even_strength` varchar(100) DEFAULT NULL,
  `goals_empty_net` varchar(100) DEFAULT NULL,
  `goals_overtime` varchar(100) DEFAULT NULL,
  `goals_shootout` varchar(100) DEFAULT NULL,
  `goals_penalty_shot` varchar(100) DEFAULT NULL,
  `assists` varchar(100) DEFAULT NULL,
  `points` varchar(100) DEFAULT NULL,
  `power_play_amount` varchar(100) DEFAULT NULL,
  `power_play_percentage` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_taken` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_missed` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_percentage` varchar(100) DEFAULT NULL,
  `giveaways` varchar(100) DEFAULT NULL,
  `minutes_power_play` varchar(100) DEFAULT NULL,
  `faceoff_wins` varchar(100) DEFAULT NULL,
  `faceoff_losses` varchar(100) DEFAULT NULL,
  `faceoff_win_percentage` varchar(100) DEFAULT NULL,
  `scoring_chances` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ice_hockey_offensive_stats`
--

LOCK TABLES `ice_hockey_offensive_stats` WRITE;
/*!40000 ALTER TABLE `ice_hockey_offensive_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `ice_hockey_offensive_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ice_hockey_player_stats`
--

DROP TABLE IF EXISTS `ice_hockey_player_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_player_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plus_minus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ice_hockey_player_stats`
--

LOCK TABLES `ice_hockey_player_stats` WRITE;
/*!40000 ALTER TABLE `ice_hockey_player_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `ice_hockey_player_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injury_phases`
--

DROP TABLE IF EXISTS `injury_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `injury_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `injury_status` varchar(100) DEFAULT NULL,
  `injury_type` varchar(100) DEFAULT NULL,
  `injury_comment` varchar(100) DEFAULT NULL,
  `disabled_list` varchar(100) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `phase_type` varchar(100) DEFAULT NULL,
  `injury_side` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_inj_pha_per_id__per_id` (`person_id`),
  KEY `IDX_FK_inj_pha_sea_id__sea_id` (`season_id`),
  KEY `IDX_injury_phases_2` (`injury_status`),
  KEY `IDX_injury_phases_3` (`start_date_time`),
  KEY `IDX_injury_phases_4` (`end_date_time`),
  CONSTRAINT `FK_inj_pha_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_inj_pha_sea_id__sea_id` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injury_phases`
--

LOCK TABLES `injury_phases` WRITE;
/*!40000 ALTER TABLE `injury_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `injury_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_aliases`
--

DROP TABLE IF EXISTS `key_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_id` int(11) NOT NULL,
  `key_root_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_key_roots_key_aliases` (`key_root_id`),
  KEY `IDX_key_aliases_2` (`key_id`),
  CONSTRAINT `FK_key_roots_key_aliases` FOREIGN KEY (`key_root_id`) REFERENCES `key_roots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_aliases`
--

LOCK TABLES `key_aliases` WRITE;
/*!40000 ALTER TABLE `key_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `key_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_roots`
--

DROP TABLE IF EXISTS `key_roots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_roots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_key_aliases_1` (`key_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_roots`
--

LOCK TABLES `key_roots` WRITE;
/*!40000 ALTER TABLE `key_roots` DISABLE KEYS */;
/*!40000 ALTER TABLE `key_roots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `latest_revisions`
--

DROP TABLE IF EXISTS `latest_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latest_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` varchar(255) NOT NULL,
  `latest_document_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_lat_rev_lat_doc_id__doc_id` (`latest_document_id`),
  KEY `IDX_latest_revisions_1` (`revision_id`),
  CONSTRAINT `FK_lat_rev_lat_doc_id__doc_id` FOREIGN KEY (`latest_document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latest_revisions`
--

LOCK TABLES `latest_revisions` WRITE;
/*!40000 ALTER TABLE `latest_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `latest_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `country_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_locations_1` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES
(1,'Czech','Moscow','Russia','Russia','GMT+2','49.8175° N','15.4730° E','+7');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `revision_id` int(11) DEFAULT NULL,
  `media_type` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `credit_id` int(11) NOT NULL,
  `db_loading_date_time` datetime DEFAULT NULL,
  `creation_location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_cre_id__per_id` (`credit_id`),
  KEY `FK_med_pub_id__pub_id` (`publisher_id`),
  KEY `FK_med_cre_loc_id__loc_id` (`creation_location_id`),
  CONSTRAINT `FK_med_cre_id__per_id` FOREIGN KEY (`credit_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_med_cre_loc_id__loc_id` FOREIGN KEY (`creation_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_med_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_captions`
--

DROP TABLE IF EXISTS `media_captions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_captions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `caption_type` varchar(100) DEFAULT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `caption_author_id` int(11) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `caption_size` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_cap_med_id__med_id` (`media_id`),
  KEY `FK_med_cap_cap_aut_id__per_id` (`caption_author_id`),
  CONSTRAINT `FK_med_cap_cap_aut_id__per_id` FOREIGN KEY (`caption_author_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_med_cap_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_captions`
--

LOCK TABLES `media_captions` WRITE;
/*!40000 ALTER TABLE `media_captions` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_captions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_contents`
--

DROP TABLE IF EXISTS `media_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `object` varchar(100) DEFAULT NULL,
  `format` varchar(100) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `width` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `file_size` varchar(100) DEFAULT NULL,
  `resolution` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_con_med_id__med_id` (`media_id`),
  CONSTRAINT `FK_med_con_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_contents`
--

LOCK TABLES `media_contents` WRITE;
/*!40000 ALTER TABLE `media_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_keywords`
--

DROP TABLE IF EXISTS `media_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_key_med_id__med_id` (`media_id`),
  CONSTRAINT `FK_med_key_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_keywords`
--

LOCK TABLES `media_keywords` WRITE;
/*!40000 ALTER TABLE `media_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motor_racing_event_states`
--

DROP TABLE IF EXISTS `motor_racing_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motor_racing_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` tinyint(4) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `lap` varchar(100) DEFAULT NULL,
  `laps_remaining` varchar(100) DEFAULT NULL,
  `time_elapsed` varchar(100) DEFAULT NULL,
  `flag_state` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_events_motor_racing_event_states` (`event_id`),
  KEY `IDX_motor_racing_event_states_context` (`context`),
  KEY `IDX_motor_racing_event_states_seq_num` (`sequence_number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motor_racing_event_states`
--

LOCK TABLES `motor_racing_event_states` WRITE;
/*!40000 ALTER TABLE `motor_racing_event_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `motor_racing_event_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motor_racing_qualifying_stats`
--

DROP TABLE IF EXISTS `motor_racing_qualifying_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motor_racing_qualifying_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid` varchar(100) DEFAULT NULL,
  `pole_position` varchar(100) DEFAULT NULL,
  `pole_wins` varchar(100) DEFAULT NULL,
  `qualifying_speed` varchar(100) DEFAULT NULL,
  `qualifying_speed_units` varchar(100) DEFAULT NULL,
  `qualifying_time` varchar(100) DEFAULT NULL,
  `qualifying_position` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motor_racing_qualifying_stats`
--

LOCK TABLES `motor_racing_qualifying_stats` WRITE;
/*!40000 ALTER TABLE `motor_racing_qualifying_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `motor_racing_qualifying_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motor_racing_race_stats`
--

DROP TABLE IF EXISTS `motor_racing_race_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motor_racing_race_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_behind_leader` varchar(100) DEFAULT NULL,
  `laps_behind_leader` varchar(100) DEFAULT NULL,
  `time_ahead_follower` varchar(100) DEFAULT NULL,
  `laps_ahead_follower` varchar(100) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `points` varchar(100) DEFAULT NULL,
  `points_rookie` varchar(100) DEFAULT NULL,
  `bonus` varchar(100) DEFAULT NULL,
  `laps_completed` varchar(100) DEFAULT NULL,
  `laps_leading_total` varchar(100) DEFAULT NULL,
  `distance_leading` varchar(100) DEFAULT NULL,
  `distance_completed` varchar(100) DEFAULT NULL,
  `distance_units` varchar(40) DEFAULT NULL,
  `speed_average` varchar(40) DEFAULT NULL,
  `speed_units` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `finishes_top_5` varchar(40) DEFAULT NULL,
  `finishes_top_10` varchar(40) DEFAULT NULL,
  `starts` varchar(40) DEFAULT NULL,
  `finishes` varchar(40) DEFAULT NULL,
  `non_finishes` varchar(40) DEFAULT NULL,
  `wins` varchar(40) DEFAULT NULL,
  `races_leading` varchar(40) DEFAULT NULL,
  `money` varchar(40) DEFAULT NULL,
  `money_units` varchar(40) DEFAULT NULL,
  `leads_total` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motor_racing_race_stats`
--

LOCK TABLES `motor_racing_race_stats` WRITE;
/*!40000 ALTER TABLE `motor_racing_race_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `motor_racing_race_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_totals`
--

DROP TABLE IF EXISTS `outcome_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_totals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standing_subgroup_id` int(11) NOT NULL,
  `outcome_holder_type` varchar(100) DEFAULT NULL,
  `outcome_holder_id` int(11) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `wins` varchar(100) DEFAULT NULL,
  `losses` varchar(100) DEFAULT NULL,
  `ties` varchar(100) DEFAULT NULL,
  `wins_overtime` int(11) DEFAULT NULL,
  `losses_overtime` int(11) DEFAULT NULL,
  `undecideds` varchar(100) DEFAULT NULL,
  `winning_percentage` varchar(100) DEFAULT NULL,
  `points_scored_for` varchar(100) DEFAULT NULL,
  `points_scored_against` varchar(100) DEFAULT NULL,
  `points_difference` varchar(100) DEFAULT NULL,
  `standing_points` varchar(100) DEFAULT NULL,
  `streak_type` varchar(100) DEFAULT NULL,
  `streak_duration` varchar(100) DEFAULT NULL,
  `streak_total` varchar(100) DEFAULT NULL,
  `streak_start` datetime DEFAULT NULL,
  `streak_end` datetime DEFAULT NULL,
  `events_played` int(11) DEFAULT NULL,
  `games_back` varchar(100) DEFAULT NULL,
  `result_effect` varchar(100) DEFAULT NULL,
  `sets_against` varchar(100) DEFAULT NULL,
  `sets_for` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_out_tot_sta_sub_id__sta_sub_id` (`standing_subgroup_id`),
  CONSTRAINT `FK_out_tot_sta_sub_id__sta_sub_id` FOREIGN KEY (`standing_subgroup_id`) REFERENCES `standing_subgroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_totals`
--

LOCK TABLES `outcome_totals` WRITE;
/*!40000 ALTER TABLE `outcome_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `outcome_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants_events`
--

DROP TABLE IF EXISTS `participants_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `alignment` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `event_outcome` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `result_effect` varchar(100) DEFAULT NULL,
  `score_attempts` int(11) DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `score_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_par_eve_eve_id__eve_id` (`event_id`),
  KEY `IDX_participants_events_1` (`participant_type`),
  KEY `IDX_participants_events_2` (`participant_id`),
  KEY `IDX_participants_events_3` (`alignment`),
  KEY `IDX_participants_events_4` (`event_outcome`),
  CONSTRAINT `FK_par_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants_events`
--

LOCK TABLES `participants_events` WRITE;
/*!40000 ALTER TABLE `participants_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `participants_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty_stats`
--

DROP TABLE IF EXISTS `penalty_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penalty_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty_stats`
--

LOCK TABLES `penalty_stats` WRITE;
/*!40000 ALTER TABLE `penalty_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `penalty_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_event_id` int(11) NOT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `score_attempts` int(11) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `sub_score_key` varchar(100) DEFAULT NULL,
  `sub_score_type` varchar(100) DEFAULT NULL,
  `sub_score_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_per_par_eve_id__par_eve_id` (`participant_event_id`),
  CONSTRAINT `FK_per_par_eve_id__par_eve_id` FOREIGN KEY (`participant_event_id`) REFERENCES `participants_events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_event_metadata`
--

DROP TABLE IF EXISTS `person_event_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_event_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `health` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `lineup_slot` int(11) DEFAULT NULL,
  `lineup_slot_sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_per_eve_met_eve_id__eve_id` (`event_id`),
  KEY `IDX_FK_per_eve_met_per_id__per_id` (`person_id`),
  KEY `IDX_FK_per_eve_met_pos_id__pos_id` (`position_id`),
  KEY `IDX_FK_per_eve_met_rol_id__rol_id` (`role_id`),
  KEY `IDX_FK_teams_person_event_metadata` (`team_id`),
  KEY `IDX_person_event_metadata_1` (`status`),
  CONSTRAINT `FK_per_eve_met_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_per_eve_met_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_per_eve_met_pos_id__pos_id` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_per_eve_met_rol_id__rol_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_per_eve_met_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_event_metadata`
--

LOCK TABLES `person_event_metadata` WRITE;
/*!40000 ALTER TABLE `person_event_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_event_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_phases`
--

DROP TABLE IF EXISTS `person_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `membership_type` varchar(40) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `role_status` varchar(40) DEFAULT NULL,
  `phase_status` varchar(40) DEFAULT NULL,
  `uniform_number` varchar(20) DEFAULT NULL,
  `regular_position_id` int(11) DEFAULT NULL,
  `regular_position_depth` varchar(40) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `entry_reason` varchar(40) DEFAULT NULL,
  `exit_reason` varchar(40) DEFAULT NULL,
  `selection_level` int(11) DEFAULT NULL,
  `selection_sublevel` int(11) DEFAULT NULL,
  `selection_overall` int(11) DEFAULT NULL,
  `duration` varchar(32) DEFAULT NULL,
  `phase_type` varchar(40) DEFAULT NULL,
  `subphase_type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_per_pha_rol_id__rol_id` (`role_id`),
  KEY `FK_per_pha_sta_sea_id__sea_id` (`start_season_id`),
  KEY `FK_per_pha_end_sea_id__sea_id` (`end_season_id`),
  KEY `IDX_FK_per_pha_per_id__per_id` (`person_id`),
  KEY `IDX_FK_per_pha_reg_pos_id__pos_id` (`regular_position_id`),
  KEY `IDX_person_phases_1` (`membership_type`),
  KEY `IDX_person_phases_2` (`membership_id`),
  KEY `IDX_person_phases_3` (`phase_status`),
  CONSTRAINT `FK_per_pha_end_sea_id__sea_id` FOREIGN KEY (`end_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_per_pha_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_per_pha_reg_pos_id__pos_id` FOREIGN KEY (`regular_position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_per_pha_rol_id__rol_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_per_pha_sta_sea_id__sea_id` FOREIGN KEY (`start_season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_phases`
--

LOCK TABLES `person_phases` WRITE;
/*!40000 ALTER TABLE `person_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `birth_date` varchar(30) DEFAULT NULL,
  `death_date` varchar(30) DEFAULT NULL,
  `final_resting_location_id` int(11) DEFAULT NULL,
  `birth_location_id` int(11) DEFAULT NULL,
  `hometown_location_id` int(11) DEFAULT NULL,
  `residence_location_id` int(11) DEFAULT NULL,
  `death_location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_persons_final_resting_location_id_locations_id` (`final_resting_location_id`),
  KEY `FK_per_bir_loc_id__loc_id` (`birth_location_id`),
  KEY `FK_per_dea_loc_id__loc_id` (`death_location_id`),
  KEY `FK_per_res_loc_id__loc_id` (`residence_location_id`),
  KEY `FK_per_hom_loc_id__loc_id` (`hometown_location_id`),
  KEY `IDX_FK_per_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_persons_1` (`person_key`),
  CONSTRAINT `FK_per_bir_loc_id__loc_id` FOREIGN KEY (`birth_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_per_dea_loc_id__loc_id` FOREIGN KEY (`death_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_per_hom_loc_id__loc_id` FOREIGN KEY (`hometown_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_per_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `FK_per_res_loc_id__loc_id` FOREIGN KEY (`residence_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_persons_final_resting_location_id_locations_id` FOREIGN KEY (`final_resting_location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES
(2,'1',1,'male','1986-05-23',NULL,1,1,1,1,NULL),
(3,'1',1,'male','1992-05-22',NULL,1,1,1,1,NULL),
(4,'1',1,'male','1994-10-07',NULL,1,1,1,1,NULL),
(5,'1',1,'male','1985-02-19',NULL,1,1,1,1,NULL),
(6,'1',1,'male','1999-12-22',NULL,1,1,1,1,NULL),
(7,'1',1,'male','1992-03-05',NULL,1,1,1,1,NULL),
(8,'1',1,'male','2001-09-27',NULL,1,1,1,1,NULL),
(9,'1',1,'male','1996-04-15',NULL,1,1,1,1,NULL),
(10,'1',1,'male','1989-11-12',NULL,1,1,1,1,NULL),
(11,'1',1,'male','1987-05-19',NULL,1,1,1,1,NULL),
(12,'1',1,'male','1987-06-04',NULL,1,1,1,1,NULL),
(13,'1',1,'male','1997-12-06',NULL,1,1,1,1,NULL),
(14,'1',1,'male','1998-01-15',NULL,1,1,1,1,NULL),
(15,'1',1,'male','1996-02-16',NULL,1,1,1,1,NULL),
(16,'1',1,'male','2000-04-15',NULL,1,1,1,1,NULL),
(17,'1',1,'male','2002-04-12',NULL,1,1,1,1,NULL),
(18,'1',1,'male','2003-17-21',NULL,1,1,1,1,NULL);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_documents`
--

DROP TABLE IF EXISTS `persons_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_documents` (
  `person_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_per_doc_per_id__per_id` (`person_id`),
  KEY `FK_per_doc_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_per_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_per_doc_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_documents`
--

LOCK TABLES `persons_documents` WRITE;
/*!40000 ALTER TABLE `persons_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_media`
--

DROP TABLE IF EXISTS `persons_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_media` (
  `person_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_per_med_med_id__med_id` (`media_id`),
  KEY `FK_per_med_per_id__per_id` (`person_id`),
  CONSTRAINT `FK_per_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `FK_per_med_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_media`
--

LOCK TABLES `persons_media` WRITE;
/*!40000 ALTER TABLE `persons_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `organisation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES
(1,'Fan','Zhendong','male','2000-06-06','ITTF'),
(2,'Ma','Long','male','1999-03-04','ITTF'),
(3,'Liang','JungKun','male','1990-12-04','ITTF'),
(4,'Hugo','Calderano','male','1994-02-04','FMTM'),
(6,'Truls','Moregard','male','1998-06-05','USATT'),
(7,'Darko','Jorgic','male','1998-06-05','ITTF'),
(8,'Tomokazu','Harimoto','male','1998-06-05','ITTF'),
(9,'Lin','Yun-Ju','male','1998-06-05','ITTF'),
(10,'Dimitrij','Ovtcharov','male','1998-06-05','ITTF'),
(11,'Quadri','Aruna','male','1998-06-05','FPTM'),
(12,'Timo','Boll','male','1997-05-02','FPTM'),
(13,'Patrick','Franziska','male','1987-02-05','FPTM'),
(14,'Wang','Chuqin','male','2000-06-06','ITTF'),
(15,'Dang','Qiu','male','2000-06-06','ITTF'),
(16,'Kristian','Karlsson','male','1997-03-04','ITTF'),
(17,'Anton','Kallberg','male','1997-03-04','ITTF'),
(18,'Liam','Pitchford','male','1997-03-04','USATT'),
(19,'Chuang','Chih-Yuan','male','1997-03-04','ITTF'),
(20,'Lin','Gaoyuan','male','1997-03-04','ITTF'),
(21,'Omar','Assar','male','1997-03-04','ITTF'),
(23,'Hugo','Tom','male','1999-03-04','TTIT');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `abbreviation` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_pos_aff_id__aff_id` (`affiliation_id`),
  KEY `IDX_positions_1` (`abbreviation`),
  CONSTRAINT `FK_pos_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_key` varchar(100) NOT NULL,
  `publisher_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_publishers_1` (`publisher_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES
(1,'1','china');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rankings`
--

DROP TABLE IF EXISTS `rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rankings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_fixture_id` int(11) DEFAULT NULL,
  `participant_type` varchar(100) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `issuer` varchar(100) DEFAULT NULL,
  `ranking_type` varchar(100) DEFAULT NULL,
  `ranking_value` varchar(100) DEFAULT NULL,
  `ranking_value_previous` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rankings`
--

LOCK TABLES `rankings` WRITE;
/*!40000 ALTER TABLE `rankings` DISABLE KEYS */;
/*!40000 ALTER TABLE `rankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `record_type` varchar(100) DEFAULT NULL,
  `record_label` varchar(100) DEFAULT NULL,
  `record_value` varchar(100) DEFAULT NULL,
  `previous_value` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_key` varchar(100) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_roles_1` (`role_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_key` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `league_id` int(11) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sea_lea_id__aff_id` (`league_id`),
  KEY `IDX_FK_sea_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_seasons_1` (`season_key`),
  CONSTRAINT `FK_sea_lea_id__aff_id` FOREIGN KEY (`league_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_sea_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_key` varchar(128) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sit_loc_id__loc_id` (`location_id`),
  KEY `IDX_FK_sit_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_sites_1` (`site_key`),
  CONSTRAINT `FK_sit_loc_id__loc_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_sit_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES
(1,'1',1,1);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soccer_action_fouls`
--

DROP TABLE IF EXISTS `soccer_action_fouls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_action_fouls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soccer_event_state_id` int(11) NOT NULL,
  `foul_name` varchar(100) DEFAULT NULL,
  `foul_result` varchar(100) DEFAULT NULL,
  `foul_type` varchar(100) DEFAULT NULL,
  `fouler_id` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int(11) NOT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soccer_event_states_soccer_action_fouls` (`soccer_event_state_id`),
  KEY `FK_persons_soccer_action_fouls` (`recipient_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soccer_action_fouls`
--

LOCK TABLES `soccer_action_fouls` WRITE;
/*!40000 ALTER TABLE `soccer_action_fouls` DISABLE KEYS */;
/*!40000 ALTER TABLE `soccer_action_fouls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soccer_action_participants`
--

DROP TABLE IF EXISTS `soccer_action_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_action_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soccer_action_play_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `participant_role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soccer_action_plays_soccer_action_participants` (`soccer_action_play_id`),
  KEY `FK_persons_soccer_action_participants` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soccer_action_participants`
--

LOCK TABLES `soccer_action_participants` WRITE;
/*!40000 ALTER TABLE `soccer_action_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `soccer_action_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soccer_action_penalties`
--

DROP TABLE IF EXISTS `soccer_action_penalties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_action_penalties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soccer_event_state_id` int(11) NOT NULL,
  `penalty_type` varchar(100) DEFAULT NULL,
  `penalty_level` varchar(100) DEFAULT NULL,
  `caution_value` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int(11) NOT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soccer_event_states_soccer_action_penalties` (`soccer_event_state_id`),
  KEY `FK_persons_soccer_action_penalties` (`recipient_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soccer_action_penalties`
--

LOCK TABLES `soccer_action_penalties` WRITE;
/*!40000 ALTER TABLE `soccer_action_penalties` DISABLE KEYS */;
/*!40000 ALTER TABLE `soccer_action_penalties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soccer_action_plays`
--

DROP TABLE IF EXISTS `soccer_action_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_action_plays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soccer_event_state_id` int(11) NOT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `score_attempt_type` varchar(100) DEFAULT NULL,
  `play_result` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soccer_event_states_soccer_action_plays` (`soccer_event_state_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soccer_action_plays`
--

LOCK TABLES `soccer_action_plays` WRITE;
/*!40000 ALTER TABLE `soccer_action_plays` DISABLE KEYS */;
/*!40000 ALTER TABLE `soccer_action_plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soccer_action_substitutions`
--

DROP TABLE IF EXISTS `soccer_action_substitutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_action_substitutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soccer_event_state_id` int(11) NOT NULL,
  `person_type` varchar(100) DEFAULT NULL,
  `person_original_id` int(11) NOT NULL,
  `person_original_position_id` int(11) NOT NULL,
  `person_replacing_id` int(11) NOT NULL,
  `person_replacing_position_id` int(11) NOT NULL,
  `substitution_reason` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soccer_event_states_soccer_action_substitutions` (`soccer_event_state_id`),
  KEY `FK_persons_soccer_action_substitutions` (`person_original_id`),
  KEY `FK_persons_soccer_action_substitutions1` (`person_replacing_id`),
  KEY `FK_positions_soccer_action_substitutions` (`person_original_position_id`),
  KEY `FK_positions_soccer_action_substitutions1` (`person_replacing_position_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soccer_action_substitutions`
--

LOCK TABLES `soccer_action_substitutions` WRITE;
/*!40000 ALTER TABLE `soccer_action_substitutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `soccer_action_substitutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soccer_defensive_stats`
--

DROP TABLE IF EXISTS `soccer_defensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_defensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shots_penalty_shot_allowed` varchar(100) DEFAULT NULL,
  `goals_penalty_shot_allowed` varchar(100) DEFAULT NULL,
  `goals_against_average` varchar(100) DEFAULT NULL,
  `goals_against_total` varchar(100) DEFAULT NULL,
  `saves` varchar(100) DEFAULT NULL,
  `save_percentage` varchar(100) DEFAULT NULL,
  `catches_punches` varchar(100) DEFAULT NULL,
  `shots_on_goal_total` varchar(100) DEFAULT NULL,
  `shots_shootout_total` varchar(100) DEFAULT NULL,
  `shots_shootout_allowed` varchar(100) DEFAULT NULL,
  `shots_blocked` varchar(100) DEFAULT NULL,
  `shutouts` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soccer_defensive_stats`
--

LOCK TABLES `soccer_defensive_stats` WRITE;
/*!40000 ALTER TABLE `soccer_defensive_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `soccer_defensive_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soccer_event_states`
--

DROP TABLE IF EXISTS `soccer_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` tinyint(4) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `minutes_elapsed` varchar(100) DEFAULT NULL,
  `period_minute_elapsed` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_events_soccer_event_states` (`event_id`),
  KEY `IDX_soccer_event_states_context` (`context`),
  KEY `IDX_soccer_event_states_seq_num` (`sequence_number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soccer_event_states`
--

LOCK TABLES `soccer_event_states` WRITE;
/*!40000 ALTER TABLE `soccer_event_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `soccer_event_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soccer_foul_stats`
--

DROP TABLE IF EXISTS `soccer_foul_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_foul_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fouls_suffered` varchar(100) DEFAULT NULL,
  `fouls_commited` varchar(100) DEFAULT NULL,
  `cautions_total` varchar(100) DEFAULT NULL,
  `cautions_pending` varchar(100) DEFAULT NULL,
  `caution_points_total` varchar(100) DEFAULT NULL,
  `caution_points_pending` varchar(100) DEFAULT NULL,
  `ejections_total` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soccer_foul_stats`
--

LOCK TABLES `soccer_foul_stats` WRITE;
/*!40000 ALTER TABLE `soccer_foul_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `soccer_foul_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soccer_offensive_stats`
--

DROP TABLE IF EXISTS `soccer_offensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_offensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goals_game_winning` varchar(100) DEFAULT NULL,
  `goals_game_tying` varchar(100) DEFAULT NULL,
  `goals_overtime` varchar(100) DEFAULT NULL,
  `goals_shootout` varchar(100) DEFAULT NULL,
  `goals_total` varchar(100) DEFAULT NULL,
  `assists_game_winning` varchar(100) DEFAULT NULL,
  `assists_game_tying` varchar(100) DEFAULT NULL,
  `assists_overtime` varchar(100) DEFAULT NULL,
  `assists_total` varchar(100) DEFAULT NULL,
  `points` varchar(100) DEFAULT NULL,
  `shots_total` varchar(100) DEFAULT NULL,
  `shots_on_goal_total` varchar(100) DEFAULT NULL,
  `shots_hit_frame` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_taken` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_scored` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_missed` varchar(40) DEFAULT NULL,
  `shots_penalty_shot_percentage` varchar(40) DEFAULT NULL,
  `shots_shootout_taken` varchar(40) DEFAULT NULL,
  `shots_shootout_scored` varchar(40) DEFAULT NULL,
  `shots_shootout_missed` varchar(40) DEFAULT NULL,
  `shots_shootout_percentage` varchar(40) DEFAULT NULL,
  `giveaways` varchar(40) DEFAULT NULL,
  `offsides` varchar(40) DEFAULT NULL,
  `corner_kicks` varchar(40) DEFAULT NULL,
  `hat_tricks` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soccer_offensive_stats`
--

LOCK TABLES `soccer_offensive_stats` WRITE;
/*!40000 ALTER TABLE `soccer_offensive_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `soccer_offensive_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_property`
--

DROP TABLE IF EXISTS `sports_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sports_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sports_property_type` varchar(100) DEFAULT NULL,
  `sports_property_id` int(11) DEFAULT NULL,
  `formal_name` varchar(100) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_property`
--

LOCK TABLES `sports_property` WRITE;
/*!40000 ALTER TABLE `sports_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `sports_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standing_subgroups`
--

DROP TABLE IF EXISTS `standing_subgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standing_subgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standing_id` int(11) NOT NULL,
  `affiliation_id` int(11) NOT NULL,
  `alignment_scope` varchar(100) DEFAULT NULL,
  `competition_scope` varchar(100) DEFAULT NULL,
  `competition_scope_id` varchar(100) DEFAULT NULL,
  `duration_scope` varchar(100) DEFAULT NULL,
  `scoping_label` varchar(100) DEFAULT NULL,
  `site_scope` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sta_sub_sta_id__sta_id` (`standing_id`),
  KEY `FK_sta_sub_aff_id__aff_id` (`affiliation_id`),
  CONSTRAINT `FK_sta_sub_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_sta_sub_sta_id__sta_id` FOREIGN KEY (`standing_id`) REFERENCES `standings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standing_subgroups`
--

LOCK TABLES `standing_subgroups` WRITE;
/*!40000 ALTER TABLE `standing_subgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `standing_subgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standings`
--

DROP TABLE IF EXISTS `standings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `standing_type` varchar(100) DEFAULT NULL,
  `sub_season_id` int(11) NOT NULL,
  `last_updated` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sta_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_sta_sub_sea_id__sub_sea_id` (`sub_season_id`),
  CONSTRAINT `FK_sta_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_sta_sub_sea_id__sub_sea_id` FOREIGN KEY (`sub_season_id`) REFERENCES `sub_seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standings`
--

LOCK TABLES `standings` WRITE;
/*!40000 ALTER TABLE `standings` DISABLE KEYS */;
/*!40000 ALTER TABLE `standings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_repository_type` varchar(100) DEFAULT NULL,
  `stat_repository_id` int(11) NOT NULL,
  `stat_holder_type` varchar(100) DEFAULT NULL,
  `stat_holder_id` int(11) DEFAULT NULL,
  `stat_coverage_type` varchar(100) DEFAULT NULL,
  `stat_coverage_id` int(11) DEFAULT NULL,
  `stat_membership_type` varchar(40) DEFAULT NULL,
  `stat_membership_id` int(11) DEFAULT NULL,
  `context` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_stats_1` (`stat_repository_type`),
  KEY `IDX_stats_2` (`stat_repository_id`),
  KEY `IDX_stats_3` (`stat_holder_type`),
  KEY `IDX_stats_4` (`stat_holder_id`),
  KEY `IDX_stats_5` (`stat_coverage_type`),
  KEY `IDX_stats_6` (`stat_coverage_id`),
  KEY `IDX_stats_7` (`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_periods`
--

DROP TABLE IF EXISTS `sub_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) NOT NULL,
  `sub_period_value` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `score_attempts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sub_per_per_id__per_id` (`period_id`),
  CONSTRAINT `FK_sub_per_per_id__per_id` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_periods`
--

LOCK TABLES `sub_periods` WRITE;
/*!40000 ALTER TABLE `sub_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_seasons`
--

DROP TABLE IF EXISTS `sub_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_season_key` varchar(100) NOT NULL,
  `season_id` int(11) NOT NULL,
  `sub_season_type` varchar(100) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sub_sea_sea_id__sea_id` (`season_id`),
  KEY `IDX_sub_seasons_1` (`sub_season_key`),
  KEY `IDX_sub_seasons_2` (`sub_season_type`),
  CONSTRAINT `FK_sub_sea_sea_id__sea_id` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_seasons`
--

LOCK TABLES `sub_seasons` WRITE;
/*!40000 ALTER TABLE `sub_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_tennis_event_stats`
--

DROP TABLE IF EXISTS `table_tennis_event_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_tennis_event_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(45) NOT NULL,
  `current_state` varchar(45) DEFAULT NULL,
  `matches_played` int(11) DEFAULT NULL,
  `winner_id` int(11) DEFAULT NULL,
  `loser_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_tennis_event_stats`
--

LOCK TABLES `table_tennis_event_stats` WRITE;
/*!40000 ALTER TABLE `table_tennis_event_stats` DISABLE KEYS */;
INSERT INTO `table_tennis_event_stats` VALUES
(1,'Setka Cup','Past',5,1,2,2),
(2,'World Table Tennis Championships','past',5,3,4,7),
(3,'Table Tennis World Cup','past',5,5,6,3),
(4,'Olympics','past',5,7,8,4),
(5,'ITTF World Tour','Past',5,9,10,5);
/*!40000 ALTER TABLE `table_tennis_event_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_tennis_game_stats`
--

DROP TABLE IF EXISTS `table_tennis_game_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_tennis_game_stats` (
  `id` int(11) NOT NULL,
  `game_number` int(11) DEFAULT NULL,
  `deuce` int(11) DEFAULT NULL,
  `backhand` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `aces` int(11) DEFAULT NULL,
  `forehand` int(11) DEFAULT NULL,
  `service_error` int(11) DEFAULT NULL,
  `biggest_lead` int(11) DEFAULT NULL,
  `serves_played` int(11) DEFAULT NULL,
  `unforced_error` int(11) DEFAULT NULL,
  `service_points_won` int(11) DEFAULT NULL,
  `match_stats_id` int(11) DEFAULT NULL,
  `game_winner_id` int(11) DEFAULT NULL,
  `game_loser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `match_stats_id_idx` (`match_stats_id`),
  KEY `person_id_idx` (`game_winner_id`),
  CONSTRAINT `m_pid` FOREIGN KEY (`game_winner_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `match_stats_id` FOREIGN KEY (`match_stats_id`) REFERENCES `table_tennis_match_stats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_tennis_game_stats`
--

LOCK TABLES `table_tennis_game_stats` WRITE;
/*!40000 ALTER TABLE `table_tennis_game_stats` DISABLE KEYS */;
INSERT INTO `table_tennis_game_stats` VALUES
(1,1,1,5,13,1,2,1,3,15,1,2,1,2,3),
(2,2,0,8,11,3,6,0,5,16,4,3,1,3,4),
(3,3,0,7,11,4,5,1,6,15,4,4,1,5,6),
(4,4,0,8,11,0,3,0,3,14,3,5,1,7,8),
(5,1,0,3,11,2,4,2,11,11,11,11,2,9,10),
(6,2,0,4,11,3,5,1,8,12,8,11,2,11,12),
(7,3,0,5,11,3,6,3,7,13,4,11,2,13,14),
(8,1,0,6,11,0,7,1,2,11,1,2,3,15,16),
(9,2,0,7,11,0,8,0,1,11,2,3,3,17,18),
(10,3,1,8,12,0,9,0,1,12,1,4,3,2,3),
(11,1,0,9,11,0,10,0,1,13,2,5,4,3,4),
(12,2,0,10,11,2,11,0,1,14,3,6,4,5,6),
(13,3,2,11,13,0,12,0,1,15,1,4,4,7,8),
(14,1,1,12,12,1,13,1,2,14,1,5,5,9,10),
(15,2,0,13,11,2,14,0,3,12,2,7,5,11,12);
/*!40000 ALTER TABLE `table_tennis_game_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_tennis_match_stats`
--

DROP TABLE IF EXISTS `table_tennis_match_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_tennis_match_stats` (
  `id` int(11) NOT NULL,
  `backhand` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `Deuce` int(11) DEFAULT NULL,
  `forhand` int(11) DEFAULT NULL,
  `service_error` int(11) DEFAULT NULL,
  `biggest_lead` int(11) DEFAULT NULL,
  `max_points_in_row` int(11) DEFAULT NULL,
  `service_points_won` int(11) DEFAULT NULL,
  `receiver_points_won` int(11) DEFAULT NULL,
  `unforced_error` int(11) DEFAULT NULL,
  `serves_played` int(11) DEFAULT NULL,
  `event_stats_id` int(11) DEFAULT NULL,
  `m_winner_id` int(11) DEFAULT NULL,
  `m_loser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_stats_id_idx` (`event_stats_id`),
  CONSTRAINT `event_stats_id` FOREIGN KEY (`event_stats_id`) REFERENCES `table_tennis_event_stats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_tennis_match_stats`
--

LOCK TABLES `table_tennis_match_stats` WRITE;
/*!40000 ALTER TABLE `table_tennis_match_stats` DISABLE KEYS */;
INSERT INTO `table_tennis_match_stats` VALUES
(1,28,12,1,16,2,4,4,14,0,12,60,1,2,3),
(2,12,0,11,15,6,11,11,33,0,23,36,1,4,5),
(3,21,12,1,24,1,2,2,9,0,4,34,1,6,7),
(4,30,13,2,33,0,1,1,15,1,6,42,1,8,9),
(5,39,12,4,42,1,3,3,20,0,3,41,1,10,11),
(6,2,13,5,55,5,4,11,33,1,23,20,1,12,13),
(7,21,13,7,45,4,5,13,22,0,45,35,1,14,15),
(8,22,13,7,67,5,0,15,31,2,30,55,1,16,17),
(9,43,13,6,64,3,0,17,35,0,12,66,1,18,1),
(10,67,13,1,47,5,0,19,33,1,14,13,1,2,3),
(11,45,13,4,53,9,4,17,23,1,57,32,1,4,5),
(12,66,13,2,33,8,5,8,35,1,63,23,1,6,7),
(13,33,13,3,30,6,7,15,56,0,24,56,1,8,9),
(14,34,13,2,38,5,3,9,53,1,57,23,1,10,11),
(15,27,13,1,39,3,2,10,36,1,37,69,1,12,13);
/*!40000 ALTER TABLE `table_tennis_match_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_phases`
--

DROP TABLE IF EXISTS `team_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `affiliation_id` int(11) NOT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `phase_status` varchar(40) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tea_aff_pha_rol_id__rol_id` (`role_id`),
  KEY `FK_tea_aff_pha_end_sea_id__sea_id` (`end_season_id`),
  KEY `FK_tea_aff_pha_sta_sea_id__sea_id` (`start_season_id`),
  KEY `FK_tea_aff_pha_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_tea_aff_pha_tea_id__tea_id` (`team_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_phases`
--

LOCK TABLES `team_phases` WRITE;
/*!40000 ALTER TABLE `team_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `home_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tea_pub_id__pub_id` (`publisher_id`),
  KEY `FK_tea_hom_sit_id__sit_id` (`home_site_id`),
  KEY `IDX_teams_team_key` (`team_key`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES
(1,'l.mlb.com-t.26',1,NULL),
(2,'l.mlb.com-t.15',1,NULL),
(3,'l.mlb.com-t.20',1,NULL),
(4,'l.mlb.com-t.21',1,NULL),
(5,'l.mlb.com-t.27',1,NULL),
(6,'l.mlb.com-t.16',1,NULL),
(7,'l.mlb.com-t.22',1,NULL),
(8,'l.mlb.com-t.28',1,NULL),
(9,'l.mlb.com-t.23',1,NULL),
(10,'l.mlb.com-t.18',1,NULL),
(11,'l.mlb.com-t.19',1,NULL),
(12,'l.mlb.com-t.24',1,NULL),
(13,'l.mlb.com-t.29',1,NULL),
(14,'l.mlb.com-t.30',1,NULL),
(15,'l.mlb.com-t.25',1,NULL),
(16,'l.mlb.com-t.17',1,NULL),
(17,'l.mlb.com-t.32',1,NULL),
(18,'l.mlb.com-t.1',1,NULL),
(19,'l.mlb.com-t.2',1,NULL),
(20,'l.mlb.com-t.6',1,NULL),
(21,'l.mlb.com-t.7',1,NULL),
(22,'l.mlb.com-t.8',1,NULL),
(23,'l.mlb.com-t.9',1,NULL),
(24,'l.mlb.com-t.11',1,NULL),
(25,'l.mlb.com-t.10',1,NULL),
(26,'l.mlb.com-t.3',1,NULL),
(27,'l.mlb.com-t.12',1,NULL),
(28,'l.mlb.com-t.13',1,NULL),
(29,'l.mlb.com-t.4',1,NULL),
(30,'l.mlb.com-t.14',1,NULL),
(31,'l.mlb.com-t.5',1,NULL),
(32,'l.mlb.com-t.31',1,NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_documents`
--

DROP TABLE IF EXISTS `teams_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_documents` (
  `team_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_tea_doc_tea_id__tea_id` (`team_id`),
  KEY `FK_tea_doc_doc_id__doc_id` (`document_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_documents`
--

LOCK TABLES `teams_documents` WRITE;
/*!40000 ALTER TABLE `teams_documents` DISABLE KEYS */;
INSERT INTO `teams_documents` VALUES
(1,5),
(14,5),
(12,6),
(8,6),
(1,7),
(14,7),
(26,8),
(20,8),
(31,9),
(18,9),
(6,10),
(7,10),
(1,11),
(14,11),
(22,12),
(30,17),
(24,17),
(31,18),
(19,18),
(23,19),
(20,19),
(3,20),
(15,20),
(12,21),
(7,21),
(16,22),
(13,22),
(21,23),
(22,23),
(2,24),
(10,24),
(29,25),
(25,25),
(26,26),
(18,26),
(6,27),
(11,27),
(10,28),
(29,29),
(15,30),
(5,31),
(1,31),
(3,32),
(18,33),
(8,34),
(14,34),
(26,35),
(4,36),
(9,36),
(22,37),
(21,38),
(27,39),
(28,39),
(7,40),
(12,41),
(19,42),
(19,43),
(31,44),
(9,45),
(4,46),
(25,47),
(11,52),
(6,53),
(2,54),
(13,55),
(16,56),
(24,57),
(30,58),
(1,59),
(5,60),
(20,61),
(23,62),
(28,63),
(27,64),
(14,65),
(8,66),
(18,67),
(18,69),
(10,74),
(9,74),
(3,75),
(15,75),
(3,76),
(15,76),
(31,79),
(3,80),
(15,80),
(6,81),
(3,82),
(15,82),
(19,83),
(9,88),
(10,89),
(3,90),
(15,90),
(4,91),
(9,91),
(21,92),
(22,92),
(30,93),
(26,96),
(18,96),
(4,97),
(9,97),
(21,98),
(22,98),
(6,99),
(11,99),
(6,100),
(11,100),
(12,103),
(7,103),
(29,104),
(25,104),
(4,105),
(9,105),
(29,106),
(25,106),
(4,107),
(9,107),
(26,108),
(18,108),
(3,109),
(15,109),
(31,110),
(19,110),
(4,111),
(9,111),
(5,112),
(1,112),
(31,113),
(19,113),
(5,114),
(1,114),
(23,115),
(20,115),
(6,116),
(11,116),
(21,117),
(22,117),
(23,118),
(20,118),
(29,119),
(25,119),
(2,120),
(10,120),
(12,121),
(7,121),
(12,122),
(7,122),
(2,123),
(10,123),
(1,124),
(14,124),
(3,125),
(15,125),
(3,126),
(15,126),
(3,127),
(15,127),
(3,128),
(15,128),
(3,129),
(15,129),
(3,130),
(15,130),
(3,131),
(15,131),
(3,132),
(15,132),
(3,133),
(15,133),
(3,134),
(15,134),
(3,135),
(15,135),
(3,136),
(15,136),
(3,137),
(15,137),
(3,138),
(15,138),
(3,139),
(15,139),
(3,140),
(15,140),
(3,141),
(15,141),
(3,142),
(15,142),
(3,143),
(15,143),
(3,144),
(15,144),
(3,145),
(15,145),
(3,146),
(15,146),
(3,147),
(15,147),
(3,148),
(15,148),
(3,149),
(15,149),
(3,150),
(15,150),
(3,151),
(15,151),
(3,152),
(15,152),
(3,153),
(15,153),
(3,154),
(15,154),
(3,155),
(15,155),
(3,156),
(15,156),
(3,157),
(15,157),
(3,158),
(15,158),
(3,159),
(15,159),
(3,160),
(15,160),
(3,161),
(15,161),
(3,162),
(15,162),
(3,163),
(15,163),
(3,164),
(15,164),
(3,165),
(15,165),
(3,166),
(15,166),
(3,167),
(15,167),
(3,168),
(15,168),
(3,169),
(15,169),
(3,170),
(15,170),
(3,171),
(15,171),
(3,172),
(15,172),
(3,173),
(15,173),
(3,174),
(15,174),
(3,175),
(15,175),
(3,176),
(15,176),
(3,177),
(15,177),
(3,178),
(15,178),
(3,179),
(15,179),
(3,180),
(15,180),
(3,181),
(15,181),
(3,182),
(15,182),
(3,183),
(15,183),
(3,184),
(15,184),
(3,185),
(15,185),
(3,186),
(15,186),
(3,187),
(15,187),
(3,188),
(15,188),
(3,189),
(15,189),
(3,190),
(15,190),
(3,191),
(15,191),
(3,192),
(15,192),
(3,193),
(15,193),
(3,194),
(15,194),
(3,195),
(15,195),
(3,196),
(15,196),
(3,197),
(15,197),
(3,198),
(15,198),
(3,199),
(15,199),
(3,200),
(15,200),
(3,201),
(15,201),
(3,202),
(15,202),
(3,203),
(15,203),
(3,204),
(15,204),
(3,205),
(15,205),
(3,206),
(15,206),
(3,207),
(15,207),
(3,208),
(15,208),
(3,209),
(15,209),
(3,210),
(15,210),
(3,211),
(15,211),
(3,212),
(15,212),
(3,213),
(15,213),
(3,214),
(15,214),
(3,215),
(15,215),
(3,216),
(15,216),
(3,217),
(15,217),
(3,218),
(15,218),
(3,219),
(15,219),
(3,220),
(15,220),
(3,221),
(15,221),
(3,222),
(15,222),
(3,223),
(15,223),
(3,224),
(15,224),
(3,225),
(15,225),
(3,226),
(15,226),
(3,227),
(15,227),
(3,228),
(15,228),
(3,229),
(15,229),
(3,230),
(15,230),
(3,231),
(15,231),
(3,232),
(15,232),
(3,233),
(15,233),
(3,234),
(15,234),
(3,235),
(15,235),
(3,236),
(15,236),
(21,237),
(22,237),
(21,238),
(22,238),
(12,239),
(7,239),
(26,240),
(18,240),
(12,241),
(7,241),
(29,242),
(25,242),
(21,243),
(22,243),
(31,244),
(19,244),
(6,245),
(11,245),
(4,246),
(9,246),
(12,247),
(7,247),
(6,248),
(11,248),
(31,249),
(19,249),
(4,250),
(9,250),
(29,251),
(25,251),
(21,252),
(22,252),
(26,253),
(18,253),
(12,254),
(7,254),
(31,255),
(19,255),
(4,256),
(9,256),
(21,257),
(22,257),
(6,258),
(11,258),
(12,259),
(7,259),
(29,260),
(25,260),
(4,261),
(9,261),
(26,262),
(18,262),
(31,263),
(19,263),
(29,264),
(25,264),
(6,265),
(11,265),
(21,266),
(22,266),
(31,267),
(19,267),
(12,268),
(7,268),
(12,269),
(7,269),
(26,270),
(18,270),
(6,271),
(11,271),
(31,272),
(19,272),
(6,273),
(11,273),
(4,274),
(9,274),
(31,275),
(19,275),
(4,276),
(9,276),
(21,277),
(22,277),
(29,278),
(25,278),
(31,279),
(19,279),
(26,280),
(18,280),
(6,281),
(11,281),
(12,282),
(7,282),
(31,283),
(19,283),
(4,284),
(9,284),
(29,285),
(25,285),
(21,286),
(22,286),
(26,287),
(18,287),
(4,288),
(9,288),
(26,289),
(18,289),
(29,290),
(25,290),
(4,291),
(9,291),
(29,292),
(25,292),
(26,293),
(18,293),
(6,294),
(11,294),
(6,295),
(11,295),
(21,296),
(22,296),
(26,297),
(18,297),
(21,298),
(22,298),
(6,299),
(11,299),
(31,300),
(19,300),
(4,301),
(9,301),
(29,302),
(25,302),
(6,303),
(11,303),
(12,304),
(7,304),
(4,305),
(9,305),
(6,306),
(11,306),
(21,307),
(22,307),
(29,308),
(25,308),
(26,309),
(18,309),
(4,310),
(9,310),
(6,311),
(11,311),
(29,312),
(25,312),
(4,313),
(9,313),
(26,314),
(18,314),
(21,315),
(22,315),
(12,316),
(7,316),
(12,317),
(7,317),
(26,318),
(18,318),
(31,319),
(19,319),
(31,320),
(19,320),
(31,321),
(19,321),
(21,322),
(22,322),
(6,323),
(11,323),
(31,324),
(19,324),
(4,325),
(9,325),
(21,326),
(22,326),
(26,327),
(18,327),
(12,328),
(7,328),
(29,329),
(25,329),
(21,330),
(22,330),
(6,331),
(11,331),
(26,332),
(18,332),
(31,333),
(19,333),
(6,334),
(11,334),
(12,335),
(7,335),
(4,336),
(9,336),
(6,337),
(11,337),
(21,338),
(22,338),
(16,339),
(13,339),
(2,340),
(10,340),
(12,341),
(7,341),
(21,342),
(22,342),
(26,343),
(18,343),
(12,344),
(7,344),
(2,345),
(10,345),
(29,346),
(25,346),
(16,347),
(13,347),
(6,348),
(11,348),
(31,349),
(19,349),
(4,350),
(9,350),
(21,351),
(22,351),
(2,352),
(10,352),
(6,353),
(11,353),
(31,354),
(19,354),
(26,355),
(18,355),
(4,356),
(9,356),
(16,357),
(13,357),
(29,358),
(25,358),
(6,359),
(11,359),
(29,360),
(25,360),
(2,361),
(10,361),
(4,362),
(9,362),
(6,363),
(11,363),
(26,364),
(18,364),
(31,365),
(19,365),
(16,366),
(13,366),
(31,367),
(19,367),
(2,368),
(10,368),
(16,369),
(13,369),
(2,370),
(10,370),
(21,371),
(22,371),
(4,372),
(9,372),
(6,373),
(11,373),
(21,374),
(22,374),
(26,375),
(18,375),
(2,376),
(10,376),
(6,377),
(11,377),
(31,378),
(19,378),
(29,379),
(25,379),
(16,380),
(13,380),
(4,381),
(9,381),
(12,382),
(7,382),
(16,383),
(13,383),
(2,384),
(10,384),
(21,385),
(22,385),
(12,386),
(7,386),
(26,387),
(18,387),
(4,388),
(9,388),
(16,389),
(13,389),
(29,390),
(25,390),
(31,391),
(19,391),
(26,392),
(18,392),
(16,393),
(13,393),
(12,394),
(7,394),
(6,395),
(11,395),
(26,396),
(18,396),
(4,397),
(9,397),
(2,398),
(10,398),
(21,399),
(22,399),
(12,400),
(7,400),
(29,401),
(25,401),
(29,402),
(25,402),
(6,403),
(11,403),
(4,404),
(9,404),
(31,405),
(19,405),
(6,406),
(11,406),
(16,407),
(13,407),
(21,408),
(22,408),
(29,409),
(25,409),
(2,410),
(10,410),
(21,411),
(22,411),
(31,412),
(19,412),
(26,413),
(18,413),
(2,414),
(10,414),
(12,415),
(7,415),
(4,416),
(9,416),
(6,417),
(11,417),
(16,418),
(13,418),
(21,419),
(22,419),
(26,420),
(18,420),
(16,421),
(13,421),
(4,422),
(9,422),
(16,423),
(13,423),
(21,424),
(22,424),
(31,425),
(19,425),
(29,426),
(25,426),
(26,427),
(18,427),
(4,428),
(9,428),
(29,429),
(25,429),
(12,430),
(7,430),
(6,431),
(11,431),
(26,432),
(18,432),
(16,433),
(13,433),
(2,434),
(10,434),
(31,435),
(19,435),
(6,436),
(11,436),
(4,437),
(9,437),
(16,438),
(13,438),
(6,439),
(11,439),
(26,440),
(18,440),
(31,441),
(19,441),
(4,442),
(9,442),
(21,443),
(22,443),
(31,444),
(19,444),
(16,445),
(13,445),
(21,446),
(22,446),
(12,447),
(7,447),
(29,448),
(25,448),
(21,449),
(22,449),
(16,450),
(13,450),
(29,451),
(25,451),
(6,452),
(11,452),
(4,453),
(9,453),
(30,454),
(24,454),
(2,455),
(10,455),
(26,456),
(18,456),
(29,457),
(25,457),
(2,458),
(10,458),
(6,459),
(11,459),
(31,460),
(19,460),
(4,461),
(9,461),
(21,462),
(22,462),
(16,463),
(13,463),
(31,464),
(19,464),
(29,465),
(25,465),
(12,466),
(7,466),
(4,467),
(9,467),
(2,468),
(10,468),
(5,469),
(1,469),
(30,470),
(24,470),
(4,471),
(9,471),
(30,472),
(24,472),
(6,473),
(11,473),
(21,474),
(22,474),
(26,475),
(18,475),
(16,476),
(13,476),
(2,477),
(10,477),
(12,478),
(7,478),
(5,479),
(1,479),
(12,480),
(7,480),
(26,481),
(18,481),
(30,482),
(24,482),
(16,483),
(13,483),
(31,484),
(19,484),
(21,485),
(22,485),
(23,486),
(20,486),
(5,487),
(1,487),
(29,488),
(25,488),
(30,489),
(24,489),
(6,490),
(11,490),
(4,491),
(9,491),
(16,492),
(13,492),
(31,493),
(19,493),
(23,494),
(20,494),
(12,495),
(7,495),
(30,496),
(24,496),
(23,497),
(20,497),
(16,498),
(13,498),
(31,499),
(19,499),
(29,500),
(25,500),
(5,501),
(1,501),
(4,502),
(9,502),
(5,503),
(1,503),
(21,504),
(22,504),
(4,505),
(9,505),
(30,506),
(24,506),
(26,507),
(18,507),
(16,508),
(13,508),
(12,509),
(7,509),
(6,510),
(11,510),
(30,511),
(24,511),
(23,512),
(20,512),
(29,513),
(25,513),
(6,514),
(11,514),
(21,515),
(22,515),
(16,516),
(13,516),
(21,517),
(22,517),
(30,518),
(24,518),
(31,519),
(19,519),
(4,520),
(9,520),
(23,521),
(20,521),
(26,522),
(18,522),
(31,523),
(19,523),
(23,524),
(20,524),
(12,525),
(7,525),
(2,526),
(10,526),
(12,527),
(7,527),
(26,528),
(18,528),
(5,529),
(1,529),
(16,530),
(13,530),
(26,531),
(18,531),
(30,532),
(24,532),
(6,533),
(11,533),
(4,534),
(9,534),
(29,535),
(25,535),
(31,536),
(19,536),
(21,537),
(22,537),
(23,538),
(20,538),
(2,539),
(10,539),
(4,540),
(9,540),
(16,541),
(13,541),
(21,542),
(22,542),
(29,543),
(25,543),
(30,544),
(24,544),
(21,545),
(22,545),
(4,546),
(9,546),
(12,547),
(7,547),
(4,548),
(9,548),
(5,549),
(1,549),
(2,550),
(10,550),
(23,551),
(20,551),
(6,552),
(11,552),
(31,553),
(19,553),
(29,554),
(25,554),
(12,555),
(7,555),
(23,556),
(20,556),
(4,557),
(9,557),
(4,558),
(9,558),
(5,559),
(1,559),
(23,560),
(20,560),
(26,561),
(18,561),
(30,562),
(24,562),
(6,563),
(11,563),
(16,564),
(13,564),
(21,565),
(22,565),
(4,566),
(9,566),
(31,567),
(19,567),
(6,568),
(11,568),
(12,569),
(7,569),
(5,570),
(1,570),
(16,571),
(13,571),
(2,572),
(10,572),
(2,573),
(10,573),
(5,574),
(1,574),
(31,575),
(19,575),
(2,576),
(10,576),
(29,577),
(25,577),
(26,578),
(18,578),
(23,579),
(20,579),
(2,580),
(10,580),
(12,581),
(7,581),
(16,582),
(13,582),
(31,583),
(19,583),
(23,584),
(20,584),
(21,585),
(22,585),
(2,586),
(10,586),
(4,587),
(9,587),
(29,588),
(25,588),
(26,589),
(18,589),
(2,590),
(10,590),
(2,591),
(10,591),
(4,592),
(9,592),
(23,593),
(20,593),
(6,594),
(11,594),
(31,595),
(19,595),
(21,596),
(22,596),
(5,597),
(1,597),
(26,598),
(18,598),
(30,599),
(24,599),
(16,600),
(13,600),
(21,601),
(22,601),
(16,602),
(13,602),
(5,603),
(1,603),
(12,604),
(7,604),
(16,605),
(13,605),
(2,606),
(10,606),
(23,607),
(20,607),
(4,608),
(9,608),
(6,609),
(11,609),
(5,610),
(1,610),
(26,611),
(18,611),
(30,612),
(24,612),
(29,613),
(25,613),
(31,614),
(19,614),
(2,615),
(10,615),
(23,616),
(20,616),
(5,617),
(1,617),
(4,618),
(9,618),
(21,619),
(22,619),
(29,620),
(25,620),
(16,621),
(13,621),
(31,622),
(19,622),
(12,623),
(7,623),
(23,624),
(20,624),
(30,625),
(24,625),
(6,626),
(11,626),
(21,627),
(22,627),
(31,628),
(19,628),
(2,629),
(10,629),
(26,630),
(18,630),
(6,631),
(11,631),
(4,632),
(9,632),
(12,633),
(7,633),
(30,634),
(24,634),
(16,635),
(13,635),
(26,636),
(18,636),
(12,637),
(7,637),
(26,638),
(18,638),
(21,639),
(22,639),
(16,640),
(13,640),
(5,641),
(1,641),
(6,642),
(11,642),
(12,643),
(7,643),
(5,644),
(1,644),
(23,645),
(20,645),
(30,646),
(24,646),
(5,647),
(1,647),
(30,648),
(24,648),
(2,649),
(10,649),
(16,650),
(13,650),
(21,651),
(22,651),
(4,652),
(9,652),
(31,653),
(19,653),
(5,654),
(1,654),
(30,655),
(24,655),
(31,656),
(19,656),
(23,657),
(20,657),
(12,658),
(7,658),
(30,659),
(24,659),
(21,660),
(22,660),
(4,661),
(9,661),
(29,662),
(25,662),
(6,663),
(11,663),
(26,664),
(18,664),
(4,665),
(9,665),
(2,666),
(10,666),
(16,667),
(13,667),
(4,668),
(9,668),
(31,669),
(19,669),
(26,670),
(18,670),
(12,671),
(7,671),
(23,672),
(20,672),
(30,673),
(24,673),
(6,674),
(11,674),
(2,675),
(10,675),
(31,676),
(19,676),
(29,677),
(25,677),
(5,678),
(1,678),
(16,679),
(13,679),
(26,680),
(18,680),
(6,681),
(11,681),
(23,682),
(20,682),
(26,683),
(18,683),
(5,684),
(1,684),
(23,685),
(20,685),
(4,686),
(9,686),
(5,687),
(1,687),
(12,688),
(7,688),
(30,689),
(24,689),
(29,690),
(25,690),
(26,691),
(18,691),
(2,692),
(10,692),
(16,693),
(13,693),
(6,694),
(11,694),
(23,695),
(20,695),
(2,696),
(10,696),
(30,697),
(24,697),
(5,698),
(1,698),
(23,699),
(20,699),
(6,700),
(11,700),
(2,701),
(10,701),
(12,702),
(7,702),
(26,703),
(18,703),
(4,704),
(9,704),
(29,705),
(25,705),
(21,706),
(22,706),
(31,707),
(19,707),
(5,708),
(1,708),
(12,709),
(7,709),
(12,710),
(7,710),
(26,711),
(18,711),
(4,712),
(9,712),
(29,713),
(25,713),
(6,714),
(11,714),
(23,715),
(20,715),
(31,716),
(19,716),
(4,717),
(9,717),
(2,718),
(10,718),
(30,719),
(24,719),
(16,720),
(13,720),
(26,721),
(18,721),
(6,722),
(11,722),
(5,723),
(1,723),
(5,724),
(1,724),
(4,725),
(9,725),
(12,726),
(7,726),
(23,727),
(20,727),
(31,728),
(19,728),
(12,729),
(7,729),
(26,730),
(18,730),
(29,731),
(25,731),
(30,732),
(24,732),
(16,733),
(13,733),
(4,734),
(9,734),
(6,735),
(11,735),
(31,736),
(19,736),
(30,737),
(24,737),
(2,738),
(10,738),
(4,739),
(9,739),
(12,740),
(7,740),
(26,741),
(18,741),
(5,742),
(1,742);
/*!40000 ALTER TABLE `teams_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_media`
--

DROP TABLE IF EXISTS `teams_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_media` (
  `team_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_tea_med_med_id__med_id` (`media_id`),
  KEY `FK_tea_med_tea_id__tea_id` (`team_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_media`
--

LOCK TABLES `teams_media` WRITE;
/*!40000 ALTER TABLE `teams_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tennis_action_points`
--

DROP TABLE IF EXISTS `tennis_action_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_action_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_period_id` varchar(100) DEFAULT NULL,
  `sequence_number` varchar(100) DEFAULT NULL,
  `win_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tennis_action_points`
--

LOCK TABLES `tennis_action_points` WRITE;
/*!40000 ALTER TABLE `tennis_action_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `tennis_action_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tennis_action_volleys`
--

DROP TABLE IF EXISTS `tennis_action_volleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_action_volleys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_number` varchar(100) DEFAULT NULL,
  `tennis_action_points_id` int(11) DEFAULT NULL,
  `landing_location` varchar(100) DEFAULT NULL,
  `swing_type` varchar(100) DEFAULT NULL,
  `result` varchar(100) DEFAULT NULL,
  `spin_type` varchar(100) DEFAULT NULL,
  `trajectory_details` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tennis_action_volleys`
--

LOCK TABLES `tennis_action_volleys` WRITE;
/*!40000 ALTER TABLE `tennis_action_volleys` DISABLE KEYS */;
/*!40000 ALTER TABLE `tennis_action_volleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tennis_event_states`
--

DROP TABLE IF EXISTS `tennis_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` tinyint(4) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `tennis_set` varchar(100) DEFAULT NULL,
  `game` varchar(100) DEFAULT NULL,
  `server_person_id` int(11) DEFAULT NULL,
  `server_score` varchar(100) DEFAULT NULL,
  `receiver_person_id` int(11) DEFAULT NULL,
  `receiver_score` varchar(100) DEFAULT NULL,
  `service_number` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_events_tennis_event_states` (`event_id`),
  KEY `IDX_tennis_event_states_context` (`context`),
  KEY `IDX_tennis_event_states_seq_num` (`sequence_number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tennis_event_states`
--

LOCK TABLES `tennis_event_states` WRITE;
/*!40000 ALTER TABLE `tennis_event_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `tennis_event_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tennis_player_stats`
--

DROP TABLE IF EXISTS `tennis_player_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_player_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `net_points_won` int(11) DEFAULT NULL,
  `net_points_played` int(11) DEFAULT NULL,
  `points_won` int(11) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `unforced_errors` int(11) DEFAULT NULL,
  `winners_forehand` int(11) DEFAULT NULL,
  `winners_backhand` int(11) DEFAULT NULL,
  `winners_volley` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tennis_player_stats`
--

LOCK TABLES `tennis_player_stats` WRITE;
/*!40000 ALTER TABLE `tennis_player_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tennis_player_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tennis_return_stats`
--

DROP TABLE IF EXISTS `tennis_return_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_return_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `returns_played` int(11) DEFAULT NULL,
  `matches_played` int(11) DEFAULT NULL,
  `first_service_return_points_won` int(11) DEFAULT NULL,
  `first_service_return_points_won_pct` int(11) DEFAULT NULL,
  `second_service_return_points_won` int(11) DEFAULT NULL,
  `second_service_return_points_won_pct` int(11) DEFAULT NULL,
  `return_games_played` int(11) DEFAULT NULL,
  `return_games_won` int(11) DEFAULT NULL,
  `return_games_won_pct` int(11) DEFAULT NULL,
  `break_points_played` int(11) DEFAULT NULL,
  `break_points_converted` int(11) DEFAULT NULL,
  `break_points_converted_pct` int(11) DEFAULT NULL,
  `net_points_won` int(11) DEFAULT NULL,
  `net_points_played` int(11) DEFAULT NULL,
  `points_won` int(11) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `unforced_errors` int(11) DEFAULT NULL,
  `winners_forehand` int(11) DEFAULT NULL,
  `winners_backhand` int(11) DEFAULT NULL,
  `winners_volley` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tennis_return_stats`
--

LOCK TABLES `tennis_return_stats` WRITE;
/*!40000 ALTER TABLE `tennis_return_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tennis_return_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tennis_service_stats`
--

DROP TABLE IF EXISTS `tennis_service_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_service_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `services_played` int(11) DEFAULT NULL,
  `matches_played` int(11) DEFAULT NULL,
  `aces` int(11) DEFAULT NULL,
  `first_services_good` int(11) DEFAULT NULL,
  `first_services_good_pct` int(11) DEFAULT NULL,
  `first_service_points_won` int(11) DEFAULT NULL,
  `first_service_points_won_pct` int(11) DEFAULT NULL,
  `second_service_points_won` int(11) DEFAULT NULL,
  `second_service_points_won_pct` int(11) DEFAULT NULL,
  `service_games_played` int(11) DEFAULT NULL,
  `service_games_won` int(11) DEFAULT NULL,
  `service_games_won_pct` int(11) DEFAULT NULL,
  `break_points_played` int(11) DEFAULT NULL,
  `break_points_saved` int(11) DEFAULT NULL,
  `break_points_saved_pct` int(11) DEFAULT NULL,
  `service_points_won` int(11) DEFAULT NULL,
  `service_points_won_pct` int(11) DEFAULT NULL,
  `double_faults` int(11) DEFAULT NULL,
  `first_service_top_speed` varchar(100) DEFAULT NULL,
  `second_services_good` int(11) DEFAULT NULL,
  `second_services_good_pct` int(11) DEFAULT NULL,
  `second_service_top_speed` varchar(100) DEFAULT NULL,
  `net_points_won` int(11) DEFAULT NULL,
  `net_points_played` int(11) DEFAULT NULL,
  `points_won` int(11) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `unforced_errors` int(11) DEFAULT NULL,
  `winners_forehand` int(11) DEFAULT NULL,
  `winners_backhand` int(11) DEFAULT NULL,
  `winners_volley` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tennis_service_stats`
--

LOCK TABLES `tennis_service_stats` WRITE;
/*!40000 ALTER TABLE `tennis_service_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tennis_service_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tennis_set_stats`
--

DROP TABLE IF EXISTS `tennis_set_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_set_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `net_points_won` int(11) DEFAULT NULL,
  `net_points_played` int(11) DEFAULT NULL,
  `points_won` int(11) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `unforced_errors` int(11) DEFAULT NULL,
  `winners_forehand` int(11) DEFAULT NULL,
  `winners_backhand` int(11) DEFAULT NULL,
  `winners_volley` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tennis_set_stats`
--

LOCK TABLES `tennis_set_stats` WRITE;
/*!40000 ALTER TABLE `tennis_set_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tennis_set_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tennis_team_stats`
--

DROP TABLE IF EXISTS `tennis_team_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_team_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `net_points_won` int(11) DEFAULT NULL,
  `net_points_played` int(11) DEFAULT NULL,
  `points_won` int(11) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `unforced_errors` int(11) DEFAULT NULL,
  `winners_forehand` int(11) DEFAULT NULL,
  `winners_backhand` int(11) DEFAULT NULL,
  `winners_volley` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tennis_team_stats`
--

LOCK TABLES `tennis_team_stats` WRITE;
/*!40000 ALTER TABLE `tennis_team_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tennis_team_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(45) NOT NULL,
  `team_id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id_idx` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(3,'mashilo','u18169377@tuks.co.za','Mashilotebatso67&',1,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_moneylines`
--

DROP TABLE IF EXISTS `wagering_moneylines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_moneylines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line` varchar(100) DEFAULT NULL,
  `line_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_mon_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_mon_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_mon_eve_id__eve_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_moneylines`
--

LOCK TABLES `wagering_moneylines` WRITE;
/*!40000 ALTER TABLE `wagering_moneylines` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagering_moneylines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_odds_lines`
--

DROP TABLE IF EXISTS `wagering_odds_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_odds_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `numerator` varchar(100) DEFAULT NULL,
  `denominator` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  `payout_calculation` varchar(100) DEFAULT NULL,
  `payout_amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_odd_lin_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_odd_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_odd_lin_boo_id__boo_id` (`bookmaker_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_odds_lines`
--

LOCK TABLES `wagering_odds_lines` WRITE;
/*!40000 ALTER TABLE `wagering_odds_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagering_odds_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_runlines`
--

DROP TABLE IF EXISTS `wagering_runlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_runlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line` varchar(100) DEFAULT NULL,
  `line_opening` varchar(100) DEFAULT NULL,
  `line_value` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_run_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_run_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_run_eve_id__eve_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_runlines`
--

LOCK TABLES `wagering_runlines` WRITE;
/*!40000 ALTER TABLE `wagering_runlines` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagering_runlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_straight_spread_lines`
--

DROP TABLE IF EXISTS `wagering_straight_spread_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_straight_spread_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line_value` varchar(100) DEFAULT NULL,
  `line_value_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_str_spr_lin_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_str_spr_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_str_spr_lin_boo_id__boo_id` (`bookmaker_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_straight_spread_lines`
--

LOCK TABLES `wagering_straight_spread_lines` WRITE;
/*!40000 ALTER TABLE `wagering_straight_spread_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagering_straight_spread_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_total_score_lines`
--

DROP TABLE IF EXISTS `wagering_total_score_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_total_score_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line_over` varchar(100) DEFAULT NULL,
  `line_under` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `total_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_tot_sco_lin_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_tot_sco_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_tot_sco_lin_tea_id__tea_id` (`team_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_total_score_lines`
--

LOCK TABLES `wagering_total_score_lines` WRITE;
/*!40000 ALTER TABLE `wagering_total_score_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagering_total_score_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_conditions`
--

DROP TABLE IF EXISTS `weather_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `temperature` varchar(100) DEFAULT NULL,
  `temperature_units` varchar(40) DEFAULT NULL,
  `humidity` varchar(100) DEFAULT NULL,
  `clouds` varchar(100) DEFAULT NULL,
  `wind_direction` varchar(100) DEFAULT NULL,
  `wind_velocity` varchar(100) DEFAULT NULL,
  `weather_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_wea_con_eve_id__eve_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_conditions`
--

LOCK TABLES `weather_conditions` WRITE;
/*!40000 ALTER TABLE `weather_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather_conditions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-07 20:23:15
