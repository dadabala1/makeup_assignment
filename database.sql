-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table showroom.bikemode
CREATE TABLE IF NOT EXISTS `bikemode` (
  `bikeid` varchar(110) DEFAULT NULL,
  `model_name` varchar(110) DEFAULT NULL,
  `price` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table showroom.bikemode: ~5 rows (approximately)
/*!40000 ALTER TABLE `bikemode` DISABLE KEYS */;
INSERT INTO `bikemode` (`bikeid`, `model_name`, `price`) VALUES
	('a1', 'apache RTR', 150000),
	('a2', 'KTM duke', 200000),
	('a3', 'HERO moto', 120000),
	('a4', 'hondacity', 54),
	('a6', 'honda', 45);
/*!40000 ALTER TABLE `bikemode` ENABLE KEYS */;

-- Dumping structure for table showroom.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `bikeid` varchar(110) DEFAULT NULL,
  `brand_name` varchar(110) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `p_price` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table showroom.brand: ~3 rows (approximately)
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` (`bikeid`, `brand_name`, `release_date`, `p_price`) VALUES
	('B1', 'APACHE', '2020-01-01', 150000),
	('B2', 'KTM', '2019-01-01', 200000),
	('B3', 'HERO', '2000-01-01', 120000);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;

-- Dumping structure for table showroom.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` varchar(110) DEFAULT NULL,
  `emp_name` varchar(110) DEFAULT NULL,
  `emp_location` varchar(110) DEFAULT NULL,
  `job_role` varchar(110) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table showroom.employee: ~3 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`emp_id`, `emp_name`, `emp_location`, `job_role`) VALUES
	('c1', 'tommy', 'london', 'manager'),
	('c2', 'jack', 'manchester', 'IT Dept'),
	('c3', 'dosan', 'newyork', 'staff');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Dumping structure for table showroom.showroom
CREATE TABLE IF NOT EXISTS `showroom` (
  `showroom_id` varchar(110) DEFAULT NULL,
  `showroom_name` varchar(110) DEFAULT NULL,
  `location` varchar(110) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table showroom.showroom: ~3 rows (approximately)
/*!40000 ALTER TABLE `showroom` DISABLE KEYS */;
INSERT INTO `showroom` (`showroom_id`, `showroom_name`, `location`) VALUES
	('d1', 'Apache showroom', 'london'),
	('d2', 'KTM showroom', 'manchester'),
	('d3', 'Hero Bike Showroom', 'new york');
/*!40000 ALTER TABLE `showroom` ENABLE KEYS */;

-- Dumping structure for table showroom.store_details
CREATE TABLE IF NOT EXISTS `store_details` (
  `bike_id` varchar(110) DEFAULT NULL,
  `no_of_sales` int(17) DEFAULT NULL,
  `available_bike` int(17) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table showroom.store_details: ~3 rows (approximately)
/*!40000 ALTER TABLE `store_details` DISABLE KEYS */;
INSERT INTO `store_details` (`bike_id`, `no_of_sales`, `available_bike`) VALUES
	('e1', 50, 25),
	('e2', 100, 80),
	('e3', 20, 9);
/*!40000 ALTER TABLE `store_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
