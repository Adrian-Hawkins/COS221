-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: sportsdb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,'English',NULL,NULL,NULL,'2','Cechova','Cechova',NULL,'Skopek Miroslav','9','Czech','Russia','Europe','10100','Russia'),(2,1,'English',NULL,NULL,NULL,'5','Cechova','Cechova',NULL,'Skopek Miroslav','8','Czech','Russia','Europe','10100','Russia'),(3,1,'Japanese',NULL,NULL,NULL,'3','Tokyo','Cechova',NULL,'','8','Japan','Russia','Europe','10101','Russia');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliation_phases`
--

DROP TABLE IF EXISTS `affiliation_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliation_phases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliation_id` int NOT NULL,
  `root_id` int DEFAULT NULL,
  `ancestor_affiliation_id` int DEFAULT NULL,
  `start_season_id` int DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_season_id` int DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliation_key` varchar(100) NOT NULL,
  `affiliation_type` varchar(100) DEFAULT NULL,
  `publisher_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_affiliations_1` (`affiliation_key`),
  KEY `IDX_affiliations_2` (`affiliation_type`),
  KEY `IDX_affiliations_3` (`affiliation_key`,`affiliation_type`,`publisher_id`),
  KEY `IDX_FK_aff_pub_id__pub_id` (`publisher_id`),
  CONSTRAINT `FK_aff_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations`
--

LOCK TABLES `affiliations` WRITE;
/*!40000 ALTER TABLE `affiliations` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations_events`
--

DROP TABLE IF EXISTS `affiliations_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliations_events` (
  `affiliation_id` int NOT NULL,
  `event_id` int NOT NULL,
  KEY `FK_aff_eve_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_aff_eve_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_aff_eve_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_aff_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliations_media` (
  `affiliation_id` int NOT NULL,
  `media_id` int NOT NULL,
  KEY `FK_aff_med_med_id__med_id` (`media_id`),
  KEY `FK_aff_med_aff_id__aff_id` (`affiliation_id`),
  CONSTRAINT `FK_aff_med_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_aff_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations_media`
--

LOCK TABLES `affiliations_media` WRITE;
/*!40000 ALTER TABLE `affiliations_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliations_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) NOT NULL,
  `participant_id` int NOT NULL,
  `award_type` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `total` int DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `award_value` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmakers`
--

DROP TABLE IF EXISTS `bookmakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmakers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookmaker_key` varchar(100) DEFAULT NULL,
  `publisher_id` int NOT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_boo_loc_id__loc_id` (`location_id`),
  KEY `FK_boo_pub_id__pub_id` (`publisher_id`),
  CONSTRAINT `FK_boo_loc_id__loc_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_boo_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_stats` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `position_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_info` (
  `version` varchar(100) NOT NULL DEFAULT '16',
  KEY `IDX_db_info_1` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `display_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(100) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_document_classes_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_contents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_id` int NOT NULL,
  `sportsml` varchar(200) DEFAULT NULL,
  `sportsml_blob` text,
  `abstract` text,
  `abstract_blob` text,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_doc_con_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_con_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_fixtures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fixture_key` varchar(100) DEFAULT NULL,
  `publisher_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `document_class_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_document_fixtures_1` (`fixture_key`),
  KEY `IDX_FK_doc_fix_doc_cla_id__doc_cla_id` (`document_class_id`),
  KEY `IDX_FK_doc_fix_pub_id__pub_id` (`publisher_id`),
  CONSTRAINT `FK_doc_fix_doc_cla_id__doc_cla_id` FOREIGN KEY (`document_class_id`) REFERENCES `document_classes` (`id`),
  CONSTRAINT `FK_doc_fix_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_fixtures_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_doc_fix_eve_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_doc_fix_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_package_entry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_package_id` int NOT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `document_id` int NOT NULL,
  `headline` varchar(100) DEFAULT NULL,
  `short_headline` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_doc_pac_ent_doc_pac_id__doc_pac_id` (`document_package_id`),
  KEY `FK_doc_pac_ent_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_pac_ent_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_doc_pac_ent_doc_pac_id__doc_pac_id` FOREIGN KEY (`document_package_id`) REFERENCES `document_packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_packages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_key` varchar(100) DEFAULT NULL,
  `package_name` varchar(100) DEFAULT NULL,
  `date_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(75) NOT NULL,
  `publisher_id` int NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `revision_id` varchar(255) DEFAULT NULL,
  `stats_coverage` varchar(100) DEFAULT NULL,
  `document_fixture_id` int NOT NULL,
  `source_id` int DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_id` int NOT NULL,
  `media_id` int NOT NULL,
  `media_caption_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_doc_med_med_cap_id__med_cap_id` (`media_caption_id`),
  KEY `FK_doc_med_med_id__med_id` (`media_id`),
  KEY `FK_doc_med_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_med_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_doc_med_med_cap_id__med_cap_id` FOREIGN KEY (`media_caption_id`) REFERENCES `media_captions` (`id`),
  CONSTRAINT `FK_doc_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_action_fouls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_state_id` int NOT NULL,
  `foul_name` varchar(100) DEFAULT NULL,
  `foul_result` varchar(100) DEFAULT NULL,
  `foul_type` varchar(100) DEFAULT NULL,
  `fouler_id` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_fouls` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_fouls` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_action_participants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_state_id` int NOT NULL,
  `event_action_play_id` int NOT NULL,
  `person_id` int NOT NULL,
  `participant_role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_action_plays_event_action_participants` (`event_action_play_id`),
  KEY `FK_persons_event_action_participants` (`person_id`),
  KEY `FK_event_states_event_action_participants` (`event_state_id`),
  CONSTRAINT `FK_event_action_plays_event_action_participants` FOREIGN KEY (`event_action_play_id`) REFERENCES `event_action_plays` (`id`),
  CONSTRAINT `FK_event_states_event_action_participants` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`),
  CONSTRAINT `FK_persons_event_action_participants` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_action_penalties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_state_id` int NOT NULL,
  `penalty_type` varchar(100) DEFAULT NULL,
  `penalty_level` varchar(100) DEFAULT NULL,
  `caution_level` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_penalties` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_penalties` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_action_plays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_state_id` int NOT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `score_attempt_type` varchar(100) DEFAULT NULL,
  `play_result` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_plays` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_plays` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_action_substitutions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_state_id` int NOT NULL,
  `person_original_id` int NOT NULL,
  `person_original_position_id` int NOT NULL,
  `person_replacing_id` int NOT NULL,
  `person_replacing_position_id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `current_state` int DEFAULT NULL,
  `sequence_number` int DEFAULT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `minutes_elapsed` varchar(100) DEFAULT NULL,
  `period_minutes_elapsed` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `document_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_events_event_states` (`event_id`),
  KEY `IDX_event_states_context` (`context`),
  KEY `IDX_event_states_seq_num` (`sequence_number`),
  CONSTRAINT `FK_events_event_states` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_key` varchar(100) NOT NULL,
  `publisher_id` int NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `site_id` int DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_documents` (
  `event_id` int NOT NULL,
  `document_id` int NOT NULL,
  KEY `FK_eve_doc_doc_id__doc_id` (`document_id`),
  KEY `FK_eve_doc_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_eve_doc_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_media` (
  `event_id` int NOT NULL,
  `media_id` int NOT NULL,
  KEY `FK_eve_med_med_id__med_id` (`media_id`),
  KEY `FK_eve_med_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_med_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_eve_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_sub_seasons` (
  `event_id` int NOT NULL,
  `sub_season_id` int NOT NULL,
  KEY `FK_eve_sub_sea_sub_sea_id__sub_sea_id` (`sub_season_id`),
  KEY `FK_eve_sub_sea_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_sub_sea_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_eve_sub_sea_sub_sea_id__sub_sea_id` FOREIGN KEY (`sub_season_id`) REFERENCES `sub_seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_sub_seasons`
--

LOCK TABLES `events_sub_seasons` WRITE;
/*!40000 ALTER TABLE `events_sub_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_sub_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injury_phases`
--

DROP TABLE IF EXISTS `injury_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injury_phases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `injury_status` varchar(100) DEFAULT NULL,
  `injury_type` varchar(100) DEFAULT NULL,
  `injury_comment` varchar(100) DEFAULT NULL,
  `disabled_list` varchar(100) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `season_id` int DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `key_aliases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key_id` int NOT NULL,
  `key_root_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_key_roots_key_aliases` (`key_root_id`),
  KEY `IDX_key_aliases_2` (`key_id`),
  CONSTRAINT `FK_key_roots_key_aliases` FOREIGN KEY (`key_root_id`) REFERENCES `key_roots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `key_roots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_key_aliases_1` (`key_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `latest_revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `revision_id` varchar(255) NOT NULL,
  `latest_document_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_lat_rev_lat_doc_id__doc_id` (`latest_document_id`),
  KEY `IDX_latest_revisions_1` (`revision_id`),
  CONSTRAINT `FK_lat_rev_lat_doc_id__doc_id` FOREIGN KEY (`latest_document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Czech','Moscow','Russia','Russia','GMT+2','49.8175° N','15.4730° E','+7');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  `revision_id` int DEFAULT NULL,
  `media_type` varchar(100) DEFAULT NULL,
  `publisher_id` int NOT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `credit_id` int NOT NULL,
  `db_loading_date_time` datetime DEFAULT NULL,
  `creation_location_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_cre_id__per_id` (`credit_id`),
  KEY `FK_med_pub_id__pub_id` (`publisher_id`),
  KEY `FK_med_cre_loc_id__loc_id` (`creation_location_id`),
  CONSTRAINT `FK_med_cre_id__per_id` FOREIGN KEY (`credit_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_med_cre_loc_id__loc_id` FOREIGN KEY (`creation_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_med_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_captions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `media_id` int NOT NULL,
  `caption_type` varchar(100) DEFAULT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `caption_author_id` int NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `caption_size` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_cap_med_id__med_id` (`media_id`),
  KEY `FK_med_cap_cap_aut_id__per_id` (`caption_author_id`),
  CONSTRAINT `FK_med_cap_cap_aut_id__per_id` FOREIGN KEY (`caption_author_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_med_cap_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_contents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `media_id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_keywords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `media_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_key_med_id__med_id` (`media_id`),
  CONSTRAINT `FK_med_key_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_keywords`
--

LOCK TABLES `media_keywords` WRITE;
/*!40000 ALTER TABLE `media_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_totals`
--

DROP TABLE IF EXISTS `outcome_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outcome_totals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `standing_subgroup_id` int NOT NULL,
  `outcome_holder_type` varchar(100) DEFAULT NULL,
  `outcome_holder_id` int DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `wins` varchar(100) DEFAULT NULL,
  `losses` varchar(100) DEFAULT NULL,
  `ties` varchar(100) DEFAULT NULL,
  `wins_overtime` int DEFAULT NULL,
  `losses_overtime` int DEFAULT NULL,
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
  `events_played` int DEFAULT NULL,
  `games_back` varchar(100) DEFAULT NULL,
  `result_effect` varchar(100) DEFAULT NULL,
  `sets_against` varchar(100) DEFAULT NULL,
  `sets_for` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_out_tot_sta_sub_id__sta_sub_id` (`standing_subgroup_id`),
  CONSTRAINT `FK_out_tot_sta_sub_id__sta_sub_id` FOREIGN KEY (`standing_subgroup_id`) REFERENCES `standing_subgroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participants_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) NOT NULL,
  `participant_id` int NOT NULL,
  `event_id` int NOT NULL,
  `alignment` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `event_outcome` varchar(100) DEFAULT NULL,
  `rank` int DEFAULT NULL,
  `result_effect` varchar(100) DEFAULT NULL,
  `score_attempts` int DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `score_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_par_eve_eve_id__eve_id` (`event_id`),
  KEY `IDX_participants_events_1` (`participant_type`),
  KEY `IDX_participants_events_2` (`participant_id`),
  KEY `IDX_participants_events_3` (`alignment`),
  KEY `IDX_participants_events_4` (`event_outcome`),
  CONSTRAINT `FK_par_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalty_stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `value` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `participant_event_id` int NOT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `score_attempts` int DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `sub_score_key` varchar(100) DEFAULT NULL,
  `sub_score_type` varchar(100) DEFAULT NULL,
  `sub_score_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_per_par_eve_id__par_eve_id` (`participant_event_id`),
  CONSTRAINT `FK_per_par_eve_id__par_eve_id` FOREIGN KEY (`participant_event_id`) REFERENCES `participants_events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_event_metadata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `event_id` int NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `health` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `lineup_slot` int DEFAULT NULL,
  `lineup_slot_sequence` int DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_phases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `membership_type` varchar(40) NOT NULL,
  `membership_id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `role_status` varchar(40) DEFAULT NULL,
  `phase_status` varchar(40) DEFAULT NULL,
  `uniform_number` varchar(20) DEFAULT NULL,
  `regular_position_id` int DEFAULT NULL,
  `regular_position_depth` varchar(40) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `start_season_id` int DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `end_season_id` int DEFAULT NULL,
  `entry_reason` varchar(40) DEFAULT NULL,
  `exit_reason` varchar(40) DEFAULT NULL,
  `selection_level` int DEFAULT NULL,
  `selection_sublevel` int DEFAULT NULL,
  `selection_overall` int DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_key` varchar(100) NOT NULL,
  `publisher_id` int NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `birth_date` varchar(30) DEFAULT NULL,
  `death_date` varchar(30) DEFAULT NULL,
  `final_resting_location_id` int DEFAULT NULL,
  `birth_location_id` int DEFAULT NULL,
  `hometown_location_id` int DEFAULT NULL,
  `residence_location_id` int DEFAULT NULL,
  `death_location_id` int DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (2,'1',1,'male','1986-05-23',NULL,1,1,1,1,NULL),(3,'1',1,'male','1992-05-22',NULL,1,1,1,1,NULL),(4,'1',1,'male','1994-10-07',NULL,1,1,1,1,NULL),(5,'1',1,'male','1985-02-19',NULL,1,1,1,1,NULL),(6,'1',1,'male','1999-12-22',NULL,1,1,1,1,NULL),(7,'1',1,'male','1992-03-05',NULL,1,1,1,1,NULL),(8,'1',1,'male','2001-09-27',NULL,1,1,1,1,NULL),(9,'1',1,'male','1996-04-15',NULL,1,1,1,1,NULL),(10,'1',1,'male','1989-11-12',NULL,1,1,1,1,NULL),(11,'1',1,'male','1987-05-19',NULL,1,1,1,1,NULL),(12,'1',1,'male','1987-06-04',NULL,1,1,1,1,NULL),(13,'1',1,'male','1997-12-06',NULL,1,1,1,1,NULL),(14,'1',1,'male','1998-01-15',NULL,1,1,1,1,NULL),(15,'1',1,'male','1996-02-16',NULL,1,1,1,1,NULL),(16,'1',1,'male','2000-04-15',NULL,1,1,1,1,NULL),(17,'1',1,'male','2002-04-12',NULL,1,1,1,1,NULL),(18,'1',1,'male','2003-17-21',NULL,1,1,1,1,NULL);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_documents`
--

DROP TABLE IF EXISTS `persons_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons_documents` (
  `person_id` int NOT NULL,
  `document_id` int NOT NULL,
  KEY `FK_per_doc_per_id__per_id` (`person_id`),
  KEY `FK_per_doc_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_per_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_per_doc_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons_media` (
  `person_id` int NOT NULL,
  `media_id` int NOT NULL,
  KEY `FK_per_med_med_id__med_id` (`media_id`),
  KEY `FK_per_med_per_id__per_id` (`person_id`),
  CONSTRAINT `FK_per_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `FK_per_med_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_media`
--

LOCK TABLES `persons_media` WRITE;
/*!40000 ALTER TABLE `persons_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons_media` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS 'person_info';
CREATE TABLE 'person_info'(
  'name' varchar(255) NOT NULL,
  'person_id' int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES 'person_info' WRITE;

INSERT INTO 'person_info' VALUES("Kamo", 3),("Adrian", 2),("Daniel", 4),("Precious", 5),("Rea", 6),("Mashilo", 7),("Bob", 8),("John", 9),("Mark", 10),("Paul", 11),("Charlie", 12),("Vesily", 13),("Mae Dong", 14),("Michael", 15),("James", 16),("Polina", 17),("Petrova", 18);
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliation_id` int NOT NULL,
  `abbreviation` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_pos_aff_id__aff_id` (`affiliation_id`),
  KEY `IDX_positions_1` (`abbreviation`),
  CONSTRAINT `FK_pos_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `publisher_key` varchar(100) NOT NULL,
  `publisher_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_publishers_1` (`publisher_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'1','china');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rankings`
--

DROP TABLE IF EXISTS `rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rankings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_fixture_id` int DEFAULT NULL,
  `participant_type` varchar(100) DEFAULT NULL,
  `participant_id` int DEFAULT NULL,
  `issuer` varchar(100) DEFAULT NULL,
  `ranking_type` varchar(100) DEFAULT NULL,
  `ranking_value` varchar(100) DEFAULT NULL,
  `ranking_value_previous` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) DEFAULT NULL,
  `participant_id` int DEFAULT NULL,
  `record_type` varchar(100) DEFAULT NULL,
  `record_label` varchar(100) DEFAULT NULL,
  `record_value` varchar(100) DEFAULT NULL,
  `previous_value` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_key` varchar(100) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_roles_1` (`role_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `season_key` int NOT NULL,
  `publisher_id` int NOT NULL,
  `league_id` int DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sea_lea_id__aff_id` (`league_id`),
  KEY `IDX_FK_sea_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_seasons_1` (`season_key`),
  CONSTRAINT `FK_sea_lea_id__aff_id` FOREIGN KEY (`league_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_sea_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_key` varchar(128) NOT NULL,
  `publisher_id` int NOT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sit_loc_id__loc_id` (`location_id`),
  KEY `IDX_FK_sit_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_sites_1` (`site_key`),
  CONSTRAINT `FK_sit_loc_id__loc_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_sit_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'1',1,1);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_property`
--

DROP TABLE IF EXISTS `sports_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sports_property_type` varchar(100) DEFAULT NULL,
  `sports_property_id` int DEFAULT NULL,
  `formal_name` varchar(100) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `standing_subgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `standing_id` int NOT NULL,
  `affiliation_id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `standings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliation_id` int NOT NULL,
  `standing_type` varchar(100) DEFAULT NULL,
  `sub_season_id` int NOT NULL,
  `last_updated` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sta_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_sta_sub_sea_id__sub_sea_id` (`sub_season_id`),
  CONSTRAINT `FK_sta_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_sta_sub_sea_id__sub_sea_id` FOREIGN KEY (`sub_season_id`) REFERENCES `sub_seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stat_repository_type` varchar(100) DEFAULT NULL,
  `stat_repository_id` int NOT NULL,
  `stat_holder_type` varchar(100) DEFAULT NULL,
  `stat_holder_id` int DEFAULT NULL,
  `stat_coverage_type` varchar(100) DEFAULT NULL,
  `stat_coverage_id` int DEFAULT NULL,
  `stat_membership_type` varchar(40) DEFAULT NULL,
  `stat_membership_id` int DEFAULT NULL,
  `context` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_stats_1` (`stat_repository_type`),
  KEY `IDX_stats_2` (`stat_repository_id`),
  KEY `IDX_stats_3` (`stat_holder_type`),
  KEY `IDX_stats_4` (`stat_holder_id`),
  KEY `IDX_stats_5` (`stat_coverage_type`),
  KEY `IDX_stats_6` (`stat_coverage_id`),
  KEY `IDX_stats_7` (`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_periods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `period_id` int NOT NULL,
  `sub_period_value` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `score_attempts` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sub_per_per_id__per_id` (`period_id`),
  CONSTRAINT `FK_sub_per_per_id__per_id` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_seasons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_season_key` varchar(100) NOT NULL,
  `season_id` int NOT NULL,
  `sub_season_type` varchar(100) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sub_sea_sea_id__sea_id` (`season_id`),
  KEY `IDX_sub_seasons_1` (`sub_season_key`),
  KEY `IDX_sub_seasons_2` (`sub_season_type`),
  CONSTRAINT `FK_sub_sea_sea_id__sea_id` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_tennis_event_stats` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(45) NOT NULL,
  `current_state` varchar(45) DEFAULT NULL,
  `matches_played` int DEFAULT NULL,
  `winner_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `id_UNIQUE` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_tennis_event_stats`
--

LOCK TABLES `table_tennis_event_stats` WRITE;
/*!40000 ALTER TABLE `table_tennis_event_stats` DISABLE KEYS */;
INSERT INTO `table_tennis_event_stats` VALUES (1,'Setka Cup','Past',5,3843,2);
INSERT INTO table_tennis_event_stats VALUES (2,'TT Cup','Past',5,3,1);
/*!40000 ALTER TABLE `table_tennis_event_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_tennis_game_stats`
--

DROP TABLE IF EXISTS `table_tennis_game_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_tennis_game_stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `game_number` int DEFAULT NULL,
  `deuce` int DEFAULT NULL,
  `backhand` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `aces` int DEFAULT NULL,
  `forehand` int DEFAULT NULL,
  `service_error` int DEFAULT NULL,
  `biggest_lead` int DEFAULT NULL,
  `serves_played` int DEFAULT NULL,
  `unforced_error` int DEFAULT NULL,
  `service_points_won` int DEFAULT NULL,
  `match_stats_id` int DEFAULT NULL,
  `game_winner_id` int DEFAULT NULL,
  `game_loser_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `match_stats_id_idx` (`match_stats_id`),
  KEY `game_winner_id_idx` (`game_winner_id`),
  KEY `game_loser_id_idx` (`game_loser_id`),
  CONSTRAINT `game_loser_id` FOREIGN KEY (`game_loser_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `game_winner_id` FOREIGN KEY (`game_winner_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `match_stats_id` FOREIGN KEY (`match_stats_id`) REFERENCES `table_tennis_match_stats` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_tennis_game_stats`
--

LOCK TABLES `table_tennis_game_stats` WRITE;
/*!40000 ALTER TABLE `table_tennis_game_stats` DISABLE KEYS */;
INSERT INTO `table_tennis_game_stats` VALUES (1,1,1,5,13,1,2,1,3,15,1,2,1,2,3),(2,2,0,8,11,3,6,0,5,16,4,3,1,3,4),(3,3,0,7,11,4,5,1,6,15,4,4,1,5,6),(4,4,0,8,11,0,3,0,3,14,3,5,1,7,8),(5,1,0,3,11,2,4,2,11,11,11,11,2,9,10),(6,2,0,4,11,3,5,1,8,12,8,11,2,11,12),(7,3,0,5,11,3,6,3,7,13,4,11,2,13,14),(8,1,0,6,11,0,7,1,2,11,1,2,3,15,16),(9,2,0,7,11,0,8,0,1,11,2,3,3,17,18),(10,3,1,8,12,0,9,0,1,12,1,4,3,2,3),(11,1,0,9,11,0,10,0,1,13,2,5,4,3,4),(12,2,0,10,11,2,11,0,1,14,3,6,4,5,6),(13,3,2,11,13,0,12,0,1,15,1,4,4,7,8),(14,1,1,12,12,1,13,1,2,14,1,5,5,9,10),(15,2,0,13,11,2,14,0,3,12,2,7,5,11,12);
INSERT INTO `table_tennis_game_stats` VALUES (1,1,4,2,11,0,1,5,2,13,3,5,1,2,1),(2,2,1,7,12,2,5,1,4,14,2,1,1,1,2),(3,3,1,6,12,3,4,2,7,16,3,3,1,4,3),(4,4,1,7,12,5,1,2,5,16,4,3,1,2,3),(5,1,0,2,11,5,2,6,8,6,11,12,2,1,5);
/*!40000 ALTER TABLE `table_tennis_game_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_tennis_match_stats`
--

DROP TABLE IF EXISTS `table_tennis_match_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_tennis_match_stats` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `backhand` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `Deuce` int DEFAULT NULL,
  `forhand` int DEFAULT NULL,
  `service_error` int DEFAULT NULL,
  `biggest_lead` int DEFAULT NULL,
  `max_points_in_row` int DEFAULT NULL,
  `service_points_won` int DEFAULT NULL,
  `receiver_points_won` int DEFAULT NULL,
  `unforced_error` int DEFAULT NULL,
  `serves_played` int DEFAULT NULL,
  `event_stats_id` int DEFAULT NULL,
  `m_winner_id` int DEFAULT NULL,
  `m_loser_id` int DEFAULT NULL,
  PRIMARY KEY (`match_id`),
  KEY `event_stats_id_idx` (`event_stats_id`),
  CONSTRAINT `event_stats_id` FOREIGN KEY (`event_stats_id`) REFERENCES `table_tennis_event_stats` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_tennis_match_stats`
--

LOCK TABLES `table_tennis_match_stats` WRITE;
/*!40000 ALTER TABLE `table_tennis_match_stats` DISABLE KEYS */;
INSERT INTO `table_tennis_match_stats` VALUES (1,28,12,1,16,2,4,4,14,0,12,60,1,2,3),(2,12,11,0,15,6,11,11,33,0,23,36,1,4,5),(3,21,12,1,24,1,2,2,9,0,4,34,1,6,7),(4,30,13,2,33,0,1,1,15,1,6,42,1,8,9),(5,39,12,4,42,1,3,3,20,0,3,41,1,10,11),(6,2,13,5,55,5,4,11,33,1,23,20,1,12,13),(7,21,13,7,45,4,5,13,22,0,45,35,1,14,15),(8,22,13,7,67,5,0,15,31,2,30,55,1,16,17),(9,43,13,6,64,3,0,17,35,0,12,66,1,18,1),(10,67,13,1,47,5,0,19,33,1,14,13,1,2,3),(11,45,13,4,53,9,4,17,23,1,57,32,1,4,5),(12,66,13,2,33,8,5,8,35,1,63,23,1,6,7),(13,33,13,3,30,6,7,15,56,0,24,56,1,8,9),(14,34,13,2,38,5,3,9,53,1,57,23,1,10,11),(15,27,13,1,39,3,2,10,36,1,37,69,1,12,13);
INSERT INTO `table_tennis_match_stats` VALUES (1,5,15,4,12,1,3,11,11,4,15,60,2,3,2),(2,12,11,0,15,6,16,11,11,0,23,36,2,5,4),(3,13,20,1,24,1,2,2,11,9,4,34,2,3,5),(4,15,16,1,9,4,5,3,11,4,6,14,2,9,8),(5,24,12,6,21,4,5,5,13,11,3,34,2,10,8);
/*!40000 ALTER TABLE `table_tennis_match_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_phases`
--

DROP TABLE IF EXISTS `team_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_phases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `start_season_id` int DEFAULT NULL,
  `end_season_id` int DEFAULT NULL,
  `affiliation_id` int NOT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `phase_status` varchar(40) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tea_aff_pha_rol_id__rol_id` (`role_id`),
  KEY `FK_tea_aff_pha_end_sea_id__sea_id` (`end_season_id`),
  KEY `FK_tea_aff_pha_sta_sea_id__sea_id` (`start_season_id`),
  KEY `FK_tea_aff_pha_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_tea_aff_pha_tea_id__tea_id` (`team_id`),
  CONSTRAINT `FK_tea_aff_pha_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_tea_aff_pha_end_sea_id__sea_id` FOREIGN KEY (`end_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_tea_aff_pha_rol_id__rol_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_tea_aff_pha_sta_sea_id__sea_id` FOREIGN KEY (`start_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_tea_aff_pha_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `team_key` varchar(100) NOT NULL,
  `publisher_id` int NOT NULL,
  `home_site_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tea_pub_id__pub_id` (`publisher_id`),
  KEY `FK_tea_hom_sit_id__sit_id` (`home_site_id`),
  KEY `IDX_teams_team_key` (`team_key`),
  CONSTRAINT `FK_tea_hom_sit_id__sit_id` FOREIGN KEY (`home_site_id`) REFERENCES `sites` (`id`),
  CONSTRAINT `FK_tea_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (2,'1',1,1);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_documents`
--

DROP TABLE IF EXISTS `teams_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_documents` (
  `team_id` int NOT NULL,
  `document_id` int NOT NULL,
  KEY `FK_tea_doc_tea_id__tea_id` (`team_id`),
  KEY `FK_tea_doc_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_tea_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_tea_doc_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_documents`
--

LOCK TABLES `teams_documents` WRITE;
/*!40000 ALTER TABLE `teams_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_media`
--

DROP TABLE IF EXISTS `teams_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_media` (
  `team_id` int NOT NULL,
  `media_id` int NOT NULL,
  KEY `FK_tea_med_med_id__med_id` (`media_id`),
  KEY `FK_tea_med_tea_id__tea_id` (`team_id`),
  CONSTRAINT `FK_tea_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `FK_tea_med_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_media`
--

LOCK TABLES `teams_media` WRITE;
/*!40000 ALTER TABLE `teams_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(45) NOT NULL,
  `team_id` int NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `team_id_idx` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Adrian','example@gmail.com','1234',33,'Admin'),(2,'Daniel','example2@gmail.com','1234',33,'Manager');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_conditions`
--

DROP TABLE IF EXISTS `weather_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_conditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `temperature` varchar(100) DEFAULT NULL,
  `temperature_units` varchar(40) DEFAULT NULL,
  `humidity` varchar(100) DEFAULT NULL,
  `clouds` varchar(100) DEFAULT NULL,
  `wind_direction` varchar(100) DEFAULT NULL,
  `wind_velocity` varchar(100) DEFAULT NULL,
  `weather_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_wea_con_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_wea_con_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2022-05-30 17:53:00
