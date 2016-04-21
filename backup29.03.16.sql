-- MySQL dump 10.13  Distrib 5.6.26, for osx10.8 (x86_64)
--
-- Host: localhost    Database: kubok
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add registration profile',8,'add_registrationprofile'),(23,'Can change registration profile',8,'change_registrationprofile'),(24,'Can delete registration profile',8,'delete_registrationprofile'),(25,'Can add source',9,'add_source'),(26,'Can change source',9,'change_source'),(27,'Can delete source',9,'delete_source'),(28,'Can add thumbnail',10,'add_thumbnail'),(29,'Can change thumbnail',10,'change_thumbnail'),(30,'Can delete thumbnail',10,'delete_thumbnail'),(31,'Can add thumbnail dimensions',11,'add_thumbnaildimensions'),(32,'Can change thumbnail dimensions',11,'change_thumbnaildimensions'),(33,'Can delete thumbnail dimensions',11,'delete_thumbnaildimensions'),(34,'Can add Cities',12,'add_city'),(35,'Can change Cities',12,'change_city'),(36,'Can delete Cities',12,'delete_city'),(37,'Can add News',13,'add_article'),(38,'Can change News',13,'change_article'),(39,'Can delete News',13,'delete_article'),(40,'Can add flat page',14,'add_flatpage'),(41,'Can change flat page',14,'change_flatpage'),(42,'Can delete flat page',14,'delete_flatpage'),(43,'Can add Правила',15,'add_rules'),(44,'Can change Правила',15,'change_rules'),(45,'Can delete Правила',15,'delete_rules');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL DEFAULT '',
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `first_name` varchar(30) NOT NULL DEFAULT '',
  `last_name` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$R65jFrtYMZk6$M+hLKNmo1yrZnW/dgxy4jQFrFrSKn46MncxAAG9Tw9s=','2016-03-25 10:00:33.219746',1,'root','','','murtazkorpaz@gmail.com',1,1,'2016-03-25 10:00:13.556865');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL DEFAULT '',
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-03-25 15:27:56.662526','1','City object',1,'?????????.',12,1),(2,'2016-03-25 15:28:05.147674','2','City object',1,'?????????.',12,1),(3,'2016-03-25 15:28:42.122500','3','City object',1,'?????????.',12,1),(4,'2016-03-25 15:29:37.163316','4','City object',1,'?????????.',12,1),(5,'2016-03-25 15:29:57.174513','5','City object',1,'?????????.',12,1),(6,'2016-03-25 15:30:20.562897','6','City object',1,'?????????.',12,1),(7,'2016-03-25 15:30:43.540145','7','City object',1,'?????????.',12,1),(8,'2016-03-25 15:30:57.499150','8','City object',1,'?????????.',12,1),(9,'2016-03-25 15:38:20.770280','2','City object',2,'??????? name.',12,1),(10,'2016-03-25 15:53:24.889218','2','City object',2,'??????? name.',12,1),(11,'2016-03-25 15:54:15.277692','2','City object',2,'??????? name.',12,1),(12,'2016-03-25 15:55:58.831003','3','City object',2,'Изменен name.',12,1),(13,'2016-03-25 15:56:09.944046','4','City object',2,'Изменен name.',12,1),(14,'2016-03-25 15:56:22.256163','5','City object',2,'Изменен name.',12,1),(15,'2016-03-25 15:56:33.714258','6','City object',2,'Изменен name.',12,1),(16,'2016-03-25 15:56:45.403986','7','City object',2,'Изменен name.',12,1),(17,'2016-03-25 15:56:56.975565','8','City object',2,'Изменен name.',12,1),(18,'2016-03-25 15:57:08.852284','1','City object',2,'Изменен name.',12,1),(19,'2016-03-25 19:44:58.359116','1','Article object',1,'Добавлено.',13,1),(20,'2016-03-25 20:45:15.566315','2','Article object',1,'Добавлено.',13,1),(21,'2016-03-25 20:49:02.211195','2','Article object',2,'Изменен type и city.',13,1),(22,'2016-03-25 21:38:22.538908','2','Санкт-Петербург',2,'Изменен image.',12,1),(23,'2016-03-28 21:35:29.665825','1','Правила Санкт-Петербург',1,'Добавлено.',15,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL DEFAULT '',
  `model` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(2,'auth','group'),(1,'auth','permission'),(3,'auth','user'),(4,'contenttypes','contenttype'),(9,'easy_thumbnails','source'),(10,'easy_thumbnails','thumbnail'),(11,'easy_thumbnails','thumbnaildimensions'),(14,'flatpages','flatpage'),(13,'news','article'),(8,'registration','registrationprofile'),(5,'sessions','session'),(6,'sites','site'),(12,'tourney','city'),(15,'tourney','rules');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage`
--

DROP TABLE IF EXISTS `django_flatpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `template_name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `registration_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_flatpage_572d4e42` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage`
--

LOCK TABLES `django_flatpage` WRITE;
/*!40000 ALTER TABLE `django_flatpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_flatpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage_sites`
--

DROP TABLE IF EXISTS `django_flatpage_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flatpage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_flatpage_sites_flatpage_id_0d29d9d1_uniq` (`flatpage_id`,`site_id`),
  KEY `django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id` (`site_id`),
  CONSTRAINT `django_flatpage_sites_flatpage_id_078bbc8b_fk_django_flatpage_id` FOREIGN KEY (`flatpage_id`) REFERENCES `django_flatpage` (`id`),
  CONSTRAINT `django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage_sites`
--

LOCK TABLES `django_flatpage_sites` WRITE;
/*!40000 ALTER TABLE `django_flatpage_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_flatpage_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-03-25 07:08:33.418274'),(2,'auth','0001_initial','2016-03-25 07:08:33.835824'),(3,'admin','0001_initial','2016-03-25 07:08:33.918611'),(4,'admin','0002_logentry_remove_auto_add','2016-03-25 07:08:33.949990'),(5,'contenttypes','0002_remove_content_type_name','2016-03-25 07:08:34.097763'),(6,'auth','0002_alter_permission_name_max_length','2016-03-25 07:08:34.147375'),(7,'auth','0003_alter_user_email_max_length','2016-03-25 07:08:34.188217'),(8,'auth','0004_alter_user_username_opts','2016-03-25 07:08:34.205682'),(9,'auth','0005_alter_user_last_login_null','2016-03-25 07:08:34.248473'),(10,'auth','0006_require_contenttypes_0002','2016-03-25 07:08:34.250856'),(11,'auth','0007_alter_validators_add_error_messages','2016-03-25 07:08:34.265232'),(12,'easy_thumbnails','0001_initial','2016-03-25 07:08:34.529201'),(13,'easy_thumbnails','0002_thumbnaildimensions','2016-03-25 07:08:34.581398'),(14,'registration','0001_initial','2016-03-25 07:08:34.652837'),(15,'sessions','0001_initial','2016-03-25 07:08:34.699628'),(16,'sites','0001_initial','2016-03-25 07:08:34.732532'),(17,'sites','0002_alter_domain_unique','2016-03-25 07:08:34.762238'),(18,'tourney','0001_initial','2016-03-25 10:08:41.745660'),(19,'tourney','0002_auto_20160325_1719','2016-03-25 15:19:53.408431'),(20,'news','0001_initial','2016-03-25 18:57:06.227422'),(21,'news','0002_article_type','2016-03-25 19:35:08.338982'),(22,'news','0003_auto_20160325_2208','2016-03-25 20:08:14.385733'),(23,'news','0004_auto_20160325_2248','2016-03-25 20:48:38.886199'),(24,'news','0005_auto_20160325_2335','2016-03-25 21:35:36.492952'),(25,'tourney','0003_auto_20160325_2335','2016-03-25 21:35:51.246360'),(26,'flatpages','0001_initial','2016-03-28 21:33:38.974463'),(27,'tourney','0004_auto_20160329_0033','2016-03-28 21:33:39.186495'),(28,'tourney','0005_auto_20160329_0036','2016-03-28 21:36:08.163511');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL DEFAULT '',
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('z0rlid5tp3f6j5xwc27nmmpmgsno6pg4','NDNmZmJmMjI5N2NhNjU3ZWNkMmI0ODA2ZTI2OWQxMDM5OTU3NTJjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM1YTE5N2Y0NDU0MjgyNmJjZmVkZWI3ZTNiZDE2MDg2OWZiNzZmYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-04-08 10:00:33.249655');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_source`
--

DROP TABLE IF EXISTS `easy_thumbnails_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `easy_thumbnails_source_storage_hash_481ce32d_uniq` (`storage_hash`,`name`),
  KEY `easy_thumbnails_source_b454e115` (`storage_hash`),
  KEY `easy_thumbnails_source_b068931c` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_source`
--

LOCK TABLES `easy_thumbnails_source` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `easy_thumbnails_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_thumbnail`
--

DROP TABLE IF EXISTS `easy_thumbnails_thumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_thumbnail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime(6) NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `easy_thumbnails_thumbnail_storage_hash_fb375270_uniq` (`storage_hash`,`name`,`source_id`),
  KEY `easy_thumbnails__source_id_5b57bc77_fk_easy_thumbnails_source_id` (`source_id`),
  KEY `easy_thumbnails_thumbnail_b454e115` (`storage_hash`),
  KEY `easy_thumbnails_thumbnail_b068931c` (`name`),
  CONSTRAINT `easy_thumbnails__source_id_5b57bc77_fk_easy_thumbnails_source_id` FOREIGN KEY (`source_id`) REFERENCES `easy_thumbnails_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnail`
--

LOCK TABLES `easy_thumbnails_thumbnail` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` DISABLE KEYS */;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_thumbnaildimensions`
--

DROP TABLE IF EXISTS `easy_thumbnails_thumbnaildimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_thumbnaildimensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int(11) NOT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thumbnail_id` (`thumbnail_id`),
  CONSTRAINT `easy_thumb_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id` FOREIGN KEY (`thumbnail_id`) REFERENCES `easy_thumbnails_thumbnail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnaildimensions`
--

LOCK TABLES `easy_thumbnails_thumbnaildimensions` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnaildimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnaildimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_article`
--

DROP TABLE IF EXISTS `news_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `main_image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `short_article` longtext COLLATE utf8_unicode_ci NOT NULL,
  `article` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_id` (`city_id`),
  CONSTRAINT `news_article_city_id_726630ed_fk_tourney_city_id` FOREIGN KEY (`city_id`) REFERENCES `tourney_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_article`
--

LOCK TABLES `news_article` WRITE;
/*!40000 ALTER TABLE `news_article` DISABLE KEYS */;
INSERT INTO `news_article` VALUES (1,'test','','<p>test...</p>','<p>test test</p>','','2016-03-25','russian_bowl',NULL),(2,'test spb','','<p>test spb</p>','<p>test spb spb</p>','','2016-03-25','region_bowl',2);
/*!40000 ALTER TABLE `news_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_key` varchar(40) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_registrationprofil_user_id_5fcbf725_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourney_city`
--

DROP TABLE IF EXISTS `tourney_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tourney_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `short_name` varchar(5) NOT NULL DEFAULT '',
  `css` longtext,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourney_city`
--

LOCK TABLES `tourney_city` WRITE;
/*!40000 ALTER TABLE `tourney_city` DISABLE KEYS */;
INSERT INTO `tourney_city` VALUES (1,'Москва','msk','',''),(2,'Санкт-Петербург','spb','','./big-jumbo.jpg'),(3,'Владивосток','vld','',''),(4,'Екатеринбург','ekt','',''),(5,'Казань','kaz','',''),(6,'Новосибирск','nsib','',''),(7,'Минеральные Воды','minv','',''),(8,'Краснодар','krsn','','');
/*!40000 ALTER TABLE `tourney_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourney_rules`
--

DROP TABLE IF EXISTS `tourney_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tourney_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regulations` longtext COLLATE utf8_unicode_ci,
  `states` longtext COLLATE utf8_unicode_ci,
  `technical_rules` longtext COLLATE utf8_unicode_ci,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_id` (`city_id`),
  CONSTRAINT `tourney_rules_city_id_c45fed4b_fk_tourney_city_id` FOREIGN KEY (`city_id`) REFERENCES `tourney_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourney_rules`
--

LOCK TABLES `tourney_rules` WRITE;
/*!40000 ALTER TABLE `tourney_rules` DISABLE KEYS */;
INSERT INTO `tourney_rules` VALUES (1,'<p>test reg</p>','<p>test stat</p>','<p>test tech</p>',2);
/*!40000 ALTER TABLE `tourney_rules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-29  3:28:05
