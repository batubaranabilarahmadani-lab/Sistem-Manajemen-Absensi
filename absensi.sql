-- --------------------------------------------------------
-- Database: absensi
-- Charset : utf8mb4
-- Collate : utf8mb4_unicode_ci
-- --------------------------------------------------------

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

SET FOREIGN_KEY_CHECKS = 0;

-- --------------------------------------------------------
-- CREATE DATABASE
-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `absensi`
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE `absensi`;

-- --------------------------------------------------------
-- TABLE: attendances
-- --------------------------------------------------------
CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `entry_ip` varchar(255) NOT NULL,
  `entry_location` varchar(255) NOT NULL,
  `exit_ip` varchar(255) DEFAULT NULL,
  `exit_location` varchar(255) DEFAULT NULL,
  `registered` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `attendances` VALUES
(2,4,'127.0.0.1','', '127.0.0.1','', 'yes',NULL,'2021-08-18 03:00:23','2021-08-18 10:00:23'),
(3,5,'127.0.0.1','', '127.0.0.1','', 'yes',NULL,'2021-08-19 03:00:23','2021-08-19 10:00:23'),
(4,6,'127.0.0.1','', '127.0.0.1','', 'yes',NULL,'2021-08-20 03:00:23','2021-08-20 10:00:23'),
(5,7,'127.0.0.1','', '127.0.0.1','', 'yes',NULL,'2021-08-21 03:00:23','2021-08-21 10:00:23'),
(6,8,'127.0.0.1','', '127.0.0.1','', 'yes',NULL,'2021-08-22 03:00:23','2021-08-22 10:00:23'),
(7,9,'127.0.0.1','', '127.0.0.1','', 'yes',NULL,'2021-08-23 03:00:23','2021-08-23 10:00:23'),
(8,10,'127.0.0.1','', '127.0.0.1','', 'yes',NULL,'2021-08-24 03:00:23','2021-08-24 10:00:23'),
(9,11,'127.0.0.1','', '127.0.0.1','', 'yes',NULL,'2021-08-25 03:00:23','2021-08-25 10:00:23'),
(10,7,'127.0.0.1','Gang Tebet Barat Raya','127.0.0.1','Gang Tebet Barat Raya','yes','12','2024-10-19 05:08:16','2024-10-19 06:14:20'),
(11,3,'127.0.0.1','Gang Tebet Barat Raya','127.0.0.1','Gang Tebet Barat Raya','ya','02','2024-11-27 07:13:15','2024-11-27 14:11:12'),
(12,3,'127.0.0.1','Geo Tag Expired',NULL,NULL,NULL,'03','2025-03-16 08:44:30','2025-03-16 08:44:30');

-- --------------------------------------------------------
-- TABLE: departments
-- --------------------------------------------------------
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `overtime_cost` varchar(255) DEFAULT NULL,
  `overtime_start` varchar(255) DEFAULT NULL,
  `overtime_end` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `departments` VALUES
(1,'Manajemen','10000','17:00','21:00','2024-10-19 04:52:20','2024-11-27 02:34:37'),
(2,'Perawat','7000','17:00','21:00','2024-10-19 04:52:20','2024-11-27 11:53:52'),
(3,'Bidan','6500','17:00','21:00','2024-10-19 04:52:20','2024-11-27 11:54:12'),
(4,'Dokter','12000','17:00','21:00','2024-10-19 04:52:20','2024-11-27 11:54:38'),
(5,'Kasir','6000','17:00','21:00','2024-10-19 04:52:20','2024-11-27 11:55:14'),
(6,'Farmasi','9500','17:00','21:00','2024-10-19 04:52:20','2024-11-27 11:55:30'),
(7,'Front Office','7000','17:00','21:00','2024-10-19 04:52:20','2024-11-27 11:56:37'),
(8,'Petugas Kebersihan','5500','17:00','21:00','2024-10-19 04:52:20','2024-11-27 11:57:13'),
(9,'Backend Developer','10000','17:00','21:00','2024-10-19 04:52:20','2024-11-27 02:36:09');

-- --------------------------------------------------------
-- TABLE: users
-- --------------------------------------------------------
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- TABLE: employees
-- --------------------------------------------------------
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `dob` datetime NOT NULL,
  `sex` varchar(50) NOT NULL,
  `desg` varchar(255) NOT NULL,
  `department_id` varchar(50) NOT NULL,
  `join_date` datetime NOT NULL,
  `salary` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'user.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- TABLE: leaves
-- --------------------------------------------------------
CREATE TABLE `leaves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `reason` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `half_day` varchar(50) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- TABLE: holidays
-- --------------------------------------------------------
CREATE TABLE `holidays` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- TABLE: expenses
-- --------------------------------------------------------
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `description` text NOT NULL,
  `amount` double(10,2) NOT NULL,
  `receipt` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
