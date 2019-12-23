-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
<<<<<<< HEAD
-- Generation Time: Dec 05, 2019 at 04:18 AM
=======
-- Generation Time: Dec 23, 2019 at 03:38 AM
>>>>>>> model-sample
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce_platform`
--

<<<<<<< HEAD
=======
DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customer_details` (IN `in_email` VARCHAR(50))  NO SQL
SELECT customers.customer_id, first_name, last_name, email, house_number, street, city, state, zip_code FROM `customers` INNER JOIN `registered_customers` USING(customer_id) WHERE registered_customers.email = in_email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_category_products` (IN `id` INT)  NO SQL
SELECT * FROM `product_details` WHERE product_id IN (SELECT product_id FROM product_category_relations WHERE category_id = id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_root_categories` ()  NO SQL
SELECT * FROM `categories` WHERE category_id NOT IN (SELECT sub_category_id FROM category_relations)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_sub_categories` (IN `id` INT)  NO SQL
SELECT * FROM `categories` WHERE category_id IN (SELECT sub_category_id FROM category_relations WHERE category_id = id)$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `calc_total_price` (`id` INT) RETURNS DECIMAL(15,2) BEGIN
	DECLARE total DECIMAL(15,2);
	SELECT SUM(price*quantity) INTO @total FROM variants INNER JOIN (SELECT variant_id, quantity FROM carts WHERE 		  	  customer_id=id AND removed_flag = 0) AS unique_cart    	  	  USING(variant_id);
	RETURN @total;
END$$

DELIMITER ;

>>>>>>> model-sample
-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
<<<<<<< HEAD
  `attribute_name` varchar(20) NOT NULL,
  `value` varchar(50) NOT NULL,
  `variant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

=======
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `attribute_name` varchar(20) NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`product_id`, `variant_id`, `attribute_name`, `value`) VALUES
(1, 1, 'RAM', '8GB'),
(1, 1, 'Storage', '128GB'),
(1, 1, 'Front Cam', '13MP'),
(1, 1, 'Back Cam', '18MP'),
(1, 1, 'Color', 'Black'),
(2, 2, 'RAM', '8GB'),
(2, 2, 'Processor', 'Intel Core i7-7500U 2.7GHz'),
(2, 2, 'Graphics', 'NVIDIA GeForce 940MX 4GB Dedicated VRAM'),
(2, 2, 'HDD', '1000GB'),
(2, 2, 'Color', 'Black'),
(2, 13, 'RAM', '8GB'),
(2, 13, 'Processor', 'Intel Core i7-8300U 3.0GHz'),
(2, 13, 'Graphics', 'NVIDIA GeForce 940MX 4GB Dedicated VRAM'),
(2, 13, 'HDD', '1000GB'),
(2, 13, 'Color', 'Grey');

>>>>>>> model-sample
-- --------------------------------------------------------

--
-- Table structure for table `card_details`
--

CREATE TABLE `card_details` (
  `customer_id` int(11) NOT NULL,
  `card_number` int(15) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `customer_id` int(11) NOT NULL,
<<<<<<< HEAD
  `variant_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
=======
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `removed_flag` tinyint(1) NOT NULL DEFAULT '0'
>>>>>>> model-sample
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
<<<<<<< HEAD
  `image` blob
=======
  `image` varchar(255) DEFAULT NULL
>>>>>>> model-sample
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `title`, `description`, `image`) VALUES
<<<<<<< HEAD
(1, 'Laptops', 'abcd', NULL),
(2, 'Phones', 'efgh', NULL);
=======
(1, 'Electronic Devices', NULL, NULL),
(2, 'Toys', NULL, NULL),
(3, 'Smart Phones', NULL, NULL),
(4, 'Laptops', NULL, NULL),
(5, 'Speakers', NULL, NULL),
(6, 'Smart Watches', NULL, NULL),
(7, 'TVs', NULL, NULL),
(8, 'Computer Accessories', NULL, NULL),
(9, 'Diecast Toy Vehicles', NULL, NULL),
(10, 'Action Figures', NULL, NULL),
(11, 'Normal Laptops', NULL, NULL),
(12, 'Gaming Laptops', NULL, NULL),
(13, 'Normal TVs', NULL, NULL),
(14, 'Smart TVs', NULL, NULL),
(15, 'Subwoofers', NULL, NULL),
(16, 'Outdoor Speakers', NULL, NULL),
(17, 'Android Phones', NULL, NULL),
(18, 'iOS Phones', NULL, NULL),
(19, 'LCD TVs', NULL, NULL),
(20, 'LED TVs', NULL, NULL),
(21, 'Plasma TVs', NULL, NULL);
>>>>>>> model-sample

-- --------------------------------------------------------

--
-- Table structure for table `category_relations`
--

CREATE TABLE `category_relations` (
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

<<<<<<< HEAD
=======
--
-- Dumping data for table `category_relations`
--

INSERT INTO `category_relations` (`category_id`, `sub_category_id`) VALUES
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 9),
(2, 10),
(4, 11),
(4, 12),
(7, 13),
(7, 14),
(7, 19),
(7, 20),
(7, 21),
(3, 17),
(3, 18),
(5, 15),
(5, 16);

>>>>>>> model-sample
-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `courier_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courier_contacts`
--

CREATE TABLE `courier_contacts` (
  `courier_id` int(11) NOT NULL,
  `contact_number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

<<<<<<< HEAD
=======
--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`) VALUES
(1, 'John', 'Felix'),
(2, 'Sam', 'Howard'),
(3, 'Peter', 'Jenkinson'),
(4, 'Alice', 'Summerville'),
(5, 'Dean', 'Morgan'),
(6, 'Kaif', 'Ali'),
(7, 'Mary', 'Whitefield'),
(8, 'Shane', 'Cooper'),
(9, 'Sam', 'Winchester'),
(10, 'Danny', 'Wu'),
(11, 'Sophia', 'Morgan'),
(12, 'Zheng', 'Mei'),
(13, 'Calvin', 'Harris'),
(14, 'Alex', 'Benjamin'),
(15, 'Sahan', 'Jayasinghe');

>>>>>>> model-sample
-- --------------------------------------------------------

--
-- Stand-in structure for view `customers_with_active_orders`
-- (See below for the actual view)
--
CREATE TABLE `customers_with_active_orders` (
`customer_id` int(11)
,`first_name` varchar(20)
,`last_name` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `customer_contacts`
--

CREATE TABLE `customer_contacts` (
  `customer_id` int(11) NOT NULL,
  `contact_number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `delivery_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `delivery_method` varchar(20) NOT NULL,
  `tracking_info` varchar(20) DEFAULT NULL,
  `expected_date` date NOT NULL,
  `completed_date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `customer_contact` varchar(12) DEFAULT NULL,
  `house_number` int(11) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guest_customers`
--

CREATE TABLE `guest_customers` (
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
<<<<<<< HEAD
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `variant_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
=======
-- Table structure for table `main_cities`
--

CREATE TABLE `main_cities` (
  `city` varchar(20) NOT NULL
>>>>>>> model-sample
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordered_categories`
-- (See below for the actual view)
--
CREATE TABLE `ordered_categories` (
<<<<<<< HEAD
`title` varchar(20)
,`description` varchar(150)
=======
`category_title` varchar(20)
,`category_description` varchar(150)
>>>>>>> model-sample
,`variant_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'created',
  `customer_id` int(11) NOT NULL,
<<<<<<< HEAD
  `soft_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

=======
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `status`, `customer_id`, `deleted`) VALUES
(1, '2019-10-28', 'created', 3, 0),
(2, '2019-11-05', 'created', 7, 0),
(3, '2019-11-16', 'created', 4, 0),
(4, '2019-11-16', 'created', 1, 0),
(5, '2019-11-21', 'created', 9, 0),
(6, '2019-11-26', 'created', 3, 0),
(7, '2019-12-02', 'created', 4, 0),
(8, '2019-12-02', 'created', 1, 0),
(9, '2019-12-04', 'created', 7, 0),
(10, '2019-12-07', 'created', 2, 0),
(11, '2019-12-08', 'created', 10, 0),
(12, '2019-12-08', 'created', 3, 0),
(13, '2019-12-08', 'created', 7, 0),
(14, '2019-12-12', 'created', 8, 0),
(15, '2019-12-15', 'created', 4, 0);

>>>>>>> model-sample
-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
<<<<<<< HEAD
=======
  `product_id` int(11) NOT NULL,
>>>>>>> model-sample
  `variant_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

<<<<<<< HEAD
=======
--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `variant_id`, `quantity`) VALUES
(1, 8, 8, 1),
(1, 5, 16, 1),
(2, 3, 3, 1),
(3, 8, 8, 1),
(3, 10, 10, 2),
(4, 1, 1, 1),
(4, 13, 30, 2),
(4, 16, 36, 1),
(5, 8, 19, 1),
(5, 16, 37, 1),
(6, 1, 1, 1),
(6, 15, 34, 3),
(7, 11, 11, 1),
(8, 2, 13, 1),
(8, 5, 16, 2),
(9, 6, 6, 1),
(9, 13, 31, 1),
(10, 12, 12, 1);

>>>>>>> model-sample
-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `order_id` int(11) NOT NULL,
<<<<<<< HEAD
  `amount` decimal(10,2) NOT NULL,
  `card_number` int(15) NOT NULL
=======
  `payment_method` varchar(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `card_number` int(15) DEFAULT NULL
>>>>>>> model-sample
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
<<<<<<< HEAD
=======
-- Stand-in structure for view `price_range`
-- (See below for the actual view)
--
CREATE TABLE `price_range` (
`product_id` int(11)
,`min_price` decimal(15,2)
,`max_price` decimal(15,2)
);

-- --------------------------------------------------------

--
>>>>>>> model-sample
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
<<<<<<< HEAD
  `title` varchar(20) NOT NULL,
  `image` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

=======
  `title` varchar(100) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `title`, `brand`, `image`) VALUES
(1, 'SAMSUNG_S10', 'Samsung', NULL),
(2, 'ACER_ASPIRE_F15', 'ACER', NULL),
(3, 'HP Elite Dragonfly', 'HP', NULL),
(4, 'HP Zbook 15u G5', 'HP', NULL),
(5, 'SONY XB402M Extra Bass', 'SONY', NULL),
(6, 'Plasma TV-TH27391YT', 'Panasonic', NULL),
(7, 'Huawei P9', 'Huawei', NULL),
(8, 'ACER Chromebook Spin511', 'ACER', NULL),
(9, 'ACER Nitro 7', 'ACER', NULL),
(10, 'SONY GTK-PG10 Outdoor Speaker', 'SONY', NULL),
(11, 'iPhone X', 'Apple', NULL),
(12, 'ASUS Predator 701', 'ASUS', NULL),
(13, 'Samsung Gear S3 Frontier Smartwatch', 'Samsung', NULL),
(14, 'Mercedes C63S Kids Ride-on Car', 'Unbranded', NULL),
(15, 'Monster Jam Mini Pack', 'Hot Wheels', NULL),
(16, 'Xiaomi mi band 4 BT5.0 Standard Edition', 'Xiaomi', NULL),
(17, 'LG Premier 2.0 Smart TV ', 'LG', NULL),
(18, 'Lego Marvel Avengers Minifigures', 'Lego', NULL),
(19, 'Technic RC Remote Control Racing Car', 'Lego', NULL),
(20, 'Sony Smart Band SWR30', 'SONY', NULL);

>>>>>>> model-sample
-- --------------------------------------------------------

--
-- Table structure for table `product_category_relations`
--

CREATE TABLE `product_category_relations` (
<<<<<<< HEAD
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

=======
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category_relations`
--

INSERT INTO `product_category_relations` (`product_id`, `category_id`) VALUES
(1, 17),
(2, 11),
(3, 11),
(4, 4),
(5, 15),
(6, 21),
(6, 13),
(7, 17),
(8, 11),
(9, 11),
(10, 16),
(11, 18),
(12, 12),
(13, 6),
(15, 9);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_details`
-- (See below for the actual view)
--
CREATE TABLE `product_details` (
`product_id` int(11)
,`title` varchar(100)
,`brand` varchar(50)
,`image` varchar(255)
,`min_price` decimal(15,2)
,`max_price` decimal(15,2)
);

>>>>>>> model-sample
-- --------------------------------------------------------

--
-- Table structure for table `registered_customers`
--

CREATE TABLE `registered_customers` (
  `customer_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `house_number` int(11) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

<<<<<<< HEAD
=======
--
-- Dumping data for table `registered_customers`
--

INSERT INTO `registered_customers` (`customer_id`, `email`, `password`, `house_number`, `street`, `city`, `state`, `zip_code`) VALUES
(1, 'johnfelix145@example.com', 'jfgORVR1nMRSlU4ZqwRl4Q==', 75, 'Lorem Rd', 'Zuni', 'Rhode Island', '87771'),
(2, 'samhoward@example.com', 'pbI2BqjtDQR7tAI/d8xj0Q==', 19, 'Nascetur Ave', 'Pahrump', 'Nevada', '32164'),
(3, 'peterjenkins@example.com', 'ucWn7dKzF+J//fu+xVZIpQ==', 148, 'Venenatis St.', 'Glen Haven', 'Nevada', '76891'),
(4, 'alicesummer@example.com', 'howZlIIY3Yx5XGXD4yliBg==', 6, 'Quam Street', 'Rowley', 'Alaska', '29510'),
(5, 'deanmorgan7@example.com', 'WQUWPmcK5gklqLYuykY0FA==', 27, 'Senectus St', 'Houma', 'Nevada', '37722'),
(6, 'kaifali215@example.com', 'H81c0+4gA69F5oKSSDxoBA==', 95, 'Dickinson Square', 'Dresden', 'New Jersey', '70862'),
(7, 'marywhite@nowhere.com', '4iT8zFUdJQ1W3YaH5e7Eig==', 46, 'Euismod Av', 'Paia', 'Vermont', '84684'),
(8, 'shanecooper@example.com', '1yFzehy7+zt+VMYMOIguCA==', 42, 'Lectus Ave', 'Glen Head', 'Illinois', '24015'),
(9, 'samwinchester6@example.com', '4NI3jN0oOvgQkZ4VJ7YK8g==', 16, 'Aenean Street', 'Roxboro', 'Alabama', '63402'),
(10, 'dannywu@nowhere.com', 'NmeE/vygrhgRMDQWs2pHPw==', 60, 'Dui. Rd', 'Soquel', 'South Dakota', '07396'),
(15, 'sahanjayasinghe.17@cse.mrt.ac.lk', '$2y$10$7yT9Hm4Ea/ncOlB40u1xrOOC8gS8GU3XdeEsansJZWdvYF1jbdyyS', 77, 'Loften Avenue', 'New Jersy', 'Philedelphia', '45107');

>>>>>>> model-sample
-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
<<<<<<< HEAD
  `sku` varchar(25) NOT NULL,
  `weight` decimal(6,3) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

=======
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `sku` varchar(25) NOT NULL,
  `weight` decimal(10,3) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`product_id`, `variant_id`, `sku`, `weight`, `price`, `stock`) VALUES
(1, 1, '345-298-2xx', '456.300', '84.76', 0),
(2, 2, '988cjj2ka', '2314.830', '138.00', 0),
(3, 3, '6ty-8729-vb45', '1875.270', '104.00', 0),
(4, 4, '80uy-bjdc3-j41nk', '1772.400', '122.00', 0),
(5, 5, 'bfehi-b72bq-72n9n', '420.500', '72.00', 0),
(6, 6, 'jhwd810-bjsc821', '2651.350', '88.56', 0),
(7, 7, 'chi9nw81-83nef9', '322.845', '82.00', 0),
(8, 8, 'hskq01-nsckh12-15db71', '1681.620', '103.00', 0),
(9, 9, 'aplm23-maqp12-pzw6v', '2027.000', '99.00', 0),
(10, 10, '6489anco', '3401.780', '52.00', 0),
(11, 11, '80qpz2-bcsu310', '486.500', '108.00', 0),
(12, 12, 'qa3-op7-xs2-l7ww', '1956.491', '149.00', 0),
(2, 13, '87ryjhxs923', '2730.100', '140.00', 0),
(3, 14, '82u-y17s-hd81', '1772.041', '115.00', 0),
(4, 15, '80uy-j27bj4-sj82', '1449.000', '123.00', 0),
(5, 16, 'bfgr7-ncsu91-nfei82n', '420.500', '77.00', 0),
(6, 17, 'jsghkqh8-bsc6714', '1945.580', '68.40', 0),
(7, 18, 'hwjhla92-ns882', '322.845', '82.00', 0),
(8, 19, 'nzc23-ml71q-lpoae4', '1558.410', '102.00', 0),
(9, 20, 'qb29npa-1hakno-aki1010', '2117.450', '98.00', 0),
(11, 21, 'nd901-za10lo6', '486.500', '108.00', 0),
(4, 22, '80uy-vhg27b-b763b', '1832.973', '116.00', 0),
(7, 23, 'nkdskj81-aazw2', '345.100', '93.00', 0),
(11, 24, '801aer-mpq012', '495.120', '111.00', 0),
(7, 25, 'balpq953-nzka12', '345.100', '93.00', 0),
(11, 26, 'pmxd87-sevm25', '496.720', '111.00', 0),
(12, 27, 's2i-qp1-b23-ga3e', '1872.410', '144.00', 0),
(13, 28, 'sgu82-fwx92', '84.390', '51.99', 0),
(13, 29, 'sgq05-am54d', '85.830', '54.20', 0),
(13, 30, 'sg4r9-e2ui8', '85.830', '52.78', 0),
(13, 31, 'sg3h2-6ciq0', '84.390', '51.99', 0),
(14, 32, 'w107y-jz34-33e', '5883.900', '87.00', 0),
(14, 33, 'w204m-6y2y-dr9', '5883.900', '87.00', 0),
(15, 34, 'up90zxx2ert', '825.910', '42.00', 0),
(15, 35, 'uq34axks431', '1022.350', '45.00', 0),
(16, 36, 'XM21qw-e56yzkj', '72.936', '22.00', 0),
(16, 37, 'XM4t6q3-niq981', '72.936', '22.00', 0);

>>>>>>> model-sample
-- --------------------------------------------------------

--
-- Structure for view `customers_with_active_orders`
--
DROP TABLE IF EXISTS `customers_with_active_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customers_with_active_orders`  AS  select `customers`.`customer_id` AS `customer_id`,`customers`.`first_name` AS `first_name`,`customers`.`last_name` AS `last_name` from (`customers` join `orders`) where ((`orders`.`customer_id` = `customers`.`customer_id`) and (`orders`.`status` = 'created')) ;

-- --------------------------------------------------------

--
-- Structure for view `ordered_categories`
--
DROP TABLE IF EXISTS `ordered_categories`;

<<<<<<< HEAD
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordered_categories`  AS  select `categories`.`title` AS `title`,`categories`.`description` AS `description`,`order_details`.`variant_id` AS `variant_id` from (`categories` join `order_details`) where `categories`.`category_id` in (select `product_category_relations`.`category_id` from `product_category_relations` where `product_category_relations`.`product_id` in (select `variants`.`product_id` from `variants` where `variants`.`variant_id` in (select `order_details`.`variant_id` from `order_details`))) ;
=======
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordered_categories`  AS  select `categories`.`title` AS `category_title`,`categories`.`description` AS `category_description`,`order_details`.`variant_id` AS `variant_id` from (`categories` join `order_details`) where `categories`.`category_id` in (select `product_category_relations`.`category_id` from `product_category_relations` where `product_category_relations`.`product_id` in (select `variants`.`product_id` from `variants` where `variants`.`variant_id` in (select `order_details`.`variant_id` from `order_details`))) ;

-- --------------------------------------------------------

--
-- Structure for view `price_range`
--
DROP TABLE IF EXISTS `price_range`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `price_range`  AS  select `variants`.`product_id` AS `product_id`,min(`variants`.`price`) AS `min_price`,max(`variants`.`price`) AS `max_price` from `variants` group by `variants`.`product_id` ;

-- --------------------------------------------------------

--
-- Structure for view `product_details`
--
DROP TABLE IF EXISTS `product_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_details`  AS  select `products`.`product_id` AS `product_id`,`products`.`title` AS `title`,`products`.`brand` AS `brand`,`products`.`image` AS `image`,`price_range`.`min_price` AS `min_price`,`price_range`.`max_price` AS `max_price` from (`products` join `price_range` on((`products`.`product_id` = `price_range`.`product_id`))) ;
>>>>>>> model-sample

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
<<<<<<< HEAD
  ADD KEY `variant_id` (`variant_id`);
=======
  ADD KEY `variant_id` (`variant_id`),
  ADD KEY `product_id` (`product_id`);
>>>>>>> model-sample

--
-- Indexes for table `card_details`
--
ALTER TABLE `card_details`
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD KEY `customer_id` (`customer_id`),
<<<<<<< HEAD
  ADD KEY `variant_id` (`variant_id`);
=======
  ADD KEY `variant_id` (`variant_id`),
  ADD KEY `product_id` (`product_id`);
>>>>>>> model-sample

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
<<<<<<< HEAD
  ADD PRIMARY KEY (`category_id`);
=======
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `title` (`title`);
>>>>>>> model-sample

--
-- Indexes for table `category_relations`
--
ALTER TABLE `category_relations`
  ADD KEY `category_id` (`category_id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`courier_id`);

--
-- Indexes for table `courier_contacts`
--
ALTER TABLE `courier_contacts`
  ADD KEY `courier_id` (`courier_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
<<<<<<< HEAD
=======
-- Indexes for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  ADD KEY `customer_id` (`customer_id`);

--
>>>>>>> model-sample
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `courier_id` (`courier_id`);

--
-- Indexes for table `guest_customers`
--
ALTER TABLE `guest_customers`
  ADD KEY `customer_id` (`customer_id`);

--
<<<<<<< HEAD
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD KEY `variant_id` (`variant_id`);

--
=======
>>>>>>> model-sample
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_id` (`order_id`),
<<<<<<< HEAD
  ADD KEY `variant_id` (`variant_id`);
=======
  ADD KEY `variant_id` (`variant_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`order_id`);
>>>>>>> model-sample

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_category_relations`
--
ALTER TABLE `product_category_relations`
  ADD KEY `category_id` (`category_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `registered_customers`
--
ALTER TABLE `registered_customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`variant_id`),
  ADD KEY `variants_ibfk_1` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
<<<<<<< HEAD
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
=======
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
>>>>>>> model-sample

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attributes`
--
ALTER TABLE `attributes`
<<<<<<< HEAD
  ADD CONSTRAINT `attributes_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE;
=======
  ADD CONSTRAINT `attributes_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attributes_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
>>>>>>> model-sample

--
-- Constraints for table `card_details`
--
ALTER TABLE `card_details`
  ADD CONSTRAINT `card_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `registered_customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
<<<<<<< HEAD
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE;
=======
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
>>>>>>> model-sample

--
-- Constraints for table `category_relations`
--
ALTER TABLE `category_relations`
  ADD CONSTRAINT `category_relations_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_relations_ibfk_2` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courier_contacts`
--
ALTER TABLE `courier_contacts`
  ADD CONSTRAINT `courier_contacts_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`courier_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
<<<<<<< HEAD
=======
-- Constraints for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  ADD CONSTRAINT `customer_contacts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
>>>>>>> model-sample
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`courier_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guest_customers`
--
ALTER TABLE `guest_customers`
  ADD CONSTRAINT `guest_customers_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
<<<<<<< HEAD
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
=======
>>>>>>> model-sample
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
<<<<<<< HEAD
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE;
=======
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;
>>>>>>> model-sample

--
-- Constraints for table `product_category_relations`
--
ALTER TABLE `product_category_relations`
  ADD CONSTRAINT `product_category_relations_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_category_relations_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `registered_customers`
--
ALTER TABLE `registered_customers`
  ADD CONSTRAINT `registered_customers_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
