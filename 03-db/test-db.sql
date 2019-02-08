# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: test
# Generation Time: 2019-01-25 07:09:49 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_520_ci,
  `category_id` int(11) unsigned NOT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `author_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;

INSERT INTO `article` (`id`, `title`, `body`, `category_id`, `created_at`, `author_id`)
VALUES
	(1,'bla bla','dgd',1,'2019-01-24T13:51:36+00:00',1),
	(3,'bla bla 1','dgd',2,'2019-01-24T12:51:36+00:00',1),
	(4,'bla bla 3','dgd',1,'2019-01-24T12:51:36+00:00',2),
	(5,'bla bla 5','dgd',3,'2019-01-24T12:51:36+00:00',2),
	(6,'bla bla 8','dgd',1,'2019-01-24T12:51:36+00:00',2),
	(7,'bla bla 2','dgd',3,'2019-01-24T13:55:36+00:00',1),
	(8,'bla bla 4','dgd',2,'2019-01-24T12:51:36+00:00',1);

/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `title`, `parent_id`, `created_at`)
VALUES
	(1,'news',0,'2019-01-24T12:51:36+00:00'),
	(2,'sport',0,'2019-01-24T12:51:36+00:00'),
	(3,'football',2,'2019-01-24T12:51:36+00:00');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `created_at` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `email`, `created_at`)
VALUES
	(1,'vasia','vasia@yopmail.com','2019-01-24T12:51:36+00:00'),
	(2,'petia','petia@yopmail.com','2019-01-24T12:51:36+00:00');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_data_first_name
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_data_first_name`;

CREATE TABLE `user_data_first_name` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `user_data_first_name` WRITE;
/*!40000 ALTER TABLE `user_data_first_name` DISABLE KEYS */;

INSERT INTO `user_data_first_name` (`id`, `user_id`, `value`)
VALUES
	(1,1,'Vasia'),
	(2,2,'Petia');

/*!40000 ALTER TABLE `user_data_first_name` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_data_phone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_data_phone`;

CREATE TABLE `user_data_phone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `user_data_phone` WRITE;
/*!40000 ALTER TABLE `user_data_phone` DISABLE KEYS */;

INSERT INTO `user_data_phone` (`id`, `user_id`, `value`)
VALUES
	(1,1,'+380982345467'),
	(2,2,'+380635467856');

/*!40000 ALTER TABLE `user_data_phone` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
