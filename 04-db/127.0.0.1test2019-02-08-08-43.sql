# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: test
# Generation Time: 2019-02-08 06:43:19 +0000
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
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;

INSERT INTO `article` (`id`, `title`, `body`, `category_id`, `created_at`, `author_id`)
VALUES
	(1,'some title1','lorem',1,'2019-01-24T13:51:36+00:00',1),
	(3,'some title3','lorem',2,'2019-01-24T12:51:36+00:00',1),
	(4,'some title4','lorem',1,'2019-01-24T12:51:36+00:00',2),
	(5,'some title5','lorem',3,'2019-01-24T12:51:36+00:00',2),
	(6,'some title6','lorem',1,'2019-01-24T12:51:36+00:00',2),
	(7,'some title7','lorem',3,'2019-01-24T13:55:36+00:00',1),
	(8,'some title8','lorem',2,'2019-01-24T12:51:36+00:00',1);

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
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
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


# Dump of table inventory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_item_id` int(11) unsigned NOT NULL,
  `size` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `price` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_item_id` (`product_item_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_item_id`) REFERENCES `product_item` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;

INSERT INTO `inventory` (`id`, `product_item_id`, `size`, `status`, `price`)
VALUES
	(1,1,'US10','available',25000),
	(2,1,'US12','available',23000),
	(3,2,'US10','available',24500),
	(4,2,'US12','available',24000),
	(5,3,'US10','available',24500),
	(6,3,'US12','available',25500),
	(8,4,'US10','available',25000),
	(9,4,'US12','available',25000);

/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table offer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `offer`;

CREATE TABLE `offer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `size` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `price` int(11) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;

INSERT INTO `offer` (`id`, `user_id`, `product_id`, `size`, `price`, `status`)
VALUES
	(1,1,1,'US10',18000,'pending'),
	(2,3,1,'US10',18500,'pending'),
	(3,1,2,'US10',19000,'pending'),
	(4,3,2,'US10',17500,'pending');

/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `created_at` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `name`, `created_at`)
VALUES
	(1,'Adidas Yeezy Boost 700 V2 Static','2019-02-05T11:43:43+00:00'),
	(2,'Air Jordan Nike AJ I 1 High Retro','2019-02-06T08:42:25+00:00'),
	(3,'Nike x Off White Air Force 1 Low Black (2018)\nStylecode: AO4606-001','2019-02-06T15:34:43+00:00');

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_item`;

CREATE TABLE `product_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `expiration` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_item_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `product_item` WRITE;
/*!40000 ALTER TABLE `product_item` DISABLE KEYS */;

INSERT INTO `product_item` (`id`, `user_id`, `product_id`, `created_at`, `expiration`)
VALUES
	(1,2,1,'2019-02-07T08:34:43+00:00','2019-02-27T08:34:43+00:00'),
	(2,4,1,'2019-02-07T07:15:48+00:00','2019-02-27T07:15:48+00:00'),
	(3,2,2,'2019-02-07T08:34:43+00:00','2019-02-27T08:34:43+00:00'),
	(4,4,2,'2019-02-07T07:15:48+00:00','2019-02-27T07:15:48+00:00');

/*!40000 ALTER TABLE `product_item` ENABLE KEYS */;
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
	(1,'Vasia','vasia@yopmail.com','2019-01-24T12:51:22+00:00'),
	(2,'Petia','petia@yopmail.com','2019-01-25T14:53:36+00:00'),
	(3,'Mark','mark@yopmail.com','2019-01-28T15:43:43+00:00'),
	(4,'Rob','rob@yopmail.com','2019-01-28T15:50:21+00:00');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_data_first_name
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_data_first_name`;

CREATE TABLE `user_data_first_name` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_data_first_name_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
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
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_data_phone_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
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
