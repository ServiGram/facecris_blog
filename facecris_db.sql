-- MySQL dump 10.13  Distrib 9.0.1, for macos14.4 (x86_64)
--
-- Host: localhost    Database: facecris_db
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Crear User');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add custom user',1,'add_customuser'),(2,'Can change custom user',1,'change_customuser'),(3,'Can delete custom user',1,'delete_customuser'),(4,'Can view custom user',1,'view_customuser'),(5,'Can add post',2,'add_post'),(6,'Can change post',2,'change_post'),(7,'Can delete post',2,'delete_post'),(8,'Can view post',2,'view_post'),(9,'Can add log entry',3,'add_logentry'),(10,'Can change log entry',3,'change_logentry'),(11,'Can delete log entry',3,'delete_logentry'),(12,'Can view log entry',3,'view_logentry'),(13,'Can add permission',4,'add_permission'),(14,'Can change permission',4,'change_permission'),(15,'Can delete permission',4,'delete_permission'),(16,'Can view permission',4,'view_permission'),(17,'Can add group',5,'add_group'),(18,'Can change group',5,'change_group'),(19,'Can delete group',5,'delete_group'),(20,'Can view group',5,'view_group'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_customuser`
--

DROP TABLE IF EXISTS `blog_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_customuser`
--

LOCK TABLES `blog_customuser` WRITE;
/*!40000 ALTER TABLE `blog_customuser` DISABLE KEYS */;
INSERT INTO `blog_customuser` VALUES (1,'pbkdf2_sha256$870000$WMIXqv0BNSQBvYuqizEmmZ$8f0MvQYD4AvnM5kHQi8hdANUQ7lt+nMboryHfVL2G30=',NULL,0,'frandjans@gmail.com','franco','','',1,0,0),(2,'pbkdf2_sha256$870000$fw4Ta1LRN8swQ4CvhMLnSk$E2TF6RePkShfgDx3EaLYyM1VtdDOQ42JgN9V7YWC46Q=','2024-10-14 02:25:28.269977',1,'servigramco@gmail.com','frandjans','','',1,1,0),(3,'pbkdf2_sha256$870000$BbNIPFRIwAbMB6xx3VpBj8$Q5e5wNpd1CIaaJacjwBTHkvzu71sHKaJD3fDjXhR93c=',NULL,0,'hayety2@gmail.com','janderly','','',1,0,0),(5,'pbkdf2_sha256$870000$Q6OFVVcS7T9iwk4tVTnzql$wOqioKCRgu85TBq2sdCeuQlIFNNypjCAglC1preGH5Y=','2024-11-08 02:35:00.712920',1,'francofrancisco2008@gmail.com','servigram','','',1,1,1),(7,'pbkdf2_sha256$870000$EtqGcs3yz0mENSeG6HgHUA$Z7jeYAFeRdcMq3gDq6b9DgAOh2rjxXxOGJdrIJMhDdw=','2024-11-08 02:43:51.793174',1,'frandjans2023@gmail.com','facecris','','',1,1,1);
/*!40000 ALTER TABLE `blog_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_customuser_groups`
--

DROP TABLE IF EXISTS `blog_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_customuser_groups_customuser_id_group_id_ac5fda07_uniq` (`customuser_id`,`group_id`),
  KEY `blog_customuser_groups_group_id_fb42ef5f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `blog_customuser_grou_customuser_id_d062a394_fk_blog_cust` FOREIGN KEY (`customuser_id`) REFERENCES `blog_customuser` (`id`),
  CONSTRAINT `blog_customuser_groups_group_id_fb42ef5f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_customuser_groups`
--

LOCK TABLES `blog_customuser_groups` WRITE;
/*!40000 ALTER TABLE `blog_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_customuser_user_permissions`
--

DROP TABLE IF EXISTS `blog_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_customuser_user_per_customuser_id_permission_bc5efb0d_uniq` (`customuser_id`,`permission_id`),
  KEY `blog_customuser_user_permission_id_48518076_fk_auth_perm` (`permission_id`),
  CONSTRAINT `blog_customuser_user_customuser_id_9c3bce41_fk_blog_cust` FOREIGN KEY (`customuser_id`) REFERENCES `blog_customuser` (`id`),
  CONSTRAINT `blog_customuser_user_permission_id_48518076_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_customuser_user_permissions`
--

LOCK TABLES `blog_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `blog_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `author_id` bigint NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_author_id_dd7a8485_fk_blog_customuser_id` (`author_id`),
  CONSTRAINT `blog_post_author_id_dd7a8485_fk_blog_customuser_id` FOREIGN KEY (`author_id`) REFERENCES `blog_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (5,'Nueva Tecnologia','Esto es un post de nueva tecnologia','2024-11-07 02:29:47.073487',5,'tecnologia_nfEkp7m.jpg'),(6,'Trump asegura que Dios le salvó la vida por una razón','Donald Trump se convertirá en el presidente número 47 de los Estados Unidos y tomará posesión del cargo en una ceremonia programada para el 20 de enero de 2025, a las 12 del mediodía, hora de Washington, D.C.','2024-11-07 02:57:56.719007',5,'trump.jpg'),(7,'Neuropsicólogo Jordan Grafman: \"Dios existe en el cerebro humano, incluso en el de los ateos\"','El neuropsicólogo Jordan Grafman, de la Universidad Northwestern, ha publicado un artículo en el que argumenta que los neurocientíficos no deben temer investigar la religión. Según Grafman, la renuencia a explorar estos temas se basa en el temor de ser considerados anticientíficos. Destaca que la investigación debe centrarse en entender cómo la religión afecta al cerebro y sus repercusiones, sin buscar desacreditar creencias.\r\n\r\nPara promover este tipo de estudio, Grafman ha iniciado una colaboración con Ciência Pioneira, del Instituto D’Or de Pesquisa e Ensino, enfocándose en la creación de un centro virtual de investigación en \"neurociencia de implicaciones\". Este espacio permitirá la cooperación entre investigadores brasileños e internacionales en el ámbito de la cognición religiosa, explorando la interacción entre diferentes creencias y el impacto de la neurociencia en la comprensión de lo religioso.\r\n\r\nEn una entrevista, Grafman reafirmó su postura diciendo: \"Dios existe. Estoy seguro de que Dios existe en el cerebro\". Explicó que muchas personas en todo el mundo pertenecen a familias en las que existía una creencia antes de nacer, y que los niños están expuestos a opiniones similares en casa o en diferentes lugares de culto. Por lo tanto, se trata de absorber el mundo que te rodea y adaptar o adoptar estas ideas por diversas razones. Algunas personas eligen ciertos sistemas de opinión porque les brindan confort y ayudan a reducir la ansiedad.\r\n\r\nSegún los estudios, los individuos de familias ateas pueden optar por no creer en Dios, lo cual también es una forma de creencia. Grafman concluye que, una vez que has estado expuesto a la idea de Dios o de la religión, esta se encuentra en tu cerebro. Por lo tanto, incluso los ateos tienen una representación de Dios en sus cerebros. Esto puede parecer radical, pero Grafman afirma: \"Dios existe. Estoy seguro de que Dios existe en el cerebro\". De esta manera, se puede estudiar a Dios de forma segura y con gran detalle examinando cómo el proceso cerebral representa y permite la creencia en lo divino.','2024-11-08 01:26:00.350084',5,'neuro.jpeg'),(8,'Cristianos desplazados en México regresan a sus hogares tras acuerdos históricos','En el estado de Hidalgo, México, más de 150 cristianos protestantes, incluyendo 70 niños, que fueron forzados a abandonar sus hogares en abril debido a su fe, han regresado tras un acuerdo negociado entre las autoridades estatales y municipales. Este pacto, facilitado por Christian Solidarity Worldwide (CSW), garantiza el respeto a la libertad religiosa en las comunidades de Rancho Nuevo y Coamila, en el municipio de Huejutla de Reyes. \r\nCBN\r\n\r\nEl conflicto, que se intensificó el 26 de abril, culminó con el corte de suministros básicos y actos de vandalismo contra las propiedades de las familias protestantes. Durante su desplazamiento, estas familias dependieron de iglesias locales para su sustento, enfrentando condiciones precarias que afectaron especialmente a niños y ancianos.\r\n\r\nLa intervención de un nuevo gobierno municipal en septiembre priorizó la resolución del conflicto, trabajando junto al Secretario de Estado de Hidalgo, Guillermo Olivares Reyna, y la Directora de Asuntos Religiosos, Margarita Cabrera Román, para alcanzar una solución que respetara los derechos de todos, conforme a la ley mexicana. El acuerdo incluye la reconexión de servicios básicos y el compromiso de las familias de contribuir financieramente a los fondos comunitarios, de los cuales habían sido excluidas desde 2015.\r\n\r\nEste caso refleja una tendencia preocupante en México, donde la protección efectiva de los derechos de las minorías religiosas sigue siendo un desafío, especialmente en comunidades indígenas. Según CSW, Hidalgo es uno de los estados con mayor número de casos documentados de intolerancia religiosa, un problema que el gobierno estatal anteriormente negó públicamente.\r\n\r\nEl retorno de estas familias marca un hito en la lucha por la libertad religiosa en México, evidenciando que, con voluntad política y compromiso con los derechos humanos, es posible superar las barreras de la intolerancia y construir comunidades más inclusivas y respetuosas de la diversidad de creencias.','2024-11-12 02:44:24.404214',7,'mexas.jpeg');
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_blog_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_blog_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `blog_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-08 02:35:52.514292','1','Crear User',1,'[{\"added\": {}}]',5,5);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (3,'admin','logentry'),(5,'auth','group'),(4,'auth','permission'),(1,'blog','customuser'),(2,'blog','post'),(6,'contenttypes','contenttype'),(7,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-10-14 02:20:24.357281'),(2,'contenttypes','0002_remove_content_type_name','2024-10-14 02:20:24.377298'),(3,'auth','0001_initial','2024-10-14 02:20:24.449577'),(4,'auth','0002_alter_permission_name_max_length','2024-10-14 02:20:24.466826'),(5,'auth','0003_alter_user_email_max_length','2024-10-14 02:20:24.470253'),(6,'auth','0004_alter_user_username_opts','2024-10-14 02:20:24.473869'),(7,'auth','0005_alter_user_last_login_null','2024-10-14 02:20:24.478176'),(8,'auth','0006_require_contenttypes_0002','2024-10-14 02:20:24.479066'),(9,'auth','0007_alter_validators_add_error_messages','2024-10-14 02:20:24.482325'),(10,'auth','0008_alter_user_username_max_length','2024-10-14 02:20:24.485552'),(11,'auth','0009_alter_user_last_name_max_length','2024-10-14 02:20:24.490393'),(12,'auth','0010_alter_group_name_max_length','2024-10-14 02:20:24.500481'),(13,'auth','0011_update_proxy_permissions','2024-10-14 02:20:24.504209'),(14,'auth','0012_alter_user_first_name_max_length','2024-10-14 02:20:24.510825'),(15,'blog','0001_initial','2024-10-14 02:20:24.619442'),(16,'admin','0001_initial','2024-10-14 02:20:24.665018'),(17,'admin','0002_logentry_remove_auto_add','2024-10-14 02:20:24.670246'),(18,'admin','0003_logentry_add_action_flag_choices','2024-10-14 02:20:24.676568'),(19,'sessions','0001_initial','2024-10-14 02:20:24.688808'),(20,'blog','0002_post_image','2024-11-06 03:25:42.505340'),(21,'blog','0003_customuser_is_admin_alter_post_image','2024-11-08 02:31:06.006469');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0h7ikvmn8h26q6kgpzvchkknstlptc8l','.eJxVjEsOwjAMBe-SNYrqxEkDS_Y9Q2XHLimgVOpnhbg7VOoCtm9m3sv0tK2l3xad-1HMxThz-t2Y8kPrDuRO9TbZPNV1Htnuij3oYrtJ9Hk93L-DQkv51glBhhAbRy2hBvGOgVpIEVlihhC8JpdRwjmCpqZR3wIjeAJkliGb9wfM7jeK:1t0Am0:dFo7gUZz7tkH678_tsX7IiBBdXF3TvG5-LyhLtwxzKE','2024-10-28 02:25:28.271108'),('xj9vz652nzzwvdvnujowb85f8ifrj2ve','.eJxVjEEOwiAQRe_C2pBpoc7g0n3P0AAzSNVAUtqV8e7apAvd_vfef6nJb2uetibLNLO6KFSn3y34-JCyA777cqs61rIuc9C7og_a9FhZntfD_TvIvuVv3RsTBDvGwAJdEsNWeIAUAfpk0Q0-2XNnKAEgEVJEl8ARmRgIBujV-wPqLTdR:1t9EyV:TtNyp62udzQ5kajAAbk7OSwgLOanHJzYTgdOutwykQE','2024-11-22 02:43:51.794518');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 22:57:11
