-- --------------------------------------------------------
-- Host:                         awseb-e-86ixkzibzj-stack-awsebrdsdatabase-yp7cf4g45dyt.cxjisw65ztsw.us-east-1.rds.amazonaws.com
-- Versión del servidor:         8.0.39 - Source distribution
-- SO del servidor:              Linux
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para apartment4V
CREATE DATABASE IF NOT EXISTS `apartment4v` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `apartment4V`;

-- Volcando estructura para tabla apartment4V.apartment
CREATE TABLE IF NOT EXISTS `apartment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupied` tinyint(1) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla apartment4V.apartment: ~2 rows (aproximadamente)
DELETE FROM `apartment`;
INSERT INTO `apartment` (`id`, `description`, `occupied`, `title`, `direction`, `price`) VALUES
	(1, 'Piso 4 Habitaciones y 2 Baños en una zona muy bien comunicada', 0, 'Piso Sancho el Fuerte', 'Sancho el Fuerte 27 5C', 980),
	(2, 'Apartamento 1 Hab recien reformado', 0, 'Piso Casco Viejo', 'San Nicolas 21 3ºDR', 550);

-- Volcando estructura para tabla apartment4V.client
CREATE TABLE IF NOT EXISTS `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `api_key` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla apartment4V.client: ~1 rows (aproximadamente)
DELETE FROM `client`;
INSERT INTO `client` (`id`, `api_key`) VALUES
	(1, '1234');

-- Volcando estructura para tabla apartment4V.doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla apartment4V.doctrine_migration_versions: ~0 rows (aproximadamente)
DELETE FROM `doctrine_migration_versions`;

-- Volcando estructura para tabla apartment4V.photo
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apartment_id` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_14B78418176DFE85` (`apartment_id`),
  CONSTRAINT `FK_14B78418176DFE85` FOREIGN KEY (`apartment_id`) REFERENCES `apartment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla apartment4V.photo: ~3 rows (aproximadamente)
DELETE FROM `photo`;
INSERT INTO `photo` (`id`, `apartment_id`, `url`) VALUES
	(1, 1, 'https://image-proxy.libere.app/images/jpg:1920/plain/https://air-production-asset-images.storage.googleapis.com/42490f16-14ee-43f3-9b11-90f1c2f3b2f4/space-categories/f894bb3e-cbd8-48ac-9164-aed6007ca89a/a80ad239-6fdb-4c08-9aac-af0a008d306c.jpg@jpg'),
	(2, 2, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/454797909.jpg?k=15c5b906b236f4ca73879afdd35ff772afd755632dc476b0da09977b323496f2&o=&hp=1'),
	(3, 2, 'https://www.viacelere.com/wp-content/uploads/old-blog/2022/11/salon02-scaled.jpg');

-- Volcando estructura para tabla apartment4V.reservation
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apartment_id` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `cancelled` tinyint(1) NOT NULL,
  `cancellation_date` datetime DEFAULT NULL,
  `reservation_contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_42C84955176DFE85` (`apartment_id`),
  CONSTRAINT `FK_42C84955176DFE85` FOREIGN KEY (`apartment_id`) REFERENCES `apartment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla apartment4V.reservation: ~1 rows (aproximadamente)
DELETE FROM `reservation`;
INSERT INTO `reservation` (`id`, `apartment_id`, `start_date`, `end_date`, `cancelled`, `cancellation_date`, `reservation_contact`) VALUES
	(1, 1, '2025-01-23 11:04:55', '2026-01-24 11:04:57', 0, NULL, 'juan.perez@gmail.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
