--
-- TABLE STRUCTURE FOR: oc_address
--

DROP TABLE IF EXISTS oc_address;

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_affiliate
--

DROP TABLE IF EXISTS oc_affiliate;

CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_affiliate_activity
--

DROP TABLE IF EXISTS oc_affiliate_activity;

CREATE TABLE `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_affiliate_transaction
--

DROP TABLE IF EXISTS oc_affiliate_transaction;

CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_api
--

DROP TABLE IF EXISTS oc_api;

CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO oc_api (`api_id`, `username`, `firstname`, `lastname`, `password`, `status`, `date_added`, `date_modified`) VALUES
(2, 'rN3C90kW1gl640zi02ZRHtd3tXOPka4RoyTnp49gbkcWbS5SKUkREDLxbaDB17Sf', '', '', 'wmJbhJ89uaVLsRe3lFKqIWdjwhknf3JRgSsEbqDLHZX0q2tS748GQcpD9QreK0wqJfvkMywUNKK4D3MAyLHFnxInDzIOq45zaqameM6sXGmaAybzAi4nVDRZ2ZojUjYuPyWuBTdYaFzb4RQ40LiMOzlHOPqjzETF3qz49STZYJ0SaHNQSwcglEo0UUZJZtOSZEMYXgyvppEGwSXFE0mq4QgPk6Y9pnREredFAS0q75wuNJzS9b84reJSaiSGLjK3', 1, '2014-11-12 01:23:48', '2014-11-12 01:23:48');

--
-- TABLE STRUCTURE FOR: oc_attribute
--

DROP TABLE IF EXISTS oc_attribute;

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO oc_attribute (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

--
-- TABLE STRUCTURE FOR: oc_attribute_description
--

DROP TABLE IF EXISTS oc_attribute_description;

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_attribute_description (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed'),
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'test 1'),
(5, 2, 'test 2'),
(6, 2, 'test 3'),
(7, 2, 'test 4'),
(8, 2, 'test 5'),
(9, 2, 'test 6'),
(10, 2, 'test 7'),
(11, 2, 'test 8'),
(3, 2, 'Clockspeed');

--
-- TABLE STRUCTURE FOR: oc_attribute_group
--

DROP TABLE IF EXISTS oc_attribute_group;

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO oc_attribute_group (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

--
-- TABLE STRUCTURE FOR: oc_attribute_group_description
--

DROP TABLE IF EXISTS oc_attribute_group_description;

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_attribute_group_description (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor');

--
-- TABLE STRUCTURE FOR: oc_banner
--

DROP TABLE IF EXISTS oc_banner;

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO oc_banner (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1),
(9, 'Start', 1);

--
-- TABLE STRUCTURE FOR: oc_banner_image
--

DROP TABLE IF EXISTS oc_banner_image;

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

INSERT INTO oc_banner_image (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(79, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(87, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(80, 7, '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(97, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0),
(99, 9, '', 'catalog/demo/start/manufacturers/105x25.jpg', 1),
(100, 9, '', 'catalog/demo/start/manufacturers/105x25.jpg', 2),
(101, 9, '', 'catalog/demo/start/manufacturers/105x25.jpg', 3),
(102, 9, '', 'catalog/demo/start/manufacturers/105x25.jpg', 4),
(103, 9, '', 'catalog/demo/start/manufacturers/105x25.jpg', 5),
(104, 9, '', 'catalog/demo/start/manufacturers/105x25.jpg', 6);

--
-- TABLE STRUCTURE FOR: oc_banner_image_description
--

DROP TABLE IF EXISTS oc_banner_image_description;

CREATE TABLE `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_banner_image_description (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(79, 1, 7, 'iPhone 6'),
(87, 1, 6, 'HP Banner'),
(93, 1, 8, 'Canon'),
(92, 1, 8, 'Burger King'),
(91, 1, 8, 'Coca Cola'),
(90, 1, 8, 'Disney'),
(89, 1, 8, 'Dell'),
(80, 1, 7, 'MacBookAir'),
(88, 1, 8, 'Harley Davidson'),
(94, 1, 8, 'NFL'),
(95, 1, 8, 'RedBull'),
(96, 1, 8, 'Sony'),
(97, 1, 8, 'Starbucks'),
(98, 1, 8, 'Nintendo'),
(79, 2, 7, 'iPhone 6'),
(87, 2, 6, 'HP Banner'),
(93, 2, 8, 'Canon'),
(92, 2, 8, 'Burger King'),
(91, 2, 8, 'Coca Cola'),
(90, 2, 8, 'Disney'),
(89, 2, 8, 'Dell'),
(80, 2, 7, 'MacBookAir'),
(88, 2, 8, 'Harley Davidson'),
(94, 2, 8, 'NFL'),
(95, 2, 8, 'RedBull'),
(96, 2, 8, 'Sony'),
(97, 2, 8, 'Starbucks'),
(98, 2, 8, 'Nintendo'),
(99, 1, 9, 'Facebook'),
(99, 2, 9, 'Facebook'),
(100, 1, 9, 'Twitter'),
(100, 2, 9, 'Twitter'),
(101, 1, 9, 'Smashing'),
(101, 2, 9, 'Smashing'),
(102, 1, 9, 'Dribbble'),
(102, 2, 9, 'Dribbble'),
(103, 1, 9, 'Envato'),
(103, 2, 9, 'Envato'),
(104, 1, 9, 'Behance'),
(104, 2, 9, 'Behance');

--
-- TABLE STRUCTURE FOR: oc_category
--

DROP TABLE IF EXISTS oc_category;

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

INSERT INTO oc_category (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(70, 'catalog/demo/start/categories/270x270.jpg', 0, 0, 1, 0, 1, '2014-11-25 13:45:04', '2014-11-27 01:06:07'),
(61, '', 60, 0, 1, 0, 1, '2014-11-25 12:01:57', '2014-11-25 12:01:57'),
(62, '', 60, 0, 1, 0, 1, '2014-11-25 13:35:24', '2014-11-25 13:35:24'),
(60, 'catalog/demo/start/products/870x1110.jpg', 59, 0, 1, 0, 1, '2014-11-25 11:59:37', '2014-11-27 01:02:36'),
(71, 'catalog/demo/start/products/870x1110.jpg', 70, 0, 1, 0, 1, '2014-11-25 13:46:05', '2014-11-27 01:06:26'),
(63, '', 60, 0, 1, 0, 1, '2014-11-25 13:35:49', '2014-11-25 13:35:49'),
(64, 'catalog/demo/start/products/870x1110.jpg', 59, 0, 1, 0, 1, '2014-11-25 13:36:17', '2014-11-27 01:03:06'),
(65, 'catalog/demo/start/products/870x1110.jpg', 59, 0, 1, 0, 1, '2014-11-25 13:39:03', '2014-11-27 01:03:22'),
(68, 'catalog/demo/start/products/870x1110.jpg', 66, 0, 1, 0, 1, '2014-11-25 13:43:13', '2014-11-27 01:05:34'),
(69, 'catalog/demo/start/products/870x1110.jpg', 66, 0, 1, 0, 1, '2014-11-25 13:44:08', '2014-11-27 01:05:48'),
(67, 'catalog/demo/start/products/870x1110.jpg', 66, 0, 1, 0, 1, '2014-11-25 13:41:28', '2014-11-27 01:05:24'),
(66, 'catalog/demo/start/categories/270x270.jpg', 0, 1, 1, 0, 1, '2014-11-25 13:40:33', '2014-11-27 01:03:38'),
(59, 'catalog/demo/start/categories/270x270.jpg', 0, 0, 1, 0, 1, '2014-11-25 11:39:23', '2014-11-27 01:02:19'),
(72, 'catalog/demo/start/products/870x1110.jpg', 70, 0, 1, 0, 1, '2014-11-25 13:47:18', '2014-11-27 01:06:53'),
(73, 'catalog/demo/start/products/870x1110.jpg', 70, 0, 1, 0, 1, '2014-11-25 13:48:53', '2014-11-27 01:07:28'),
(74, 'catalog/demo/start/categories/270x270.jpg', 0, 0, 1, 0, 1, '2014-11-25 13:51:10', '2014-11-27 01:07:47'),
(75, 'catalog/demo/start/products/870x1110.jpg', 74, 0, 1, 0, 1, '2014-11-25 13:53:44', '2014-11-27 01:08:05'),
(76, 'catalog/demo/start/products/870x1110.jpg', 74, 0, 1, 0, 1, '2014-11-25 13:54:53', '2014-11-27 01:08:19'),
(77, 'catalog/demo/start/products/870x1110.jpg', 74, 0, 1, 0, 1, '2014-11-25 13:55:53', '2014-11-27 01:08:32'),
(78, 'catalog/demo/start/categories/270x270.jpg', 0, 0, 1, 0, 1, '2014-11-25 13:56:39', '2014-11-27 01:08:45'),
(79, 'catalog/demo/start/products/870x1110.jpg', 78, 0, 1, 0, 1, '2014-11-25 13:57:38', '2014-11-27 01:09:03'),
(80, 'catalog/demo/start/products/870x1110.jpg', 78, 0, 1, 0, 1, '2014-11-25 13:58:40', '2014-11-27 01:09:22'),
(81, 'catalog/demo/start/products/870x1110.jpg', 78, 0, 1, 0, 1, '2014-11-25 13:59:35', '2014-11-27 01:09:34'),
(82, 'catalog/demo/start/products/870x1110.jpg', 78, 0, 1, 0, 1, '2014-11-25 14:01:09', '2014-11-27 01:09:46'),
(83, 'catalog/demo/start/categories/270x270.jpg', 0, 0, 1, 0, 1, '2014-11-25 14:01:59', '2014-11-27 01:09:58'),
(84, 'catalog/demo/start/products/870x1110.jpg', 83, 0, 1, 0, 1, '2014-11-25 14:03:17', '2014-11-27 01:10:25'),
(85, 'catalog/demo/start/products/870x1110.jpg', 83, 0, 1, 0, 1, '2014-11-25 14:04:07', '2014-11-27 01:10:41'),
(86, 'catalog/demo/start/products/870x1110.jpg', 83, 0, 1, 0, 1, '2014-11-25 14:04:59', '2014-11-27 01:11:07'),
(87, 'catalog/demo/start/categories/270x270.jpg', 0, 0, 1, 0, 1, '2014-11-25 14:05:41', '2014-11-27 01:11:24'),
(88, 'catalog/demo/start/products/870x1110.jpg', 87, 0, 1, 0, 1, '2014-11-25 14:06:31', '2014-11-27 01:12:06'),
(89, 'catalog/demo/start/products/870x1110.jpg', 87, 0, 1, 0, 1, '2014-11-25 14:07:20', '2014-11-27 01:12:20'),
(90, 'catalog/demo/start/products/870x1110.jpg', 87, 0, 1, 0, 1, '2014-11-25 14:08:16', '2014-11-27 01:12:33'),
(91, 'catalog/demo/start/categories/270x270.jpg', 0, 0, 1, 0, 1, '2014-11-25 14:09:09', '2014-11-27 01:12:50'),
(92, 'catalog/demo/start/products/870x1110.jpg', 91, 0, 1, 0, 1, '2014-11-25 14:12:34', '2014-11-27 01:13:04'),
(93, 'catalog/demo/start/products/870x1110.jpg', 91, 0, 1, 0, 1, '2014-11-25 14:13:43', '2014-11-27 01:13:17'),
(94, 'catalog/demo/start/products/870x1110.jpg', 91, 0, 1, 0, 1, '2014-11-25 14:14:56', '2014-11-27 01:13:29');

--
-- TABLE STRUCTURE FOR: oc_category_description
--

DROP TABLE IF EXISTS oc_category_description;

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_category_description (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(59, 1, 'MEN’S ACCESSORIES', 'Our collection of wallets carries both classic and contemporary styles, from top designer name Paul Smith and established heritage labels including Ben Sherman and Fred Perry. Bold interior linings add an off-beat twist to Ted Baker\'s classic designs, whilst Diesel\'s utility style wallets reference current workwear influences.', 'MEN’S ACCESSORIES', '', ''),
(59, 2, 'MEN’S ACCESSORIES', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'MEN’S ACCESSORIES', '', ''),
(60, 1, 'Back Pack', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.', 'Back Pack', '', ''),
(60, 2, 'Back Pack', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.', 'Back Pack', '', ''),
(61, 1, 'EMBELLISH', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'EMBELLISH', '', ''),
(61, 2, 'EMBELLISH', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'EMBELLISH', '', ''),
(62, 1, 'LEE&amp;TEE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'LEE&amp;TEE', '', ''),
(62, 2, 'LEE&amp;TEE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'LEE&amp;TEE', '', ''),
(63, 1, 'RIVER ISLAND', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'RIVER ISLAND', '', ''),
(63, 2, 'RIVER ISLAND', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'RIVER ISLAND', '', ''),
(64, 1, 'Wallets', 'Our collection of wallets carries both classic and contemporary styles, from top designer name Paul Smith and established heritage labels including Ben Sherman and Fred Perry. Bold interior linings add an off-beat twist to Ted Baker\'s classic designs, whilst Diesel\'s utility style wallets reference current workwear influences.', 'Wallets', '', ''),
(64, 2, 'Wallets', 'Our collection of wallets carries both classic and contemporary styles, from top designer name Paul Smith and established heritage labels including Ben Sherman and Fred Perry. Bold interior linings add an off-beat twist to Ted Baker\'s classic designs, whilst Diesel\'s utility style wallets reference current workwear influences.', 'Wallets', '', ''),
(65, 1, 'Watch', 'Start bring forth a range of watches that capture both directional and classic styles. Classic analogue watches from sought after names such as Boss by Hugo Boss and Michael Kors, sit alongside digital watches from G-Shock and directional designs from our own Start brand.', 'Watch', '', ''),
(65, 2, 'Watch', 'Start bring forth a range of watches that capture both directional and classic styles. Classic analogue watches from sought after names such as Boss by Hugo Boss and Michael Kors, sit alongside digital watches from G-Shock and directional designs from our own Start brand.', 'Watch', '', ''),
(66, 1, 'MEN’S PANTS', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'MEN’S PANTS', '', ''),
(66, 2, 'MEN’S PANTS', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'MEN’S PANTS', '', ''),
(67, 1, 'Jeans', 'Delivering a huge range of jeans, Start offers premium, dry selvedge and denim jeans, ideal for breaking in. A range of washes, finishes and natural fading effects add to the collection.', 'Jeans', '', ''),
(67, 2, 'Jeans', 'Delivering a huge range of jeans, Start offers premium, dry selvedge and denim jeans, ideal for breaking in. A range of washes, finishes and natural fading effects add to the collection.', 'Jeans', '', ''),
(68, 1, 'Short', 'Offering the most directional edit of the best styles of shorts, Start offers relaxed and rugged designs alongside well tailored casual shorts. Chino shorts from brands such as Polo Ralph Lauren, as well as our own Start brand, offer a preppy vibe, whilst Denim shorts can be seen in labels such as G-Star.', 'Short', '', ''),
(68, 2, 'Short', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;Offering the most directional edit of the best styles of shorts,&amp;nbsp;&lt;/span&gt;&lt;strong style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;Start&amp;nbsp;&lt;/strong&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;offers relaxed and rugged designs alongside well tailored casual shorts. Chino shorts from brands such as&amp;nbsp;&lt;/span&gt;&lt;strong style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;Polo Ralph Lauren&lt;/strong&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;, as well as our own&amp;nbsp;&lt;/span&gt;&lt;strong style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;Start&lt;/strong&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;&amp;nbsp;brand, offer a preppy vibe, whilst Denim shorts can be seen in labels such as&amp;nbsp;&lt;/span&gt;&lt;strong style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;G-Star&lt;/strong&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Short', '', ''),
(69, 1, 'Sweatpant', 'Offering the most directional edit of the best styles of shorts, Start offers relaxed and rugged designs alongside well tailored casual shorts. Chino shorts from brands such as Polo Ralph Lauren, as well as our own Start brand, offer a preppy vibe, whilst Denim shorts can be seen in labels such as G-Star.', 'Sweatpant', '', ''),
(69, 2, 'Sweatpant', 'Offering the most directional edit of the best styles of shorts, Start offers relaxed and rugged designs alongside well tailored casual shorts. Chino shorts from brands such as Polo Ralph Lauren, as well as our own Start brand, offer a preppy vibe, whilst Denim shorts can be seen in labels such as G-Star.', 'Sweatpant', '', ''),
(70, 1, 'MEN’S SHIRT', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'MEN’S SHIRT', '', ''),
(70, 2, 'MEN’S SHIRT', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'MEN’S SHIRT', '', ''),
(71, 1, 'Jackets &amp; Coats', 'Our outerwear options have never been more bountiful and these are the jacket and coats you\'re going to need when the mercury dips. Lifetime-lasting leather jackets, downpour-ready rain coats and parkas will bear the brunt of any uneasy weather, while wool coats and pea coats have you covered when things need to sharpen up.', 'Jackets &amp; Coats', '', ''),
(71, 2, 'Jackets &amp; Coats', 'Our outerwear options have never been more bountiful and these are the jacket and coats you\'re going to need when the mercury dips. Lifetime-lasting leather jackets, downpour-ready rain coats and parkas will bear the brunt of any uneasy weather, while wool coats and pea coats have you covered when things need to sharpen up.', 'Jackets &amp; Coats', '', ''),
(72, 1, 'Polo Shirt', 'The polo shirt has been a wardrobe staple since its introduction in the 1930s. Our range of polo shirts and long sleeved rugby shirts carries brands such as, Polo Ralph Lauren, Lacoste, Fred Perry and our own Start label.', 'Polo Shirt', '', ''),
(72, 2, 'Polo Shirt', 'The polo shirt has been a wardrobe staple since its introduction in the 1930s. Our range of polo shirts and long sleeved rugby shirts carries brands such as, Polo Ralph Lauren, Lacoste, Fred Perry and our own Start label.', 'Polo Shirt', '', ''),
(73, 1, 'T-shirt', 'The backbone of your wardrobe. Pick from the classic plain tee to prints of bands, cityscapes, films, pop culture, slogans and all-overs by big brands including American Apparel, Cheap Monday and Start.', 'T-shirt', '', ''),
(73, 2, 'T-shirt', 'The backbone of your wardrobe. Pick from the classic plain tee to prints of bands, cityscapes, films, pop culture, slogans and all-overs by big brands including American Apparel, Cheap Monday and Start.', 'T-shirt', '', ''),
(74, 1, 'MEN’S SHOES', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'MEN’S SHOES', '', ''),
(74, 2, 'MEN’S SHOES', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'MEN’S SHOES', '', ''),
(75, 1, 'Dr Martens', 'With a diverse edit of classic through to contemporary styles, Start offers a huge range of shoes, boots and trainers. Timeless brogues and loafers from H by Hudson and Start Brand align with Converse hi-tops, Fred Perry plimsolls and old-school Nike trainers, as hard-wearing desert boots and formal shoes edge across the smart casual divide.', 'Dr Martens', '', ''),
(75, 2, 'Dr Martens', 'With a diverse edit of classic through to contemporary styles, Start offers a huge range of shoes, boots and trainers. Timeless brogues and loafers from H by Hudson and Start Brand align with Converse hi-tops, Fred Perry plimsolls and old-school Nike trainers, as hard-wearing desert boots and formal shoes edge across the smart casual divide.', 'Dr Martens', '', ''),
(76, 1, 'Sneaker', 'With a diverse edit of classic through to contemporary styles, Start offers a huge range of shoes, boots and trainers. Timeless brogues and loafers from H by Hudson and Start Brand align with Converse hi-tops, Fred Perry plimsolls and old-school Nike trainers, as hard-wearing desert boots and formal shoes edge across the smart casual divide.', 'Sneaker', '', ''),
(76, 2, 'Sneaker', 'With a diverse edit of classic through to contemporary styles, Start offers a huge range of shoes, boots and trainers. Timeless brogues and loafers from H by Hudson and Start Brand align with Converse hi-tops, Fred Perry plimsolls and old-school Nike trainers, as hard-wearing desert boots and formal shoes edge across the smart casual divide.', 'Sneaker', '', ''),
(77, 1, 'Sport', 'With a diverse edit of classic through to contemporary styles, Start offers a huge range of shoes, boots and trainers. Timeless brogues and loafers from H by Hudson and Start Brand align with Converse hi-tops, Fred Perry plimsolls and old-school Nike trainers, as hard-wearing desert boots and formal shoes edge across the smart casual divide.', 'Sport', '', ''),
(77, 2, 'Sport', 'With a diverse edit of classic through to contemporary styles, Start offers a huge range of shoes, boots and trainers. Timeless brogues and loafers from H by Hudson and Start Brand align with Converse hi-tops, Fred Perry plimsolls and old-school Nike trainers, as hard-wearing desert boots and formal shoes edge across the smart casual divide.', 'Sport', '', ''),
(78, 1, 'WOMEN’S ACCESSORIES', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'WOMEN’S ACCESSORIES', '', ''),
(78, 2, 'WOMEN’S ACCESSORIES', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'WOMEN’S ACCESSORIES', '', ''),
(79, 1, 'Hats &amp; Caps', 'Headwear has seriously come into its own - caps and hats are at their peak shall we say? If we\'re talking timeless you can\'t better a Polo Ralph Lauren baseball cap or chill-beating beanie, while the suavest of hat-wearers show a penchant for flat caps and trilbies.', 'Hats &amp; Caps', '', ''),
(79, 2, 'Hats &amp; Caps', 'Headwear has seriously come into its own - caps and hats are at their peak shall we say? If we\'re talking timeless you can\'t better a Polo Ralph Lauren baseball cap or chill-beating beanie, while the suavest of hat-wearers show a penchant for flat caps and trilbies.', 'Hats &amp; Caps', '', ''),
(80, 1, 'Jewelry', 'Tip your cap (or fedora) to summer with our next-level accessories. Say it in sorbet shades, with fondant fanciful belts, scarves and hats. Festival vibes? Garlands and headscarves are our most-wanted.', 'Jewelry', '', ''),
(80, 2, 'Jewelry', 'Tip your cap (or fedora) to summer with our next-level accessories. Say it in sorbet shades, with fondant fanciful belts, scarves and hats. Festival vibes? Garlands and headscarves are our most-wanted.', 'Jewelry', '', ''),
(81, 1, 'Scarves &amp; Snoods', 'Tip your cap (or fedora) to summer with our next-level accessories. Say it in sorbet shades, with fondant fanciful belts, scarves and hats. Festival vibes? Garlands and headscarves are our most-wanted.', 'Scarves &amp; Snoods', '', ''),
(81, 2, 'Scarves &amp; Snoods', 'Tip your cap (or fedora) to summer with our next-level accessories. Say it in sorbet shades, with fondant fanciful belts, scarves and hats. Festival vibes? Garlands and headscarves are our most-wanted.', 'Scarves &amp; Snoods', '', ''),
(82, 1, 'Shock', 'Let your legs lead the way with the Start edit of socks and tights. Flash some colour with multipacks of Start socks, fake it in mock sock tights or strike out in patterned suspender tights. Plus-size girls get in on the action with the newest line of Start Curve tights, which sits alongside a cheeky range of novelty ankle socks and favourite labels including Wolford, Calvin Klein, Happy Socks and Falke. Step it up!', 'Shock', '', ''),
(82, 2, 'Shock', 'Let your legs lead the way with the Start edit of socks and tights. Flash some colour with multipacks of Start socks, fake it in mock sock tights or strike out in patterned suspender tights. Plus-size girls get in on the action with the newest line of Start Curve tights, which sits alongside a cheeky range of novelty ankle socks and favourite labels including Wolford, Calvin Klein, Happy Socks and Falke. Step it up!', 'Shock', '', ''),
(83, 1, 'WOMEN’S BOTTOM', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'WOMEN’S BOTTOM', '', ''),
(83, 2, 'WOMEN’S BOTTOM', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'WOMEN’S BOTTOM', '', ''),
(84, 1, 'Jeans', 'A hands-down wardrobe hero, jeans are getting the full on focus this season as we’re swimming in an ocean of blue. If you’re in boyfriend jeans you better hope he’s a skater – think Cheap Monday for shredded and super loose. Sticking with skinny? Then go for ankle grazing ultra-skinny jeans for the coolest fit.', 'Jeans', '', ''),
(84, 2, 'Jeans', 'A hands-down wardrobe hero, jeans are getting the full on focus this season as we’re swimming in an ocean of blue. If you’re in boyfriend jeans you better hope he’s a skater – think Cheap Monday for shredded and super loose. Sticking with skinny? Then go for ankle grazing ultra-skinny jeans for the coolest fit.', 'Jeans', '', ''),
(85, 1, 'Short', 'Shorts are our favourite way of showing some leg, from tailored shorts that make workwear dressing a breeze to your festival BFF - the denim cut-off. New season shapes to get to grips with? The latest comeback kids are culottes and High waisted shorts.', 'Short', '', ''),
(85, 2, 'Short', 'Shorts are our favourite way of showing some leg, from tailored shorts that make workwear dressing a breeze to your festival BFF - the denim cut-off. New season shapes to get to grips with? The latest comeback kids are culottes and High waisted shorts.', 'Short', '', ''),
(86, 1, 'Skirt', 'Let’s not skirt the issue – we love statement minis, midis and maxis. Say high-low to hem play, leather up in pastel pencils or ramp up the volume with full skirts and peplums. Pleats please? Oh go on then.', 'Skirt', '', ''),
(86, 2, 'Skirt', 'Let’s not skirt the issue – we love statement minis, midis and maxis. Say high-low to hem play, leather up in pastel pencils or ramp up the volume with full skirts and peplums. Pleats please? Oh go on then.', 'Skirt', '', ''),
(87, 1, 'WOMEN’S SHOES', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'WOMEN’S SHOES', '', ''),
(87, 2, 'WOMEN’S SHOES', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'WOMEN’S SHOES', '', ''),
(88, 1, 'Dr Martens', 'Be the best in shoes, whether that’s barely-there sandals or sky high-heels. Go boyish in plimsolls and retro kicks by Nike and New Balance or show some FUG love for Start faves Birkenstock and Swedish Hasbeens. Ankle boots hit refresh with heavy hardware, chunky heels and cleated soles.', 'Dr Martens', '', ''),
(88, 2, 'Dr Martens', 'Be the best in shoes, whether that’s barely-there sandals or sky high-heels. Go boyish in plimsolls and retro kicks by Nike and New Balance or show some FUG love for Start faves Birkenstock and Swedish Hasbeens. Ankle boots hit refresh with heavy hardware, chunky heels and cleated soles.', 'Dr Martens', '', ''),
(89, 1, 'Sneaker', 'Be the best in shoes, whether that’s barely-there sandals or sky high-heels. Go boyish in plimsolls and retro kicks by Nike and New Balance or show some FUG love for Start faves Birkenstock and Swedish Hasbeens. Ankle boots hit refresh with heavy hardware, chunky heels and cleated soles.', 'Sneaker', '', ''),
(89, 2, 'Sneaker', 'Be the best in shoes, whether that’s barely-there sandals or sky high-heels. Go boyish in plimsolls and retro kicks by Nike and New Balance or show some FUG love for Start faves Birkenstock and Swedish Hasbeens. Ankle boots hit refresh with heavy hardware, chunky heels and cleated soles.', 'Sneaker', '', ''),
(90, 1, 'Sport', 'Be the best in shoes, whether that’s barely-there sandals or sky high-heels. Go boyish in plimsolls and retro kicks by Nike and New Balance or show some FUG love for Start faves Birkenstock and Swedish Hasbeens. Ankle boots hit refresh with heavy hardware, chunky heels and cleated soles.', 'Sport', '', ''),
(90, 2, 'Sport', 'Be the best in shoes, whether that’s barely-there sandals or sky high-heels. Go boyish in plimsolls and retro kicks by Nike and New Balance or show some FUG love for Start faves Birkenstock and Swedish Hasbeens. Ankle boots hit refresh with heavy hardware, chunky heels and cleated soles.', 'Sport', '', ''),
(91, 1, 'WOMEN’S TOP', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'WOMEN’S TOP', '', ''),
(91, 2, 'WOMEN’S TOP', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.', 'WOMEN’S TOP', '', ''),
(92, 1, 'Crop Top', 'Let’s get top-heavy. Freshen up your jersey basics in summer lovin’ shades or keep things super cute in lace camis, bandeau bra tops and printed girly t-shirts. Cooling down? Don’t sweat it with some of our lightweight layers.', 'Crop Top', '', ''),
(92, 2, 'Crop Top', 'Let’s get top-heavy. Freshen up your jersey basics in summer lovin’ shades or keep things super cute in lace camis, bandeau bra tops and printed girly t-shirts. Cooling down? Don’t sweat it with some of our lightweight layers.', 'Crop Top', '', ''),
(93, 1, 'Shirt', 'Let’s get top-heavy. Freshen up your jersey basics in summer lovin’ shades or keep things super cute in lace camis, bandeau bra tops and printed girly t-shirts. Cooling down? Don’t sweat it with some of our lightweight layers.', 'Shirt', '', ''),
(93, 2, 'Shirt', 'Let’s get top-heavy. Freshen up your jersey basics in summer lovin’ shades or keep things super cute in lace camis, bandeau bra tops and printed girly t-shirts. Cooling down? Don’t sweat it with some of our lightweight layers.', 'Shirt', '', ''),
(94, 1, 'T-shirt', 'Let’s get top-heavy. Freshen up your jersey basics in summer lovin’ shades or keep things super cute in lace camis, bandeau bra tops and printed girly t-shirts. Cooling down? Don’t sweat it with some of our lightweight layers.', 'T-shirt', '', ''),
(94, 2, 'T-shirt', 'Let’s get top-heavy. Freshen up your jersey basics in summer lovin’ shades or keep things super cute in lace camis, bandeau bra tops and printed girly t-shirts. Cooling down? Don’t sweat it with some of our lightweight layers.', 'T-shirt', '', '');

--
-- TABLE STRUCTURE FOR: oc_category_filter
--

DROP TABLE IF EXISTS oc_category_filter;

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_category_path
--

DROP TABLE IF EXISTS oc_category_path;

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_category_path (`category_id`, `path_id`, `level`) VALUES
(94, 94, 1),
(94, 91, 0),
(93, 93, 1),
(93, 91, 0),
(92, 92, 1),
(92, 91, 0),
(91, 91, 0),
(90, 90, 1),
(90, 87, 0),
(89, 89, 1),
(89, 87, 0),
(88, 88, 1),
(88, 87, 0),
(87, 87, 0),
(86, 86, 1),
(86, 83, 0),
(85, 85, 1),
(85, 83, 0),
(84, 84, 1),
(60, 60, 1),
(84, 83, 0),
(83, 83, 0),
(82, 82, 1),
(82, 78, 0),
(81, 81, 1),
(60, 59, 0),
(81, 78, 0),
(80, 80, 1),
(80, 78, 0),
(79, 79, 1),
(79, 78, 0),
(78, 78, 0),
(77, 77, 1),
(77, 74, 0),
(76, 76, 1),
(76, 74, 0),
(75, 75, 1),
(75, 74, 0),
(74, 74, 0),
(73, 73, 1),
(73, 70, 0),
(72, 72, 1),
(72, 70, 0),
(71, 71, 1),
(71, 70, 0),
(70, 70, 0),
(69, 69, 1),
(69, 66, 0),
(68, 68, 1),
(68, 66, 0),
(67, 67, 1),
(67, 66, 0),
(66, 66, 0),
(65, 65, 1),
(65, 59, 0),
(64, 59, 0),
(64, 64, 1),
(63, 63, 2),
(63, 60, 1),
(63, 59, 0),
(62, 62, 2),
(62, 60, 1),
(62, 59, 0),
(61, 61, 2),
(61, 60, 1),
(61, 59, 0),
(59, 59, 0);

--
-- TABLE STRUCTURE FOR: oc_category_to_layout
--

DROP TABLE IF EXISTS oc_category_to_layout;

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_category_to_layout (`category_id`, `store_id`, `layout_id`) VALUES
(59, 0, 0),
(60, 0, 0),
(61, 0, 0),
(62, 0, 0),
(63, 0, 0),
(64, 0, 0),
(65, 0, 0),
(66, 0, 0),
(67, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(73, 0, 0),
(74, 0, 0),
(75, 0, 0),
(76, 0, 0),
(77, 0, 0),
(78, 0, 0),
(79, 0, 0),
(80, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0),
(84, 0, 0),
(85, 0, 0),
(86, 0, 0),
(87, 0, 0),
(88, 0, 0),
(89, 0, 0),
(90, 0, 0),
(91, 0, 0),
(92, 0, 0),
(93, 0, 0),
(94, 0, 0);

--
-- TABLE STRUCTURE FOR: oc_category_to_store
--

DROP TABLE IF EXISTS oc_category_to_store;

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_category_to_store (`category_id`, `store_id`) VALUES
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0);

--
-- TABLE STRUCTURE FOR: oc_country
--

DROP TABLE IF EXISTS oc_country;

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

INSERT INTO oc_country (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

--
-- TABLE STRUCTURE FOR: oc_coupon
--

DROP TABLE IF EXISTS oc_coupon;

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO oc_coupon (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

--
-- TABLE STRUCTURE FOR: oc_coupon_category
--

DROP TABLE IF EXISTS oc_coupon_category;

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_coupon_history
--

DROP TABLE IF EXISTS oc_coupon_history;

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_coupon_product
--

DROP TABLE IF EXISTS oc_coupon_product;

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_currency
--

DROP TABLE IF EXISTS oc_currency;

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO oc_currency (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', '0.63330001', 1, '2014-11-27 04:29:32'),
(2, 'US Dollar', 'USD', '$', '', '2', '1.00000000', 1, '2014-11-27 04:29:32'),
(3, 'Euro', 'EUR', '', '€', '2', '0.79949999', 1, '2014-11-27 04:29:32');

--
-- TABLE STRUCTURE FOR: oc_custom_field
--

DROP TABLE IF EXISTS oc_custom_field;

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_custom_field_customer_group
--

DROP TABLE IF EXISTS oc_custom_field_customer_group;

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_custom_field_description
--

DROP TABLE IF EXISTS oc_custom_field_description;

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_custom_field_value
--

DROP TABLE IF EXISTS oc_custom_field_value;

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_custom_field_value_description
--

DROP TABLE IF EXISTS oc_custom_field_value_description;

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_customer
--

DROP TABLE IF EXISTS oc_customer;

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_customer_activity
--

DROP TABLE IF EXISTS oc_customer_activity;

CREATE TABLE `oc_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_customer_ban_ip
--

DROP TABLE IF EXISTS oc_customer_ban_ip;

CREATE TABLE `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_customer_group
--

DROP TABLE IF EXISTS oc_customer_group;

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO oc_customer_group (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

--
-- TABLE STRUCTURE FOR: oc_customer_group_description
--

DROP TABLE IF EXISTS oc_customer_group_description;

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_customer_group_description (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 2, 'Default', 'test');

--
-- TABLE STRUCTURE FOR: oc_customer_history
--

DROP TABLE IF EXISTS oc_customer_history;

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_customer_ip
--

DROP TABLE IF EXISTS oc_customer_ip;

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_customer_online
--

DROP TABLE IF EXISTS oc_customer_online;

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_customer_reward
--

DROP TABLE IF EXISTS oc_customer_reward;

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_customer_transaction
--

DROP TABLE IF EXISTS oc_customer_transaction;

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_download
--

DROP TABLE IF EXISTS oc_download;

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_download_description
--

DROP TABLE IF EXISTS oc_download_description;

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_event
--

DROP TABLE IF EXISTS oc_event;

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_extension
--

DROP TABLE IF EXISTS oc_extension;

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=437 DEFAULT CHARSET=utf8;

INSERT INTO oc_extension (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured'),
(419, 'module', 'slideshow'),
(428, 'module', 'kuler_cp'),
(429, 'module', 'kuler_menu'),
(430, 'module', 'kuler_layer_slider'),
(431, 'module', 'kuler_showcase'),
(432, 'module', 'kuler_advanced_html'),
(433, 'module', 'kuler_contact_form'),
(434, 'module', 'kbm'),
(435, 'module', 'kbm_mod_recent_article'),
(436, 'module', 'kuler_demo_builder');

--
-- TABLE STRUCTURE FOR: oc_filter
--

DROP TABLE IF EXISTS oc_filter;

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_filter_description
--

DROP TABLE IF EXISTS oc_filter_description;

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_filter_group
--

DROP TABLE IF EXISTS oc_filter_group;

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_filter_group_description
--

DROP TABLE IF EXISTS oc_filter_group_description;

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_geo_zone
--

DROP TABLE IF EXISTS oc_geo_zone;

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO oc_geo_zone (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

--
-- TABLE STRUCTURE FOR: oc_information
--

DROP TABLE IF EXISTS oc_information;

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO oc_information (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

--
-- TABLE STRUCTURE FOR: oc_information_description
--

DROP TABLE IF EXISTS oc_information_description;

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_information_description (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', '', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', '', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', '', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', '', '', ''),
(4, 2, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', '', '', ''),
(5, 2, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', '', '', ''),
(3, 2, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', '', '', ''),
(6, 2, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', '', '', '');

--
-- TABLE STRUCTURE FOR: oc_information_to_layout
--

DROP TABLE IF EXISTS oc_information_to_layout;

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_information_to_store
--

DROP TABLE IF EXISTS oc_information_to_store;

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_information_to_store (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

--
-- TABLE STRUCTURE FOR: oc_kbm_article
--

DROP TABLE IF EXISTS oc_kbm_article;

CREATE TABLE `oc_kbm_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `viewed` int(5) NOT NULL DEFAULT '0',
  `featured_image` varchar(255) DEFAULT NULL,
  `date_added` int(10) unsigned NOT NULL,
  `date_modified` int(10) unsigned NOT NULL,
  `date_published` int(10) unsigned NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO oc_kbm_article (`article_id`, `author_id`, `viewed`, `featured_image`, `date_added`, `date_modified`, `date_published`, `sort_order`, `status`) VALUES
(1, 1, 1, 'catalog/demo/start/blog/270x200.jpg', 1416998040, 1417080840, 1416994483, 1, 1),
(2, 1, 0, 'catalog/demo/start/blog/270x200.jpg', 1416998160, 1417080840, 1416994463, 2, 1),
(3, 1, 0, 'catalog/demo/start/blog/270x200.jpg', 1416998220, 1417080780, 1416994446, 3, 1),
(4, 1, 0, 'catalog/demo/start/blog/270x200.jpg', 1416998280, 1417080780, 1416994429, 4, 1),
(5, 1, 3, 'catalog/demo/start/blog/270x200.jpg', 1416998340, 1417080780, 1416994404, 5, 1),
(6, 1, 1, 'catalog/demo/start/blog/270x200.jpg', 1416998400, 1417080720, 1416994363, 6, 1),
(7, 1, 25, 'catalog/demo/start/blog/270x200.jpg', 1416998460, 1417080720, 1416994348, 7, 1);

--
-- TABLE STRUCTURE FOR: oc_kbm_article_description
--

DROP TABLE IF EXISTS oc_kbm_article_description;

CREATE TABLE `oc_kbm_article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_kbm_article_description (`article_id`, `language_id`, `name`, `description`, `meta_keyword`, `meta_description`, `tags`) VALUES
(1, 1, 'Vestibulum auctor tortor', 'Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.\r\n\r\nProin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.\r\nAliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.\r\n\r\nEtiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.\r\n\r\nAenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum.\r\n\r\nNam pellentesque ipsum ac tincidunt elementum. Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus.\r\n\r\nDonec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu.\r\n\r\nNullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo.', '', '', ''),
(1, 2, 'Vestibulum auctor tortor', 'Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.\r\n\r\nProin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.\r\nAliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.\r\n\r\nEtiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.\r\n\r\nAenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum.\r\n\r\nNam pellentesque ipsum ac tincidunt elementum. Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus.\r\n\r\nDonec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu.\r\n\r\nNullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo.', '', '', ''),
(2, 1, 'Tincidunt elementum', 'Shoes of Prey is a global online retail brand that allows women (including Carly Rae Jepsen!) to design their own shoes which we hand-make and deliver to them. We’re changing the way women shop for shoes and we’re on track to become a significant international retailer within the next 5 years. As our business continues to grow we\'re looking for a passionate Marketing and Product Management Intern to assist Todd, our Senior Product Manager improving our website conversion rate whilst also managing and propelling forward the Shoes of Prey presence in the French market.\r\nShoes of Prey has created one of the best shoe design experiences on the internet. With such a bright group of engineers, creatives and marketing specialists behind this website, there is much you can learn from an internship with us!\r\nShoes of Prey internships are full-time and based in Sydney, Australia. Internships typically last between 4 and 6 months. The internship is unpaid however, we do provide lunch daily and partial reimbursement for housing and/or travel expenses, depending on your relevant experience:\r\nYour Key Responsibilities:\r\nManage French market presence, including website content updates, email marketing, social media management, blogger outreach, and public relations efforts. Seeking out prospects for effective business partners within the French market.\r\n\r\nAssisting the product management team in the coordination of website development and technology initiatives. Including managing design life cycle by conduct brainstorms, prototyping, design reviews, user testing, etc. Writing functional specifications and mock website enhancements. Also, administering our JIRA project management platform.\r\n\r\nReview marketing and website analytics, manage internal company dashboard reporting.\r\n\r\nAttend weekly production meetings with Engineering, Creative, and Marketing teams.\r\n\r\nApplicants for this position should be fluent in both English and French. Working knowledge of Spanish or German are also appreciated. Candidates should have achieved or be pursuing a degree in business and/or engineering.\r\n\r\nStrong organisational and analytical skills with a persistent attention to detail.\r\n\r\nA great attitude and team player mentality.\r\n\r\nTime-management skills: multi-tasking, prioritising, organising and planning\r\n\r\nTechnical aptitude:- you don\'t need to know how to code (although that would be an asset) but you must be able to convey complex, technical product requirements to engineers, and then translate these complicated details to non-technical colleagues\r\n\r\nCreativity and an enthusiasm for technology or e-commerce in the fashion sector\r\n\r\nAn interest in marketing and social media\r\nTo apply for this role please email a cover letter and resume to joinourteam@shoesofprey.com with the subject line &quot;YOUR NAME - MARKETING AND PRODUCT MANAGEMENT INTERN&quot;. This is essential to ensure applications are reviewed by the correct department.', '', '', ''),
(2, 2, 'Tincidunt elementum', 'Shoes of Prey is a global online retail brand that allows women (including Carly Rae Jepsen!) to design their own shoes which we hand-make and deliver to them. We’re changing the way women shop for shoes and we’re on track to become a significant international retailer within the next 5 years. As our business continues to grow we\'re looking for a passionate Marketing and Product Management Intern to assist Todd, our Senior Product Manager improving our website conversion rate whilst also managing and propelling forward the Shoes of Prey presence in the French market.\r\nShoes of Prey has created one of the best shoe design experiences on the internet. With such a bright group of engineers, creatives and marketing specialists behind this website, there is much you can learn from an internship with us!\r\nShoes of Prey internships are full-time and based in Sydney, Australia. Internships typically last between 4 and 6 months. The internship is unpaid however, we do provide lunch daily and partial reimbursement for housing and/or travel expenses, depending on your relevant experience:\r\nYour Key Responsibilities:\r\nManage French market presence, including website content updates, email marketing, social media management, blogger outreach, and public relations efforts. Seeking out prospects for effective business partners within the French market.\r\n\r\nAssisting the product management team in the coordination of website development and technology initiatives. Including managing design life cycle by conduct brainstorms, prototyping, design reviews, user testing, etc. Writing functional specifications and mock website enhancements. Also, administering our JIRA project management platform.\r\n\r\nReview marketing and website analytics, manage internal company dashboard reporting.\r\n\r\nAttend weekly production meetings with Engineering, Creative, and Marketing teams.\r\n\r\nApplicants for this position should be fluent in both English and French. Working knowledge of Spanish or German are also appreciated. Candidates should have achieved or be pursuing a degree in business and/or engineering.\r\n\r\nStrong organisational and analytical skills with a persistent attention to detail.\r\n\r\nA great attitude and team player mentality.\r\n\r\nTime-management skills: multi-tasking, prioritising, organising and planning\r\n\r\nTechnical aptitude:- you don\'t need to know how to code (although that would be an asset) but you must be able to convey complex, technical product requirements to engineers, and then translate these complicated details to non-technical colleagues\r\n\r\nCreativity and an enthusiasm for technology or e-commerce in the fashion sector\r\n\r\nAn interest in marketing and social media\r\nTo apply for this role please email a cover letter and resume to joinourteam@shoesofprey.com with the subject line &quot;YOUR NAME - MARKETING AND PRODUCT MANAGEMENT INTERN&quot;. This is essential to ensure applications are reviewed by the correct department.', '', '', ''),
(3, 1, 'Aenean aliquet mi ligula', 'Shoes of Prey is a global online retail brand that allows women (including Carly Rae Jepsen!) to design their own shoes which we hand-make and deliver to them. We’re changing the way women shop for shoes and we’re on track to become a significant international retailer within the next 5 years. As our business continues to grow we\'re looking for a passionate Marketing and Product Management Intern to assist Todd, our Senior Product Manager improving our website conversion rate whilst also managing and propelling forward the Shoes of Prey presence in the French market.\r\nShoes of Prey has created one of the best shoe design experiences on the internet. With such a bright group of engineers, creatives and marketing specialists behind this website, there is much you can learn from an internship with us!\r\nShoes of Prey internships are full-time and based in Sydney, Australia. Internships typically last between 4 and 6 months. The internship is unpaid however, we do provide lunch daily and partial reimbursement for housing and/or travel expenses, depending on your relevant experience:\r\nYour Key Responsibilities:\r\nManage French market presence, including website content updates, email marketing, social media management, blogger outreach, and public relations efforts. Seeking out prospects for effective business partners within the French market.\r\n\r\nAssisting the product management team in the coordination of website development and technology initiatives. Including managing design life cycle by conduct brainstorms, prototyping, design reviews, user testing, etc. Writing functional specifications and mock website enhancements. Also, administering our JIRA project management platform.\r\n\r\nReview marketing and website analytics, manage internal company dashboard reporting.\r\n\r\nAttend weekly production meetings with Engineering, Creative, and Marketing teams.\r\n\r\nApplicants for this position should be fluent in both English and French. Working knowledge of Spanish or German are also appreciated. Candidates should have achieved or be pursuing a degree in business and/or engineering.\r\n\r\nStrong organisational and analytical skills with a persistent attention to detail.\r\n\r\nA great attitude and team player mentality.\r\n\r\nTime-management skills: multi-tasking, prioritising, organising and planning\r\n\r\nTechnical aptitude:- you don\'t need to know how to code (although that would be an asset) but you must be able to convey complex, technical product requirements to engineers, and then translate these complicated details to non-technical colleagues\r\n\r\nCreativity and an enthusiasm for technology or e-commerce in the fashion sector\r\n\r\nAn interest in marketing and social media\r\nTo apply for this role please email a cover letter and resume to joinourteam@shoesofprey.com with the subject line &quot;YOUR NAME - MARKETING AND PRODUCT MANAGEMENT INTERN&quot;. This is essential to ensure applications are reviewed by the correct department.', '', '', ''),
(3, 2, 'Aenean aliquet mi ligula', 'Shoes of Prey is a global online retail brand that allows women (including Carly Rae Jepsen!) to design their own shoes which we hand-make and deliver to them. We’re changing the way women shop for shoes and we’re on track to become a significant international retailer within the next 5 years. As our business continues to grow we\'re looking for a passionate Marketing and Product Management Intern to assist Todd, our Senior Product Manager improving our website conversion rate whilst also managing and propelling forward the Shoes of Prey presence in the French market.\r\nShoes of Prey has created one of the best shoe design experiences on the internet. With such a bright group of engineers, creatives and marketing specialists behind this website, there is much you can learn from an internship with us!\r\nShoes of Prey internships are full-time and based in Sydney, Australia. Internships typically last between 4 and 6 months. The internship is unpaid however, we do provide lunch daily and partial reimbursement for housing and/or travel expenses, depending on your relevant experience:\r\nYour Key Responsibilities:\r\nManage French market presence, including website content updates, email marketing, social media management, blogger outreach, and public relations efforts. Seeking out prospects for effective business partners within the French market.\r\n\r\nAssisting the product management team in the coordination of website development and technology initiatives. Including managing design life cycle by conduct brainstorms, prototyping, design reviews, user testing, etc. Writing functional specifications and mock website enhancements. Also, administering our JIRA project management platform.\r\n\r\nReview marketing and website analytics, manage internal company dashboard reporting.\r\n\r\nAttend weekly production meetings with Engineering, Creative, and Marketing teams.\r\n\r\nApplicants for this position should be fluent in both English and French. Working knowledge of Spanish or German are also appreciated. Candidates should have achieved or be pursuing a degree in business and/or engineering.\r\n\r\nStrong organisational and analytical skills with a persistent attention to detail.\r\n\r\nA great attitude and team player mentality.\r\n\r\nTime-management skills: multi-tasking, prioritising, organising and planning\r\n\r\nTechnical aptitude:- you don\'t need to know how to code (although that would be an asset) but you must be able to convey complex, technical product requirements to engineers, and then translate these complicated details to non-technical colleagues\r\n\r\nCreativity and an enthusiasm for technology or e-commerce in the fashion sector\r\n\r\nAn interest in marketing and social media\r\nTo apply for this role please email a cover letter and resume to joinourteam@shoesofprey.com with the subject line &quot;YOUR NAME - MARKETING AND PRODUCT MANAGEMENT INTERN&quot;. This is essential to ensure applications are reviewed by the correct department.', '', '', ''),
(4, 2, 'Vitae justo cursus pulvinar', 'Aenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum. Nam pellentesque ipsum ac tincidunt elementum. Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus. Donec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu. Nullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo. Sed pellentesque commodo magna, eget tincidunt magna condimentum lobortis. Integer facilisis ipsum sem, sit amet aliquet sem iaculis in. Vivamus at accumsan ante. Donec vitae diam eu magna tincidunt rutrum. Nullam interdum lacinia lobortis. Duis eget lobortis augue, id sollicitudin justo. Aenean sollicitudin elit ut egestas viverra. Mauris tempus mollis velit, cursus pulvinar lectus auctor eget. Quisque eget arcu iaculis, tempus tellus id, semper augue. Vivamus facilisis imperdiet consectetur. Proin ac magna ante. Phasellus nec sagittis tellus. Mauris cursus, mi eget mollis dignissim, lectus nibh placerat lorem, at lobortis tellus nulla vitae arcu. Ut sit amet orci ac sapien porta porta. Mauris facilisis sollicitudin pharetra. Phasellus rutrum nisi quam, quis congue nisi vehicula ac.', '', '', ''),
(4, 1, 'Vitae justo cursus pulvinar', 'Aenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum. Nam pellentesque ipsum ac tincidunt elementum. Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus. Donec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu. Nullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo. Sed pellentesque commodo magna, eget tincidunt magna condimentum lobortis. Integer facilisis ipsum sem, sit amet aliquet sem iaculis in. Vivamus at accumsan ante. Donec vitae diam eu magna tincidunt rutrum. Nullam interdum lacinia lobortis. Duis eget lobortis augue, id sollicitudin justo. Aenean sollicitudin elit ut egestas viverra. Mauris tempus mollis velit, cursus pulvinar lectus auctor eget. Quisque eget arcu iaculis, tempus tellus id, semper augue. Vivamus facilisis imperdiet consectetur. Proin ac magna ante. Phasellus nec sagittis tellus. Mauris cursus, mi eget mollis dignissim, lectus nibh placerat lorem, at lobortis tellus nulla vitae arcu. Ut sit amet orci ac sapien porta porta. Mauris facilisis sollicitudin pharetra. Phasellus rutrum nisi quam, quis congue nisi vehicula ac.', '', '', ''),
(5, 1, 'Curabitur pretium tincidunt', 'In hac habitasse platea dictumst. Nulla dapibus ultricies pede. Quisque augue risus, porttitor nec, suscipit ut, pellentesque quis, lacus. Duis adipiscing purus eu metus pharetra porttitor. Aenean sapien nisi, sodales non, facilisis nec, ultricies et, erat. Cras aliquam. Maecenas mi. Sed lacus arcu, malesuada id, ultricies et, ornare non, dolor. Maecenas turpis lacus, vehicula nec, blandit in, laoreet a, nibh. Donec aliquet. In et leo tincidunt tortor rhoncus convallis. Nulla facilisi. Praesent bibendum semper eros. Morbi risus. Nam tellus leo, ullamcorper egestas, venenatis quis, viverra ac, mauris. In hac habitasse platea dictumst. Curabitur at velit vel sem auctor hendrerit. Integer mauris orci, vehicula eu, feugiat ac, hendrerit ut, dolor. Fusce elit nulla, gravida quis, vulputate eu, rutrum vel, lectus. Integer cursus luctus nisl. Quisque quam. Aliquam lectus urna, porta in, viverra eu, pellentesque a, massa. Etiam eros sapien, porta et, aliquam et, bibendum sit amet, erat. Sed condimentum interdum lacus. In ut ante non felis tincidunt porta. Aenean aliquet ornare sem. Nunc dignissim, erat sit amet vulputate cursus, elit magna facilisis massa, quis hendrerit nunc odio id dui. Proin interdum dictum arcu. Pellentesque erat ante, ultricies ac, porttitor ac, dictum et, purus. Donec enim odio, gravida ut, imperdiet quis, rutrum ut, lacus.\r\n\r\nEtiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.\r\n\r\n\r\nSuspendisse aliquet sem ut nulla. Cras mollis ornare nisl. Morbi ac mi. Nunc eget nisi. Donec at enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed diam. Ut sagittis ultrices urna. Suspendisse eget erat non purus varius sodales. Aliquam imperdiet lobortis libero. Suspendisse scelerisque sagittis odio. Phasellus imperdiet interdum dolor. Mauris ante ante, gravida at, consectetuer quis, ullamcorper ornare, magna. Duis sed mauris sed libero tincidunt rutrum. In vulputate pretium dolor.Nullam ac erat. Donec a ipsum. Nullam tristique leo id lacus. Sed sed pede non arcu ornare interdum. Maecenas justo elit, rutrum in, adipiscing id, laoreet in, libero. Fusce quam. Donec a urna a enim gravida dictum. Nunc elementum, mauris sit amet imperdiet iaculis, dolor metus consectetuer mi, et tempor elit enim at massa. Duis ac nisl. Nullam pulvinar. Curabitur quam sapien, lobortis eu, luctus vitae, volutpat ac, metus. Nam elementum. Fusce fringilla. Praesent pulvinar turpis vitae justo cursus pulvinar. In hac habitasse platea dictumst. Nunc fermentum tellus interdum libero. Phasellus eros. Vestibulum euismod nunc at eros. Pellentesque nec ligula non tellus accumsan molestie. Pellentesque felis massa, tincidunt at, pulvinar id, placerat nec, velit.', '', '', ''),
(5, 2, 'Curabitur pretium tincidunt', 'In hac habitasse platea dictumst. Nulla dapibus ultricies pede. Quisque augue risus, porttitor nec, suscipit ut, pellentesque quis, lacus. Duis adipiscing purus eu metus pharetra porttitor. Aenean sapien nisi, sodales non, facilisis nec, ultricies et, erat. Cras aliquam. Maecenas mi. Sed lacus arcu, malesuada id, ultricies et, ornare non, dolor. Maecenas turpis lacus, vehicula nec, blandit in, laoreet a, nibh. Donec aliquet. In et leo tincidunt tortor rhoncus convallis. Nulla facilisi. Praesent bibendum semper eros. Morbi risus. Nam tellus leo, ullamcorper egestas, venenatis quis, viverra ac, mauris. In hac habitasse platea dictumst. Curabitur at velit vel sem auctor hendrerit. Integer mauris orci, vehicula eu, feugiat ac, hendrerit ut, dolor. Fusce elit nulla, gravida quis, vulputate eu, rutrum vel, lectus. Integer cursus luctus nisl. Quisque quam. Aliquam lectus urna, porta in, viverra eu, pellentesque a, massa. Etiam eros sapien, porta et, aliquam et, bibendum sit amet, erat. Sed condimentum interdum lacus. In ut ante non felis tincidunt porta. Aenean aliquet ornare sem. Nunc dignissim, erat sit amet vulputate cursus, elit magna facilisis massa, quis hendrerit nunc odio id dui. Proin interdum dictum arcu. Pellentesque erat ante, ultricies ac, porttitor ac, dictum et, purus. Donec enim odio, gravida ut, imperdiet quis, rutrum ut, lacus.\r\n\r\nEtiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.\r\n\r\n\r\nSuspendisse aliquet sem ut nulla. Cras mollis ornare nisl. Morbi ac mi. Nunc eget nisi. Donec at enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed diam. Ut sagittis ultrices urna. Suspendisse eget erat non purus varius sodales. Aliquam imperdiet lobortis libero. Suspendisse scelerisque sagittis odio. Phasellus imperdiet interdum dolor. Mauris ante ante, gravida at, consectetuer quis, ullamcorper ornare, magna. Duis sed mauris sed libero tincidunt rutrum. In vulputate pretium dolor.Nullam ac erat. Donec a ipsum. Nullam tristique leo id lacus. Sed sed pede non arcu ornare interdum. Maecenas justo elit, rutrum in, adipiscing id, laoreet in, libero. Fusce quam. Donec a urna a enim gravida dictum. Nunc elementum, mauris sit amet imperdiet iaculis, dolor metus consectetuer mi, et tempor elit enim at massa. Duis ac nisl. Nullam pulvinar. Curabitur quam sapien, lobortis eu, luctus vitae, volutpat ac, metus. Nam elementum. Fusce fringilla. Praesent pulvinar turpis vitae justo cursus pulvinar. In hac habitasse platea dictumst. Nunc fermentum tellus interdum libero. Phasellus eros. Vestibulum euismod nunc at eros. Pellentesque nec ligula non tellus accumsan molestie. Pellentesque felis massa, tincidunt at, pulvinar id, placerat nec, velit.', '', '', ''),
(6, 1, 'Sed posuere vestibulum nisl', 'Morbi ac mi. Nunc eget nisi. Donec at enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed diam. Ut sagittis ultrices urna. Suspendisse eget erat non purus varius sodales. Aliquam imperdiet lobortis libero. Suspendisse scelerisque sagittis odio. Phasellus imperdiet interdum dolor. Mauris ante ante, gravida at, consectetuer quis, ullamcorper ornare, magna. Duis sed mauris sed libero tincidunt rutrum. In vulputate pretium dolor.Nullam ac erat. Donec a ipsum. Nullam tristique leo id lacus. Sed sed pede non arcu ornare interdum. Maecenas justo elit, rutrum in, adipiscing id, laoreet in, libero. Fusce quam. Donec a urna a enim gravida dictum. Nunc elementum, mauris sit amet imperdiet iaculis, dolor metus consectetuer mi, et tempor elit enim at massa. Duis ac nisl. Nullam pulvinar. Curabitur quam sapien, lobortis eu, luctus vitae, volutpat ac, metus. Nam elementum. Fusce fringilla. Praesent pulvinar turpis vitae justo cursus pulvinar. In hac habitasse platea dictumst. Nunc fermentum tellus interdum libero. Phasellus eros. Vestibulum euismod nunc at eros. Pellentesque nec ligula non tellus accumsan molestie. Pellentesque felis massa, tincidunt at, pulvinar id, placerat nec, velit.\r\n\r\nCras rhoncus ipsum ac dolor. In hac habitasse platea dictumst. Nulla dapibus ultricies pede. Quisque augue risus, porttitor nec, suscipit ut, pellentesque quis, lacus. Duis adipiscing purus eu metus pharetra porttitor. Aenean sapien nisi, sodales non, facilisis nec, ultricies et, erat. Cras aliquam. Maecenas mi. Sed lacus arcu, malesuada id, ultricies et, ornare non, dolor. Maecenas turpis lacus, vehicula nec, blandit in, laoreet a, nibh. Donec aliquet. In et leo tincidunt tortor rhoncus convallis. Nulla facilisi. Praesent bibendum semper eros. Morbi risus. Nam tellus leo, ullamcorper egestas, venenatis quis, viverra ac, mauris. In hac habitasse platea dictumst. Curabitur at velit vel sem auctor hendrerit. Integer mauris orci, vehicula eu, feugiat ac, hendrerit ut, dolor. Fusce elit nulla, gravida quis, vulputate eu, rutrum vel, lectus. Integer cursus luctus nisl. Quisque quam. Aliquam lectus urna, porta in, viverra eu, pellentesque a, massa. Etiam eros sapien, porta et, aliquam et, bibendum sit amet, erat. Sed condimentum interdum lacus. In ut ante non felis tincidunt porta. Aenean aliquet ornare sem. Nunc dignissim, erat sit amet vulputate cursus, elit magna facilisis massa, quis hendrerit nunc odio id dui. Proin interdum dictum arcu. Pellentesque erat ante, ultricies ac, porttitor ac, dictum et, purus. Donec enim odio, gravida ut, imperdiet quis, rutrum ut, lacus.\r\n\r\nEtiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.', '', '', ''),
(6, 2, 'Sed posuere vestibulum nisl', 'Morbi ac mi. Nunc eget nisi. Donec at enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed diam. Ut sagittis ultrices urna. Suspendisse eget erat non purus varius sodales. Aliquam imperdiet lobortis libero. Suspendisse scelerisque sagittis odio. Phasellus imperdiet interdum dolor. Mauris ante ante, gravida at, consectetuer quis, ullamcorper ornare, magna. Duis sed mauris sed libero tincidunt rutrum. In vulputate pretium dolor.Nullam ac erat. Donec a ipsum. Nullam tristique leo id lacus. Sed sed pede non arcu ornare interdum. Maecenas justo elit, rutrum in, adipiscing id, laoreet in, libero. Fusce quam. Donec a urna a enim gravida dictum. Nunc elementum, mauris sit amet imperdiet iaculis, dolor metus consectetuer mi, et tempor elit enim at massa. Duis ac nisl. Nullam pulvinar. Curabitur quam sapien, lobortis eu, luctus vitae, volutpat ac, metus. Nam elementum. Fusce fringilla. Praesent pulvinar turpis vitae justo cursus pulvinar. In hac habitasse platea dictumst. Nunc fermentum tellus interdum libero. Phasellus eros. Vestibulum euismod nunc at eros. Pellentesque nec ligula non tellus accumsan molestie. Pellentesque felis massa, tincidunt at, pulvinar id, placerat nec, velit.\r\n\r\nCras rhoncus ipsum ac dolor. In hac habitasse platea dictumst. Nulla dapibus ultricies pede. Quisque augue risus, porttitor nec, suscipit ut, pellentesque quis, lacus. Duis adipiscing purus eu metus pharetra porttitor. Aenean sapien nisi, sodales non, facilisis nec, ultricies et, erat. Cras aliquam. Maecenas mi. Sed lacus arcu, malesuada id, ultricies et, ornare non, dolor. Maecenas turpis lacus, vehicula nec, blandit in, laoreet a, nibh. Donec aliquet. In et leo tincidunt tortor rhoncus convallis. Nulla facilisi. Praesent bibendum semper eros. Morbi risus. Nam tellus leo, ullamcorper egestas, venenatis quis, viverra ac, mauris. In hac habitasse platea dictumst. Curabitur at velit vel sem auctor hendrerit. Integer mauris orci, vehicula eu, feugiat ac, hendrerit ut, dolor. Fusce elit nulla, gravida quis, vulputate eu, rutrum vel, lectus. Integer cursus luctus nisl. Quisque quam. Aliquam lectus urna, porta in, viverra eu, pellentesque a, massa. Etiam eros sapien, porta et, aliquam et, bibendum sit amet, erat. Sed condimentum interdum lacus. In ut ante non felis tincidunt porta. Aenean aliquet ornare sem. Nunc dignissim, erat sit amet vulputate cursus, elit magna facilisis massa, quis hendrerit nunc odio id dui. Proin interdum dictum arcu. Pellentesque erat ante, ultricies ac, porttitor ac, dictum et, purus. Donec enim odio, gravida ut, imperdiet quis, rutrum ut, lacus.\r\n\r\nEtiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.', '', '', ''),
(7, 1, 'Consectetur adipisicing elit', 'Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.\r\nProin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.\r\nAliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.\r\nVivamus commodo, augue et laoreet euismod, sem sapien tempor dolor, ac egestas sem ligula quis lacus. Donec vestibulum tortor ac lacus. Sed posuere vestibulum nisl. Curabitur eleifend fermentum justo. Nullam imperdiet. Integer sit amet mauris imperdiet risus sollicitudin rutrum. Ut vitae turpis. Nulla facilisi. Quisque tortor velit, scelerisque et, facilisis vel, tempor sed, urna. Vivamus nulla elit, vestibulum eget, semper et, scelerisque eget, lacus. Pellentesque viverra purus. Quisque elit. Donec ut dolor.\r\nDuis volutpat elit et erat. In at nulla at nisl condimentum aliquet. Quisque elementum pharetra lacus. Nunc gravida arcu eget nunc. Nulla iaculis egestas magna. Aliquam erat volutpat. Sed pellentesque orci. Etiam lacus lorem, iaculis sit amet, pharetra quis, imperdiet sit amet, lectus. Integer quis elit ac mi aliquam pretium. Nullam mauris orci, porttitor eget, sollicitudin non, vulputate id, risus. Donec varius enim nec sem. Nam aliquam lacinia enim. Quisque eget lorem eu purus dignissim ultricies. Fusce porttitor hendrerit ante. Mauris urna diam, cursus id, mattis eget, tempus sit amet, risus. Curabitur eu felis. Sed eu mi. Nullam lectus mauris, luctus a, mattis ac, tempus non, leo. Cras mi nulla, rhoncus id, laoreet ut, ultricies id, odio.\r\nDonec imperdiet. Vestibulum auctor tortor at orci. Integer semper, nisi eget suscipit eleifend, erat nisl hendrerit justo, eget vestibulum lorem justo ac leo. Integer sem velit, pharetra in, fringilla eu, fermentum id, felis. Vestibulum sed felis. In elit. Praesent et pede vel ante dapibus condimentum. Donec magna. Quisque id risus. Mauris vulputate pellentesque leo. Duis vulputate, ligula at venenatis tincidunt, orci nunc interdum leo, ac egestas elit sem ut lacus. Etiam non diam quis arcu egestas commodo. Curabitur nec massa ac massa gravida condimentum. Aenean id libero. Pellentesque vitae tellus. Fusce lectus est, accumsan ac, bibendum sed, porta eget, augue. Etiam faucibus. Quisque tempus purus eu ante.\r\nVestibulum sapien nisl, ornare auctor, consectetuer quis, posuere tristique, odio. Fusce ultrices ullamcorper odio. Ut augue nulla, interdum at, adipiscing non, tristique eget, neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut pede est, condimentum id, scelerisque ac, malesuada non, quam. Proin eu ligula ac sapien suscipit blandit. Suspendisse euismod. Ut accumsan, neque id gravida luctus, arcu pede sodales felis, vel blandit massa arcu eget ligula. Aenean sed turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem eros, ornare ut, commodo eu, tempor nec, risus. Donec laoreet dapibus ligula. Praesent orci leo, bibendum nec, ornare et, nonummy in, elit. Donec interdum feugiat leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque feugiat ullamcorper ipsum. Donec convallis tincidunt urna.\r\nSuspendisse et orci et arcu porttitor pellentesque. Sed lacus nunc, fermentum vel, vehicula in, imperdiet eget, urna. Nam consectetuer euismod nunc. Nulla dignissim posuere nulla. Integer iaculis lacinia massa. Nullam sapien augue, condimentum vel, venenatis id, rhoncus pellentesque, sapien. Donec sed ipsum ultrices turpis consectetuer imperdiet. Duis et ipsum ac nisl laoreet commodo. Mauris eu est. Suspendisse id turpis quis orci euismod consequat. Donec tellus mi, luctus sit amet, ultrices a, convallis eu, lorem. Proin faucibus convallis elit. Maecenas rhoncus arcu at arcu. Proin libero. Proin adipiscing. In quis lorem vitae elit consectetuer pretium. Nullam ligula urna, adipiscing nec, iaculis ut, elementum non, turpis. Fusce pulvinar.', '', '', ''),
(7, 2, 'Consectetur adipisicing elit', 'Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.\r\nProin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.\r\nAliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.\r\nVivamus commodo, augue et laoreet euismod, sem sapien tempor dolor, ac egestas sem ligula quis lacus. Donec vestibulum tortor ac lacus. Sed posuere vestibulum nisl. Curabitur eleifend fermentum justo. Nullam imperdiet. Integer sit amet mauris imperdiet risus sollicitudin rutrum. Ut vitae turpis. Nulla facilisi. Quisque tortor velit, scelerisque et, facilisis vel, tempor sed, urna. Vivamus nulla elit, vestibulum eget, semper et, scelerisque eget, lacus. Pellentesque viverra purus. Quisque elit. Donec ut dolor.\r\nDuis volutpat elit et erat. In at nulla at nisl condimentum aliquet. Quisque elementum pharetra lacus. Nunc gravida arcu eget nunc. Nulla iaculis egestas magna. Aliquam erat volutpat. Sed pellentesque orci. Etiam lacus lorem, iaculis sit amet, pharetra quis, imperdiet sit amet, lectus. Integer quis elit ac mi aliquam pretium. Nullam mauris orci, porttitor eget, sollicitudin non, vulputate id, risus. Donec varius enim nec sem. Nam aliquam lacinia enim. Quisque eget lorem eu purus dignissim ultricies. Fusce porttitor hendrerit ante. Mauris urna diam, cursus id, mattis eget, tempus sit amet, risus. Curabitur eu felis. Sed eu mi. Nullam lectus mauris, luctus a, mattis ac, tempus non, leo. Cras mi nulla, rhoncus id, laoreet ut, ultricies id, odio.\r\nDonec imperdiet. Vestibulum auctor tortor at orci. Integer semper, nisi eget suscipit eleifend, erat nisl hendrerit justo, eget vestibulum lorem justo ac leo. Integer sem velit, pharetra in, fringilla eu, fermentum id, felis. Vestibulum sed felis. In elit. Praesent et pede vel ante dapibus condimentum. Donec magna. Quisque id risus. Mauris vulputate pellentesque leo. Duis vulputate, ligula at venenatis tincidunt, orci nunc interdum leo, ac egestas elit sem ut lacus. Etiam non diam quis arcu egestas commodo. Curabitur nec massa ac massa gravida condimentum. Aenean id libero. Pellentesque vitae tellus. Fusce lectus est, accumsan ac, bibendum sed, porta eget, augue. Etiam faucibus. Quisque tempus purus eu ante.\r\nVestibulum sapien nisl, ornare auctor, consectetuer quis, posuere tristique, odio. Fusce ultrices ullamcorper odio. Ut augue nulla, interdum at, adipiscing non, tristique eget, neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut pede est, condimentum id, scelerisque ac, malesuada non, quam. Proin eu ligula ac sapien suscipit blandit. Suspendisse euismod. Ut accumsan, neque id gravida luctus, arcu pede sodales felis, vel blandit massa arcu eget ligula. Aenean sed turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem eros, ornare ut, commodo eu, tempor nec, risus. Donec laoreet dapibus ligula. Praesent orci leo, bibendum nec, ornare et, nonummy in, elit. Donec interdum feugiat leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque feugiat ullamcorper ipsum. Donec convallis tincidunt urna.\r\nSuspendisse et orci et arcu porttitor pellentesque. Sed lacus nunc, fermentum vel, vehicula in, imperdiet eget, urna. Nam consectetuer euismod nunc. Nulla dignissim posuere nulla. Integer iaculis lacinia massa. Nullam sapien augue, condimentum vel, venenatis id, rhoncus pellentesque, sapien. Donec sed ipsum ultrices turpis consectetuer imperdiet. Duis et ipsum ac nisl laoreet commodo. Mauris eu est. Suspendisse id turpis quis orci euismod consequat. Donec tellus mi, luctus sit amet, ultrices a, convallis eu, lorem. Proin faucibus convallis elit. Maecenas rhoncus arcu at arcu. Proin libero. Proin adipiscing. In quis lorem vitae elit consectetuer pretium. Nullam ligula urna, adipiscing nec, iaculis ut, elementum non, turpis. Fusce pulvinar.', '', '', '');

--
-- TABLE STRUCTURE FOR: oc_kbm_article_related
--

DROP TABLE IF EXISTS oc_kbm_article_related;

CREATE TABLE `oc_kbm_article_related` (
  `article_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_kbm_article_to_category
--

DROP TABLE IF EXISTS oc_kbm_article_to_category;

CREATE TABLE `oc_kbm_article_to_category` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_kbm_article_to_layout
--

DROP TABLE IF EXISTS oc_kbm_article_to_layout;

CREATE TABLE `oc_kbm_article_to_layout` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_kbm_article_to_layout (`article_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(2, 0, 0),
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0);

--
-- TABLE STRUCTURE FOR: oc_kbm_article_to_store
--

DROP TABLE IF EXISTS oc_kbm_article_to_store;

CREATE TABLE `oc_kbm_article_to_store` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_kbm_article_to_store (`article_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0);

--
-- TABLE STRUCTURE FOR: oc_kbm_author
--

DROP TABLE IF EXISTS oc_kbm_author;

CREATE TABLE `oc_kbm_author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` tinyint(3) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO oc_kbm_author (`author_id`, `name`, `user_id`, `role_id`) VALUES
(1, 'admin', 1, 15);

--
-- TABLE STRUCTURE FOR: oc_kbm_category
--

DROP TABLE IF EXISTS oc_kbm_category;

CREATE TABLE `oc_kbm_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `column` int(3) NOT NULL,
  `article_order` int(3) NOT NULL DEFAULT '0',
  `article_image_width` int(3) DEFAULT NULL,
  `article_image_height` int(3) DEFAULT NULL,
  `character_limit` int(5) DEFAULT NULL,
  `date_added` int(10) unsigned NOT NULL,
  `date_modified` int(10) unsigned NOT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO oc_kbm_category (`category_id`, `parent_id`, `image`, `column`, `article_order`, `article_image_width`, `article_image_height`, `character_limit`, `date_added`, `date_modified`, `sort_order`, `status`) VALUES
(9, 0, '', 1, 1, 0, 0, 0, 1416998005, 1416998005, 1, 1),
(10, 0, '', 1, 1, 0, 0, 0, 1416998041, 1416998041, 0, 1);

--
-- TABLE STRUCTURE FOR: oc_kbm_category_description
--

DROP TABLE IF EXISTS oc_kbm_category_description;

CREATE TABLE `oc_kbm_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_kbm_category_description (`category_id`, `language_id`, `name`, `meta_keyword`, `meta_description`, `description`) VALUES
(9, 1, 'Men\'s Fashion', '', '', '&lt;span style=&quot;font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla odio urna, vehicula at nisi nec, viverra suscipit nunc. In sagittis varius laoreet. Donec scelerisque feugiat facilisis. Sed id accumsan tellus. Proin ornare placerat est et cursus. Donec ac mauris vitae nibh luctus lacinia non ut nisl. Vestibulum auctor, urna vel sollicitudin pretium, lorem neque viverra est, eu condimentum ipsum velit vel massa. In&lt;/span&gt;'),
(9, 2, 'Men\'s Fashion', '', '', '&lt;span style=&quot;font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla odio urna, vehicula at nisi nec, viverra suscipit nunc. In sagittis varius laoreet. Donec scelerisque feugiat facilisis. Sed id accumsan tellus. Proin ornare placerat est et cursus. Donec ac mauris vitae nibh luctus lacinia non ut nisl. Vestibulum auctor, urna vel sollicitudin pretium, lorem neque viverra est, eu condimentum ipsum velit vel massa. In&lt;/span&gt;'),
(10, 1, 'Women\'s Fashion', '', '', '&lt;span style=&quot;font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.&lt;/span&gt;'),
(10, 2, 'Women\'s Fashion', '', '', '&lt;span style=&quot;font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.&lt;/span&gt;');

--
-- TABLE STRUCTURE FOR: oc_kbm_category_path
--

DROP TABLE IF EXISTS oc_kbm_category_path;

CREATE TABLE `oc_kbm_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_kbm_category_path (`category_id`, `path_id`, `level`) VALUES
(10, 10, 0),
(9, 9, 0);

--
-- TABLE STRUCTURE FOR: oc_kbm_category_to_layout
--

DROP TABLE IF EXISTS oc_kbm_category_to_layout;

CREATE TABLE `oc_kbm_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_kbm_category_to_layout (`category_id`, `store_id`, `layout_id`) VALUES
(10, 0, 0),
(9, 0, 0);

--
-- TABLE STRUCTURE FOR: oc_kbm_category_to_store
--

DROP TABLE IF EXISTS oc_kbm_category_to_store;

CREATE TABLE `oc_kbm_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_kbm_category_to_store (`category_id`, `store_id`) VALUES
(10, 0),
(9, 0);

--
-- TABLE STRUCTURE FOR: oc_kbm_comment
--

DROP TABLE IF EXISTS oc_kbm_comment;

CREATE TABLE `oc_kbm_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `parent_comment_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL,
  `author_type` enum('admin','customer','guest') NOT NULL,
  `content` text NOT NULL,
  `data` text,
  `date_added` int(10) unsigned NOT NULL,
  `date_modified` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_kbm_permission
--

DROP TABLE IF EXISTS oc_kbm_permission;

CREATE TABLE `oc_kbm_permission` (
  `role_id` int(3) NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_kbm_permission (`role_id`, `permissions`) VALUES
(5, 'a:2:{i:0;s:14:"create_article";i:1;s:16:"edit_own_article";}'),
(10, 'a:14:{i:0;s:14:"create_article";i:1;s:12:"copy_article";i:2;s:16:"edit_own_article";i:3;s:18:"edit_other_article";i:4;s:13:"change_author";i:5;s:14:"remove_article";i:6;s:15:"create_category";i:7;s:13:"copy_category";i:8;s:13:"edit_category";i:9;s:15:"remove_category";i:10;s:12:"edit_comment";i:11;s:13:"reply_comment";i:12;s:14:"remove_comment";i:13;s:10:"add_author";}'),
(15, 'a:18:{i:0;s:14:"create_article";i:1;s:12:"copy_article";i:2;s:16:"edit_own_article";i:3;s:18:"edit_other_article";i:4;s:13:"change_author";i:5;s:14:"remove_article";i:6;s:15:"create_category";i:7;s:13:"copy_category";i:8;s:13:"edit_category";i:9;s:15:"remove_category";i:10;s:12:"edit_comment";i:11;s:13:"reply_comment";i:12;s:14:"remove_comment";i:13;s:10:"add_author";i:14;s:11:"edit_author";i:15;s:13:"remove_author";i:16;s:21:"edit_group_permission";i:17;s:12:"edit_setting";}');

--
-- TABLE STRUCTURE FOR: oc_kcp_skin
--

DROP TABLE IF EXISTS oc_kcp_skin;

CREATE TABLE `oc_kcp_skin` (
  `theme_id` varchar(64) NOT NULL,
  `skin_id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `root_skin_id` varchar(64) NOT NULL,
  PRIMARY KEY (`theme_id`,`skin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO oc_kcp_skin (`theme_id`, `skin_id`, `name`, `root_skin_id`) VALUES
('start', 'skin1', 'Skin 1', 'skin1'),
('start', 'skin2', 'Skin 2', 'skin2'),
('start', 'skin3', 'Skin 3', 'skin3'),
('start', 'skin4', 'Skin 4', 'skin4');

--
-- TABLE STRUCTURE FOR: oc_kcp_skin_option
--

DROP TABLE IF EXISTS oc_kcp_skin_option;

CREATE TABLE `oc_kcp_skin_option` (
  `option` varchar(64) NOT NULL,
  `theme_id` varchar(64) NOT NULL,
  `skin_id` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`option`,`theme_id`,`skin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_kcp_skin_option (`option`, `theme_id`, `skin_id`, `value`) VALUES
('custom_css', 'start', 'skin1', '\"a.button_advanced {\\nborder-radius: 2px;\\n-moz-border-radius: 2px;\\n-webkit-border-radius: 2px;\\ncolor: #fff;\\nbackground: #ff7200;\\ndisplay: inline-block;\\nfont-size: 20px;\\nfont-weight: bold;\\npadding: 8px 15px;\\ntext-decoration: none;\\ntransition: all 0.3s;\\n-moz-transition: all 0.3s;\\n-webkit-transition: all 0.3s;\\n}\\na.button_advanced:hover {\\nbackground: #444;\\n}\"'),
('topbar_border_color', 'start', 'skin1', '\"#f2f2f2\"'),
('topbar_link_hover_color', 'start', 'skin1', '\"#db2c2c\"'),
('topbar_background_color', 'start', 'skin1', '\"#F2F2F2\"'),
('information_title', 'start', 'skin1', '{\"ar\":\"About us\",\"en\":\"About us\"}'),
('footer_link_hover_color', 'start', 'skin1', '\"#fff\"'),
('information_content', 'start', 'skin1', '{\"ar\":\"test\",\"en\":\"<img alt=\\\"\\\" src=\\\"http:\\/\\/demo.kulerthemes.com\\/start\\/1\\/image\\/data\\/demo\\/start\\/cp\\/170x170\\/about.jpg\\\" \\/>\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, dolorem ea id illo illum ipsum labore pariatur temporibus. Enim eveniet molestias, possimus quod rerum tempore. Asperiores laboriosam quis vero voluptatem.<\\/p>\\n<a href=\\\"#\\\">read more<\\/a>\"}'),
('custom_block_content', 'start', 'skin1', '\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"'),
('heading_font', 'start', 'skin1', '{\"font_family\":\"Varela Round\"}'),
('custom_tab_1_content', 'start', 'skin1', '{\"ar\":\"fsfsdfsdfsdf\",\"en\":\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"}'),
('brand_logo_height', 'start', 'skin1', '\"50\"'),
('body_text_color', 'start', 'skin1', '\"#333\"'),
('body_pattern', 'start', 'skin1', '\"\"'),
('custom_tab_1_title', 'start', 'skin1', '{\"en\":\"Custom tab 1\"}'),
('layout_style', 'start', 'skin1', '\"full_width\"'),
('body_main_color', 'start', 'skin1', '\"#EC6467\"'),
('body_font', 'start', 'skin1', '{\"font_family\":\"Varela Round\"}'),
('category_menu_type', 'start', 'skin1', '\"accordion\"'),
('body_bg_color', 'start', 'skin1', '\"#ababab\"'),
('mobile_1', 'start', 'skin1', '\"01.666.777.8989\"'),
('brand_logo_width', 'start', 'skin1', '\"50\"'),
('payment_icons', 'start', 'skin1', '[{\"$$hashKey\":\"04T\",\"image\":\"catalog\\/demo\\/start\\/payment_icons\\/visa.png\",\"link\":\"#\",\"name\":{\"ar\":\"visa\",\"en\":\"visa\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"04Z\",\"image\":\"catalog\\/demo\\/start\\/payment_icons\\/master.png\",\"link\":\"#\",\"name\":{\"ar\":\"master\",\"en\":\"master\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"040\",\"image\":\"catalog\\/demo\\/start\\/payment_icons\\/amex.png\",\"link\":\"#\",\"name\":{\"ar\":\"american express\",\"en\":\"american express\"},\"new_tab\":\"true\",\"sort\":\"\"}]'),
('email_1', 'start', 'skin1', '\"contact@kulerthemes.com\"'),
('contact_list', 'start', 'skin1', '\"5d5b9f858d\"'),
('link_text_color', 'start', 'skin1', '\"#949494\"'),
('mail_service', 'start', 'skin1', '\"mailchimp\"'),
('menu_item_color', 'start', 'skin1', '\"#666\"'),
('custom_copyright', 'start', 'skin1', '{\"ar\":\"\",\"en\":\"\"}'),
('longitude', 'start', 'skin1', '\"151.209744\"'),
('home_icon_type', 'start', 'skin1', '\"icon\"'),
('display_product_mode', 'start', 'skin1', '\"list\"'),
('menu_font', 'start', 'skin1', '{\"font_family\":\"Varela Round\"}'),
('image_zoom_type', 'start', 'skin1', '\"outer_cloud\"'),
('custom_information', 'start', 'skin1', '{\"ar\":\"\",\"en\":\"Say Hello! Don\'t be shy!\"}'),
('notification_show_time', 'start', 'skin1', '\"3000\"'),
('header_background_color', 'start', 'skin1', '\"rgba(255, 255, 255, 1)\"'),
('topbar_text_color', 'start', 'skin1', '\"#999\"'),
('select_manufacturer_text', 'start', 'skin1', '{\"en\":\"Manufacturer\"}'),
('custom_js_status', 'start', 'skin1', '\"false\"'),
('button_select_list', 'start', 'skin1', '\"false\"'),
('custom_css_status', 'start', 'skin1', '\"true\"'),
('custom_css_file_status', 'start', 'skin1', '\"false\"'),
('show_custom_copyright', 'start', 'skin1', '\"false\"'),
('show_payment_icons', 'start', 'skin1', '\"true\"'),
('newsletter_button_text', 'start', 'skin1', '{\"en\":\"SUBSCRIBE\"}'),
('newsletter_success_message', 'start', 'skin1', '{\"ar\":\"\",\"en\":\"Thank you for contact us\"}'),
('newsletter_title', 'start', 'skin1', '{\"en\":\"Newsletter\"}'),
('newsletter_description_text', 'start', 'skin1', '{\"en\":\"Newsletter\"}'),
('newsletter_input_text', 'start', 'skin1', '{\"en\":\"Enter Your Email Address\"}'),
('social_icon_instagram', 'start', 'skin1', '\"true\"'),
('show_newsletter_title', 'start', 'skin1', '\"false\"'),
('social_icon_rss', 'start', 'skin1', '\"true\"'),
('show_newsletter', 'start', 'skin1', '\"true\"'),
('social_icon_pinterest', 'start', 'skin1', '\"true\"'),
('social_icon_youtube', 'start', 'skin1', '\"true\"'),
('social_icon_twitter', 'start', 'skin1', '\"true\"'),
('social_icon_google_plus', 'start', 'skin1', '\"true\"'),
('social_icon_facebook', 'start', 'skin1', '\"true\"'),
('twitter_transparent_background', 'start', 'skin1', '\"false\"'),
('show_social_icons', 'start', 'skin1', '\"true\"'),
('show_social_icons_title', 'start', 'skin1', '\"false\"'),
('show_twitter_title', 'start', 'skin1', '\"false\"'),
('show_twitter_footer', 'start', 'skin1', '\"false\"'),
('show_twitter_header', 'start', 'skin1', '\"false\"'),
('show_twitter', 'start', 'skin1', '\"false\"'),
('show_facebook', 'start', 'skin1', '\"false\"'),
('show_facebook_title', 'start', 'skin1', '\"false\"'),
('show_facebook_friend_faces', 'start', 'skin1', '\"false\"'),
('show_facebook_posts', 'start', 'skin1', '\"false\"'),
('show_information_title', 'start', 'skin1', '\"true\"'),
('contact_title', 'start', 'skin1', '{\"en\":\"Contact\"}'),
('show_contact', 'start', 'skin1', '\"true\"'),
('scroll_up_text', 'start', 'skin1', '{\"ar\":\"Up\",\"en\":\"Up\"}'),
('show_information', 'start', 'skin1', '\"true\"'),
('show_contact_title', 'start', 'skin1', '\"true\"'),
('enable_scroll_up', 'start', 'skin1', '\"true\"'),
('enable_swap_image', 'start', 'skin1', '\"true\"'),
('more_details_button_text', 'start', 'skin1', '{\"ar\":\"Product Detail\",\"en\":\"Product Detail\"}'),
('show_sale_badge', 'start', 'skin1', '\"true\"'),
('view_button_text', 'start', 'skin1', '{\"ar\":\"abc\",\"en\":\"Quick View\"}'),
('show_quick_view', 'start', 'skin1', '\"true\"'),
('show_custom_notification', 'start', 'skin1', '\"true\"'),
('login_popup', 'start', 'skin1', '\"true\"'),
('enable_one_page_checkout', 'start', 'skin1', '\"true\"'),
('show_custom_tab_2', 'start', 'skin1', '\"true\"'),
('show_google_map', 'start', 'skin1', '\"true\"'),
('show_custom_information', 'start', 'skin1', '\"true\"'),
('show_tax', 'start', 'skin1', '\"false\"'),
('show_number_quantity', 'start', 'skin1', '\"true\"'),
('image_lightbox', 'start', 'skin1', '\"true\"'),
('default_sharing', 'start', 'skin1', '\"true\"'),
('show_custom_block', 'start', 'skin1', '\"true\"'),
('show_related_products', 'start', 'skin1', '\"true\"'),
('show_custom_tab_1', 'start', 'skin1', '\"true\"'),
('show_save_percent', 'start', 'skin1', '\"false\"'),
('sub_categories_image_carousel', 'start', 'skin1', '\"true\"'),
('show_brand_logo', 'start', 'skin1', '\"true\"'),
('sub_category_image', 'start', 'skin1', '\"true\"'),
('hide_category_image', 'start', 'skin1', '\"false\"'),
('show_compare_button', 'start', 'skin1', '\"true\"'),
('search_in_specific_manufacturer', 'start', 'skin1', '\"false\"'),
('search_in_product_description', 'start', 'skin1', '\"false\"'),
('show_product_image', 'start', 'skin1', '\"true\"'),
('show_product_name', 'start', 'skin1', '\"true\"'),
('custom_css', 'start', 'skin2', '\"a.button_advanced {\\nborder-radius: 2px;\\n-moz-border-radius: 2px;\\n-webkit-border-radius: 2px;\\ncolor: #fff;\\nbackground: #ff7200;\\ndisplay: inline-block;\\nfont-size: 20px;\\nfont-weight: bold;\\npadding: 8px 15px;\\ntext-decoration: none;\\ntransition: all 0.3s;\\n-moz-transition: all 0.3s;\\n-webkit-transition: all 0.3s;\\n}\\na.button_advanced:hover {\\nbackground: #444;\\n}\"'),
('social_icon_twitter_link', 'start', 'skin2', '\"#\"'),
('menu_color', 'start', 'skin2', '\"#ffffff\"'),
('topbar_background_color', 'start', 'skin2', '\"#F2F2F2\"'),
('menu_bg_color', 'start', 'skin2', '\"#63B5BD\"'),
('topbar_link_hover_color', 'start', 'skin2', '\"#db2c2c\"'),
('social_icon_rss_link', 'start', 'skin2', '\"#\"'),
('topbar_border_color', 'start', 'skin2', '\"#f2f2f2\"'),
('topbar_link_color', 'start', 'skin2', '\"#999\"'),
('product_description_limit', 'start', 'skin2', '\"120\"'),
('social_icon_instagram_link', 'start', 'skin2', '\"http:\\/\\/instagram.com\\/mashable\"'),
('social_icon_google_plus_link', 'start', 'skin2', '\"#\"'),
('social_icon_pinterest_link', 'start', 'skin2', '\"#\"'),
('sub_category_image_size', 'start', 'skin2', '\"80\"'),
('product_image_width', 'start', 'skin2', '\"130\"'),
('social_icon_youtube_link', 'start', 'skin2', '\"#\"'),
('select_category_text', 'start', 'skin2', '{\"ar\":\"\",\"en\":\"Category\"}'),
('related_products_position', 'start', 'skin2', '\"bottom\"'),
('related_products_style', 'start', 'skin2', '\"grid\"'),
('zoom_window_height', 'start', 'skin2', '\"300\"'),
('search_result_limit', 'start', 'skin2', '\"4\"'),
('zoom_window_width', 'start', 'skin2', '\"300\"'),
('topbar_text_color', 'start', 'skin2', '\"#999\"'),
('payment_icons', 'start', 'skin2', '[{\"$$hashKey\":\"04T\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/visa.png\",\"link\":\"#\",\"name\":{\"ar\":\"visa\",\"en\":\"visa\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"04Z\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/master.png\",\"link\":\"#\",\"name\":{\"ar\":\"master\",\"en\":\"master\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"040\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/amex.png\",\"link\":\"#\",\"name\":{\"ar\":\"american express\",\"en\":\"american express\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"047\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/cirrus.png\",\"link\":\"#\",\"name\":{\"ar\":\"cirrus\",\"en\":\"cirrus\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"04E\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/paypal.png\",\"link\":\"#\",\"name\":{\"ar\":\"paypal\",\"en\":\"cirrus\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"04L\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/discovery.png\",\"link\":\"#\",\"name\":{\"ar\":\"discover\",\"en\":\"discover\"},\"new_tab\":\"true\",\"sort\":\"\"}]'),
('body_main_color', 'start', 'skin2', '\"#EC6467\"'),
('body_bg_color', 'start', 'skin2', '\"#ababab\"'),
('mobile_1', 'start', 'skin2', '\"01.666.777.8989\"'),
('live_search_status', 'start', 'skin2', '\"true\"'),
('mobile_menu_title', 'start', 'skin2', '{\"ar\":\"Menu\",\"en\":\"Menu\"}'),
('fixed_header', 'start', 'skin2', '\"false\"'),
('search_field_text', 'start', 'skin2', '{\"ar\":\"\",\"en\":\"Live search products ...\"}'),
('search_in_specific_category', 'start', 'skin2', '\"false\"'),
('color_01', 'start', 'skin2', '\"#a12525\"'),
('multi_level_default_menu', 'start', 'skin2', '\"true\"'),
('search_in_specific_manufacturer', 'start', 'skin2', '\"false\"'),
('search_in_product_description', 'start', 'skin2', '\"false\"'),
('show_product_name', 'start', 'skin2', '\"true\"'),
('show_product_description', 'start', 'skin2', '\"true\"'),
('show_product_image', 'start', 'skin2', '\"true\"'),
('show_product_price', 'start', 'skin2', '\"true\"'),
('show_product_rating', 'start', 'skin2', '\"true\"'),
('show_add_to_cart_button', 'start', 'skin2', '\"true\"'),
('sub_categories_image_carousel', 'start', 'skin2', '\"true\"'),
('show_wish_list_button', 'start', 'skin2', '\"true\"'),
('sub_category_image', 'start', 'skin2', '\"true\"'),
('show_brand_logo', 'start', 'skin2', '\"true\"'),
('hide_category_image', 'start', 'skin2', '\"false\"'),
('show_compare_button', 'start', 'skin2', '\"true\"'),
('show_quick_view', 'start', 'skin2', '\"true\"'),
('show_custom_notification', 'start', 'skin2', '\"true\"'),
('login_popup', 'start', 'skin2', '\"true\"'),
('enable_one_page_checkout', 'start', 'skin2', '\"true\"'),
('show_google_map', 'start', 'skin2', '\"true\"'),
('show_custom_information', 'start', 'skin2', '\"true\"'),
('show_related_products', 'start', 'skin2', '\"true\"'),
('show_custom_tab_2', 'start', 'skin2', '\"true\"'),
('show_custom_tab_1', 'start', 'skin2', '\"true\"'),
('contact_title', 'start', 'skin2', '{\"en\":\"Contact\"}'),
('show_custom_block', 'start', 'skin2', '\"true\"'),
('default_sharing', 'start', 'skin2', '\"true\"'),
('show_save_percent', 'start', 'skin2', '\"false\"'),
('show_number_quantity', 'start', 'skin2', '\"true\"'),
('show_tax', 'start', 'skin2', '\"false\"'),
('image_lightbox', 'start', 'skin2', '\"true\"'),
('more_details_button_text', 'start', 'skin2', '{\"ar\":\"Product Detail\",\"en\":\"Product Detail\"}'),
('view_button_text', 'start', 'skin2', '{\"ar\":\"abc\",\"en\":\"Quick View\"}'),
('enable_swap_image', 'start', 'skin2', '\"true\"'),
('show_sale_badge', 'start', 'skin2', '\"true\"'),
('enable_scroll_up', 'start', 'skin2', '\"true\"'),
('scroll_up_text', 'start', 'skin2', '{\"ar\":\"Up\",\"en\":\"Up\"}'),
('show_information', 'start', 'skin2', '\"true\"'),
('show_facebook', 'start', 'skin2', '\"false\"'),
('show_contact', 'start', 'skin2', '\"true\"'),
('show_contact_title', 'start', 'skin2', '\"true\"'),
('show_twitter', 'start', 'skin2', '\"false\"'),
('show_twitter_title', 'start', 'skin2', '\"false\"'),
('show_facebook_title', 'start', 'skin2', '\"false\"'),
('show_information_title', 'start', 'skin2', '\"true\"'),
('show_facebook_friend_faces', 'start', 'skin2', '\"false\"'),
('show_facebook_posts', 'start', 'skin2', '\"false\"'),
('newsletter_success_message', 'start', 'skin2', '{\"ar\":\"\",\"en\":\"Thank you for contact us\"}'),
('newsletter_description_text', 'start', 'skin2', '{\"en\":\"Newsletter\"}'),
('newsletter_input_text', 'start', 'skin2', '{\"en\":\"Enter Your Email Address\"}'),
('newsletter_title', 'start', 'skin2', '{\"en\":\"Newsletter\"}'),
('social_icon_rss', 'start', 'skin2', '\"true\"'),
('newsletter_button_text', 'start', 'skin2', '{\"en\":\"SUBSCRIBE\"}'),
('show_newsletter', 'start', 'skin2', '\"true\"'),
('show_newsletter_title', 'start', 'skin2', '\"false\"'),
('social_icon_instagram', 'start', 'skin2', '\"true\"'),
('social_icon_pinterest', 'start', 'skin2', '\"true\"'),
('show_twitter_footer', 'start', 'skin2', '\"false\"'),
('show_custom_copyright', 'start', 'skin2', '\"false\"'),
('show_twitter_header', 'start', 'skin2', '\"false\"'),
('twitter_transparent_background', 'start', 'skin2', '\"false\"'),
('show_social_icons', 'start', 'skin2', '\"true\"'),
('show_social_icons_title', 'start', 'skin2', '\"false\"'),
('social_icon_facebook', 'start', 'skin2', '\"true\"'),
('social_icon_twitter', 'start', 'skin2', '\"true\"'),
('social_icon_google_plus', 'start', 'skin2', '\"true\"'),
('social_icon_youtube', 'start', 'skin2', '\"true\"'),
('show_payment_icons', 'start', 'skin2', '\"false\"'),
('button_select_list', 'start', 'skin2', '\"false\"'),
('custom_css_status', 'start', 'skin2', '\"true\"'),
('custom_js_status', 'start', 'skin2', '\"false\"'),
('custom_css_file_status', 'start', 'skin2', '\"false\"'),
('custom_tab_2_title', 'start', 'skin2', '{\"ar\":\"Custom Tab 2\",\"en\":\"Custom Tab 2\"}'),
('longitude', 'start', 'skin2', '\"151.209744\"'),
('menu_font', 'start', 'skin2', '{\"font_family\":\"Varela Round\"}'),
('display_product_mode', 'start', 'skin2', '\"list\"'),
('mail_service', 'start', 'skin2', '\"mailchimp\"'),
('maximum_width', 'start', 'skin2', '\"1170px\"'),
('menu_item_color', 'start', 'skin2', '\"#666\"'),
('map_type', 'start', 'skin2', '\"ROADMAP\"'),
('link_text_color', 'start', 'skin2', '\"#949494\"'),
('mailchimp_api_key', 'start', 'skin2', '\"950e5f5a7b9c2bbe328717079c168fad-us8\"'),
('latitude', 'start', 'skin2', '\"-33.878715\"'),
('lens_zoom_shape', 'start', 'skin2', '\"rounded\"'),
('home_icon_type', 'start', 'skin2', '\"icon\"'),
('footer_heading_color', 'start', 'skin2', '\"#ffffff\"'),
('image_zoom_type', 'start', 'skin2', '\"outer_cloud\"'),
('footer_background_color', 'start', 'skin2', '\"#222\"'),
('heading_font', 'start', 'skin2', '{\"font_family\":\"Varela Round\"}'),
('email_1', 'start', 'skin2', '\"contact@kulerthemes.com\"'),
('footer_link_hover_color', 'start', 'skin2', '\"#fff\"'),
('footer_link_color', 'start', 'skin2', '\"#666\"'),
('show_twitter_title', 'start', 'skin3', '\"false\"'),
('show_twitter_header', 'start', 'skin3', '\"false\"'),
('show_twitter_footer', 'start', 'skin3', '\"false\"'),
('twitter_transparent_background', 'start', 'skin3', '\"false\"'),
('show_social_icons', 'start', 'skin3', '\"true\"'),
('show_social_icons_title', 'start', 'skin3', '\"false\"'),
('social_icon_rss', 'start', 'skin3', '\"true\"'),
('social_icon_instagram', 'start', 'skin3', '\"true\"'),
('social_icon_pinterest', 'start', 'skin3', '\"true\"'),
('social_icon_youtube', 'start', 'skin3', '\"true\"'),
('social_icon_google_plus', 'start', 'skin3', '\"true\"'),
('social_icon_twitter', 'start', 'skin3', '\"true\"'),
('social_icon_facebook', 'start', 'skin3', '\"true\"'),
('show_newsletter', 'start', 'skin3', '\"true\"'),
('newsletter_title', 'start', 'skin3', '{\"en\":\"Newsletter\"}'),
('show_newsletter_title', 'start', 'skin3', '\"false\"'),
('newsletter_input_text', 'start', 'skin3', '{\"en\":\"Enter Your Email Address\"}'),
('newsletter_description_text', 'start', 'skin3', '{\"en\":\"Newsletter\"}'),
('newsletter_button_text', 'start', 'skin3', '{\"en\":\"SUBSCRIBE\"}'),
('maximum_width', 'start', 'skin3', '\"1170px\"'),
('mail_service', 'start', 'skin3', '\"mailchimp\"'),
('social_icon_google_plus_link', 'start', 'skin3', '\"#\"'),
('social_icon_pinterest_link', 'start', 'skin3', '\"#\"'),
('topbar_background_color', 'start', 'skin3', '\"#F2F2F2\"'),
('topbar_border_color', 'start', 'skin3', '\"#f2f2f2\"'),
('sub_category_image_size', 'start', 'skin3', '\"80\"'),
('topbar_link_hover_color', 'start', 'skin3', '\"#db2c2c\"'),
('button_select_list', 'start', 'skin3', '\"false\"'),
('custom_js_status', 'start', 'skin3', '\"false\"'),
('custom_css_status', 'start', 'skin3', '\"true\"'),
('custom_css_file_status', 'start', 'skin3', '\"false\"'),
('show_custom_copyright', 'start', 'skin3', '\"false\"'),
('show_payment_icons', 'start', 'skin3', '\"false\"'),
('newsletter_success_message', 'start', 'skin3', '{\"ar\":\"\",\"en\":\"Thank you for contact us\"}'),
('social_icon_twitter_link', 'start', 'skin3', '\"#\"'),
('social_icon_instagram_link', 'start', 'skin3', '\"http:\\/\\/instagram.com\\/mashable\"'),
('social_icon_rss_link', 'start', 'skin3', '\"#\"'),
('social_icon_youtube_link', 'start', 'skin3', '\"#\"'),
('link_text_color', 'start', 'skin3', '\"#949494\"'),
('email_1', 'start', 'skin3', '\"contact@kulerthemes.com\"'),
('custom_tab_2_content', 'start', 'skin3', '{\"ar\":\"fsdfsdfsdfsdf\",\"en\":\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"}'),
('custom_tab_2_title', 'start', 'skin3', '{\"ar\":\"Custom Tab 2\",\"en\":\"Custom Tab 2\"}'),
('select_category_text', 'start', 'skin3', '{\"ar\":\"\",\"en\":\"Category\"}'),
('menu_item_color', 'start', 'skin3', '\"#666\"'),
('menu_font', 'start', 'skin3', '{\"font_family\":\"Varela Round\"}'),
('display_product_mode', 'start', 'skin3', '\"list\"'),
('longitude', 'start', 'skin3', '\"151.209744\"'),
('custom_information', 'start', 'skin3', '{\"ar\":\"\",\"en\":\"Say Hello! Don\'t be shy!\"}'),
('custom_block_content', 'start', 'skin3', '\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"'),
('home_icon_type', 'start', 'skin3', '\"icon\"'),
('custom_copyright', 'start', 'skin3', '{\"ar\":\"\",\"en\":\"\"}'),
('information_title', 'start', 'skin3', '{\"ar\":\"About us\",\"en\":\"About us\"}'),
('header_background_color', 'start', 'skin3', '\"rgba(255, 255, 255, 1)\"'),
('footer_background_color', 'start', 'skin3', '\"#222\"'),
('heading_font', 'start', 'skin3', '{\"font_family\":\"Varela Round\"}'),
('mailchimp_api_key', 'start', 'skin3', '\"950e5f5a7b9c2bbe328717079c168fad-us8\"'),
('footer_heading_color', 'start', 'skin3', '\"#ffffff\"'),
('custom_tab_1_title', 'start', 'skin3', '{\"en\":\"Custom tab 1\"}'),
('layout_style', 'start', 'skin3', '\"full_width\"'),
('footer_link_hover_color', 'start', 'skin3', '\"#fff\"'),
('footer_link_color', 'start', 'skin3', '\"#666\"'),
('fax_1', 'start', 'skin3', '\"03.989898989\"'),
('latitude', 'start', 'skin3', '\"-33.878715\"'),
('information_content', 'start', 'skin3', '{\"ar\":\"test\",\"en\":\"<img alt=\\\"\\\" src=\\\"http:\\/\\/demo.kulerthemes.com\\/start\\/1\\/image\\/data\\/demo\\/start\\/cp\\/170x170\\/about.jpg\\\" \\/>\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, dolorem ea id illo illum ipsum labore pariatur temporibus. Enim eveniet molestias, possimus quod rerum tempore. Asperiores laboriosam quis vero voluptatem.<\\/p>\\n<a href=\\\"#\\\">read more<\\/a>\"}'),
('brand_logo_height', 'start', 'skin3', '\"50\"'),
('body_text_color', 'start', 'skin3', '\"#333\"'),
('body_pattern', 'start', 'skin3', '\"\"'),
('lens_zoom_shape', 'start', 'skin3', '\"rounded\"'),
('image_zoom_type', 'start', 'skin3', '\"outer_cloud\"'),
('map_type', 'start', 'skin3', '\"ROADMAP\"'),
('product_image_height', 'start', 'skin3', '\"150\"'),
('social_icon_facebook_link', 'start', 'skin3', '\"http:\\/\\/facebook.com\\/kulerthemes\"'),
('notification_show_time', 'start', 'skin3', '\"3000\"'),
('body_main_color', 'start', 'skin3', '\"#EC6467\"'),
('body_bg_color', 'start', 'skin3', '\"#ababab\"'),
('mobile_1', 'start', 'skin3', '\"01.666.777.8989\"'),
('custom_tab_1_content', 'start', 'skin3', '{\"ar\":\"fsfsdfsdfsdf\",\"en\":\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"}'),
('payment_icons', 'start', 'skin3', '[{\"$$hashKey\":\"04T\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/visa.png\",\"link\":\"#\",\"name\":{\"ar\":\"visa\",\"en\":\"visa\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"04Z\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/master.png\",\"link\":\"#\",\"name\":{\"ar\":\"master\",\"en\":\"master\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"040\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/amex.png\",\"link\":\"#\",\"name\":{\"ar\":\"american express\",\"en\":\"american express\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"047\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/cirrus.png\",\"link\":\"#\",\"name\":{\"ar\":\"cirrus\",\"en\":\"cirrus\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"04E\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/paypal.png\",\"link\":\"#\",\"name\":{\"ar\":\"paypal\",\"en\":\"cirrus\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"04L\",\"image\":\"data\\/demo\\/start\\/payment_icons\\/discovery.png\",\"link\":\"#\",\"name\":{\"ar\":\"discover\",\"en\":\"discover\"},\"new_tab\":\"true\",\"sort\":\"\"}]'),
('select_manufacturer_text', 'start', 'skin3', '{\"en\":\"Manufacturer\"}'),
('topbar_text_color', 'start', 'skin3', '\"#999\"'),
('body_font', 'start', 'skin3', '{\"font_family\":\"Varela Round\"}'),
('product_description_limit', 'start', 'skin3', '\"120\"'),
('phone_1', 'start', 'skin3', '\"+1.3333.9999\"'),
('category_menu_type', 'start', 'skin3', '\"accordion\"'),
('brand_logo_width', 'start', 'skin3', '\"50\"'),
('contact_list', 'start', 'skin3', '\"5d5b9f858d\"'),
('zoom_window_height', 'start', 'skin3', '\"300\"'),
('custom_css', 'start', 'skin3', '\"a.button_advanced {\\nborder-radius: 2px;\\n-moz-border-radius: 2px;\\n-webkit-border-radius: 2px;\\ncolor: #fff;\\nbackground: #ff7200;\\ndisplay: inline-block;\\nfont-size: 20px;\\nfont-weight: bold;\\npadding: 8px 15px;\\ntext-decoration: none;\\ntransition: all 0.3s;\\n-moz-transition: all 0.3s;\\n-webkit-transition: all 0.3s;\\n}\\na.button_advanced:hover {\\nbackground: #444;\\n}\"'),
('related_products_style', 'start', 'skin3', '\"grid\"'),
('search_result_limit', 'start', 'skin3', '\"4\"'),
('zoom_window_width', 'start', 'skin3', '\"300\"'),
('related_products_position', 'start', 'skin3', '\"bottom\"'),
('topbar_bg_color', 'start', 'skin3', '\"#fff\"'),
('footer_bg_color', 'start', 'skin3', '\"#000\"'),
('powered_bg_color', 'start', 'skin3', '\"#000\"'),
('social_newsletter_bg_color', 'start', 'skin3', '\"#000\"'),
('product_image_width', 'start', 'skin3', '\"130\"'),
('topbar_link_color', 'start', 'skin3', '\"#999\"'),
('header_bg_color', 'start', 'skin3', '\"#141414\"'),
('live_search_status', 'start', 'skin4', '\"true\"'),
('multi_level_default_menu', 'start', 'skin4', '\"true\"'),
('search_field_text', 'start', 'skin4', '{\"ar\":\"\",\"en\":\"Live search products ...\"}'),
('search_in_specific_manufacturer', 'start', 'skin4', '\"false\"'),
('show_product_rating', 'start', 'skin4', '\"true\"'),
('show_product_description', 'start', 'skin4', '\"true\"'),
('show_wish_list_button', 'start', 'skin4', '\"true\"'),
('show_product_image', 'start', 'skin4', '\"true\"'),
('search_in_specific_category', 'start', 'skin4', '\"false\"'),
('show_product_price', 'start', 'skin4', '\"true\"'),
('show_add_to_cart_button', 'start', 'skin4', '\"true\"'),
('show_product_name', 'start', 'skin4', '\"true\"'),
('search_in_product_description', 'start', 'skin4', '\"false\"'),
('image_lightbox', 'start', 'skin4', '\"true\"'),
('show_compare_button', 'start', 'skin4', '\"true\"'),
('default_sharing', 'start', 'skin4', '\"true\"'),
('show_tax', 'start', 'skin4', '\"false\"'),
('show_number_quantity', 'start', 'skin4', '\"true\"'),
('show_save_percent', 'start', 'skin4', '\"false\"'),
('show_brand_logo', 'start', 'skin4', '\"true\"'),
('sub_categories_image_carousel', 'start', 'skin4', '\"true\"'),
('show_related_products', 'start', 'skin4', '\"true\"'),
('hide_category_image', 'start', 'skin4', '\"false\"'),
('sub_category_image', 'start', 'skin4', '\"true\"'),
('show_custom_block', 'start', 'skin4', '\"true\"'),
('show_custom_tab_1', 'start', 'skin4', '\"true\"'),
('scroll_up_text', 'start', 'skin4', '{\"ar\":\"Up\",\"en\":\"Up\"}'),
('show_custom_tab_2', 'start', 'skin4', '\"true\"'),
('show_quick_view', 'start', 'skin4', '\"true\"'),
('view_button_text', 'start', 'skin4', '{\"ar\":\"abc\",\"en\":\"Quick View\"}'),
('login_popup', 'start', 'skin4', '\"true\"'),
('show_custom_notification', 'start', 'skin4', '\"true\"'),
('enable_one_page_checkout', 'start', 'skin4', '\"true\"'),
('show_google_map', 'start', 'skin4', '\"true\"'),
('enable_scroll_up', 'start', 'skin4', '\"true\"'),
('show_sale_badge', 'start', 'skin4', '\"true\"'),
('show_custom_information', 'start', 'skin4', '\"true\"'),
('more_details_button_text', 'start', 'skin4', '{\"ar\":\"Product Detail\",\"en\":\"Product Detail\"}'),
('enable_swap_image', 'start', 'skin4', '\"true\"'),
('show_information_title', 'start', 'skin4', '\"true\"'),
('show_contact', 'start', 'skin4', '\"true\"'),
('social_icon_google_plus', 'start', 'skin4', '\"true\"'),
('social_icon_youtube', 'start', 'skin4', '\"true\"'),
('social_icon_instagram', 'start', 'skin4', '\"true\"'),
('social_icon_pinterest', 'start', 'skin4', '\"true\"'),
('contact_title', 'start', 'skin4', '{\"en\":\"Contact\"}'),
('show_information', 'start', 'skin4', '\"true\"'),
('show_contact_title', 'start', 'skin4', '\"true\"'),
('social_icon_facebook', 'start', 'skin4', '\"true\"'),
('social_icon_twitter', 'start', 'skin4', '\"true\"'),
('show_twitter_footer', 'start', 'skin4', '\"false\"'),
('show_twitter_header', 'start', 'skin4', '\"false\"'),
('show_social_icons', 'start', 'skin4', '\"true\"'),
('show_social_icons_title', 'start', 'skin4', '\"false\"'),
('show_facebook_posts', 'start', 'skin4', '\"false\"'),
('show_twitter_title', 'start', 'skin4', '\"false\"'),
('twitter_transparent_background', 'start', 'skin4', '\"false\"'),
('show_facebook_title', 'start', 'skin4', '\"true\"'),
('show_twitter', 'start', 'skin4', '\"false\"'),
('show_facebook_friend_faces', 'start', 'skin4', '\"true\"'),
('show_facebook', 'start', 'skin4', '\"true\"'),
('newsletter_title', 'start', 'skin4', '{\"en\":\"Newsletter\"}'),
('show_newsletter_title', 'start', 'skin4', '\"false\"'),
('show_newsletter', 'start', 'skin4', '\"true\"'),
('custom_css_file_status', 'start', 'skin4', '\"false\"'),
('show_custom_copyright', 'start', 'skin4', '\"false\"'),
('newsletter_button_text', 'start', 'skin4', '{\"en\":\"SUBSCRIBE\"}'),
('newsletter_input_text', 'start', 'skin4', '{\"en\":\"Enter Your Email Address\"}'),
('newsletter_success_message', 'start', 'skin4', '{\"ar\":\"\",\"en\":\"Thank you for contact us\"}'),
('newsletter_description_text', 'start', 'skin4', '{\"en\":\"Newsletter\"}'),
('social_icon_rss', 'start', 'skin4', '\"true\"'),
('show_payment_icons', 'start', 'skin4', '\"true\"'),
('custom_css_status', 'start', 'skin4', '\"true\"'),
('email_1', 'start', 'skin4', '\"contact@kulerthemes.com\"'),
('custom_copyright', 'start', 'skin4', '{\"ar\":\"\",\"en\":\"\"}'),
('button_select_list', 'start', 'skin4', '\"false\"'),
('custom_js_status', 'start', 'skin4', '\"false\"'),
('link_text_color', 'start', 'skin4', '\"#949494\"'),
('display_product_mode', 'start', 'skin4', '\"list\"'),
('custom_tab_2_title', 'start', 'skin4', '{\"ar\":\"Custom Tab 2\",\"en\":\"Custom Tab 2\"}'),
('layout_style', 'start', 'skin4', '\"full_width\"'),
('mail_service', 'start', 'skin4', '\"mailchimp\"'),
('header_background_color', 'start', 'skin4', '\"rgba(255, 255, 255, 1)\"'),
('maximum_width', 'start', 'skin4', '\"1170px\"'),
('related_products_position', 'start', 'skin4', '\"bottom\"'),
('map_type', 'start', 'skin4', '\"ROADMAP\"'),
('footer_link_color', 'start', 'skin4', '\"#666\"'),
('custom_information', 'start', 'skin4', '{\"ar\":\"\",\"en\":\"Say Hello! Don\'t be shy!\"}'),
('social_icon_twitter_link', 'start', 'skin4', '\"#\"'),
('custom_tab_2_content', 'start', 'skin4', '{\"ar\":\"fsdfsdfsdfsdf\",\"en\":\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"}'),
('mailchimp_api_key', 'start', 'skin4', '\"950e5f5a7b9c2bbe328717079c168fad-us8\"'),
('menu_item_color', 'start', 'skin4', '\"#666\"'),
('menu_font', 'start', 'skin4', '{\"font_family\":\"Varela Round\"}'),
('social_icon_pinterest_link', 'start', 'skin4', '\"#\"'),
('fax_1', 'start', 'skin4', '\"03.989898989\"'),
('footer_heading_color', 'start', 'skin4', '\"#ffffff\"'),
('footer_background_color', 'start', 'skin4', '\"#222\"'),
('footer_link_hover_color', 'start', 'skin4', '\"#fff\"'),
('lens_zoom_shape', 'start', 'skin4', '\"rounded\"'),
('custom_css', 'start', 'skin4', '\"a.button_advanced {\\nborder-radius: 2px;\\n-moz-border-radius: 2px;\\n-webkit-border-radius: 2px;\\ncolor: #fff;\\nbackground: #ff7200;\\ndisplay: inline-block;\\nfont-size: 20px;\\nfont-weight: bold;\\npadding: 8px 15px;\\ntext-decoration: none;\\ntransition: all 0.3s;\\n-moz-transition: all 0.3s;\\n-webkit-transition: all 0.3s;\\n}\\na.button_advanced:hover {\\nbackground: #444;\\n}\"'),
('longitude', 'start', 'skin4', '\"151.209744\"'),
('latitude', 'start', 'skin4', '\"-33.878715\"'),
('topbar_background_color', 'start', 'skin4', '\"#F2F2F2\"'),
('home_icon_type', 'start', 'skin4', '\"icon\"'),
('social_icon_rss_link', 'start', 'skin4', '\"#\"'),
('social_icon_youtube_link', 'start', 'skin4', '\"#\"'),
('social_icon_google_plus_link', 'start', 'skin4', '\"#\"'),
('sub_category_image_size', 'start', 'skin4', '\"80\"'),
('custom_block_content', 'start', 'skin4', '\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"'),
('brand_logo_height', 'start', 'skin4', '\"50\"'),
('social_icon_instagram_link', 'start', 'skin4', '\"http:\\/\\/instagram.com\\/mashable\"'),
('select_category_text', 'start', 'skin4', '{\"ar\":\"\",\"en\":\"Category\"}'),
('show_product_rating', 'start', 'skin1', '\"true\"'),
('show_product_price', 'start', 'skin1', '\"true\"'),
('show_product_description', 'start', 'skin1', '\"true\"'),
('show_wish_list_button', 'start', 'skin1', '\"true\"'),
('show_add_to_cart_button', 'start', 'skin1', '\"true\"'),
('search_field_text', 'start', 'skin1', '{\"ar\":\"\",\"en\":\"Live search products ...\"}'),
('search_in_specific_category', 'start', 'skin1', '\"false\"'),
('custom_tab_2_content', 'start', 'skin1', '{\"ar\":\"fsdfsdfsdfsdf\",\"en\":\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"}'),
('footer_heading_color', 'start', 'skin1', '\"#ffffff\"'),
('footer_background_color', 'start', 'skin1', '\"#222\"'),
('footer_link_color', 'start', 'skin1', '\"#666\"'),
('fixed_header', 'start', 'skin1', '\"true\"'),
('custom_tab_2_title', 'start', 'skin1', '{\"ar\":\"Custom Tab 2\",\"en\":\"Custom Tab 2\"}'),
('live_search_status', 'start', 'skin1', '\"true\"'),
('multi_level_default_menu', 'start', 'skin1', '\"true\"'),
('mobile_menu_title', 'start', 'skin1', '{\"ar\":\"Menu\",\"en\":\"Menu\"}'),
('map_type', 'start', 'skin1', '\"ROADMAP\"'),
('maximum_width', 'start', 'skin1', '\"1170px\"'),
('lens_zoom_shape', 'start', 'skin1', '\"rounded\"'),
('fax_1', 'start', 'skin1', '\"03.989898989\"'),
('latitude', 'start', 'skin1', '\"-33.878715\"'),
('mailchimp_api_key', 'start', 'skin1', '\"950e5f5a7b9c2bbe328717079c168fad-us8\"'),
('related_products_position', 'start', 'skin1', '\"bottom\"'),
('product_image_width', 'start', 'skin1', '\"130\"'),
('zoom_window_height', 'start', 'skin1', '\"300\"'),
('social_icon_youtube_link', 'start', 'skin1', '\"#\"'),
('sub_category_image_size', 'start', 'skin1', '\"80\"'),
('social_icon_instagram_link', 'start', 'skin1', '\"http:\\/\\/instagram.com\\/mashable\"'),
('zoom_window_width', 'start', 'skin1', '\"300\"'),
('search_result_limit', 'start', 'skin1', '\"4\"'),
('related_products_style', 'start', 'skin1', '\"grid\"'),
('header_background_color', 'start', 'skin2', '\"rgba(255, 255, 255, 1)\"'),
('layout_style', 'start', 'skin2', '\"boxed\"'),
('fax_1', 'start', 'skin2', '\"03.989898989\"'),
('body_text_color', 'start', 'skin2', '\"#333\"'),
('body_pattern', 'start', 'skin2', '\"catalog\\/view\\/theme\\/start\\/data\\/patterns\\/stardust.png\"'),
('information_title', 'start', 'skin2', '{\"ar\":\"About us\",\"en\":\"About us\"}'),
('custom_information', 'start', 'skin2', '{\"ar\":\"\",\"en\":\"Say Hello! Don\'t be shy!\"}'),
('custom_tab_2_content', 'start', 'skin2', '{\"ar\":\"fsdfsdfsdfsdf\",\"en\":\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"}'),
('custom_copyright', 'start', 'skin2', '{\"ar\":\"\",\"en\":\"\"}'),
('information_content', 'start', 'skin2', '{\"ar\":\"test\",\"en\":\"<img alt=\\\"\\\" src=\\\"http:\\/\\/demo.kulerthemes.com\\/start\\/1\\/image\\/data\\/demo\\/start\\/cp\\/170x170\\/about.jpg\\\" \\/>\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, dolorem ea id illo illum ipsum labore pariatur temporibus. Enim eveniet molestias, possimus quod rerum tempore. Asperiores laboriosam quis vero voluptatem.<\\/p>\\n<a href=\\\"#\\\">read more<\\/a>\"}'),
('custom_tab_1_title', 'start', 'skin2', '{\"en\":\"Custom tab 1\"}'),
('brand_logo_width', 'start', 'skin2', '\"50\"'),
('custom_block_content', 'start', 'skin2', '\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"'),
('brand_logo_height', 'start', 'skin2', '\"50\"'),
('custom_tab_1_content', 'start', 'skin2', '{\"ar\":\"fsfsdfsdfsdf\",\"en\":\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"}'),
('category_menu_type', 'start', 'skin2', '\"accordion\"'),
('contact_list', 'start', 'skin2', '\"5d5b9f858d\"'),
('select_manufacturer_text', 'start', 'skin2', '{\"en\":\"Manufacturer\"}'),
('notification_show_time', 'start', 'skin2', '\"3000\"'),
('social_icon_facebook_link', 'start', 'skin2', '\"http:\\/\\/facebook.com\\/kulerthemes\"'),
('product_image_height', 'start', 'skin2', '\"150\"'),
('phone_1', 'start', 'skin2', '\"+1.3333.9999\"'),
('body_font', 'start', 'skin2', '{\"font_family\":\"Varela Round\"}'),
('show_twitter', 'start', 'skin3', '\"false\"'),
('show_facebook_posts', 'start', 'skin3', '\"false\"'),
('show_facebook_friend_faces', 'start', 'skin3', '\"false\"'),
('show_facebook_title', 'start', 'skin3', '\"false\"'),
('show_facebook', 'start', 'skin3', '\"false\"'),
('contact_title', 'start', 'skin3', '{\"en\":\"Contact\"}'),
('show_contact_title', 'start', 'skin3', '\"true\"'),
('show_contact', 'start', 'skin3', '\"true\"'),
('show_information', 'start', 'skin3', '\"true\"'),
('show_information_title', 'start', 'skin3', '\"true\"'),
('scroll_up_text', 'start', 'skin3', '{\"ar\":\"Up\",\"en\":\"Up\"}'),
('enable_swap_image', 'start', 'skin3', '\"true\"'),
('enable_scroll_up', 'start', 'skin3', '\"true\"'),
('show_sale_badge', 'start', 'skin3', '\"true\"'),
('more_details_button_text', 'start', 'skin3', '{\"ar\":\"Product Detail\",\"en\":\"Product Detail\"}'),
('view_button_text', 'start', 'skin3', '{\"ar\":\"abc\",\"en\":\"Quick View\"}'),
('show_quick_view', 'start', 'skin3', '\"true\"'),
('show_custom_notification', 'start', 'skin3', '\"true\"'),
('login_popup', 'start', 'skin3', '\"true\"'),
('enable_one_page_checkout', 'start', 'skin3', '\"true\"'),
('show_google_map', 'start', 'skin3', '\"true\"'),
('show_custom_information', 'start', 'skin3', '\"true\"'),
('show_custom_tab_2', 'start', 'skin3', '\"true\"'),
('show_custom_tab_1', 'start', 'skin3', '\"true\"'),
('show_related_products', 'start', 'skin3', '\"true\"'),
('show_custom_block', 'start', 'skin3', '\"true\"'),
('default_sharing', 'start', 'skin3', '\"true\"'),
('image_lightbox', 'start', 'skin3', '\"true\"'),
('show_save_percent', 'start', 'skin3', '\"false\"'),
('show_tax', 'start', 'skin3', '\"false\"'),
('show_number_quantity', 'start', 'skin3', '\"true\"'),
('show_brand_logo', 'start', 'skin3', '\"true\"'),
('sub_categories_image_carousel', 'start', 'skin3', '\"true\"'),
('sub_category_image', 'start', 'skin3', '\"true\"'),
('hide_category_image', 'start', 'skin3', '\"false\"'),
('show_compare_button', 'start', 'skin3', '\"true\"'),
('show_wish_list_button', 'start', 'skin3', '\"true\"'),
('show_add_to_cart_button', 'start', 'skin3', '\"true\"'),
('show_product_rating', 'start', 'skin3', '\"true\"'),
('show_product_price', 'start', 'skin3', '\"true\"'),
('show_product_description', 'start', 'skin3', '\"true\"'),
('show_product_name', 'start', 'skin3', '\"true\"'),
('show_product_image', 'start', 'skin3', '\"true\"'),
('search_in_product_description', 'start', 'skin3', '\"false\"'),
('search_in_specific_manufacturer', 'start', 'skin3', '\"false\"'),
('search_in_specific_category', 'start', 'skin3', '\"false\"'),
('search_field_text', 'start', 'skin3', '{\"ar\":\"\",\"en\":\"Live search products ...\"}'),
('live_search_status', 'start', 'skin3', '\"true\"'),
('multi_level_default_menu', 'start', 'skin3', '\"true\"'),
('mobile_menu_title', 'start', 'skin3', '{\"ar\":\"Menu\",\"en\":\"Menu\"}'),
('fixed_header', 'start', 'skin3', '\"true\"'),
('body_background_color', 'start', 'skin3', '\"#222\"'),
('menu_color', 'start', 'skin3', '\"#fff\"'),
('payment_icons', 'start', 'skin4', '[{\"$$hashKey\":\"04T\",\"image\":\"catalog\\/demo\\/start\\/payment_icons\\/visa.png\",\"link\":\"#\",\"name\":{\"ar\":\"visa\",\"en\":\"visa\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"04Z\",\"image\":\"catalog\\/demo\\/start\\/payment_icons\\/master.png\",\"link\":\"#\",\"name\":{\"ar\":\"master\",\"en\":\"master\"},\"new_tab\":\"true\",\"sort\":\"\"},{\"$$hashKey\":\"040\",\"image\":\"catalog\\/demo\\/start\\/payment_icons\\/amex.png\",\"link\":\"#\",\"name\":{\"ar\":\"american express\",\"en\":\"american express\"},\"new_tab\":\"true\",\"sort\":\"\"}]'),
('related_products_style', 'start', 'skin4', '\"grid\"'),
('body_pattern', 'start', 'skin4', '\"\"'),
('search_result_limit', 'start', 'skin4', '\"4\"'),
('custom_tab_1_title', 'start', 'skin4', '{\"en\":\"Custom tab 1\"}'),
('custom_tab_1_content', 'start', 'skin4', '{\"ar\":\"fsfsdfsdfsdf\",\"en\":\"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\"}'),
('heading_font', 'start', 'skin4', '{\"font_family\":\"Varela Round\"}'),
('image_zoom_type', 'start', 'skin4', '\"outer_cloud\"'),
('notification_show_time', 'start', 'skin4', '\"3000\"'),
('category_menu_type', 'start', 'skin4', '\"accordion\"'),
('brand_logo_width', 'start', 'skin4', '\"50\"'),
('contact_list', 'start', 'skin4', '\"5d5b9f858d\"'),
('body_font', 'start', 'skin4', '{\"font_family\":\"Varela Round\"}'),
('body_bg_color', 'start', 'skin4', '\"#ababab\"'),
('body_text_color', 'start', 'skin4', '\"#333\"'),
('select_manufacturer_text', 'start', 'skin4', '{\"en\":\"Manufacturer\"}'),
('information_content', 'start', 'skin4', '{\"ar\":\"test\",\"en\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, dolorem ea id illo illum ipsum labore pariatur temporibus. Enim eveniet molestias, possimus quod rerum tempore. Asperiores laboriosam quis vero voluptatem.<\\/p>\"}'),
('body_main_color', 'start', 'skin4', '\"#EC6467\"'),
('phone_1', 'start', 'skin4', '\"+1.3333.9999\"'),
('product_description_limit', 'start', 'skin4', '\"120\"'),
('mobile_1', 'start', 'skin4', '\"01.666.777.8989\"'),
('information_title', 'start', 'skin4', '{\"ar\":\"About us\",\"en\":\"About us\"}'),
('product_image_height', 'start', 'skin4', '\"150\"'),
('product_image_width', 'start', 'skin4', '\"130\"'),
('topbar_link_hover_color', 'start', 'skin4', '\"#db2c2c\"'),
('mobile_menu_title', 'start', 'skin4', '{\"ar\":\"Menu\",\"en\":\"Menu\"}'),
('fixed_header', 'start', 'skin4', '\"true\"'),
('body_background_color', 'start', 'skin4', '\"#fff\"'),
('topbar_border_color', 'start', 'skin4', '\"#f2f2f2\"'),
('social_icon_facebook_link', 'start', 'skin4', '\"http:\\/\\/facebook.com\\/kulerthemes\"'),
('zoom_window_width', 'start', 'skin4', '\"300\"'),
('zoom_window_height', 'start', 'skin4', '\"300\"'),
('topbar_text_color', 'start', 'skin4', '\"#999\"'),
('topbar_link_color', 'start', 'skin4', '\"#999\"'),
('facebook_page_id', 'start', 'skin4', '\"kulerthemes\"'),
('facebook_theme', 'start', 'skin4', '\"dark\"'),
('topbar_link_color', 'start', 'skin1', '\"#999\"'),
('select_category_text', 'start', 'skin1', '{\"ar\":\"\",\"en\":\"Category\"}'),
('social_icon_facebook_link', 'start', 'skin1', '\"http:\\/\\/facebook.com\\/kulerthemes\"'),
('social_icon_pinterest_link', 'start', 'skin1', '\"#\"'),
('social_icon_rss_link', 'start', 'skin1', '\"#\"'),
('social_icon_twitter_link', 'start', 'skin1', '\"#\"'),
('product_image_height', 'start', 'skin1', '\"150\"'),
('product_description_limit', 'start', 'skin1', '\"120\"'),
('phone_1', 'start', 'skin1', '\"+1.3333.9999\"'),
('social_icon_google_plus_link', 'start', 'skin1', '\"#\"'),
('body_background_color', 'start', 'skin1', '\"#fff\"');

--
-- TABLE STRUCTURE FOR: oc_kcp_theme
--

DROP TABLE IF EXISTS oc_kcp_theme;

CREATE TABLE `oc_kcp_theme` (
  `theme_id` varchar(64) NOT NULL,
  `version` varchar(10) NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_kcp_theme (`theme_id`, `version`) VALUES
('start', '1.0.0');

--
-- TABLE STRUCTURE FOR: oc_language
--

DROP TABLE IF EXISTS oc_language;

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO oc_language (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 'english', 1, 1),
(2, 'Arabic', 'ar', 'ar_LB', 'lb.png', 'arabic', 'arabic', 2, 1);

--
-- TABLE STRUCTURE FOR: oc_layout
--

DROP TABLE IF EXISTS oc_layout;

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO oc_layout (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'All'),
(13, 'Kuler Blog Manager');

--
-- TABLE STRUCTURE FOR: oc_layout_module
--

DROP TABLE IF EXISTS oc_layout_module;

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

INSERT INTO oc_layout_module (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(105, 1, 'carousel.0', 'content_bottom', 0),
(2, 4, 'carousel.0', 'content_top', 0),
(3, 4, 'banner.0', 'content_top', 1),
(19, 3, 'slideshow.pol3h8iif8j2lnmi', 'column_left', 1),
(8, 6, 'account', 'column_right', 0),
(20, 5, 'category', 'column_left', 2),
(18, 3, 'category', 'column_left', 0),
(81, 12, 'kuler_contact_form.0', 'footer_address', 0),
(110, 1, 'featured.0', 'content_top', 2),
(80, 12, 'kuler_menu', 'kuler_menu', 0),
(111, 1, 'kuler_advanced_html.4', 'content_top', 3),
(109, 1, 'kuler_showcase.1', 'content_top', 2),
(108, 1, 'kuler_showcase.0', 'content_top', 1),
(107, 1, 'kuler_advanced_html.3', 'promotion', 2),
(79, 2, 'category', 'column_left', 0),
(82, 12, 'kuler_advanced_html.1', 'header_extra', 0),
(83, 12, 'kuler_advanced_html.2', 'footer_extra', 0),
(106, 1, 'kuler_layer_slider.0', 'promotion', 0),
(112, 1, 'kbm_mod_recent_article.0', 'content_top', 4),
(113, 13, 'kbm_mod_recent_article.0', 'column_left', 0);

--
-- TABLE STRUCTURE FOR: oc_layout_route
--

DROP TABLE IF EXISTS oc_layout_route;

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

INSERT INTO oc_layout_route (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(64, 1, 0, 'common/home'),
(58, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, 'common/home'),
(45, 5, 0, 'product/manufacturer'),
(46, 5, 0, 'common/home'),
(59, 12, 0, ''),
(71, 13, 0, 'module/kbm/category'),
(70, 13, 0, 'module/kbm'),
(69, 13, 0, 'module/kbm/article');

--
-- TABLE STRUCTURE FOR: oc_length_class
--

DROP TABLE IF EXISTS oc_length_class;

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO oc_length_class (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

--
-- TABLE STRUCTURE FOR: oc_length_class_description
--

DROP TABLE IF EXISTS oc_length_class_description;

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO oc_length_class_description (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in'),
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in');

--
-- TABLE STRUCTURE FOR: oc_location
--

DROP TABLE IF EXISTS oc_location;

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_manufacturer
--

DROP TABLE IF EXISTS oc_manufacturer;

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO oc_manufacturer (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

--
-- TABLE STRUCTURE FOR: oc_manufacturer_to_store
--

DROP TABLE IF EXISTS oc_manufacturer_to_store;

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_manufacturer_to_store (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

--
-- TABLE STRUCTURE FOR: oc_marketing
--

DROP TABLE IF EXISTS oc_marketing;

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_modification
--

DROP TABLE IF EXISTS oc_modification;

CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO oc_modification (`modification_id`, `name`, `author`, `version`, `link`, `code`, `status`, `date_added`) VALUES
(3, 'KulerThemes CP', 'KulerThemes.com', '1.0', 'http://www.kulerthemes.com', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n  <name>KulerThemes CP</name>\r\n  <version>1.0</version>\r\n  <author>KulerThemes.com</author>\r\n  <link>http://www.kulerthemes.com</link>\r\n\r\n  <!-- Override Response -->\r\n	<file path=\"system/library/response.php\">\r\n		<operation>\r\n			<search><![CDATA[if ($this->output) {]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			if (class_exists(\'Kuler\'))\r\n			{\r\n			  $this->output = Kuler::getInstance()->processOutput($this->output);\r\n			}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n\r\n  <file path=\"system/engine/front.php\">\r\n    <operation>\r\n      <search><![CDATA[$this->registry = $registry;]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n      if (!defined(\'DIR_CATALOG\') && defined(\'DIR_IMAGE\')) {\r\n        $this->addPreAction(new Action(\'module/kuler_cp/startup\'));\r\n      }\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n  <file path=\"catalog/controller/module/kuler_cp.php\">\r\n    <operation>\r\n      <search><![CDATA[$this->overrideResponse();]]></search>\r\n      <add position=\"replace\"><![CDATA[]]></add>\r\n    </operation>\r\n  </file>\r\n  <!-- / Override Response -->\r\n\r\n  <!-- All pages layout -->\r\n  <file path=\"catalog/model/design/layout.php\">\r\n    <operation>\r\n      <search><![CDATA[return $query->rows;]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n        $all_layouts_id = $this->model_design_layout->getLayout(\'\');\r\n        if ($all_layouts_id) {\r\n          $all_layouts_query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"layout_module WHERE layout_id = \'\" . (int)$all_layouts_id . \"\' AND position = \'\" . $this->db->escape($position) . \"\' ORDER BY sort_order\");\r\n\r\n          return array_merge($all_layouts_query->rows, $query->rows);\r\n        }      \r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n  <!-- / All pages layout -->\r\n\r\n  <!-- Extra Positions -->\r\n  <file path=\"admin/controller/design/layout.php\">\r\n    <operation>\r\n      <search><![CDATA[$this->response->setOutput($this->load->view(\'design/layout_form.tpl\', $data));]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      $this->load->model(\'kuler/common\');\r\n      $data[\'kuler_extra_positions\'] = $this->model_kuler_common->getPositions();\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n  <file path=\"admin/view/template/design/layout_form.tpl\">\r\n    <operation>\r\n      <search><![CDATA[html += \'    <option value=\"column_right\"><?php echo $text_column_right; ?></option>\';]]></search>\r\n      <add position=\"replace\"><![CDATA[\r\n      html += \'    <option value=\"column_right\"><?php echo $text_column_right; ?> </option>\';\r\n      <?php foreach ($kuler_extra_positions as $position_code => $position_name) { ?>\r\n        html += \'<option value=\"<?php echo $position_code; ?>\"><?php echo $position_name; ?></option>\';\r\n      <?php } ?>\r\n      ]]></add>\r\n    </operation>\r\n    <operation>\r\n      <search><![CDATA[<option value=\"column_right\"><?php echo $text_column_right; ?></option>]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n      <?php } ?>\r\n      <?php foreach ($kuler_extra_positions as $position_code => $position_name) { ?>\r\n        <option value=\"<?php echo $position_code; ?>\"<?php if ($layout_module[\'position\'] == $position_code) echo \' selected=\"selected\"\'; ?>><?php echo $position_name; ?></option>\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n  <!-- / Extra Positions -->\r\n\r\n</modification>', 1, '2014-12-01 02:29:26');

--
-- TABLE STRUCTURE FOR: oc_option
--

DROP TABLE IF EXISTS oc_option;

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO oc_option (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11),
(13, 'select', 10);

--
-- TABLE STRUCTURE FOR: oc_option_description
--

DROP TABLE IF EXISTS oc_option_description;

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_option_description (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 1, 'Select Color'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size'),
(5, 2, 'Select Color'),
(13, 1, 'Select Size'),
(13, 2, 'Select Size');

--
-- TABLE STRUCTURE FOR: oc_option_value
--

DROP TABLE IF EXISTS oc_option_value;

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

INSERT INTO oc_option_value (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(40, 5, '', 2),
(39, 5, '', 1),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3),
(49, 13, '', 0),
(50, 13, '', 0),
(51, 13, '', 0),
(52, 13, '', 0),
(53, 13, '', 0),
(54, 13, '', 0),
(55, 13, '', 0),
(56, 13, '', 0),
(57, 13, '', 0);

--
-- TABLE STRUCTURE FOR: oc_option_value_description
--

DROP TABLE IF EXISTS oc_option_value_description;

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_option_value_description (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(41, 1, 5, 'Green'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(40, 2, 5, 'Blue'),
(40, 1, 5, 'Blue'),
(39, 2, 5, 'Red'),
(39, 1, 5, 'Red'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small'),
(42, 2, 5, 'Yellow'),
(49, 1, 13, '30'),
(49, 2, 13, '30'),
(50, 1, 13, '31'),
(50, 2, 13, '31'),
(51, 1, 13, '32'),
(51, 2, 13, '32'),
(52, 1, 13, '33'),
(52, 2, 13, '33'),
(53, 1, 13, '34'),
(53, 2, 13, '34'),
(54, 1, 13, '35'),
(54, 2, 13, '35'),
(55, 1, 13, 'Small'),
(55, 2, 13, 'Small'),
(56, 1, 13, 'Medium'),
(56, 2, 13, 'Medium'),
(57, 1, 13, 'Large'),
(57, 2, 13, 'Large');

--
-- TABLE STRUCTURE FOR: oc_order
--

DROP TABLE IF EXISTS oc_order;

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO oc_order (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'INV-2013-00', 0, 'Your Store', 'http://demo.kulerthemes.com/start/opencart2/1/', 0, 1, '', '', '', '', '', 'a:0:{}', '', '', '', '', '', '', '', 'Aaland Islands', 244, '', 0, '', 'a:0:{}', 'Cash On Delivery', 'cod', '', '', '', '', '', '', '', 'Aaland Islands', 244, '', 0, '', 'a:0:{}', 'Flat Shipping Rate', 'flat.flat', '', '50.5000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '118.71.153.30', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', 'en,vi;q=0.8', '2014-11-26 01:37:43', '2014-11-26 01:37:43'),
(2, 0, 'INV-2013-00', 0, 'Your Store', 'http://demo.kulerthemes.com/start/opencart2/1/', 0, 1, '', '', '', '', '', 'a:0:{}', '', '', '', '', '', '', '', 'Aaland Islands', 244, '', 0, '', 'a:0:{}', 'Cash On Delivery', 'cod', '', '', '', '', '', '', '', 'Aaland Islands', 244, '', 0, '', 'a:0:{}', 'Flat Shipping Rate', 'flat.flat', '', '93.0000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '118.71.153.30', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', 'en-US,en;q=0.8,es;q=0.6,et;q=0.4,lt;q=0.2,vi;q=0.2,fi;q=0.2,nl;q=0.2,fr;q=0.2,de;q=0.2,ru;q=0.2,pt;q=0.2,sk;q=0.2', '2014-11-26 02:25:50', '2014-11-26 02:25:50'),
(3, 0, 'INV-2013-00', 0, 'Your Store', 'http://demo.kulerthemes.com/start/opencart2/1/', 0, 1, '', '', '', '', '', 'a:0:{}', '', '', '', '', '', '', '', 'Aaland Islands', 244, '', 0, '', 'a:0:{}', 'Cash On Delivery', 'cod', '', '', '', '', '', '', '', 'Aaland Islands', 244, '', 0, '', 'a:0:{}', 'Flat Shipping Rate', 'flat.flat', '', '50.5000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '118.71.153.30', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', 'en,vi;q=0.8', '2014-11-26 20:05:33', '2014-11-26 20:05:33'),
(4, 0, 'INV-2013-00', 0, 'Your Store', 'http://demo.kulerthemes.com/start/opencart2/1/', 0, 1, '', '', '', '', '', 'a:0:{}', '', '', '', '', '', '', '', 'Aaland Islands', 244, '', 0, '', 'a:0:{}', 'Cash On Delivery', 'cod', '', '', '', '', '', '', '', 'Aaland Islands', 244, '', 0, '', 'a:0:{}', 'Flat Shipping Rate', 'flat.flat', '', '53.9900', 0, 0, '0.0000', 0, '', 1, 3, 'EUR', '0.79949999', '118.71.153.30', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', 'en,vi;q=0.8', '2014-11-27 01:52:27', '2014-11-27 01:52:27');

--
-- TABLE STRUCTURE FOR: oc_order_custom_field
--

DROP TABLE IF EXISTS oc_order_custom_field;

CREATE TABLE `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_order_fraud
--

DROP TABLE IF EXISTS oc_order_fraud;

CREATE TABLE `oc_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_order_history
--

DROP TABLE IF EXISTS oc_order_history;

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_order_option
--

DROP TABLE IF EXISTS oc_order_option;

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_order_product
--

DROP TABLE IF EXISTS oc_order_product;

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO oc_order_product (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(2, 1, 106, 'Warehouse Digital Floral Scarf', '468509', 1, '42.5000', '42.5000', '0.0000', 0),
(3, 2, 106, 'Warehouse Digital Floral Scarf', '468509', 2, '42.5000', '85.0000', '0.0000', 0),
(4, 3, 106, 'Warehouse Digital Floral Scarf', '468509', 1, '42.5000', '42.5000', '0.0000', 0),
(6, 4, 104, 'Vila Sleeveless Braid Detail Button Blouse', '485941', 1, '45.9900', '45.9900', '0.0000', 0);

--
-- TABLE STRUCTURE FOR: oc_order_recurring
--

DROP TABLE IF EXISTS oc_order_recurring;

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_order_recurring_transaction
--

DROP TABLE IF EXISTS oc_order_recurring_transaction;

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_order_status
--

DROP TABLE IF EXISTS oc_order_status;

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO oc_order_status (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired'),
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Canceled'),
(5, 2, 'Complete'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(1, 2, 'Pending'),
(16, 2, 'Voided'),
(15, 2, 'Processed'),
(14, 2, 'Expired');

--
-- TABLE STRUCTURE FOR: oc_order_total
--

DROP TABLE IF EXISTS oc_order_total;

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

INSERT INTO oc_order_total (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(8, 1, 'tax', 'Eco Tax (-2.00)', '2.0000', 5),
(7, 1, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(6, 1, 'sub_total', 'Sub-Total', '42.5000', 1),
(9, 1, 'tax', 'VAT (20%)', '1.0000', 5),
(10, 1, 'total', 'Total', '50.5000', 9),
(11, 2, 'sub_total', 'Sub-Total', '85.0000', 1),
(12, 2, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(13, 2, 'tax', 'Eco Tax (-2.00)', '2.0000', 5),
(14, 2, 'tax', 'VAT (20%)', '1.0000', 5),
(15, 2, 'total', 'Total', '93.0000', 9),
(16, 3, 'sub_total', 'Sub-Total', '42.5000', 1),
(17, 3, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(18, 3, 'tax', 'Eco Tax (-2.00)', '2.0000', 5),
(19, 3, 'tax', 'VAT (20%)', '1.0000', 5),
(20, 3, 'total', 'Total', '50.5000', 9),
(28, 4, 'tax', 'Eco Tax (-2.00)', '2.0000', 5),
(27, 4, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(26, 4, 'sub_total', 'Sub-Total', '45.9900', 1),
(29, 4, 'tax', 'VAT (20%)', '1.0000', 5),
(30, 4, 'total', 'Total', '53.9900', 9);

--
-- TABLE STRUCTURE FOR: oc_order_voucher
--

DROP TABLE IF EXISTS oc_order_voucher;

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_pavoslidergroups
--

DROP TABLE IF EXISTS oc_pavoslidergroups;

CREATE TABLE `oc_pavoslidergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO oc_pavoslidergroups (`id`, `title`, `params`) VALUES
(1, 'Layer Slider', 'a:18:{s:5:"title";s:12:"Layer Slider";s:5:"delay";s:4:"6000";s:9:"fullwidth";s:9:"fullwidth";s:5:"width";s:4:"1920";s:6:"height";s:3:"500";s:13:"stop_on_hover";s:1:"1";s:12:"shuffle_mode";s:1:"0";s:11:"shadow_type";s:1:"0";s:14:"show_time_line";s:1:"1";s:18:"time_line_position";s:6:"bottom";s:16:"navigator_arrows";s:16:"verticalcentered";s:14:"navigator_type";s:4:"none";s:14:"show_navigator";s:1:"0";s:20:"hide_navigator_after";s:3:"200";s:15:"thumbnail_width";s:3:"100";s:16:"thumbnail_height";s:2:"50";s:16:"thumbnail_amount";s:1:"5";s:17:"hide_screen_width";s:0:"";}');

--
-- TABLE STRUCTURE FOR: oc_pavosliderlayers
--

DROP TABLE IF EXISTS oc_pavosliderlayers;

CREATE TABLE `oc_pavosliderlayers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `params` text NOT NULL,
  `layersparams` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO oc_pavosliderlayers (`id`, `title`, `parent_id`, `group_id`, `params`, `layersparams`, `image`, `status`, `position`) VALUES
(7, 'slide_02', 0, 1, 'a:19:{s:17:"slider_transition";s:6:"random";s:15:"slider_duration";s:3:"300";s:15:"slider_rotation";s:1:"0";s:11:"slider_link";s:0:"";s:2:"id";s:1:"7";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"slide_02";s:13:"slider_status";s:1:"1";s:11:"slider_slot";s:1:"7";s:12:"slider_delay";s:1:"0";s:18:"slider_enable_link";s:1:"0";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"7";s:12:"slider_image";s:45:"catalog/demo/start/layer_sliders/1920x500.jpg";s:7:"$$delay";i:6000;s:20:"$$slider_image_thumb";s:97:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/1920x500.jpg";}', 'O:8:\"stdClass\":1:{s:6:"layers";a:3:{i:0;a:20:{s:10:"layer_type";s:5:"image";s:13:"layer_caption";s:7:"image 1";s:10:"time_start";s:4:"1484";s:10:"layer_left";s:6:"center";s:9:"layer_top";s:3:"top";s:13:"layer_hoffset";i:0;s:13:"layer_voffset";i:157;s:15:"layer_animation";s:3:"sfl";s:12:"layer_easing";s:16:"Power1.easeInOut";s:11:"layer_split";s:4:"none";s:11:"layer_speed";s:4:"1000";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:14:"layer_endspeed";i:300;s:14:"layer_endsplit";s:4:"none";s:6:"$$hide";b:0;s:13:"layer_content";s:67:"catalog/demo/start/layer_sliders/typo/slider02_start1_object_01.png";s:12:"$$time_range";a:2:{i:0;i:1484;i:1;i:6000;}s:7:"$$thumb";s:119:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/typo/slider02_start1_object_01.png";s:8:"$$active";b:0;}i:1;a:20:{s:10:"layer_type";s:5:"image";s:13:"layer_caption";s:7:"image 2";s:10:"time_start";s:4:"2288";s:10:"layer_left";s:6:"center";s:9:"layer_top";s:3:"top";s:13:"layer_hoffset";i:0;s:13:"layer_voffset";i:232;s:15:"layer_animation";s:3:"sfl";s:12:"layer_easing";s:16:"Power2.easeInOut";s:11:"layer_split";s:4:"none";s:11:"layer_speed";s:4:"1000";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:14:"layer_endspeed";i:300;s:14:"layer_endsplit";s:4:"none";s:6:"$$hide";b:0;s:13:"layer_content";s:67:"catalog/demo/start/layer_sliders/typo/slider02_start1_object_02.png";s:12:"$$time_range";a:2:{i:0;i:2288;i:1;i:6000;}s:7:"$$thumb";s:119:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/typo/slider02_start1_object_02.png";s:8:"$$active";b:0;}i:2;a:20:{s:10:"layer_type";s:5:"image";s:13:"layer_caption";s:7:"image 3";s:10:"time_start";s:4:"3470";s:10:"layer_left";s:6:"center";s:9:"layer_top";s:3:"top";s:13:"layer_hoffset";i:0;s:13:"layer_voffset";i:293;s:15:"layer_animation";s:3:"sft";s:12:"layer_easing";s:13:"Power2.easeIn";s:11:"layer_split";s:4:"none";s:11:"layer_speed";i:300;s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:14:"layer_endspeed";i:300;s:14:"layer_endsplit";s:4:"none";s:6:"$$hide";b:0;s:13:"layer_content";s:67:"catalog/demo/start/layer_sliders/typo/slider02_start1_object_03.png";s:12:"$$time_range";a:2:{i:0;i:3470;i:1;i:6000;}s:7:"$$thumb";s:119:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/typo/slider02_start1_object_03.png";s:8:"$$active";b:1;}}}', 'catalog/demo/start/layer_sliders/1920x500.jpg', 1, 2),
(8, 'slide_03', 0, 1, 'a:19:{s:17:"slider_transition";s:6:"random";s:15:"slider_duration";s:3:"300";s:15:"slider_rotation";s:1:"0";s:11:"slider_link";s:0:"";s:2:"id";s:1:"8";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"slide_03";s:13:"slider_status";s:1:"1";s:11:"slider_slot";s:1:"7";s:12:"slider_delay";s:1:"0";s:18:"slider_enable_link";s:1:"0";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"8";s:12:"slider_image";s:45:"catalog/demo/start/layer_sliders/1920x500.jpg";s:7:"$$delay";i:6000;s:20:"$$slider_image_thumb";s:97:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/1920x500.jpg";}', 'O:8:\"stdClass\":1:{s:6:"layers";a:4:{i:0;a:20:{s:10:"layer_type";s:5:"image";s:13:"layer_caption";s:7:"image 1";s:10:"time_start";s:4:"1119";s:10:"layer_left";s:4:"left";s:9:"layer_top";s:3:"top";s:13:"layer_hoffset";i:1316;s:13:"layer_voffset";i:118;s:15:"layer_animation";s:7:"tp-fade";s:12:"layer_easing";s:16:"Power3.easeInOut";s:11:"layer_split";s:4:"none";s:11:"layer_speed";i:300;s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:14:"layer_endspeed";i:300;s:14:"layer_endsplit";s:4:"none";s:6:"$$hide";b:0;s:13:"layer_content";s:71:"catalog/demo/start/layer_sliders/typo/slider03_start1_object_01.png.png";s:12:"$$time_range";a:2:{i:0;i:1119;i:1;i:6000;}s:7:"$$thumb";s:123:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/typo/slider03_start1_object_01.png.png";s:8:"$$active";b:0;}i:1;a:20:{s:10:"layer_type";s:5:"image";s:13:"layer_caption";s:7:"image 2";s:10:"time_start";s:4:"1970";s:10:"layer_left";s:4:"left";s:9:"layer_top";s:3:"top";s:13:"layer_hoffset";i:1219;s:13:"layer_voffset";i:150;s:15:"layer_animation";s:7:"tp-fade";s:12:"layer_easing";s:16:"Power3.easeInOut";s:11:"layer_split";s:4:"none";s:11:"layer_speed";i:300;s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:14:"layer_endspeed";i:300;s:14:"layer_endsplit";s:4:"none";s:6:"$$hide";b:0;s:13:"layer_content";s:67:"catalog/demo/start/layer_sliders/typo/slider03_start1_object_02.png";s:12:"$$time_range";a:2:{i:0;i:1970;i:1;i:6000;}s:7:"$$thumb";s:119:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/typo/slider03_start1_object_02.png";s:8:"$$active";b:0;}i:2;a:20:{s:10:"layer_type";s:5:"image";s:13:"layer_caption";s:7:"image 3";s:10:"time_start";s:4:"2619";s:10:"layer_left";s:4:"left";s:9:"layer_top";s:3:"top";s:13:"layer_hoffset";i:1270;s:13:"layer_voffset";i:253;s:15:"layer_animation";s:7:"tp-fade";s:12:"layer_easing";s:16:"Power3.easeInOut";s:11:"layer_split";s:4:"none";s:11:"layer_speed";i:300;s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:14:"layer_endspeed";i:300;s:14:"layer_endsplit";s:4:"none";s:6:"$$hide";b:0;s:13:"layer_content";s:71:"catalog/demo/start/layer_sliders/typo/slider03_start1_object_03.png.png";s:12:"$$time_range";a:2:{i:0;i:2619;i:1;i:6000;}s:7:"$$thumb";s:123:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/typo/slider03_start1_object_03.png.png";s:8:"$$active";b:1;}i:3;a:20:{s:10:"layer_type";s:5:"image";s:13:"layer_caption";s:7:"image 4";s:10:"time_start";s:4:"3497";s:10:"layer_left";s:4:"left";s:9:"layer_top";s:3:"top";s:13:"layer_hoffset";i:1201;s:13:"layer_voffset";i:274;s:15:"layer_animation";s:7:"tp-fade";s:12:"layer_easing";s:16:"Power3.easeInOut";s:11:"layer_split";s:4:"none";s:11:"layer_speed";i:300;s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:14:"layer_endspeed";i:300;s:14:"layer_endsplit";s:4:"none";s:6:"$$hide";b:0;s:13:"layer_content";s:71:"catalog/demo/start/layer_sliders/typo/slider03_start1_object_04.png.png";s:12:"$$time_range";a:2:{i:0;i:1200;i:1;i:6000;}s:7:"$$thumb";s:123:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/typo/slider03_start1_object_04.png.png";s:8:"$$active";b:0;}}}', 'catalog/demo/start/layer_sliders/1920x500.jpg', 1, 3),
(6, 'slide_01', 0, 1, 'a:19:{s:17:"slider_transition";s:6:"random";s:15:"slider_duration";s:3:"300";s:15:"slider_rotation";s:1:"0";s:11:"slider_link";s:0:"";s:2:"id";s:1:"6";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"slide_01";s:13:"slider_status";s:1:"1";s:11:"slider_slot";s:1:"7";s:12:"slider_delay";s:1:"0";s:18:"slider_enable_link";s:1:"0";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"6";s:12:"slider_image";s:45:"catalog/demo/start/layer_sliders/1920x500.jpg";s:7:"$$delay";i:6000;s:20:"$$slider_image_thumb";s:97:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/1920x500.jpg";}', 'O:8:\"stdClass\":1:{s:6:"layers";a:2:{i:0;a:20:{s:10:"layer_type";s:5:"image";s:13:"layer_caption";s:7:"image 1";s:10:"time_start";s:4:"1567";s:10:"layer_left";s:6:"center";s:9:"layer_top";s:3:"top";s:13:"layer_hoffset";i:0;s:13:"layer_voffset";s:3:"117";s:15:"layer_animation";s:3:"lfr";s:12:"layer_easing";s:16:"Power3.easeInOut";s:11:"layer_split";s:4:"none";s:11:"layer_speed";s:4:"1000";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:14:"layer_endspeed";i:300;s:14:"layer_endsplit";s:4:"none";s:6:"$$hide";b:0;s:13:"layer_content";s:67:"catalog/demo/start/layer_sliders/typo/slider01_start1_object_01.png";s:12:"$$time_range";a:2:{i:0;i:1567;i:1;i:6000;}s:7:"$$thumb";s:119:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/typo/slider01_start1_object_01.png";s:8:"$$active";b:0;}i:1;a:20:{s:10:"layer_type";s:5:"image";s:13:"layer_caption";s:7:"image 2";s:10:"time_start";s:4:"3376";s:10:"layer_left";s:6:"center";s:9:"layer_top";s:3:"top";s:13:"layer_hoffset";i:0;s:13:"layer_voffset";i:304;s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:12:"Back.easeOut";s:11:"layer_split";s:4:"none";s:11:"layer_speed";s:4:"1000";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:14:"layer_endspeed";i:300;s:14:"layer_endsplit";s:4:"none";s:6:"$$hide";b:0;s:13:"layer_content";s:67:"catalog/demo/start/layer_sliders/typo/slider01_start1_object_02.png";s:12:"$$time_range";a:2:{i:0;i:3376;i:1;i:6000;}s:7:"$$thumb";s:119:"http://demo.kulerthemes.com/start/opencart2/1/image/catalog/demo/start/layer_sliders/typo/slider01_start1_object_02.png";s:8:"$$active";b:1;}}}', 'catalog/demo/start/layer_sliders/1920x500.jpg', 1, 1);

--
-- TABLE STRUCTURE FOR: oc_product
--

DROP TABLE IF EXISTS oc_product;

CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

INSERT INTO oc_product (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(62, '400136', '', '', '', '', '', '', '', 40, 7, 'catalog/demo/start/products/870x1110.jpg', 16, 1, '89.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:06:29', '2014-11-27 01:17:54'),
(63, '471941', '', '', '', '', '', '', '', 45, 7, 'catalog/demo/start/products/870x1110.jpg', 17, 1, '27.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:08:41', '2014-11-27 01:18:11'),
(64, '474111', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '27.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:10:43', '2014-11-27 01:18:34'),
(65, '451919', '', '', '', '', '', '', '', 60, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '40.0000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:12:40', '2014-11-27 01:18:50'),
(54, '457247', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '12.0000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 14:47:24', '2014-11-27 01:15:30'),
(55, '428335', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 25, 1, '120.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 14:49:34', '2014-11-27 01:15:52'),
(56, '381186', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '60.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 14:51:17', '2014-11-27 01:16:13'),
(57, '469914', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '40.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 14:53:28', '2014-11-27 01:16:27'),
(58, '436776', '', '', '', '', '', '', '', 50, 8, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '37.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 14:57:21', '2014-11-27 01:16:53'),
(59, '401413', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '29.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 14:59:34', '2014-11-27 01:17:06'),
(60, '455249', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '38.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:01:52', '2014-11-27 01:17:26'),
(61, '414996', '', '', '', '', '', '', '', 50, 6, 'catalog/demo/start/products/870x1110.jpg', 16, 1, '150.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:04:15', '2014-11-27 01:17:41'),
(50, '456194', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 13, 1, '85.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2014-11-25 14:24:41', '2014-11-27 01:13:56'),
(51, '157564', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 21, 1, '30.0000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 14:27:13', '2014-11-27 01:14:20'),
(52, '2411066262', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 14, 1, '89.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 14:40:54', '2014-11-27 01:14:41'),
(53, '494888', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 15, 1, '50.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2014-11-25 14:44:21', '2014-11-27 01:15:13'),
(66, '403291', '', '', '', '', '', '', '', 50, 6, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '35.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:17:28', '2014-11-27 01:19:03'),
(67, '463233', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '60.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:19:29', '2014-11-27 01:19:17'),
(68, '392936', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '45.6000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:21:34', '2014-11-27 01:19:32'),
(69, '331650', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '28.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:23:27', '2014-11-27 01:19:46'),
(70, '309707', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '150.0000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:29:06', '2014-11-27 01:20:10'),
(71, '462181', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '33.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:30:56', '2014-11-27 01:20:23'),
(72, '444089', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '18.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:33:19', '2014-11-27 01:20:48'),
(73, '430622', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 20, 1, '65.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:35:40', '2014-11-27 01:22:11'),
(74, '462888', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 21, 1, '10.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:37:26', '2014-11-27 01:22:28'),
(75, '469184', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 21, 1, '15.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:41:06', '2014-11-27 01:22:44'),
(76, '441334', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 21, 1, '19.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:43:03', '2014-11-27 01:22:57'),
(77, '446202', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 21, 1, '20.0000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:44:47', '2014-11-27 01:23:25'),
(78, '2014433077', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 22, 1, '130.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:46:41', '0000-00-00 00:00:00'),
(79, '1352561559', '', '', '', '', '', '', '', 40, 7, 'catalog/demo/start/products/870x1110.jpg', 22, 1, '98.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:52:06', '2014-11-27 01:23:54'),
(80, '451232', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 22, 1, '60.0000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:55:00', '2014-11-27 01:24:11'),
(81, '451331', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 22, 1, '35.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:56:40', '2014-11-27 01:24:24'),
(82, '418141', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 23, 1, '90.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 15:58:12', '2014-11-27 01:24:45'),
(83, '503609', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '15.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:00:45', '2014-11-27 01:24:59'),
(84, '457968', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '21.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:06:15', '2014-11-27 01:25:15'),
(85, '455636', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '24.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:10:20', '2014-11-27 01:25:38'),
(86, '514872', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 24, 1, '18.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:15:57', '2014-11-27 01:25:57'),
(87, '431802', '', '', '', '', '', '', '', 30, 6, 'catalog/demo/start/products/870x1110.jpg', 19, 1, '9.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:18:07', '2014-11-27 01:26:20'),
(88, '340271', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '63.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:19:59', '2014-11-27 01:26:35'),
(89, '269921', '', '', '', '', '', '', '', 50, 6, 'catalog/demo/start/products/870x1110.jpg', 26, 1, '60.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2014-11-25 16:21:36', '2014-11-27 01:26:49'),
(90, '475054', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '33.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:26:24', '2014-11-27 01:27:08'),
(91, '484139', '', '', '', '', '', '', '', 30, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '45.6000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:28:10', '2014-11-27 01:27:20'),
(92, '491554', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '22.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:30:19', '2014-11-27 01:27:32'),
(93, '422048', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 18, 1, '22.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:31:58', '2014-11-27 01:27:57'),
(94, '488644', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '45.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:34:24', '2014-11-27 01:28:09'),
(95, '401978', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 27, 1, '87.6000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:38:48', '2014-11-27 01:28:24'),
(96, '444839', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 27, 1, '59.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:41:26', '2014-11-27 01:28:48'),
(97, '495511', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '18.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:43:05', '2014-11-27 01:29:07'),
(98, '482169', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '39.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:44:48', '2014-11-27 01:29:29'),
(99, '414446', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '60.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:46:34', '2014-11-27 01:29:42'),
(100, '154265', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '37.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:48:22', '2014-11-27 01:29:54'),
(101, '443250', '', '', '', '', '', '', '', 50, 6, 'catalog/demo/start/products/870x1110.jpg', 21, 1, '30.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:50:01', '2014-11-27 01:30:19'),
(102, '494561', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '33.0000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:51:47', '2014-11-27 01:30:35'),
(103, '486343', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 12, 1, '24.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:53:36', '2014-11-27 01:30:50'),
(104, '485941', '', '', '', '', '', '', '', 50, 6, 'catalog/demo/start/products/870x1110.jpg', 28, 1, '45.9900', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 4, '2014-11-25 16:55:14', '2014-11-27 01:31:03'),
(105, '474858', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 29, 1, '62.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2014-11-25 16:57:04', '2014-11-27 01:31:17'),
(106, '468509', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 29, 1, '42.5000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 5, '2014-11-25 16:58:31', '2014-11-27 01:31:37'),
(107, '413589', '', '', '', '', '', '', '', 50, 7, 'catalog/demo/start/products/870x1110.jpg', 29, 1, '33.0000', 0, 0, '2014-11-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 13, '2014-11-25 17:00:17', '2014-11-27 01:31:49');

--
-- TABLE STRUCTURE FOR: oc_product_attribute
--

DROP TABLE IF EXISTS oc_product_attribute;

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_product_description
--

DROP TABLE IF EXISTS oc_product_description;

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_product_description (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(57, 1, 'Denim Shirt in Retro Mid Wash', 'Denim shirt by ASOS Collection\r\n\r\nMade from 100% pure cotton \r\nRetro mid-wash denim\r\nButton through fastening\r\nPatch chest pocket\r\nCurved hemline \r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Denim Shirt in Retro Mid Wash', '', ''),
(57, 2, 'Denim Shirt in Retro Mid Wash', 'Denim shirt by ASOS Collection\r\n\r\nMade from 100% pure cotton \r\nRetro mid-wash denim\r\nButton through fastening\r\nPatch chest pocket\r\nCurved hemline \r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Denim Shirt in Retro Mid Wash', '', ''),
(58, 1, 'Denim Shirt In Short Sleeve', 'Shirt by ASOS\r\n\r\nMade from cotton denim\r\nButton down collar\r\nPocket detail to chest\r\nRegular fit\r\nABOUT ASOS BRAND\r\n    Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Denim Shirt In Short Sleeve', '', ''),
(58, 2, 'Denim Shirt In Short Sleeve', 'Shirt by ASOS\r\n\r\nMade from cotton denim\r\nButton down collar\r\nPocket detail to chest\r\nRegular fit\r\nABOUT ASOS BRAND\r\n    Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Denim Shirt In Short Sleeve', '', ''),
(59, 1, 'Denim Shorts In Super Skinny', 'Denim shorts by ASOS\r\n\r\nMade from stretch cotton denim\r\nConcealed fly and button closure\r\nFive pocket set\r\nSuper skinny fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Denim Shorts In Super Skinny', '', ''),
(59, 2, 'Denim Shorts In Super Skinny', 'Denim shorts by ASOS\r\n\r\nMade from stretch cotton denim\r\nConcealed fly and button closure\r\nFive pocket set\r\nSuper skinny fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Denim Shorts In Super Skinny', '', ''),
(51, 2, 'Chino Shorts In Mid Length', 'Backpack by Cheap Monday\r\n\r\nMade from cotton\r\nZip closure\r\nLarge main compartment\r\nAdjustable shoulder straps\r\nABOUT CHEAP MONDAY\r\nKnown for their skinny jeans and their characteristic skull logo, Stockholm based label Cheap Monday channel their slick Scandinavian style to a range of clothing, with everything from check shirts to selvedge denim.', '', 'Chino Shorts In Mid Length', '', ''),
(60, 1, 'Denim Smock Dress with Cap Sleeve in Light Wash', 'Dress by ASOS Collection\r\n\r\nMade from pure cotton denim\r\nBoat neckline\r\nCap shoulders\r\nLoose seam under the bust\r\nRelaxed swing shape\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Denim Smock Dress with Cap Sleeve in Light Wash', '', ''),
(60, 2, 'Denim Smock Dress with Cap Sleeve in Light Wash', 'Dress by ASOS Collection\r\n\r\nMade from pure cotton denim\r\nBoat neckline\r\nCap shoulders\r\nLoose seam under the bust\r\nRelaxed swing shape\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Denim Smock Dress with Cap Sleeve in Light Wash', '', ''),
(50, 1, 'Cheap Monday Zip Backpack', 'Backpack by Cheap Monday\r\n\r\nMade from cotton\r\nZip closure\r\nLarge main compartment\r\nAdjustable shoulder straps\r\nABOUT CHEAP MONDAY\r\nKnown for their skinny jeans and their characteristic skull logo, Stockholm based label Cheap Monday channel their slick Scandinavian style to a range of clothing, with everything from check shirts to selvedge denim.', '', 'Cheap Monday Zip Backpack', '', ''),
(50, 2, 'Cheap Monday Zip Backpack', 'Backpack by Cheap Monday\r\n\r\nMade from cotton\r\nZip closure\r\nLarge main compartment\r\nAdjustable shoulder straps\r\nABOUT CHEAP MONDAY\r\nKnown for their skinny jeans and their characteristic skull logo, Stockholm based label Cheap Monday channel their slick Scandinavian style to a range of clothing, with everything from check shirts to selvedge denim.', '', 'Cheap Monday Zip Backpack', '', ''),
(51, 1, 'Chino Shorts In Mid Length', 'Backpack by Cheap Monday\r\n\r\nMade from cotton\r\nZip closure\r\nLarge main compartment\r\nAdjustable shoulder straps\r\nABOUT CHEAP MONDAY\r\nKnown for their skinny jeans and their characteristic skull logo, Stockholm based label Cheap Monday channel their slick Scandinavian style to a range of clothing, with everything from check shirts to selvedge denim.', '', 'Chino Shorts In Mid Length', '', ''),
(52, 1, 'Converse All Star Hi Foam Mint Better', 'All Star Hi By Converse\r\n\r\nThe iconic basketball style that transcends age and time, this style features a foam mint better wash colourway with lace up front and classic striped white sole.\r\n\r\n- Better wash canvas upper\r\n- Classic rubber toecap and outsole\r\n- All Star branding on midsole and side\r\n\r\n\r\nAbout Converse\r\n\r\nConverse, renowned for their hi-top canvas trainers have become true wardrobe staples. Transcending age, gender and time Converse continue to develop the iconic hi-top trainer with exclusive prints and designer collaborations keeping the original Converse DNA at its heart.', '', 'Converse All Star Hi Foam Mint Better', '', ''),
(52, 2, 'Converse All Star Hi Foam Mint Better', 'All Star Hi By Converse\r\n\r\nThe iconic basketball style that transcends age and time, this style features a foam mint better wash colourway with lace up front and classic striped white sole.\r\n\r\n- Better wash canvas upper\r\n- Classic rubber toecap and outsole\r\n- All Star branding on midsole and side\r\n\r\n\r\nAbout Converse\r\n\r\nConverse, renowned for their hi-top canvas trainers have become true wardrobe staples. Transcending age, gender and time Converse continue to develop the iconic hi-top trainer with exclusive prints and designer collaborations keeping the original Converse DNA at its heart.', '', 'Converse All Star Hi Foam Mint Better', '', ''),
(53, 1, 'Criminal Damage Longline T-Shirt', 'T-shirt by Criminal Damage\r\n\r\nMade from cotton blend\r\nContrast hem panel\r\nSide zip fastening\r\nRegular fit\r\nCRIMINAL DAMAGE\r\n    Established in 1991, East London label Criminal Damage put their unique take on streetwear with their own trend-led influences. From the dark and macabre, to the bright and bold Criminal Damage\'s designers have fun with all-over prints and loud graphics as well as understated classic designs across a line of t-shirts, hoodies and sweatshirts.', '', 'Criminal Damage Longline T-Shirt', '', ''),
(53, 2, 'Criminal Damage Longline T-Shirt', 'T-shirt by Criminal Damage\r\n\r\nMade from cotton blend\r\nContrast hem panel\r\nSide zip fastening\r\nRegular fit\r\nCRIMINAL DAMAGE\r\n    Established in 1991, East London label Criminal Damage put their unique take on streetwear with their own trend-led influences. From the dark and macabre, to the bright and bold Criminal Damage\'s designers have fun with all-over prints and loud graphics as well as understated classic designs across a line of t-shirts, hoodies and sweatshirts.', '', 'Criminal Damage Longline T-Shirt', '', ''),
(54, 1, 'Cropped Boyfriend T-Shirt with Roll Sleeve', 'T-shirt by ASOS Collection\r\n\r\nMade from 100% pure cotton\r\nSoft touch jersey fabric\r\nCrew neckline\r\nRolled sleeves\r\nCropped cut\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Cropped Boyfriend T-Shirt with Roll Sleeve', '', ''),
(54, 2, 'Cropped Boyfriend T-Shirt with Roll Sleeve', 'T-shirt by ASOS Collection\r\n\r\nMade from 100% pure cotton\r\nSoft touch jersey fabric\r\nCrew neckline\r\nRolled sleeves\r\nCropped cut\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Cropped Boyfriend T-Shirt with Roll Sleeve', '', ''),
(55, 1, 'Denim &amp; Supply Super Skinny Jeans', 'Skinny jeans by Denim &amp; Supply by Ralph Lauren\r\n\r\nMade from a cotton rich denim\r\nStretch added for comfort and fit \r\nClassic five pocket styling\r\nLow rise\r\nConcealed zip fly\r\nSkinny fit \r\nABOUT DENIM &amp; SUPPLY BY RALPH LAUREN\r\nWorking a laidback chic aesthetic, Denim &amp; Supply by Ralph Lauren is the latest denim line from the Ralph Lauren family. Taking inspiration from the artist communities of Brooklyn, New York, Denim &amp; Supply by Ralph Lauren teams soft marl t-shirts, bandana print vests and cable knit jumpers with fade-out denim and distressed skinny jeans, to channel a carefree vintage vibe.', '', 'Denim &amp; Supply Super Skinny Jeans', '', ''),
(55, 2, 'Denim &amp; Supply Super Skinny Jeans', 'Skinny jeans by Denim &amp; Supply by Ralph Lauren\r\n\r\nMade from a cotton rich denim\r\nStretch added for comfort and fit \r\nClassic five pocket styling\r\nLow rise\r\nConcealed zip fly\r\nSkinny fit \r\nABOUT DENIM &amp; SUPPLY BY RALPH LAUREN\r\nWorking a laidback chic aesthetic, Denim &amp; Supply by Ralph Lauren is the latest denim line from the Ralph Lauren family. Taking inspiration from the artist communities of Brooklyn, New York, Denim &amp; Supply by Ralph Lauren teams soft marl t-shirts, bandana print vests and cable knit jumpers with fade-out denim and distressed skinny jeans, to channel a carefree vintage vibe.', '', 'Denim &amp; Supply Super Skinny Jeans', '', ''),
(56, 1, 'Denim Jacket With Distressed Effect', 'Denim jacket by ASOS\r\nMade from 100% cotton denim\r\nFour front pockets\r\nDistressed effect \r\nRegular fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Denim Jacket With Distressed Effect', '', ''),
(56, 2, 'Denim Jacket With Distressed Effect', 'Denim jacket by ASOS\r\nMade from 100% cotton denim\r\nFour front pockets\r\nDistressed effect \r\nRegular fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Denim Jacket With Distressed Effect', '', ''),
(61, 1, 'Dr Martens Ali 6-Eye Boots', 'Boots by Dr Martens\r\n\r\n100% leather upper\r\nLace up fastening\r\nHeel pull tab\r\nChunky grip tread\r\nABOUT DR MARTENS\r\nSince its creation in the 1960s, the classic Dr Martens eight eyelet boot was once an iconic footwear choice for punks, skinheads and working class rebels the world over. With technical construction that ensures each shoe or boot is durable, resistant and comfortable; Dr Martens have built a reputation on the exceptional quality of their footwear. Today, Dr Martens has retained its trademark designs but added a fresh, contemporary twist with the addition of coloured soles, soft suedes, bright colours and bold prints.', '', 'Dr Martens Ali 6-Eye Boots', '', ''),
(61, 2, 'Dr Martens Ali 6-Eye Boots', 'Boots by Dr Martens\r\n\r\n100% leather upper\r\nLace up fastening\r\nHeel pull tab\r\nChunky grip tread\r\nABOUT DR MARTENS\r\nSince its creation in the 1960s, the classic Dr Martens eight eyelet boot was once an iconic footwear choice for punks, skinheads and working class rebels the world over. With technical construction that ensures each shoe or boot is durable, resistant and comfortable; Dr Martens have built a reputation on the exceptional quality of their footwear. Today, Dr Martens has retained its trademark designs but added a fresh, contemporary twist with the addition of coloured soles, soft suedes, bright colours and bold prints.', '', 'Dr Martens Ali 6-Eye Boots', '', ''),
(62, 1, 'Dr Martens Silver Packard Heeled Sandal', 'Yasmin sandals by Dr Martens\r\n\r\n100% leather upper\r\nMetallic-look finish\r\nSilver-tone spiked studs\r\nLace front fastening\r\nCut-out detailing\r\nOpen toe design\r\nTapered heel\r\nABOUT DR MARTENS\r\nFrom working class essential to counter-culture icon, Dr Martens\' boots and shoes define generations of rebel style. With classic yellow welt stitching and an air cushioned sole, anti-fashion was indentified in eight holes of Dr Martens\' leather boot. Look to seasonal updates from Liberty\'s prettifying florals, original colour ways and fresh print finishes', '', 'Dr Martens Silver Packard Heeled Sandal', '', ''),
(62, 2, 'Dr Martens Silver Packard Heeled Sandal', 'Yasmin sandals by Dr Martens\r\n\r\n100% leather upper\r\nMetallic-look finish\r\nSilver-tone spiked studs\r\nLace front fastening\r\nCut-out detailing\r\nOpen toe design\r\nTapered heel\r\nABOUT DR MARTENS\r\nFrom working class essential to counter-culture icon, Dr Martens\' boots and shoes define generations of rebel style. With classic yellow welt stitching and an air cushioned sole, anti-fashion was indentified in eight holes of Dr Martens\' leather boot. Look to seasonal updates from Liberty\'s prettifying florals, original colour ways and fresh print finishes', '', 'Dr Martens Silver Packard Heeled Sandal', '', ''),
(63, 1, 'Esprit Short Sleeve Henley In Pique', 'T-shirt by Esprit\r\n\r\nMade from pure 100% cotton\r\nGrandad collar with two button placket\r\nShort sleeves\r\nChest pocket with button\r\nShort sleeves\r\nRegular fit\r\nABOUT ESPRIT\r\nEsprit was founded by Susie and Doug Tompkins from the back of their station wagon in countercultural \'60s San Francisco. From these bohemian beginnings, the label has risen to become an iconic international brand, synonymous with fresh, youthful style. Look to Esprit\'s menswear line for a casual and crisply sporty collection of slim-fit cotton chinos alongside collegiate-style blazers, polo shirts and preppy knitwear.', '', 'Esprit Short Sleeve Henley In Pique', '', ''),
(63, 2, 'Esprit Short Sleeve Henley In Pique', 'T-shirt by Esprit\r\n\r\nMade from pure 100% cotton\r\nGrandad collar with two button placket\r\nShort sleeves\r\nChest pocket with button\r\nShort sleeves\r\nRegular fit\r\nABOUT ESPRIT\r\nEsprit was founded by Susie and Doug Tompkins from the back of their station wagon in countercultural \'60s San Francisco. From these bohemian beginnings, the label has risen to become an iconic international brand, synonymous with fresh, youthful style. Look to Esprit\'s menswear line for a casual and crisply sporty collection of slim-fit cotton chinos alongside collegiate-style blazers, polo shirts and preppy knitwear.', '', 'Esprit Short Sleeve Henley In Pique', '', ''),
(64, 1, 'Exclusive Cross Back Body', 'Body exclusive to the ASOS PETITE collection\r\n\r\nMade from a stretch jersey fabric\r\nScoop neckline \r\nV-shaped back with wrap styling\r\nCut-out detailing\r\nRegular fit\r\nABOUT ASOS PETITE\r\nASOS PETITE brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.', '', 'Exclusive Cross Back Body', '', ''),
(64, 2, 'Exclusive Cross Back Body', 'Body exclusive to the ASOS PETITE collection\r\n\r\nMade from a stretch jersey fabric\r\nScoop neckline \r\nV-shaped back with wrap styling\r\nCut-out detailing\r\nRegular fit\r\nABOUT ASOS PETITE\r\nASOS PETITE brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.', '', 'Exclusive Cross Back Body', '', ''),
(65, 1, 'Fitted Shirt', 'Shirt by ASOS Collection\r\n\r\nMade from 100% pure cotton\r\nBreathable woven fabric\r\nClassic point collar\r\nButton down front\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Fitted Shirt', '', ''),
(65, 2, 'Fitted Shirt', 'Shirt by ASOS Collection\r\n\r\nMade from 100% pure cotton\r\nBreathable woven fabric\r\nClassic point collar\r\nButton down front\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Fitted Shirt', '', ''),
(66, 1, 'High Waist Denim Jeggings in Mid Wash Blue', 'Jeggings by ASOS Collection\r\n\r\nMade from from a stretch cotton denim\r\nStretch added for comfort and fit\r\nHigh waisted design\r\nButtoned top with a concealed zip fly\r\nPatch pockets to the reverse \r\nFlattering tube shape\r\nSuper skinny fit\r\nABOUT ASOS COLLECTION\r\n    Directional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'High Waist Denim Jeggings in Mid Wash Blue', '', ''),
(66, 2, 'High Waist Denim Jeggings in Mid Wash Blue', 'Jeggings by ASOS Collection\r\n\r\nMade from from a stretch cotton denim\r\nStretch added for comfort and fit\r\nHigh waisted design\r\nButtoned top with a concealed zip fly\r\nPatch pockets to the reverse \r\nFlattering tube shape\r\nSuper skinny fit\r\nABOUT ASOS COLLECTION\r\n    Directional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'High Waist Denim Jeggings in Mid Wash Blue', '', ''),
(67, 1, 'Irish Linen Shirt In Long Sleeve', 'Shirt by ASOS\r\n\r\nMade from pure 100% linen\r\nPoint collar\r\nButton fastening\r\nChest pocket\r\nFull length sleeves\r\nRegular fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Irish Linen Shirt In Long Sleeve', '', ''),
(67, 2, 'Irish Linen Shirt In Long Sleeve', 'Shirt by ASOS\r\n\r\nMade from pure 100% linen\r\nPoint collar\r\nButton fastening\r\nChest pocket\r\nFull length sleeves\r\nRegular fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Irish Linen Shirt In Long Sleeve', '', ''),
(68, 1, 'Jameson Low Rise Denim Jeggings', 'Jeggings by ASOS Collection\r\n\r\nMade from 100%cotton denim\r\nLow rise, stretch waist\r\nFaux front pockets \r\nBack patch pockets\r\nSkinny fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Jameson Low Rise Denim Jeggings', '', ''),
(68, 2, 'Jameson Low Rise Denim Jeggings', 'Jeggings by ASOS Collection\r\n\r\nMade from 100%cotton denim\r\nLow rise, stretch waist\r\nFaux front pockets \r\nBack patch pockets\r\nSkinny fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Jameson Low Rise Denim Jeggings', '', ''),
(69, 1, 'Jersey Shorts', 'Shorts by ASOS\r\n\r\nMade from cotton jersey\r\nAdjustable drawcords to waist\r\nSide seam pockets\r\nPatch pocket to reverse\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Jersey Shorts', '', ''),
(69, 2, 'Jersey Shorts', 'Shorts by ASOS\r\n\r\nMade from cotton jersey\r\nAdjustable drawcords to waist\r\nSide seam pockets\r\nPatch pocket to reverse\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Jersey Shorts', '', ''),
(70, 1, 'Leather Biker Jacket', 'Leather jacket by ASOS\r\n\r\nMade from a soft leather\r\nClassic point collar\r\nZipped front and cuffs\r\nJetted side pockets\r\nWaist cinchers to sides\r\nRegular fit\r\nABOUT ASOS BRAND\r\n     Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Leather Biker Jacket', '', ''),
(70, 2, 'Leather Biker Jacket', 'Leather jacket by ASOS\r\n\r\nMade from a soft leather\r\nClassic point collar\r\nZipped front and cuffs\r\nJetted side pockets\r\nWaist cinchers to sides\r\nRegular fit\r\nABOUT ASOS BRAND\r\n     Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Leather Biker Jacket', '', ''),
(71, 1, 'Long Sleeve Polo With Cut And Sew Panels', 'Polo shirt by ASOS\r\n\r\nMade from a cotton blend\r\nCut and sew panel detail\r\nPolo collar and button placket\r\nRegular fit\r\nABOUT ASOS BRAND\r\n    Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Long Sleeve Polo With Cut And Sew Panels', '', ''),
(71, 2, 'Long Sleeve Polo With Cut And Sew Panels', 'Polo shirt by ASOS\r\n\r\nMade from a cotton blend\r\nCut and sew panel detail\r\nPolo collar and button placket\r\nRegular fit\r\nABOUT ASOS BRAND\r\n    Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Long Sleeve Polo With Cut And Sew Panels', '', ''),
(72, 1, 'Long Sleeve T-Shirt With V Neck', 'T-shirt by ASOS\r\n\r\nMade from 100% pure cotton\r\nSoft touch jersey fabric\r\nStepped hem\r\nRegular fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Long Sleeve T-Shirt With V Neck', '', ''),
(72, 2, 'Long Sleeve T-Shirt With V Neck', 'T-shirt by ASOS\r\n\r\nMade from 100% pure cotton\r\nSoft touch jersey fabric\r\nStepped hem\r\nRegular fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Long Sleeve T-Shirt With V Neck', '', ''),
(73, 1, 'Minkpink Cottonfields Crochet Top', 'Top by Minkpink\r\n\r\nMade from 100% cotton\r\nSnooped neckline\r\nSpaghetti straps \r\nCross detail with self-tie on reverse\r\nDrawstring at front\r\nCropped cut\r\nRegular fit\r\nABOUT MINKPINK\r\nRenowned for a laidback, vintage inspired aesthetic; Australian label Minkpink channel a trend-led, directional approach, with an eclectic, rock and roll vibe. Expect a collection of distinctive dresses, unique jersey separates and statement jackets, all with Minkpink\'s signature prints and undone cool.', '', 'Minkpink Cottonfields Crochet Top', '', ''),
(73, 2, 'Minkpink Cottonfields Crochet Top', 'Top by Minkpink\r\n\r\nMade from 100% cotton\r\nSnooped neckline\r\nSpaghetti straps \r\nCross detail with self-tie on reverse\r\nDrawstring at front\r\nCropped cut\r\nRegular fit\r\nABOUT MINKPINK\r\nRenowned for a laidback, vintage inspired aesthetic; Australian label Minkpink channel a trend-led, directional approach, with an eclectic, rock and roll vibe. Expect a collection of distinctive dresses, unique jersey separates and statement jackets, all with Minkpink\'s signature prints and undone cool.', '', 'Minkpink Cottonfields Crochet Top', '', ''),
(74, 1, 'New Look Double Strap Cami', 'Top by New Look\r\nMade from a premium modal jersey blend\r\n\r\nSuper soft smooth touch\r\nScoop neckline\r\nRacer cut to the back\r\nCurved, split hem\r\nRegular fit\r\nABOUT NEW LOOK\r\n    Offering irresistible fashion and fast off the catwalk styles, New Look joins the ASOS round up of great British high street brands. Bringing forth their award-winning clothing collection of dresses, jeans and jersey basics alongside a punchy edit of accessories. Go glam with skater and bodycon dresses or keep casual with high waisted jeans and biker boots.', '', 'New Look Double Strap Cami', '', ''),
(74, 2, 'New Look Double Strap Cami', 'Top by New Look\r\nMade from a premium modal jersey blend\r\n\r\nSuper soft smooth touch\r\nScoop neckline\r\nRacer cut to the back\r\nCurved, split hem\r\nRegular fit\r\nABOUT NEW LOOK\r\n    Offering irresistible fashion and fast off the catwalk styles, New Look joins the ASOS round up of great British high street brands. Bringing forth their award-winning clothing collection of dresses, jeans and jersey basics alongside a punchy edit of accessories. Go glam with skater and bodycon dresses or keep casual with high waisted jeans and biker boots.', '', 'New Look Double Strap Cami', '', ''),
(75, 1, 'New Look Gathered Waist Skater Dress', 'Skater dress by New Look\r\n\r\nMade from stretch cotton jersey\r\nBreathable soft touch fabric\r\nScoop neckline\r\nFit and flare shape\r\nABOUT NEW LOOK\r\nOffering irresistible fashion and fast off the catwalk styles, New Look joins the ASOS round up of great British high street brands. Bringing forth their award-winning clothing collection of dresses, jeans and jersey basics alongside a punchy edit of accessories. Go glam with skater and bodycon dresses or keep casual with high waisted jeans and biker boots.', '', 'New Look Gathered Waist Skater Dress', '', ''),
(75, 2, 'New Look Gathered Waist Skater Dress', 'Skater dress by New Look\r\n\r\nMade from stretch cotton jersey\r\nBreathable soft touch fabric\r\nScoop neckline\r\nFit and flare shape\r\nABOUT NEW LOOK\r\nOffering irresistible fashion and fast off the catwalk styles, New Look joins the ASOS round up of great British high street brands. Bringing forth their award-winning clothing collection of dresses, jeans and jersey basics alongside a punchy edit of accessories. Go glam with skater and bodycon dresses or keep casual with high waisted jeans and biker boots.', '', 'New Look Gathered Waist Skater Dress', '', ''),
(76, 1, 'New Look Oxford Shirt with Long Sleeves', 'Shirt by New Look\r\n\r\nMade from cotton chambray\r\nShirt collar and button fastening\r\nShaped hem\r\nRegular fit\r\nABOUT NEW LOOK\r\nNew Look joins the ASOS round up of great British high street brands, showcasing the best in upcoming style and staying ahead of the game. From graphic print t-shirts, through to footwear and accessories, New Look\'s menswear collection takes influences from classic rebel movies and the best of effortless style.', '', 'New Look Oxford Shirt with Long Sleeves', '', ''),
(76, 2, 'New Look Oxford Shirt with Long Sleeves', 'Shirt by New Look\r\n\r\nMade from cotton chambray\r\nShirt collar and button fastening\r\nShaped hem\r\nRegular fit\r\nABOUT NEW LOOK\r\nNew Look joins the ASOS round up of great British high street brands, showcasing the best in upcoming style and staying ahead of the game. From graphic print t-shirts, through to footwear and accessories, New Look\'s menswear collection takes influences from classic rebel movies and the best of effortless style.', '', 'New Look Oxford Shirt with Long Sleeves', '', ''),
(77, 1, 'New Look Polo Shirt in Stripe', 'T-shirt by New Look\r\n\r\nMade from a cotton blend\r\nFour button placket\r\nChest patch pocket\r\nStriped pattern throughout\r\nRegular fit\r\nABOUT NEW LOOK\r\nNew Look joins the ASOS round up of great British high street brands, showcasing the best in upcoming style and staying ahead of the game. From graphic print t-shirts, through to footwear and accessories, New Look\'s menswear collection takes influences from classic rebel movies and the best of effortless style.', '', 'New Look Polo Shirt in Stripe', '', ''),
(77, 2, 'New Look Polo Shirt in Stripe', 'T-shirt by New Look\r\n\r\nMade from a cotton blend\r\nFour button placket\r\nChest patch pocket\r\nStriped pattern throughout\r\nRegular fit\r\nABOUT NEW LOOK\r\nNew Look joins the ASOS round up of great British high street brands, showcasing the best in upcoming style and staying ahead of the game. From graphic print t-shirts, through to footwear and accessories, New Look\'s menswear collection takes influences from classic rebel movies and the best of effortless style.', '', 'New Look Polo Shirt in Stripe', '', ''),
(78, 1, 'Nike Air Max 1', '&lt;p style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13.3333330154419px; line-height: 20.8000011444092px;&quot;&gt;&lt;strong&gt;Air Max 1 by Nike&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13.3333330154419px; line-height: 20.8000011444092px;&quot;&gt;- Running silhouette&lt;br&gt;- Pure platinum, navy and silver colourway&lt;br&gt;- Leather and mesh upper&lt;br&gt;- Visible Air Sole unit&lt;br&gt;- Rubber outsole with Waffle pattern for traction&lt;br&gt;&lt;strong&gt;- Half sizes available in this style&lt;/strong&gt;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13.3333330154419px; line-height: 20.8000011444092px;&quot;&gt;&lt;strong&gt;About Air Max 1&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13.3333330154419px; line-height: 20.8000011444092px;&quot;&gt;First released in 1987, the&amp;nbsp;&lt;strong&gt;Air Max 1&lt;/strong&gt;&amp;nbsp;was the first shoe to display Nike’s revolutionary Air-Sole unit in the heel, proving seeing was believing with this lightweight and cushioned model. Made from premium materials in a variety of colourways for style and durability the&amp;nbsp;&lt;strong&gt;Air Max 1&lt;/strong&gt;&amp;nbsp;trainer is a classic that continues to evolve.&lt;/p&gt;', '', 'Nike Air Max 1', '', ''),
(78, 2, 'Nike Air Max 1', '&lt;p style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13.3333330154419px; line-height: 20.8000011444092px;&quot;&gt;&lt;strong&gt;Air Max 1 by Nike&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13.3333330154419px; line-height: 20.8000011444092px;&quot;&gt;- Running silhouette&lt;br&gt;- Pure platinum, navy and silver colourway&lt;br&gt;- Leather and mesh upper&lt;br&gt;- Visible Air Sole unit&lt;br&gt;- Rubber outsole with Waffle pattern for traction&lt;br&gt;&lt;strong&gt;- Half sizes available in this style&lt;/strong&gt;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13.3333330154419px; line-height: 20.8000011444092px;&quot;&gt;&lt;strong&gt;About Air Max 1&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: sans-serif, Arial, Verdana, \'Trebuchet MS\'; font-size: 13.3333330154419px; line-height: 20.8000011444092px;&quot;&gt;First released in 1987, the&amp;nbsp;&lt;strong&gt;Air Max 1&lt;/strong&gt;&amp;nbsp;was the first shoe to display Nike’s revolutionary Air-Sole unit in the heel, proving seeing was believing with this lightweight and cushioned model. Made from premium materials in a variety of colourways for style and durability the&amp;nbsp;&lt;strong&gt;Air Max 1&lt;/strong&gt;&amp;nbsp;trainer is a classic that continues to evolve.&lt;/p&gt;', '', 'Nike Air Max 1', '', ''),
(79, 1, 'Nike Air Max Thea', 'The Nike Air Max Thea is a new addition to the Air Max family, a hybrid mix of Air Max and the minimalist Roshe Run. This style is featured here in a orange and bright magenta colourway, the upper is a mix of engineered mesh for ultimate breathability and simplistic Hyperfuse panels. This is all sat atop a white EVA midsole with the visible AirSole unit, a perfect twist of comfort and style.\r\n\r\n- Half sizes available in this style', '', 'Nike Air Max Thea', '', ''),
(79, 2, 'Nike Air Max Thea', 'The Nike Air Max Thea is a new addition to the Air Max family, a hybrid mix of Air Max and the minimalist Roshe Run. This style is featured here in a orange and bright magenta colourway, the upper is a mix of engineered mesh for ultimate breathability and simplistic Hyperfuse panels. This is all sat atop a white EVA midsole with the visible AirSole unit, a perfect twist of comfort and style.\r\n\r\n- Half sizes available in this style', '', 'Nike Air Max Thea', '', ''),
(80, 1, 'Nike Long Basketball Shorts', 'Shorts by Nike\r\n\r\nMade from  jersey\r\nShirred waist with custom drawcords\r\nSide seam pockets\r\nBranded logo print\r\nABOUT NIKE\r\nBack in 1971 Blue Ribbons Sports introduced the concept of the Greek Goddess of Victory - Nike. Founded a year later in 1972, Nike have a long and esteemed history of creating functional yet stylish sportswear, covering everything from retro styles, to forward thinking pieces that use the latest innovations in sports technology.', '', 'Nike Long Basketball Shorts', '', ''),
(80, 2, 'Nike Long Basketball Shorts', 'Shorts by Nike\r\n\r\nMade from  jersey\r\nShirred waist with custom drawcords\r\nSide seam pockets\r\nBranded logo print\r\nABOUT NIKE\r\nBack in 1971 Blue Ribbons Sports introduced the concept of the Greek Goddess of Victory - Nike. Founded a year later in 1972, Nike have a long and esteemed history of creating functional yet stylish sportswear, covering everything from retro styles, to forward thinking pieces that use the latest innovations in sports technology.', '', 'Nike Long Basketball Shorts', '', ''),
(81, 1, 'Nike SB Icon Lizard T-Shirt', 'T-shirt by Nike Skateboarding\r\n\r\nMade from a cotton rich fabric\r\nBreathable jersey fabric\r\nLarge print on chest\r\nRegular fit\r\nABOUT NIKE SKATEBOARDING\r\nBalancing premium style and unmatched innovation, Nike Skateboarding is committed to inspiring and supporting the world of skateboarding. With their own pro skate team lead by their signature athlete Paul Rodriguez, Nike Skateboarding produce a line of trainers and apparel, releasing classic Dunk low skate trainers in refreshed colourways alongside their newest signature styles.', '', 'Nike SB Icon Lizard T-Shirt', '', ''),
(81, 2, 'Nike SB Icon Lizard T-Shirt', 'T-shirt by Nike Skateboarding\r\n\r\nMade from a cotton rich fabric\r\nBreathable jersey fabric\r\nLarge print on chest\r\nRegular fit\r\nABOUT NIKE SKATEBOARDING\r\nBalancing premium style and unmatched innovation, Nike Skateboarding is committed to inspiring and supporting the world of skateboarding. With their own pro skate team lead by their signature athlete Paul Rodriguez, Nike Skateboarding produce a line of trainers and apparel, releasing classic Dunk low skate trainers in refreshed colourways alongside their newest signature styles.', '', 'Nike SB Icon Lizard T-Shirt', '', ''),
(82, 1, 'Penfield Shorts with Palm Flower Print', 'Shorts by Penfield\r\n\r\nMade from cotton\r\nSide slant pockets\r\nFlower print pattern\r\nStraight fit\r\nABOUT PENFIELD\r\n    Designed to withstand the demands of the New England climate, Penfield jackets and accessories place a strong emphasis on quality and style. Established in Massachusetts in 1975 the label have a rich history within the area of outdoor clothing, with fashion, function and durability all playing key roles in Penfield\'s aesthetic.', '', 'Penfield Shorts with Palm Flower Print', '', ''),
(82, 2, 'Penfield Shorts with Palm Flower Print', 'Shorts by Penfield\r\n\r\nMade from cotton\r\nSide slant pockets\r\nFlower print pattern\r\nStraight fit\r\nABOUT PENFIELD\r\n    Designed to withstand the demands of the New England climate, Penfield jackets and accessories place a strong emphasis on quality and style. Established in Massachusetts in 1975 the label have a rich history within the area of outdoor clothing, with fashion, function and durability all playing key roles in Penfield\'s aesthetic.', '', 'Penfield Shorts with Palm Flower Print', '', ''),
(83, 1, 'PETITE Exclusive Rib Crop Top', 'Top exclusive to the ASOS PETITE collection\r\n\r\nMade from a stretch cotton jersey\r\nRibbed knit throughout\r\nScoop neckline\r\nCropped fit\r\nABOUT ASOS PETITE\r\n    ASOS PETITE brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.', '', 'PETITE Exclusive Rib Crop Top', '', ''),
(83, 2, 'PETITE Exclusive Rib Crop Top', 'Top exclusive to the ASOS PETITE collection\r\n\r\nMade from a stretch cotton jersey\r\nRibbed knit throughout\r\nScoop neckline\r\nCropped fit\r\nABOUT ASOS PETITE\r\n    ASOS PETITE brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.', '', 'PETITE Exclusive Rib Crop Top', '', ''),
(84, 1, 'Polo In England Football Colours', 'Polo shirt by ASOS\r\n\r\nMade from pure 100% cotton\r\nPolo neck\r\nThree button placket\r\nShort sleeves\r\nRegular fit \r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Polo In England Football Colours', '', ''),
(84, 2, 'Polo In England Football Colours', 'Polo shirt by ASOS\r\n\r\nMade from pure 100% cotton\r\nPolo neck\r\nThree button placket\r\nShort sleeves\r\nRegular fit \r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Polo In England Football Colours', '', ''),
(85, 1, 'Polo With Palm Tree Printed Collar &amp; Cuffs', 'Polo shirt by ASOS\r\n\r\nMade from pure 100% cotton\r\nPrinted design on collar and cuffs\r\nSide slits for ease of movement\r\nRibbed cuffs to stop stretching\r\nExtended tail to prevent shirt coming loose\r\nRegular fit\r\nABOUT ASOS BRAND\r\n    Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Polo With Palm Tree Printed Collar &amp; Cuffs', '', ''),
(85, 2, 'Polo With Palm Tree Printed Collar &amp; Cuffs', 'Polo shirt by ASOS\r\n\r\nMade from pure 100% cotton\r\nPrinted design on collar and cuffs\r\nSide slits for ease of movement\r\nRibbed cuffs to stop stretching\r\nExtended tail to prevent shirt coming loose\r\nRegular fit\r\nABOUT ASOS BRAND\r\n    Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Polo With Palm Tree Printed Collar &amp; Cuffs', '', ''),
(86, 1, 'Pull&amp;Bear T-Shirt with Brooklyn Print', 'T-shirt by Pull&amp;Bear\r\n\r\nMade from cotton\r\nBreathable jersey fabric\r\nLarge print on chest\r\nRegular fit\r\nABOUT PULL&amp;BEAR\r\nBorn in the ‘90s, Pull&amp;Bear aren’t ones to suffer stereotypes. With a big nod to street style, Pull&amp;Bear opt into a laidback, easy-wearing aesthetic, where age isn’t an obstacle. Sweatshirts, t-shirts and jeans make up their core collection alongside a sharper line of accessories, indigo denim and biker jackets.', '', 'Pull&amp;Bear T-Shirt with Brooklyn Print', '', ''),
(86, 2, 'Pull&amp;Bear T-Shirt with Brooklyn Print', 'T-shirt by Pull&amp;Bear\r\n\r\nMade from cotton\r\nBreathable jersey fabric\r\nLarge print on chest\r\nRegular fit\r\nABOUT PULL&amp;BEAR\r\nBorn in the ‘90s, Pull&amp;Bear aren’t ones to suffer stereotypes. With a big nod to street style, Pull&amp;Bear opt into a laidback, easy-wearing aesthetic, where age isn’t an obstacle. Sweatshirts, t-shirts and jeans make up their core collection alongside a sharper line of accessories, indigo denim and biker jackets.', '', 'Pull&amp;Bear T-Shirt with Brooklyn Print', '', ''),
(87, 1, 'Rib Collar Tank Top', 'Top by JDY\r\n\r\nMade from a cotton-rich fabric mix\r\nSoft touch jersey fabric\r\nRound neckline with rib collar\r\nRegular fit\r\nABOUT JDY\r\n    Part of the Only family, JDY put a whole new spin on wardrobe basics. Always hot on the heels of the latest trends, JDY mix and match cool prints and strong colours across a collection of super-soft jersey, low-key sweatshirts and denim jeans.', '', 'Rib Collar Tank Top', '', ''),
(87, 2, 'Rib Collar Tank Top', 'Top by JDY\r\n\r\nMade from a cotton-rich fabric mix\r\nSoft touch jersey fabric\r\nRound neckline with rib collar\r\nRegular fit\r\nABOUT JDY\r\n    Part of the Only family, JDY put a whole new spin on wardrobe basics. Always hot on the heels of the latest trends, JDY mix and match cool prints and strong colours across a collection of super-soft jersey, low-key sweatshirts and denim jeans.', '', 'Rib Collar Tank Top', '', ''),
(88, 1, 'Rivington High Waist Denim Jeggings', 'Jeggings by ASOS Collection\r\n\r\nMade from stretch cotton denim\r\nStretch added for comfort and fit\r\nFlattering high rise, concealed fly\r\nPatch pockets\r\nSkinny fit\r\nABOUT ASOS COLLECTION\r\n    Directional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Rivington High Waist Denim Jeggings', '', ''),
(88, 2, 'Rivington High Waist Denim Jeggings', 'Jeggings by ASOS Collection\r\n\r\nMade from stretch cotton denim\r\nStretch added for comfort and fit\r\nFlattering high rise, concealed fly\r\nPatch pockets\r\nSkinny fit\r\nABOUT ASOS COLLECTION\r\n    Directional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Rivington High Waist Denim Jeggings', '', ''),
(89, 1, 'Selected Shorts In Mesh', 'Shorts by Selected\r\n\r\nMade from a mesh fabric\r\nShirred waistband\r\nSide slant pockets\r\nRegular rise\r\nLoose fit\r\nRounded hem\r\nABOUT SELECTED\r\nFirst launched in 1997, Selected now has a strong and respected foothold in men\'s fashion worldwide with a presence in 25 countries across the globe. Still continuing to stand at the forefront of men\'s fashion; Selected specialises in raw and simple designs that are never obviously trend-driven, but always edgy, elegant and masculine with focus on attention to detail.', '', 'Selected Shorts In Mesh', '', ''),
(89, 2, 'Selected Shorts In Mesh', 'Shorts by Selected\r\n\r\nMade from a mesh fabric\r\nShirred waistband\r\nSide slant pockets\r\nRegular rise\r\nLoose fit\r\nRounded hem\r\nABOUT SELECTED\r\nFirst launched in 1997, Selected now has a strong and respected foothold in men\'s fashion worldwide with a presence in 25 countries across the globe. Still continuing to stand at the forefront of men\'s fashion; Selected specialises in raw and simple designs that are never obviously trend-driven, but always edgy, elegant and masculine with focus on attention to detail.', '', 'Selected Shorts In Mesh', '', ''),
(90, 1, 'Shirt In Short Sleeve With Dip Dye', 'Short sleeve shirt by ASOS\r\n\r\nMade from cotton\r\nChest patch pocket\r\nDip dye pattern\r\nRegular fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Shirt In Short Sleeve With Dip Dye', '', ''),
(90, 2, 'Shirt In Short Sleeve With Dip Dye', 'Short sleeve shirt by ASOS\r\n\r\nMade from cotton\r\nChest patch pocket\r\nDip dye pattern\r\nRegular fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Shirt In Short Sleeve With Dip Dye', '', ''),
(91, 1, 'Short Sleeve Hi Lo Peplum Top', 'Top by ASOS PETITE\r\n\r\nMade from a breathable woven fabric\r\nCrew neckline\r\nPeplum hem\r\nButton keyhole back\r\nRegular fit\r\nABOUT ASOS PETITE\r\n     ASOS PETITE brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.', '', 'Short Sleeve Hi Lo Peplum Top', '', ''),
(91, 2, 'Short Sleeve Hi Lo Peplum Top', 'Top by ASOS PETITE\r\n\r\nMade from a breathable woven fabric\r\nCrew neckline\r\nPeplum hem\r\nButton keyhole back\r\nRegular fit\r\nABOUT ASOS PETITE\r\n     ASOS PETITE brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.', '', 'Short Sleeve Hi Lo Peplum Top', '', ''),
(92, 1, 'Smart Shirt In Short Sleeve', 'Smart shirt by ASOS\r\n\r\nMade from a cotton blend\r\nClassic placket\r\nRegular fit\r\nClick here to shop our range of cufflinks.\r\nABOUT ASOS BRAND\r\n    Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Smart Shirt In Short Sleeve', '', ''),
(92, 2, 'Smart Shirt In Short Sleeve', 'Smart shirt by ASOS\r\n\r\nMade from a cotton blend\r\nClassic placket\r\nRegular fit\r\nClick here to shop our range of cufflinks.\r\nABOUT ASOS BRAND\r\n    Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Smart Shirt In Short Sleeve', '', ''),
(93, 1, 'Straw Fedora Hat With Skinny Band', 'Fedora hat by ASOS Collection\r\n\r\nMade from straw\r\nPinched grown\r\nGrosgrain ribbon trim\r\nWide brim\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Straw Fedora Hat With Skinny Band', '', ''),
(93, 2, 'Straw Fedora Hat With Skinny Band', 'Fedora hat by ASOS Collection\r\n\r\nMade from straw\r\nPinched grown\r\nGrosgrain ribbon trim\r\nWide brim\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Straw Fedora Hat With Skinny Band', '', ''),
(94, 1, 'Stripe Oversize Shirt', 'Shirt by ASOS Collection\r\n\r\nMade from 100% cotton\r\nBreathable woven fabric \r\nClassic point collar\r\nButton placket to front\r\nCuffing detail to sleeves\r\nPinstripe pattern\r\nOversize style\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Stripe Oversize Shirt', '', ''),
(94, 2, 'Stripe Oversize Shirt', 'Shirt by ASOS Collection\r\n\r\nMade from 100% cotton\r\nBreathable woven fabric \r\nClassic point collar\r\nButton placket to front\r\nCuffing detail to sleeves\r\nPinstripe pattern\r\nOversize style\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Stripe Oversize Shirt', '', ''),
(95, 1, 'Superdry Montana Marled Backpack', 'Backpack by Superdry\r\n\r\nSpacious main with zip around closure\r\nFront storage pocket\r\nContrast lined interior and padded back\r\nTwo interior pockets\r\nAdjustable shoulder straps\r\nABOUT SUPERDRY\r\nFamed for their print t-shirts and innovative washed jeans, Superdry combine Japanese design influences with timeless American style, producing a complete clothing range that captures Superdry\'s laid back yet stylish take on casual menswear.', '', 'Superdry Montana Marled Backpack', '', ''),
(95, 2, 'Superdry Montana Marled Backpack', 'Backpack by Superdry\r\n\r\nSpacious main with zip around closure\r\nFront storage pocket\r\nContrast lined interior and padded back\r\nTwo interior pockets\r\nAdjustable shoulder straps\r\nABOUT SUPERDRY\r\nFamed for their print t-shirts and innovative washed jeans, Superdry combine Japanese design influences with timeless American style, producing a complete clothing range that captures Superdry\'s laid back yet stylish take on casual menswear.', '', 'Superdry Montana Marled Backpack', '', ''),
(96, 1, 'Superdry Polo Shirt With Applique', 'Polo shirt by Superdry\r\n\r\nMade from a breathable cotton pique\r\nTwo button placket\r\nRibbed armbands\r\nUneven split hem\r\nRegular fit\r\nABOUT SUPERDRY\r\n    Famed for their print t-shirts and innovative washed jeans, Superdry combine Japanese design influences with timeless American style, producing a complete clothing range that captures Superdry\'s laid back yet stylish take on casual menswear.', '', 'Superdry Polo Shirt With Applique', '', ''),
(96, 2, 'Superdry Polo Shirt With Applique', 'Polo shirt by Superdry\r\n\r\nMade from a breathable cotton pique\r\nTwo button placket\r\nRibbed armbands\r\nUneven split hem\r\nRegular fit\r\nABOUT SUPERDRY\r\n    Famed for their print t-shirts and innovative washed jeans, Superdry combine Japanese design influences with timeless American style, producing a complete clothing range that captures Superdry\'s laid back yet stylish take on casual menswear.', '', 'Superdry Polo Shirt With Applique', '', ''),
(97, 1, 'T-Shirt With Yoke Print And Roll Sleeve', 'T-shirt by ASOS\r\n\r\nMade from 100% pure cotton\r\nSoft touch jersey fabric\r\nPrint on yoke\r\nRolled sleeve design\r\nRegular fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'T-Shirt With Yoke Print And Roll Sleeve', '', ''),
(97, 2, 'T-Shirt With Yoke Print And Roll Sleeve', 'T-shirt by ASOS\r\n\r\nMade from 100% pure cotton\r\nSoft touch jersey fabric\r\nPrint on yoke\r\nRolled sleeve design\r\nRegular fit\r\nABOUT ASOS BRAND\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'T-Shirt With Yoke Print And Roll Sleeve', '', ''),
(98, 1, 'Textured Top With Chiffon Inserts', 'T-shirt by ASOS Collection\r\n\r\nMade from a waffle texture jersey\r\nBoat neckline\r\nChiffon shoulder strips\r\nCurved, split hem\r\nZip back fastening\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Textured Top With Chiffon Inserts', '', ''),
(98, 2, 'Textured Top With Chiffon Inserts', 'T-shirt by ASOS Collection\r\n\r\nMade from a waffle texture jersey\r\nBoat neckline\r\nChiffon shoulder strips\r\nCurved, split hem\r\nZip back fastening\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Textured Top With Chiffon Inserts', '', ''),
(99, 1, 'Top with Dramatic Pleated Ruffle', 'Top by ASOS Collection\r\n\r\nMade from a sheer mesh fabric\r\nCrew neckline\r\nLayered ruffle detail\r\nCropped fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Top with Dramatic Pleated Ruffle', '', ''),
(99, 2, 'Top with Dramatic Pleated Ruffle', 'Top by ASOS Collection\r\n\r\nMade from a sheer mesh fabric\r\nCrew neckline\r\nLayered ruffle detail\r\nCropped fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Top with Dramatic Pleated Ruffle', '', ''),
(100, 1, 'Top with Origami Pleat Detail and Jersey Back', 'Top by ASOS Collection\r\n\r\nMade from a breathable woven fabric\r\nCrew neckline\r\nOrigami pleat detail to front\r\nKeyhole button fastening to reverse\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Top with Origami Pleat Detail and Jersey Back', '', ''),
(100, 2, 'Top with Origami Pleat Detail and Jersey Back', 'Top by ASOS Collection\r\n\r\nMade from a breathable woven fabric\r\nCrew neckline\r\nOrigami pleat detail to front\r\nKeyhole button fastening to reverse\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'Top with Origami Pleat Detail and Jersey Back', '', ''),
(101, 1, 'Twill Shirt In Short Sleeve With', 'Shirt by ASOS\r\n\r\nMade from 100% pure cotton\r\nButton down collar\r\nChest patch pocket\r\nHanging hook\r\nRegular fit\r\nABOUT ASOS BRAND\r\n    Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Twill Shirt In Short Sleeve With', '', ''),
(101, 2, 'Twill Shirt In Short Sleeve With', 'Shirt by ASOS\r\n\r\nMade from 100% pure cotton\r\nButton down collar\r\nChest patch pocket\r\nHanging hook\r\nRegular fit\r\nABOUT ASOS BRAND\r\n    Designed in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.', '', 'Twill Shirt In Short Sleeve With', '', ''),
(102, 1, 'V Neck Contrast Panel Cami', 'Top by ASOS Collection\r\n\r\nMade from a woven poly fabric\r\nV-neckline\r\nContrast trim\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'V Neck Contrast Panel Cami', '', ''),
(102, 2, 'V Neck Contrast Panel Cami', 'Top by ASOS Collection\r\n\r\nMade from a woven poly fabric\r\nV-neckline\r\nContrast trim\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.', '', 'V Neck Contrast Panel Cami', '', ''),
(103, 1, 'Vest with Drop Armhole and keyhole Back', 'Vest by ASOS Collection\r\n\r\nMade from a woven poly fabric\r\nCrew neckline\r\nKeyhole cut with button fastening to reverse\r\nCropped cut\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.\r\n\r\nThis garment is also available in our ASOS PETITE collection.', '', 'Vest with Drop Armhole and keyhole Back', '', ''),
(103, 2, 'Vest with Drop Armhole and keyhole Back', 'Vest by ASOS Collection\r\n\r\nMade from a woven poly fabric\r\nCrew neckline\r\nKeyhole cut with button fastening to reverse\r\nCropped cut\r\nRegular fit\r\nABOUT ASOS COLLECTION\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.\r\n\r\nThis garment is also available in our ASOS PETITE collection.', '', 'Vest with Drop Armhole and keyhole Back', '', ''),
(104, 1, 'Vila Sleeveless Braid Detail Button Blouse', 'Blouse by Vila\r\n\r\nMade from a breathable woven fabric\r\nCollarless design\r\nButton placket through front\r\nCurved, split hem\r\nRegular fit\r\nABOUT VILA\r\n   Seeking inspiration from street and city style, Danish label Vila combine quality fabrics, textures and delicate cuts to create fashion-forward garments. Intricate feminine detailing and fine prints channel the brand\'s signature elegant style; with party dresses and cool casuals featuring prominently.', '', 'Vila Sleeveless Braid Detail Button Blouse', '', ''),
(104, 2, 'Vila Sleeveless Braid Detail Button Blouse', 'Blouse by Vila\r\n\r\nMade from a breathable woven fabric\r\nCollarless design\r\nButton placket through front\r\nCurved, split hem\r\nRegular fit\r\nABOUT VILA\r\n   Seeking inspiration from street and city style, Danish label Vila combine quality fabrics, textures and delicate cuts to create fashion-forward garments. Intricate feminine detailing and fine prints channel the brand\'s signature elegant style; with party dresses and cool casuals featuring prominently.', '', 'Vila Sleeveless Braid Detail Button Blouse', '', ''),
(105, 1, 'Warehouse Denim Jogger', 'Trousers by Warehouse\r\n\r\nMade from 100% pure natural lyocell fabric\r\nEasy-care, lightweight, denim-look fabric\r\nRegular rise\r\nConcealed zip fly fastening\r\nSide pockets\r\nFitted cuffs\r\nRelaxed fit\r\nABOUT WAREHOUSE\r\n    Delivering seasonal trends for the high street, Warehouse offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand\'s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.', '', 'Warehouse Denim Jogger', '', ''),
(105, 2, 'Warehouse Denim Jogger', 'Trousers by Warehouse\r\n\r\nMade from 100% pure natural lyocell fabric\r\nEasy-care, lightweight, denim-look fabric\r\nRegular rise\r\nConcealed zip fly fastening\r\nSide pockets\r\nFitted cuffs\r\nRelaxed fit\r\nABOUT WAREHOUSE\r\n    Delivering seasonal trends for the high street, Warehouse offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand\'s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.', '', 'Warehouse Denim Jogger', '', ''),
(106, 1, 'Warehouse Digital Floral Scarf', 'Scarf by Warehouse\r\n\r\nMade from a lightweight poly fabric\r\nDigital floral print \r\nSquare-cut, wraparound style \r\nABOUT WAREHOUSE\r\nDelivering seasonal trends for the high street, Warehouse offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand\'s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.', '', 'Warehouse Digital Floral Scarf', '', ''),
(106, 2, 'Warehouse Digital Floral Scarf', 'Scarf by Warehouse\r\n\r\nMade from a lightweight poly fabric\r\nDigital floral print \r\nSquare-cut, wraparound style \r\nABOUT WAREHOUSE\r\nDelivering seasonal trends for the high street, Warehouse offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand\'s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.', '', 'Warehouse Digital Floral Scarf', '', ''),
(107, 1, 'Warehouse Shoulder Pad Shell Top', 'Top by Warehouse\r\n\r\nMade from a breathable lightweight fabric\r\nBoat neckline\r\nPadded shoulders\r\nZip back detail\r\nRegular fit\r\nABOUT WAREHOUSE\r\nDelivering seasonal trends for the high street, Warehouse offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand\'s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.', '', 'Warehouse Shoulder Pad Shell Top', '', ''),
(107, 2, 'Warehouse Shoulder Pad Shell Top', 'Top by Warehouse\r\n\r\nMade from a breathable lightweight fabric\r\nBoat neckline\r\nPadded shoulders\r\nZip back detail\r\nRegular fit\r\nABOUT WAREHOUSE\r\nDelivering seasonal trends for the high street, Warehouse offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand\'s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.', '', 'Warehouse Shoulder Pad Shell Top', '', '');

--
-- TABLE STRUCTURE FOR: oc_product_discount
--

DROP TABLE IF EXISTS oc_product_discount;

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_product_filter
--

DROP TABLE IF EXISTS oc_product_filter;

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_product_image
--

DROP TABLE IF EXISTS oc_product_image;

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2689 DEFAULT CHARSET=utf8;

INSERT INTO oc_product_image (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2551, 59, 'catalog/demo/start/products/870x1110.jpg', 3),
(2550, 59, 'catalog/demo/start/products/870x1110.jpg', 2),
(2548, 58, 'catalog/demo/start/products/870x1110.jpg', 0),
(2547, 58, 'catalog/demo/start/products/870x1110.jpg', 0),
(2545, 57, 'catalog/demo/start/products/870x1110.jpg', 3),
(2544, 57, 'catalog/demo/start/products/870x1110.jpg', 2),
(2542, 56, 'catalog/demo/start/products/870x1110.jpg', 3),
(2541, 56, 'catalog/demo/start/products/870x1110.jpg', 2),
(2539, 55, 'catalog/demo/start/products/870x1110.jpg', 3),
(2536, 54, 'catalog/demo/start/products/870x1110.jpg', 3),
(2535, 54, 'catalog/demo/start/products/870x1110.jpg', 2),
(2533, 53, 'catalog/demo/start/products/870x1110.jpg', 0),
(2527, 51, 'catalog/demo/start/products/870x1110.jpg', 3),
(2524, 50, 'catalog/demo/start/products/870x1110.jpg', 3),
(2526, 51, 'catalog/demo/start/products/870x1110.jpg', 2),
(2525, 51, 'catalog/demo/start/products/870x1110.jpg', 1),
(2546, 58, 'catalog/demo/start/products/870x1110.jpg', 0),
(2543, 57, 'catalog/demo/start/products/870x1110.jpg', 1),
(2540, 56, 'catalog/demo/start/products/870x1110.jpg', 1),
(2538, 55, 'catalog/demo/start/products/870x1110.jpg', 2),
(2537, 55, 'catalog/demo/start/products/870x1110.jpg', 1),
(2534, 54, 'catalog/demo/start/products/870x1110.jpg', 1),
(2532, 53, 'catalog/demo/start/products/870x1110.jpg', 0),
(2531, 53, 'catalog/demo/start/products/870x1110.jpg', 0),
(2523, 50, 'catalog/demo/start/products/870x1110.jpg', 2),
(2522, 50, 'catalog/demo/start/products/870x1110.jpg', 1),
(2530, 52, 'catalog/demo/start/products/870x1110.jpg', 3),
(2529, 52, 'catalog/demo/start/products/870x1110.jpg', 2),
(2528, 52, 'catalog/demo/start/products/870x1110.jpg', 1),
(2549, 59, 'catalog/demo/start/products/870x1110.jpg', 1),
(2554, 60, 'catalog/demo/start/products/870x1110.jpg', 3),
(2553, 60, 'catalog/demo/start/products/870x1110.jpg', 2),
(2552, 60, 'catalog/demo/start/products/870x1110.jpg', 1),
(2557, 61, 'catalog/demo/start/products/870x1110.jpg', 3),
(2556, 61, 'catalog/demo/start/products/870x1110.jpg', 2),
(2555, 61, 'catalog/demo/start/products/870x1110.jpg', 1),
(2560, 62, 'catalog/demo/start/products/870x1110.jpg', 3),
(2559, 62, 'catalog/demo/start/products/870x1110.jpg', 2),
(2558, 62, 'catalog/demo/start/products/870x1110.jpg', 1),
(2563, 63, 'catalog/demo/start/products/870x1110.jpg', 0),
(2562, 63, 'catalog/demo/start/products/870x1110.jpg', 0),
(2561, 63, 'catalog/demo/start/products/870x1110.jpg', 0),
(2566, 64, 'catalog/demo/start/products/870x1110.jpg', 3),
(2565, 64, 'catalog/demo/start/products/870x1110.jpg', 2),
(2564, 64, 'catalog/demo/start/products/870x1110.jpg', 1),
(2569, 65, 'catalog/demo/start/products/870x1110.jpg', 3),
(2568, 65, 'catalog/demo/start/products/870x1110.jpg', 2),
(2567, 65, 'catalog/demo/start/products/870x1110.jpg', 1),
(2571, 66, 'catalog/demo/start/products/870x1110.jpg', 0),
(2570, 66, 'catalog/demo/start/products/870x1110.jpg', 0),
(2574, 67, 'catalog/demo/start/products/870x1110.jpg', 3),
(2573, 67, 'catalog/demo/start/products/870x1110.jpg', 2),
(2572, 67, 'catalog/demo/start/products/870x1110.jpg', 1),
(2577, 68, 'catalog/demo/start/products/870x1110.jpg', 3),
(2576, 68, 'catalog/demo/start/products/870x1110.jpg', 2),
(2575, 68, 'catalog/demo/start/products/870x1110.jpg', 1),
(2580, 69, 'catalog/demo/start/products/870x1110.jpg', 3),
(2579, 69, 'catalog/demo/start/products/870x1110.jpg', 2),
(2578, 69, 'catalog/demo/start/products/870x1110.jpg', 1),
(2583, 70, 'catalog/demo/start/products/870x1110.jpg', 3),
(2582, 70, 'catalog/demo/start/products/870x1110.jpg', 2),
(2581, 70, 'catalog/demo/start/products/870x1110.jpg', 1),
(2586, 71, 'catalog/demo/start/products/870x1110.jpg', 3),
(2585, 71, 'catalog/demo/start/products/870x1110.jpg', 2),
(2584, 71, 'catalog/demo/start/products/870x1110.jpg', 1),
(2589, 72, 'catalog/demo/start/products/870x1110.jpg', 3),
(2588, 72, 'catalog/demo/start/products/870x1110.jpg', 2),
(2587, 72, 'catalog/demo/start/products/870x1110.jpg', 1),
(2592, 73, 'catalog/demo/start/products/870x1110.jpg', 3),
(2591, 73, 'catalog/demo/start/products/870x1110.jpg', 2),
(2590, 73, 'catalog/demo/start/products/870x1110.jpg', 1),
(2595, 74, 'catalog/demo/start/products/870x1110.jpg', 3),
(2594, 74, 'catalog/demo/start/products/870x1110.jpg', 2),
(2593, 74, 'catalog/demo/start/products/870x1110.jpg', 1),
(2598, 75, 'catalog/demo/start/products/870x1110.jpg', 3),
(2597, 75, 'catalog/demo/start/products/870x1110.jpg', 2),
(2596, 75, 'catalog/demo/start/products/870x1110.jpg', 1),
(2600, 76, 'catalog/demo/start/products/870x1110.jpg', 2),
(2599, 76, 'catalog/demo/start/products/870x1110.jpg', 1),
(2603, 77, 'catalog/demo/start/products/870x1110.jpg', 3),
(2602, 77, 'catalog/demo/start/products/870x1110.jpg', 2),
(2601, 77, 'catalog/demo/start/products/870x1110.jpg', 1),
(2434, 78, 'catalog/demo/start/products/870x1110.jpg', 1),
(2435, 78, 'catalog/demo/start/products/870x1110.jpg', 2),
(2436, 78, 'catalog/demo/start/products/870x1110.jpg', 3),
(2606, 79, 'catalog/demo/start/products/870x1110.jpg', 3),
(2605, 79, 'catalog/demo/start/products/870x1110.jpg', 2),
(2604, 79, 'catalog/demo/start/products/870x1110.jpg', 1),
(2609, 80, 'catalog/demo/start/products/870x1110.jpg', 3),
(2608, 80, 'catalog/demo/start/products/870x1110.jpg', 2),
(2607, 80, 'catalog/demo/start/products/870x1110.jpg', 1),
(2612, 81, 'catalog/demo/start/products/870x1110.jpg', 3),
(2611, 81, 'catalog/demo/start/products/870x1110.jpg', 2),
(2610, 81, 'catalog/demo/start/products/870x1110.jpg', 1),
(2614, 82, 'catalog/demo/start/products/870x1110.jpg', 2),
(2613, 82, 'catalog/demo/start/products/870x1110.jpg', 1),
(2617, 83, 'catalog/demo/start/products/870x1110.jpg', 0),
(2616, 83, 'catalog/demo/start/products/870x1110.jpg', 0),
(2615, 83, 'catalog/demo/start/products/870x1110.jpg', 0),
(2620, 84, 'catalog/demo/start/products/870x1110.jpg', 3),
(2619, 84, 'catalog/demo/start/products/870x1110.jpg', 2),
(2618, 84, 'catalog/demo/start/products/870x1110.jpg', 1),
(2623, 85, 'catalog/demo/start/products/870x1110.jpg', 3),
(2622, 85, 'catalog/demo/start/products/870x1110.jpg', 2),
(2621, 85, 'catalog/demo/start/products/870x1110.jpg', 1),
(2625, 86, 'catalog/demo/start/products/870x1110.jpg', 2),
(2624, 86, 'catalog/demo/start/products/870x1110.jpg', 1),
(2629, 87, 'catalog/demo/start/products/870x1110.jpg', 3),
(2628, 87, 'catalog/demo/start/products/870x1110.jpg', 2),
(2627, 87, 'catalog/demo/start/products/870x1110.jpg', 1),
(2632, 88, 'catalog/demo/start/products/870x1110.jpg', 3),
(2631, 88, 'catalog/demo/start/products/870x1110.jpg', 2),
(2630, 88, 'catalog/demo/start/products/870x1110.jpg', 1),
(2635, 89, 'catalog/demo/start/products/870x1110.jpg', 3),
(2634, 89, 'catalog/demo/start/products/870x1110.jpg', 2),
(2633, 89, 'catalog/demo/start/products/870x1110.jpg', 1),
(2638, 90, 'catalog/demo/start/products/870x1110.jpg', 3),
(2637, 90, 'catalog/demo/start/products/870x1110.jpg', 2),
(2636, 90, 'catalog/demo/start/products/870x1110.jpg', 1),
(2641, 91, 'catalog/demo/start/products/870x1110.jpg', 3),
(2640, 91, 'catalog/demo/start/products/870x1110.jpg', 2),
(2639, 91, 'catalog/demo/start/products/870x1110.jpg', 1),
(2644, 92, 'catalog/demo/start/products/870x1110.jpg', 3),
(2643, 92, 'catalog/demo/start/products/870x1110.jpg', 2),
(2642, 92, 'catalog/demo/start/products/870x1110.jpg', 1),
(2647, 93, 'catalog/demo/start/products/870x1110.jpg', 3),
(2646, 93, 'catalog/demo/start/products/870x1110.jpg', 2),
(2645, 93, 'catalog/demo/start/products/870x1110.jpg', 1),
(2650, 94, 'catalog/demo/start/products/870x1110.jpg', 3),
(2649, 94, 'catalog/demo/start/products/870x1110.jpg', 2),
(2648, 94, 'catalog/demo/start/products/870x1110.jpg', 1),
(2653, 95, 'catalog/demo/start/products/870x1110.jpg', 3),
(2652, 95, 'catalog/demo/start/products/870x1110.jpg', 2),
(2651, 95, 'catalog/demo/start/products/870x1110.jpg', 1),
(2656, 96, 'catalog/demo/start/products/870x1110.jpg', 3),
(2655, 96, 'catalog/demo/start/products/870x1110.jpg', 2),
(2654, 96, 'catalog/demo/start/products/870x1110.jpg', 1),
(2659, 97, 'catalog/demo/start/products/870x1110.jpg', 3),
(2658, 97, 'catalog/demo/start/products/870x1110.jpg', 2),
(2657, 97, 'catalog/demo/start/products/870x1110.jpg', 1),
(2662, 98, 'catalog/demo/start/products/870x1110.jpg', 3),
(2661, 98, 'catalog/demo/start/products/870x1110.jpg', 2),
(2660, 98, 'catalog/demo/start/products/870x1110.jpg', 1),
(2665, 99, 'catalog/demo/start/products/870x1110.jpg', 3),
(2664, 99, 'catalog/demo/start/products/870x1110.jpg', 2),
(2663, 99, 'catalog/demo/start/products/870x1110.jpg', 1),
(2668, 100, 'catalog/demo/start/products/870x1110.jpg', 3),
(2667, 100, 'catalog/demo/start/products/870x1110.jpg', 2),
(2666, 100, 'catalog/demo/start/products/870x1110.jpg', 1),
(2671, 101, 'catalog/demo/start/products/870x1110.jpg', 3),
(2670, 101, 'catalog/demo/start/products/870x1110.jpg', 2),
(2669, 101, 'catalog/demo/start/products/870x1110.jpg', 1),
(2674, 102, 'catalog/demo/start/products/870x1110.jpg', 3),
(2673, 102, 'catalog/demo/start/products/870x1110.jpg', 2),
(2672, 102, 'catalog/demo/start/products/870x1110.jpg', 1),
(2677, 103, 'catalog/demo/start/products/870x1110.jpg', 3),
(2676, 103, 'catalog/demo/start/products/870x1110.jpg', 2),
(2675, 103, 'catalog/demo/start/products/870x1110.jpg', 1),
(2680, 104, 'catalog/demo/start/products/870x1110.jpg', 3),
(2679, 104, 'catalog/demo/start/products/870x1110.jpg', 2),
(2678, 104, 'catalog/demo/start/products/870x1110.jpg', 1),
(2683, 105, 'catalog/demo/start/products/870x1110.jpg', 3),
(2682, 105, 'catalog/demo/start/products/870x1110.jpg', 2),
(2681, 105, 'catalog/demo/start/products/870x1110.jpg', 1),
(2685, 106, 'catalog/demo/start/products/870x1110.jpg', 2),
(2684, 106, 'catalog/demo/start/products/870x1110.jpg', 1),
(2688, 107, 'catalog/demo/start/products/870x1110.jpg', 3),
(2687, 107, 'catalog/demo/start/products/870x1110.jpg', 2),
(2686, 107, 'catalog/demo/start/products/870x1110.jpg', 1),
(2626, 86, '', 3);

--
-- TABLE STRUCTURE FOR: oc_product_option
--

DROP TABLE IF EXISTS oc_product_option;

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

INSERT INTO oc_product_option (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(227, 52, 5, '', 1),
(228, 53, 5, '', 1),
(230, 94, 13, '', 1),
(229, 72, 5, '', 1);

--
-- TABLE STRUCTURE FOR: oc_product_option_value
--

DROP TABLE IF EXISTS oc_product_option_value;

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

INSERT INTO oc_product_option_value (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(27, 230, 94, 13, 57, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(28, 230, 94, 13, 56, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(29, 230, 94, 13, 55, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(23, 229, 72, 5, 39, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(24, 229, 72, 5, 41, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(25, 229, 72, 5, 40, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(26, 229, 72, 5, 42, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(20, 228, 53, 5, 41, 0, 1, '2.0000', '+', 0, '+', '0.00000000', '+'),
(21, 228, 53, 5, 39, 0, 1, '1.0000', '+', 0, '+', '0.00000000', '+'),
(22, 228, 53, 5, 42, 0, 1, '0.0000', '-', 0, '+', '0.00000000', '+'),
(18, 227, 52, 5, 39, 0, 1, '2.0000', '-', 0, '+', '0.00000000', '+'),
(17, 227, 52, 5, 41, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(19, 227, 52, 5, 39, 0, 1, '1.0000', '+', 0, '+', '0.00000000', '+');

--
-- TABLE STRUCTURE FOR: oc_product_recurring
--

DROP TABLE IF EXISTS oc_product_recurring;

CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_product_related
--

DROP TABLE IF EXISTS oc_product_related;

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_product_reward
--

DROP TABLE IF EXISTS oc_product_reward;

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=661 DEFAULT CHARSET=utf8;

INSERT INTO oc_product_reward (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(622, 68, 1, 0),
(620, 66, 1, 0),
(619, 65, 1, 0),
(612, 58, 1, 0),
(608, 54, 1, 0),
(616, 62, 1, 0),
(617, 63, 1, 0),
(621, 67, 1, 0),
(611, 57, 1, 0),
(610, 56, 1, 0),
(609, 55, 1, 0),
(607, 53, 1, 0),
(605, 51, 1, 0),
(604, 50, 1, 0),
(618, 64, 1, 0),
(615, 61, 1, 0),
(614, 60, 1, 0),
(613, 59, 1, 0),
(606, 52, 1, 0),
(623, 69, 1, 0),
(624, 70, 1, 0),
(625, 71, 1, 0),
(626, 72, 1, 0),
(627, 73, 1, 0),
(628, 74, 1, 0),
(629, 75, 1, 0),
(630, 76, 1, 0),
(631, 77, 1, 0),
(574, 78, 1, 0),
(632, 79, 1, 0),
(633, 80, 1, 0),
(634, 81, 1, 0),
(635, 82, 1, 0),
(636, 83, 1, 0),
(637, 84, 1, 0),
(638, 85, 1, 0),
(639, 86, 1, 0),
(640, 87, 1, 0),
(641, 88, 1, 0),
(642, 89, 1, 0),
(643, 90, 1, 0),
(644, 91, 1, 0),
(645, 92, 1, 0),
(646, 93, 1, 0),
(647, 94, 1, 0),
(648, 95, 1, 0),
(649, 96, 1, 0),
(650, 97, 1, 0),
(651, 98, 1, 0),
(652, 99, 1, 0),
(653, 100, 1, 0),
(654, 101, 1, 0),
(655, 102, 1, 0),
(656, 103, 1, 0),
(657, 104, 1, 0),
(658, 105, 1, 0),
(659, 106, 1, 0),
(660, 107, 1, 0);

--
-- TABLE STRUCTURE FOR: oc_product_special
--

DROP TABLE IF EXISTS oc_product_special;

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=454 DEFAULT CHARSET=utf8;

INSERT INTO oc_product_special (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(449, 61, 1, 0, '120.5000', '2014-11-25', '2015-11-25'),
(448, 60, 1, 0, '30.0000', '2014-11-25', '2015-05-13'),
(447, 54, 1, 0, '10.0000', '2014-11-25', '2015-07-23'),
(450, 62, 1, 0, '70.5000', '2014-11-25', '2015-07-25'),
(451, 63, 1, 0, '22.0000', '2014-11-25', '2015-01-21'),
(452, 76, 1, 0, '8.0000', '2014-11-25', '2015-01-31'),
(453, 86, 1, 0, '10.0000', '2014-11-25', '2015-06-25');

--
-- TABLE STRUCTURE FOR: oc_product_to_category
--

DROP TABLE IF EXISTS oc_product_to_category;

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_product_to_category (`product_id`, `category_id`) VALUES
(50, 59),
(50, 60),
(51, 66),
(51, 68),
(52, 74),
(52, 76),
(52, 87),
(52, 89),
(53, 70),
(53, 73),
(54, 91),
(54, 92),
(55, 83),
(55, 84),
(56, 70),
(56, 71),
(57, 91),
(57, 94),
(58, 70),
(58, 73),
(59, 66),
(59, 68),
(60, 86),
(60, 91),
(61, 87),
(61, 88),
(62, 87),
(62, 88),
(63, 70),
(63, 73),
(64, 91),
(64, 94),
(65, 91),
(65, 94),
(66, 83),
(66, 84),
(67, 70),
(67, 73),
(68, 83),
(68, 84),
(69, 66),
(69, 68),
(70, 70),
(70, 71),
(71, 70),
(71, 73),
(72, 70),
(72, 73),
(73, 91),
(73, 92),
(74, 91),
(74, 93),
(75, 83),
(75, 86),
(76, 70),
(76, 72),
(77, 70),
(77, 72),
(78, 87),
(78, 90),
(79, 87),
(79, 90),
(80, 66),
(80, 68),
(81, 70),
(81, 72),
(82, 66),
(82, 68),
(83, 91),
(83, 92),
(84, 70),
(84, 72),
(85, 70),
(85, 72),
(86, 70),
(86, 73),
(87, 91),
(87, 92),
(88, 83),
(88, 84),
(89, 66),
(89, 68),
(90, 70),
(90, 73),
(91, 91),
(91, 94),
(92, 70),
(92, 73),
(93, 78),
(93, 79),
(94, 91),
(94, 94),
(95, 59),
(95, 60),
(96, 70),
(96, 72),
(97, 70),
(97, 73),
(98, 91),
(98, 94),
(99, 86),
(99, 91),
(100, 91),
(100, 93),
(101, 70),
(101, 73),
(102, 91),
(102, 93),
(103, 73),
(103, 91),
(104, 91),
(104, 93),
(105, 83),
(105, 84),
(106, 78),
(106, 81),
(107, 91),
(107, 94);

--
-- TABLE STRUCTURE FOR: oc_product_to_download
--

DROP TABLE IF EXISTS oc_product_to_download;

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_product_to_layout
--

DROP TABLE IF EXISTS oc_product_to_layout;

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_product_to_layout (`product_id`, `store_id`, `layout_id`) VALUES
(50, 0, 0),
(51, 0, 0),
(52, 0, 0),
(53, 0, 0),
(54, 0, 0),
(55, 0, 0),
(56, 0, 0),
(57, 0, 0),
(58, 0, 0),
(59, 0, 0),
(60, 0, 0),
(61, 0, 0),
(62, 0, 0),
(63, 0, 0),
(64, 0, 0),
(65, 0, 0),
(66, 0, 0),
(67, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(73, 0, 0),
(74, 0, 0),
(75, 0, 0),
(76, 0, 0),
(77, 0, 0),
(78, 0, 0),
(79, 0, 0),
(80, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0),
(84, 0, 0),
(85, 0, 0),
(86, 0, 0),
(87, 0, 0),
(88, 0, 0),
(89, 0, 0),
(90, 0, 0),
(91, 0, 0),
(92, 0, 0),
(93, 0, 0),
(94, 0, 0),
(95, 0, 0),
(96, 0, 0),
(97, 0, 0),
(98, 0, 0),
(99, 0, 0),
(100, 0, 0),
(101, 0, 0),
(102, 0, 0),
(103, 0, 0),
(104, 0, 0),
(105, 0, 0),
(106, 0, 0),
(107, 0, 0);

--
-- TABLE STRUCTURE FOR: oc_product_to_store
--

DROP TABLE IF EXISTS oc_product_to_store;

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_product_to_store (`product_id`, `store_id`) VALUES
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0);

--
-- TABLE STRUCTURE FOR: oc_recurring
--

DROP TABLE IF EXISTS oc_recurring;

CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_recurring_description
--

DROP TABLE IF EXISTS oc_recurring_description;

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_return
--

DROP TABLE IF EXISTS oc_return;

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_return_action
--

DROP TABLE IF EXISTS oc_return_action;

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO oc_return_action (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent');

--
-- TABLE STRUCTURE FOR: oc_return_history
--

DROP TABLE IF EXISTS oc_return_history;

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_return_reason
--

DROP TABLE IF EXISTS oc_return_reason;

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO oc_return_reason (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details'),
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details');

--
-- TABLE STRUCTURE FOR: oc_return_status
--

DROP TABLE IF EXISTS oc_return_status;

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO oc_return_status (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products'),
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products');

--
-- TABLE STRUCTURE FOR: oc_review
--

DROP TABLE IF EXISTS oc_review;

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_setting
--

DROP TABLE IF EXISTS oc_setting;

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=888 DEFAULT CHARSET=utf8;

INSERT INTO oc_setting (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(741, 0, 'carousel', 'carousel_module', 'a:1:{i:0;a:5:{s:9:"banner_id";s:1:"9";s:5:"limit";s:2:"10";s:6:"scroll";s:1:"3";s:5:"width";s:3:"130";s:6:"height";s:3:"100";}}', 1),
(156, 0, 'featured', 'featured_status', '1', 0),
(155, 0, 'featured', 'featured_product', '43,40,42,30', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(146, 0, 'category', 'category_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(856, 0, 'config', 'config_seo_url', '0', 0),
(857, 0, 'config', 'config_file_max_size', '300000', 0),
(858, 0, 'config', 'config_file_ext_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0),
(859, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(157, 0, 'featured', 'featured_module', 'a:1:{i:0;a:3:{s:5:"limit";s:1:"4";s:5:"width";s:3:"200";s:6:"height";s:3:"200";}}', 1),
(165, 0, 'slideshow', 'slideshow_status', '1', 0),
(166, 0, 'slideshow', 'slideshow_module', 'a:2:{i:0;a:3:{s:9:"banner_id";s:1:"7";s:5:"width";s:4:"1140";s:6:"height";s:3:"380";}s:16:"pol3h8iif8j2lnmi";a:3:{s:9:"banner_id";s:1:"6";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}', 1),
(109, 0, 'banner', 'banner_module', 'a:1:{i:0;a:8:{s:9:"banner_id";s:1:"6";s:5:"width";s:3:"182";s:6:"height";s:3:"182";s:11:"resize_type";s:7:"default";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(855, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(854, 0, 'config', 'config_shared', '0', 0),
(853, 0, 'config', 'config_secure', '0', 0),
(851, 0, 'config', 'config_fraud_score', '', 0),
(852, 0, 'config', 'config_fraud_status_id', '7', 0),
(850, 0, 'config', 'config_fraud_key', '', 0),
(849, 0, 'config', 'config_fraud_detection', '0', 0),
(848, 0, 'config', 'config_mail_alert', '', 0),
(847, 0, 'config', 'config_mail', 'a:7:{s:8:"protocol";s:4:"mail";s:9:"parameter";s:0:"";s:13:"smtp_hostname";s:0:"";s:13:"smtp_username";s:0:"";s:13:"smtp_password";s:0:"";s:9:"smtp_port";s:0:"";s:12:"smtp_timeout";s:0:"";}', 1),
(846, 0, 'config', 'config_ftp_status', '0', 0),
(845, 0, 'config', 'config_ftp_root', '', 0),
(844, 0, 'config', 'config_ftp_password', '', 0),
(843, 0, 'config', 'config_ftp_username', '', 0),
(842, 0, 'config', 'config_ftp_port', '21', 0),
(841, 0, 'config', 'config_ftp_hostname', 'opencart.opencartdemo.com', 0),
(840, 0, 'config', 'config_image_location_height', '50', 0),
(839, 0, 'config', 'config_image_location_width', '268', 0),
(838, 0, 'config', 'config_image_cart_height', '115', 0),
(837, 0, 'config', 'config_image_cart_width', '90', 0),
(836, 0, 'config', 'config_image_wishlist_height', '115', 0),
(835, 0, 'config', 'config_image_wishlist_width', '90', 0),
(834, 0, 'config', 'config_image_compare_height', '115', 0),
(833, 0, 'config', 'config_image_compare_width', '90', 0),
(832, 0, 'config', 'config_image_related_height', '344', 0),
(831, 0, 'config', 'config_image_related_width', '270', 0),
(830, 0, 'config', 'config_image_additional_height', '94', 0),
(829, 0, 'config', 'config_image_additional_width', '74', 0),
(828, 0, 'config', 'config_image_product_height', '344', 0),
(827, 0, 'config', 'config_image_product_width', '270', 0),
(826, 0, 'config', 'config_image_popup_height', '1110', 0),
(825, 0, 'config', 'config_image_popup_width', '870', 0),
(824, 0, 'config', 'config_image_thumb_height', '638', 0),
(823, 0, 'config', 'config_image_thumb_width', '500', 0),
(822, 0, 'config', 'config_image_category_height', '300', 0),
(820, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(821, 0, 'config', 'config_image_category_width', '870', 0),
(819, 0, 'config', 'config_logo', 'catalog/start/logo.png', 0),
(818, 0, 'config', 'config_return_status_id', '2', 0),
(817, 0, 'config', 'config_return_id', '0', 0),
(816, 0, 'config', 'config_affiliate_mail', '0', 0),
(815, 0, 'config', 'config_affiliate_id', '4', 0),
(814, 0, 'config', 'config_affiliate_commission', '5', 0),
(813, 0, 'config', 'config_affiliate_auto', '0', 0),
(811, 0, 'config', 'config_stock_checkout', '0', 0),
(812, 0, 'config', 'config_affiliate_approval', '0', 0),
(810, 0, 'config', 'config_stock_warning', '0', 0),
(809, 0, 'config', 'config_stock_display', '0', 0),
(808, 0, 'config', 'config_order_mail', '0', 0),
(807, 0, 'config', 'config_complete_status', 'a:1:{i:0;s:1:"5";}', 1),
(806, 0, 'config', 'config_processing_status', 'a:1:{i:0;s:1:"2";}', 1),
(805, 0, 'config', 'config_order_status_id', '1', 0),
(877, 0, 'kuler_cp', 'kuler_cp_skin_id', 'skin1', 0),
(876, 0, 'kuler_cp', 'kuler_cp_theme_id', 'start', 0),
(879, 0, 'kuler_layer_slider', 'kuler_layer_slider_module', 'a:1:{i:0;a:1:{s:9:"slider_id";s:1:"1";}}', 1),
(750, 0, 'kuler_menu', 'kuler_menu_status', '1', 0),
(878, 0, 'kuler_layer_slider', 'kuler_layer_slider_status', '1', 0),
(675, 0, 'kuler_contact_form', 'kuler_contact_form_status', '1', 0),
(676, 0, 'kuler_contact_form', 'kuler_contact_form_module', 'a:1:{i:0;a:10:{s:10:"sort_order";s:2:"10";s:6:"status";s:1:"1";s:9:"mainTitle";s:8:"Module 1";s:5:"title";a:1:{s:2:"en";s:8:"Module 1";}s:6:"active";s:4:"true";s:10:"short_code";s:29:"[kuler_contact_form module_1]";s:9:"$$hashKey";s:8:"object:7";s:10:"show_title";s:1:"0";s:23:"show_custom_information";s:1:"1";s:18:"custom_information";a:1:{s:2:"en";s:398:"&lt;iframe frameborder=&quot;0&quot; height=&quot;260&quot; src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1656.212338688264!2d151.20974400000003!3d-33.87871499999992!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12ae3d511200d9%3A0x16a18777b88ade3f!2s170+Elizabeth+St!5e0!3m2!1sen!2s!4v1402653619325&quot; style=&quot;border:0&quot; width=&quot;350&quot;&gt;&lt;/iframe&gt;";}}}', 1),
(801, 0, 'config', 'config_api_id', '2', 0),
(802, 0, 'config', 'config_cart_weight', '1', 0),
(803, 0, 'config', 'config_checkout_guest', '1', 0),
(804, 0, 'config', 'config_checkout_id', '5', 0),
(800, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(799, 0, 'config', 'config_account_mail', '0', 0),
(798, 0, 'config', 'config_account_id', '3', 0),
(797, 0, 'config', 'config_customer_price', '0', 0),
(796, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(795, 0, 'config', 'config_customer_group_id', '1', 0),
(794, 0, 'config', 'config_customer_online', '0', 0),
(793, 0, 'config', 'config_tax_customer', 'shipping', 0),
(792, 0, 'config', 'config_tax_default', 'shipping', 0),
(791, 0, 'config', 'config_tax', '1', 0),
(790, 0, 'config', 'config_voucher_max', '1000', 0),
(789, 0, 'config', 'config_voucher_min', '1', 0),
(788, 0, 'config', 'config_review_mail', '0', 0),
(787, 0, 'config', 'config_review_guest', '1', 0),
(786, 0, 'config', 'config_review_status', '1', 0),
(781, 0, 'config', 'config_weight_class_id', '1', 0),
(782, 0, 'config', 'config_product_count', '1', 0),
(783, 0, 'config', 'config_product_limit', '15', 0),
(784, 0, 'config', 'config_product_description_length', '100', 0),
(785, 0, 'config', 'config_limit_admin', '20', 0),
(780, 0, 'config', 'config_length_class_id', '1', 0),
(776, 0, 'config', 'config_language', 'en', 0),
(777, 0, 'config', 'config_admin_language', 'en', 0),
(778, 0, 'config', 'config_currency', 'USD', 0),
(779, 0, 'config', 'config_currency_auto', '1', 0),
(765, 0, 'config', 'config_fax', '', 0),
(766, 0, 'config', 'config_image', '', 0),
(767, 0, 'config', 'config_open', '', 0),
(768, 0, 'config', 'config_comment', '', 0),
(769, 0, 'config', 'config_meta_title', 'Your Store', 0),
(770, 0, 'config', 'config_meta_description', 'My Store', 0),
(771, 0, 'config', 'config_meta_keyword', '', 0),
(772, 0, 'config', 'config_template', 'start', 0),
(773, 0, 'config', 'config_layout_id', '4', 0),
(774, 0, 'config', 'config_country_id', '222', 0),
(775, 0, 'config', 'config_zone_id', '3563', 0),
(764, 0, 'config', 'config_telephone', '123456789', 0),
(763, 0, 'config', 'config_email', 'contact@kulerthemes.com', 0),
(762, 0, 'config', 'config_geocode', '', 0),
(761, 0, 'config', 'config_address', 'Address 1', 0),
(760, 0, 'config', 'config_owner', 'Your Name', 0),
(759, 0, 'config', 'config_name', 'Your Store', 0),
(883, 0, 'kuler_advanced_html', 'kuler_advanced_html_module', 'a:4:{i:1;a:4:{s:5:"title";a:2:{i:1;s:12:"Header Extra";i:2;s:12:"Header Extra";}s:9:"showtitle";s:1:"0";s:11:"module_type";s:8:"standard";s:11:"description";a:2:{i:1;s:400:"&lt;div class=&quot;row hidden-sm hidden-xs&quot;&gt;\r\n		      &lt;div class=&quot;col-lg-4&quot;&gt;\r\n			      &lt;i class=&quot;fa fa-phone&quot;&gt;&lt;/i&gt;\r\n			      +1.333.999&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n		      &lt;div class=&quot;col-lg-8&quot;&gt;\r\n			      &lt;i class=&quot;fa fa-send&quot;&gt;&lt;/i&gt;\r\n			      Free Ship On Order Over $2000\r\n		      &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n	      &lt;/div&gt;";i:2;s:400:"&lt;div class=&quot;row hidden-sm hidden-xs&quot;&gt;\r\n		      &lt;div class=&quot;col-lg-4&quot;&gt;\r\n			      &lt;i class=&quot;fa fa-phone&quot;&gt;&lt;/i&gt;\r\n			      +1.333.999&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n		      &lt;div class=&quot;col-lg-8&quot;&gt;\r\n			      &lt;i class=&quot;fa fa-send&quot;&gt;&lt;/i&gt;\r\n			      Free Ship On Order Over $2000\r\n		      &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n	      &lt;/div&gt;";}}i:2;a:4:{s:5:"title";a:2:{i:1;s:5:"Steps";i:2;s:5:"Steps";}s:9:"showtitle";s:1:"0";s:11:"module_type";s:8:"standard";s:11:"description";a:2:{i:1;s:620:"&lt;div class=&quot;steps&quot;&gt;\r\n										&lt;h3 class=&quot;box-heading box-heading--footer&quot;&gt;STEPS TO BUY PRODUCT&lt;/h3&gt;\r\n\r\n										&lt;ul&gt;\r\n\r\n											&lt;li class=&quot;steps__item&quot;&gt;Choose your wishlist products then add to cart.&lt;/li&gt;\r\n\r\n											&lt;li class=&quot;steps__item&quot;&gt;Call us for more info about our products.&lt;/li&gt;\r\n\r\n											&lt;li class=&quot;steps__item&quot;&gt;Pay by creadit card.&lt;/li&gt;\r\n\r\n											&lt;li class=&quot;steps__item&quot;&gt;We will send this product in 2 days.&lt;/li&gt;\r\n\r\n										&lt;/ul&gt;\r\n\r\n									&lt;/div&gt;";i:2;s:620:"&lt;div class=&quot;steps&quot;&gt;\r\n										&lt;h3 class=&quot;box-heading box-heading--footer&quot;&gt;STEPS TO BUY PRODUCT&lt;/h3&gt;\r\n\r\n										&lt;ul&gt;\r\n\r\n											&lt;li class=&quot;steps__item&quot;&gt;Choose your wishlist products then add to cart.&lt;/li&gt;\r\n\r\n											&lt;li class=&quot;steps__item&quot;&gt;Call us for more info about our products.&lt;/li&gt;\r\n\r\n											&lt;li class=&quot;steps__item&quot;&gt;Pay by creadit card.&lt;/li&gt;\r\n\r\n											&lt;li class=&quot;steps__item&quot;&gt;We will send this product in 2 days.&lt;/li&gt;\r\n\r\n										&lt;/ul&gt;\r\n\r\n									&lt;/div&gt;";}}i:3;a:4:{s:5:"title";a:2:{i:1;s:11:"top banners";i:2;s:11:"top banners";}s:9:"showtitle";s:1:"0";s:11:"module_type";s:8:"standard";s:11:"description";a:2:{i:1;s:2071:"&lt;div class=&quot;top-block&quot;&gt;\r\n		&lt;div class=&quot;container&quot;&gt;\r\n			&lt;div class=&quot;row&quot;&gt;\r\n				&lt;div class=&quot;col-lg-4 col-md-4 col-sm-4&quot;&gt;\r\n					&lt;div class=&quot;top-block__item&quot;&gt;\r\n						&lt;img alt=&quot;top 1&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/370x180/top1.png&quot;&gt;\r\n						&lt;img alt=&quot;s1&quot; class=&quot;top-block__small-image&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/60x60/s1.png&quot;&gt;\r\n						&lt;h3&gt;MENSWEAR&lt;/h3&gt;\r\n\r\n						&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla at convallis purus.&lt;/p&gt;\r\n\r\n					&lt;/div&gt;\r\n\r\n				&lt;/div&gt;\r\n\r\n				&lt;div class=&quot;col-lg-4 col-md-4 col-sm-4&quot;&gt;\r\n					&lt;div class=&quot;top-block__item&quot;&gt;\r\n						&lt;img alt=&quot;top 1&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/370x180/top2.png&quot;&gt;\r\n						&lt;img alt=&quot;s1&quot; class=&quot;top-block__small-image&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/60x60/s2.png&quot;&gt;\r\n						&lt;h3&gt;STREETSTYLE&lt;/h3&gt;\r\n\r\n						&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla at convallis purus.&lt;/p&gt;\r\n\r\n					&lt;/div&gt;\r\n\r\n				&lt;/div&gt;\r\n\r\n				&lt;div class=&quot;col-lg-4 col-md-4 col-sm-4&quot;&gt;\r\n					&lt;div class=&quot;top-block__item&quot;&gt;\r\n						&lt;img alt=&quot;top 1&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/370x180/top3.png&quot;&gt;\r\n						&lt;img alt=&quot;s1&quot; class=&quot;top-block__small-image&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/60x60/s3.png&quot;&gt;\r\n						&lt;h3&gt;BOY IN TOWN&lt;/h3&gt;\r\n\r\n						&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla at convallis purus.&lt;/p&gt;\r\n\r\n					&lt;/div&gt;\r\n\r\n				&lt;/div&gt;\r\n\r\n			&lt;/div&gt;\r\n\r\n		&lt;/div&gt;\r\n\r\n	&lt;/div&gt;";i:2;s:2071:"&lt;div class=&quot;top-block&quot;&gt;\r\n		&lt;div class=&quot;container&quot;&gt;\r\n			&lt;div class=&quot;row&quot;&gt;\r\n				&lt;div class=&quot;col-lg-4 col-md-4 col-sm-4&quot;&gt;\r\n					&lt;div class=&quot;top-block__item&quot;&gt;\r\n						&lt;img alt=&quot;top 1&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/370x180/top1.png&quot;&gt;\r\n						&lt;img alt=&quot;s1&quot; class=&quot;top-block__small-image&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/60x60/s1.png&quot;&gt;\r\n						&lt;h3&gt;MENSWEAR&lt;/h3&gt;\r\n\r\n						&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla at convallis purus.&lt;/p&gt;\r\n\r\n					&lt;/div&gt;\r\n\r\n				&lt;/div&gt;\r\n\r\n				&lt;div class=&quot;col-lg-4 col-md-4 col-sm-4&quot;&gt;\r\n					&lt;div class=&quot;top-block__item&quot;&gt;\r\n						&lt;img alt=&quot;top 1&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/370x180/top2.png&quot;&gt;\r\n						&lt;img alt=&quot;s1&quot; class=&quot;top-block__small-image&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/60x60/s2.png&quot;&gt;\r\n						&lt;h3&gt;STREETSTYLE&lt;/h3&gt;\r\n\r\n						&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla at convallis purus.&lt;/p&gt;\r\n\r\n					&lt;/div&gt;\r\n\r\n				&lt;/div&gt;\r\n\r\n				&lt;div class=&quot;col-lg-4 col-md-4 col-sm-4&quot;&gt;\r\n					&lt;div class=&quot;top-block__item&quot;&gt;\r\n						&lt;img alt=&quot;top 1&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/370x180/top3.png&quot;&gt;\r\n						&lt;img alt=&quot;s1&quot; class=&quot;top-block__small-image&quot; src=&quot;http://demo.kulerthemes.com/start/1/image/data/demo/start/advanced_html/60x60/s3.png&quot;&gt;\r\n						&lt;h3&gt;BOY IN TOWN&lt;/h3&gt;\r\n\r\n						&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla at convallis purus.&lt;/p&gt;\r\n\r\n					&lt;/div&gt;\r\n\r\n				&lt;/div&gt;\r\n\r\n			&lt;/div&gt;\r\n\r\n		&lt;/div&gt;\r\n\r\n	&lt;/div&gt;";}}i:4;a:4:{s:5:"title";a:2:{i:1;s:8:"4 blocks";i:2;s:8:"4 blocks";}s:9:"showtitle";s:1:"0";s:11:"module_type";s:8:"standard";s:11:"description";a:2:{i:1;s:530:"&lt;div class=&quot;row bottom-blocks&quot;&gt;\r\n		&lt;div class=&quot;col-lg-3 col-md-3 col-sm-6&quot;&gt;\r\n			[kuler_showcase new_arrival]\r\n		&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n		&lt;div class=&quot;col-lg-3 col-md-3 col-sm-6&quot;&gt;\r\n			[kuler_showcase new_arrival]\r\n		&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n		&lt;div class=&quot;col-lg-3 col-md-3 col-sm-6&quot;&gt;\r\n			[kuler_showcase new_arrival]\r\n		&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n		&lt;div class=&quot;col-lg-3 col-md-3 col-sm-6&quot;&gt;\r\n			[kuler_showcase new_arrival]\r\n		&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n	&lt;/div&gt;";i:2;s:530:"&lt;div class=&quot;row bottom-blocks&quot;&gt;\r\n		&lt;div class=&quot;col-lg-3 col-md-3 col-sm-6&quot;&gt;\r\n			[kuler_showcase new_arrival]\r\n		&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n		&lt;div class=&quot;col-lg-3 col-md-3 col-sm-6&quot;&gt;\r\n			[kuler_showcase new_arrival]\r\n		&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n		&lt;div class=&quot;col-lg-3 col-md-3 col-sm-6&quot;&gt;\r\n			[kuler_showcase new_arrival]\r\n		&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n		&lt;div class=&quot;col-lg-3 col-md-3 col-sm-6&quot;&gt;\r\n			[kuler_showcase new_arrival]\r\n		&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n	&lt;/div&gt;";}}}', 1),
(871, 0, 'kbm', 'kbm_settings', 'a:8:{s:4:"home";a:4:{s:11:"description";a:2:{i:1;a:4:{s:9:"blog_name";s:18:"Kuler Blog Manager";s:12:"blog_keyword";s:0:"";s:21:"blog_meta_description";s:0:"";s:21:"blog_home_description";s:0:"";}i:2;a:4:{s:9:"blog_name";s:18:"Kuler Blog Manager";s:12:"blog_keyword";s:0:"";s:21:"blog_meta_description";s:0:"";s:21:"blog_home_description";s:0:"";}}s:10:"show_title";s:1:"1";s:13:"article_order";s:1:"2";s:6:"column";s:1:"1";}s:8:"category";a:6:{s:17:"articles_per_page";s:1:"3";s:18:"article_characters";s:3:"600";s:20:"featured_image_width";s:3:"270";s:21:"featured_image_height";s:3:"200";s:17:"virtual_directory";s:1:"1";s:22:"virtual_directory_name";s:4:"blog";}s:7:"article";a:12:{s:11:"author_name";s:1:"1";s:4:"date";s:1:"1";s:11:"last_update";s:1:"1";s:8:"category";s:2:"on";s:7:"comment";s:2:"on";s:15:"related_article";s:1:"1";s:20:"featured_image_width";s:3:"270";s:21:"featured_image_height";s:3:"200";s:12:"social_media";s:1:"1";s:17:"add_analytic_code";s:0:"";s:20:"add_this_custom_code";s:0:"";s:10:"url_suffix";s:5:".html";}s:7:"comment";a:10:{s:6:"status";s:1:"1";s:16:"comment_per_page";s:1:"6";s:11:"avatar_size";s:2:"60";s:13:"min_character";s:2:"25";s:13:"max_character";s:4:"1500";s:13:"comment_order";s:17:"date_created_desc";s:18:"email_notification";s:0:"";s:7:"captcha";s:1:"3";s:13:"guest_comment";s:1:"1";s:12:"auto_approve";s:1:"0";}s:6:"search";a:6:{s:6:"status";s:1:"1";s:11:"author_name";s:2:"on";s:4:"date";s:2:"on";s:14:"search_display";s:12:"compact_list";s:13:"search_result";s:1:"6";s:14:"result_per_row";s:1:"6";}s:4:"feed";a:2:{s:6:"status";s:1:"0";s:5:"limit";s:3:"500";}s:7:"sitemap";a:2:{s:6:"status";s:1:"0";s:5:"limit";s:4:"1000";}s:5:"admin";a:1:{s:17:"articles_per_page";s:2:"40";}}', 1),
(887, 0, 'kuler_demo_builder', 'kuler_demo_builder', 'a:1:{s:10:"quickstart";a:3:{s:14:"excluded_items";s:359:"config.php\nadmin/config.php\nimage/catalog/demo/*\nimage/cache/*\nquickstart.zip\nadmin/controller/module/kuler_demo_builder.php\nadmin/language/english/module/kuler_demo_builder.php\nadmin/model/kuler/demo_builder.php\nadmin/view/kuler/js/demo_builder.js\nadmin/view/template/module/kuler_demo_builder.tpl\nvqmod/xml/kulerthemes_demo_admin_account.xml\nvqmod/vqcache/*";s:13:"mapping_items";s:155:"config-dist.php=config.php\nadmin/config-dist.php=admin/config.php\nimage/catalog/demo_placeholder/=image/catalog/demo/\nimage/cache_placeholder/=image/cache/";s:18:"image_placeholders";s:759:"catalog/demo/start/categories/270x270/*=catalog/demo/start/categories/270x270.jpg\ncatalog/demo/start/products/870x1110/*=catalog/demo/start/products/870x1110.jpg\ncatalog/demo/start/layer_sliders/1920x500/*=catalog/demo/start/layer_sliders/1920x500.jpg\nhttp://demo.kulerthemes.com/start/1/image/catalog/demo/start/advanced_html/370x180/*=image/catalog/demo/start/advanced_html/370x180.jpg\nhttp://demo.kulerthemes.com/start/1/image/catalog/demo/start/advanced_html/384x384/*=image/catalog/demo/start/advanced_html/384x384.jpg\ncatalog/demo/start/manufacturers/105x25/*=catalog/demo/start/manufacturers/105x25.jpg\ncatalog/demo/start/blog/270x200/*=catalog/demo/start/blog/270x200.jpg\nimage/catalog/demo/start/cp/170x170.jpg=image/catalog/demo/start/cp/170x170.jpg";}}', 1),
(882, 0, 'kuler_advanced_html', 'kuler_advanced_html_status', '1', 0),
(735, 0, 'kbm_mod_recent_article', 'kbm_mod_recent_article_module', 'a:1:{i:0;a:10:{s:10:"show_title";s:1:"1";s:5:"title";a:2:{i:1;s:15:"Recent Articles";i:2;s:0:"";}s:9:"shortcode";s:40:"[kbm_mod_recent_article recent_articles]";s:10:"sort_order";s:0:"";s:22:"product_featured_image";s:1:"1";s:19:"product_description";s:1:"1";s:13:"article_limit";s:1:"4";s:17:"description_limit";s:2:"50";s:20:"featured_image_width";s:3:"270";s:21:"featured_image_height";s:3:"200";}}', 1),
(734, 0, 'kbm_mod_recent_article', 'kbm_mod_recent_article_status', '1', 0),
(758, 0, 'kuler_showcase', 'kuler_showcase_module', 'a:6:{i:0;a:12:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:10:"sort_order";s:1:"3";s:10:"show_title";s:1:"0";s:6:"status";s:1:"1";s:9:"mainTitle";s:3:"tab";s:5:"title";a:1:{s:2:"en";s:3:"tab";}s:6:"active";s:5:"false";s:4:"type";s:3:"tab";s:9:"shortcode";s:20:"[kuler_showcase tab]";s:9:"$$hashKey";s:8:"object:7";s:9:"showcases";a:2:{i:0;a:8:{s:9:"mainTitle";s:11:"New arrival";s:5:"title";a:1:{s:2:"en";s:11:"New arrival";}s:6:"active";s:4:"true";s:6:"status";s:1:"1";s:10:"show_title";s:1:"1";s:9:"$$hashKey";s:9:"object:22";s:9:"css_class";s:0:"";s:5:"items";a:1:{i:0;a:23:{s:9:"mainTitle";s:6:"Item 1";s:5:"title";a:1:{s:2:"en";s:6:"Item 1";}s:4:"open";s:5:"false";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:4:"type";s:7:"product";s:12:"product_type";s:6:"latest";s:16:"product_category";s:1:"0";s:22:"show_product_deal_date";s:1:"0";s:18:"show_product_image";s:1:"1";s:17:"show_product_name";s:1:"1";s:24:"show_product_description";s:1:"0";s:19:"show_product_rating";s:1:"1";s:18:"show_product_price";s:1:"1";s:23:"show_add_to_cart_button";s:1:"1";s:21:"show_wish_list_button";s:1:"1";s:19:"show_compare_button";s:1:"1";s:19:"product_image_width";s:3:"270";s:20:"product_image_height";s:3:"344";s:25:"product_description_limit";s:0:"";s:13:"product_limit";s:1:"4";s:16:"products_per_row";s:1:"4";s:9:"$$hashKey";s:9:"object:35";}}}i:1;a:8:{s:9:"mainTitle";s:8:"Sale off";s:5:"title";a:1:{s:2:"en";s:8:"Sale off";}s:6:"active";s:1:"0";s:6:"status";s:1:"1";s:10:"show_title";s:1:"1";s:9:"$$hashKey";s:9:"object:56";s:9:"css_class";s:0:"";s:5:"items";a:1:{i:0;a:23:{s:9:"mainTitle";s:6:"Item 1";s:5:"title";a:1:{s:2:"en";s:6:"Item 1";}s:4:"open";s:5:"false";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:4:"type";s:7:"product";s:12:"product_type";s:6:"latest";s:16:"product_category";s:2:"66";s:22:"show_product_deal_date";s:1:"0";s:18:"show_product_image";s:1:"1";s:17:"show_product_name";s:1:"1";s:24:"show_product_description";s:1:"0";s:19:"show_product_rating";s:1:"1";s:18:"show_product_price";s:1:"1";s:23:"show_add_to_cart_button";s:1:"1";s:21:"show_wish_list_button";s:1:"1";s:19:"show_compare_button";s:1:"1";s:19:"product_image_width";s:3:"270";s:20:"product_image_height";s:3:"344";s:25:"product_description_limit";s:0:"";s:13:"product_limit";s:1:"4";s:16:"products_per_row";s:1:"4";s:9:"$$hashKey";s:9:"object:69";}}}}}i:1;a:12:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:10:"sort_order";s:1:"3";s:10:"show_title";s:1:"1";s:6:"status";s:1:"1";s:9:"mainTitle";s:11:"Best Seller";s:5:"title";a:1:{s:2:"en";s:11:"Best Seller";}s:6:"active";s:5:"false";s:4:"type";s:5:"slide";s:9:"shortcode";s:28:"[kuler_showcase best_seller]";s:9:"$$hashKey";s:9:"object:85";s:9:"showcases";a:1:{i:0;a:7:{s:9:"mainTitle";s:10:"Showcase 1";s:5:"title";a:1:{s:2:"en";s:10:"Showcase 1";}s:6:"active";s:4:"true";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:9:"$$hashKey";s:10:"object:100";s:5:"items";a:1:{i:0;a:23:{s:9:"mainTitle";s:6:"Item 1";s:5:"title";a:1:{s:2:"en";s:6:"Item 1";}s:4:"open";s:5:"false";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:4:"type";s:7:"product";s:12:"product_type";s:6:"latest";s:16:"product_category";s:1:"0";s:22:"show_product_deal_date";s:1:"0";s:18:"show_product_image";s:1:"1";s:17:"show_product_name";s:1:"1";s:24:"show_product_description";s:1:"0";s:19:"show_product_rating";s:1:"1";s:18:"show_product_price";s:1:"1";s:23:"show_add_to_cart_button";s:1:"1";s:21:"show_wish_list_button";s:1:"1";s:19:"show_compare_button";s:1:"1";s:19:"product_image_width";s:3:"270";s:20:"product_image_height";s:3:"344";s:25:"product_description_limit";s:3:"100";s:13:"product_limit";s:1:"4";s:16:"products_per_row";s:1:"4";s:9:"$$hashKey";s:10:"object:113";}}}}}i:2;a:12:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:10:"sort_order";s:1:"3";s:10:"show_title";s:1:"0";s:6:"status";s:1:"1";s:9:"mainTitle";s:11:"new arrival";s:5:"title";a:2:{s:2:"en";s:11:"new arrival";s:2:"ar";s:0:"";}s:6:"active";s:5:"false";s:4:"type";s:3:"tab";s:9:"shortcode";s:28:"[kuler_showcase new_arrival]";s:9:"$$hashKey";s:10:"object:139";s:9:"showcases";a:1:{i:0;a:7:{s:9:"mainTitle";s:10:"Showcase 1";s:5:"title";a:2:{s:2:"en";s:10:"Showcase 1";s:2:"ar";s:10:"Showcase 1";}s:6:"active";s:4:"true";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:9:"$$hashKey";s:10:"object:155";s:5:"items";a:1:{i:0;a:23:{s:9:"mainTitle";s:6:"Item 1";s:5:"title";a:2:{s:2:"en";s:6:"Item 1";s:2:"ar";s:6:"Item 1";}s:4:"open";s:4:"true";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:4:"type";s:7:"product";s:12:"product_type";s:6:"latest";s:16:"product_category";s:1:"0";s:22:"show_product_deal_date";s:1:"0";s:18:"show_product_image";s:1:"1";s:17:"show_product_name";s:1:"1";s:24:"show_product_description";s:1:"0";s:19:"show_product_rating";s:1:"1";s:18:"show_product_price";s:1:"1";s:23:"show_add_to_cart_button";s:1:"1";s:21:"show_wish_list_button";s:1:"1";s:19:"show_compare_button";s:1:"1";s:19:"product_image_width";s:3:"270";s:20:"product_image_height";s:3:"344";s:25:"product_description_limit";s:3:"100";s:13:"product_limit";s:1:"2";s:16:"products_per_row";s:1:"2";s:9:"$$hashKey";s:10:"object:169";}}}}}i:3;a:12:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:10:"sort_order";s:1:"3";s:10:"show_title";s:1:"1";s:6:"status";s:1:"1";s:9:"mainTitle";s:10:"Sale Items";s:5:"title";a:2:{s:2:"en";s:10:"Sale Items";s:2:"ar";s:10:"Sale Items";}s:6:"active";s:5:"false";s:4:"type";s:3:"tab";s:9:"shortcode";s:27:"[kuler_showcase sale_items]";s:9:"$$hashKey";s:10:"object:188";s:9:"showcases";a:1:{i:0;a:7:{s:9:"mainTitle";s:10:"Showcase 1";s:5:"title";a:2:{s:2:"en";s:10:"Showcase 1";s:2:"ar";s:10:"Showcase 1";}s:6:"active";s:4:"true";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:9:"$$hashKey";s:10:"object:204";s:5:"items";a:1:{i:0;a:23:{s:9:"mainTitle";s:6:"Item 1";s:5:"title";a:2:{s:2:"en";s:6:"Item 1";s:2:"ar";s:6:"Item 1";}s:4:"open";s:4:"true";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:4:"type";s:7:"product";s:12:"product_type";s:6:"latest";s:16:"product_category";s:2:"66";s:22:"show_product_deal_date";s:1:"0";s:18:"show_product_image";s:1:"1";s:17:"show_product_name";s:1:"1";s:24:"show_product_description";s:1:"0";s:19:"show_product_rating";s:1:"1";s:18:"show_product_price";s:1:"1";s:23:"show_add_to_cart_button";s:1:"1";s:21:"show_wish_list_button";s:1:"1";s:19:"show_compare_button";s:1:"1";s:19:"product_image_width";s:3:"270";s:20:"product_image_height";s:3:"344";s:25:"product_description_limit";s:3:"100";s:13:"product_limit";s:1:"2";s:16:"products_per_row";s:1:"2";s:9:"$$hashKey";s:10:"object:218";}}}}}i:4;a:12:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:10:"sort_order";s:1:"3";s:10:"show_title";s:1:"1";s:6:"status";s:1:"1";s:9:"mainTitle";s:12:"Best sellers";s:5:"title";a:2:{s:2:"en";s:12:"Best sellers";s:2:"ar";s:0:"";}s:6:"active";s:5:"false";s:4:"type";s:3:"tab";s:9:"shortcode";s:29:"[kuler_showcase best_sellers]";s:9:"$$hashKey";s:10:"object:240";s:9:"showcases";a:1:{i:0;a:7:{s:9:"mainTitle";s:10:"Showcase 1";s:5:"title";a:2:{s:2:"en";s:10:"Showcase 1";s:2:"ar";s:10:"Showcase 1";}s:6:"active";s:4:"true";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:9:"$$hashKey";s:10:"object:256";s:5:"items";a:1:{i:0;a:23:{s:9:"mainTitle";s:6:"Item 1";s:5:"title";a:2:{s:2:"en";s:6:"Item 1";s:2:"ar";s:6:"Item 1";}s:4:"open";s:4:"true";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:4:"type";s:7:"product";s:12:"product_type";s:6:"latest";s:16:"product_category";s:2:"59";s:22:"show_product_deal_date";s:1:"0";s:18:"show_product_image";s:1:"1";s:17:"show_product_name";s:1:"1";s:24:"show_product_description";s:1:"0";s:19:"show_product_rating";s:1:"1";s:18:"show_product_price";s:1:"1";s:23:"show_add_to_cart_button";s:1:"1";s:21:"show_wish_list_button";s:1:"1";s:19:"show_compare_button";s:1:"1";s:19:"product_image_width";s:3:"270";s:20:"product_image_height";s:3:"344";s:25:"product_description_limit";s:3:"100";s:13:"product_limit";s:1:"2";s:16:"products_per_row";s:1:"2";s:9:"$$hashKey";s:10:"object:270";}}}}}i:5;a:12:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:10:"sort_order";s:1:"3";s:10:"show_title";s:1:"1";s:6:"status";s:1:"1";s:9:"mainTitle";s:13:"Feature Items";s:5:"title";a:2:{s:2:"en";s:13:"Feature Items";s:2:"ar";s:0:"";}s:6:"active";s:4:"true";s:4:"type";s:3:"tab";s:9:"shortcode";s:30:"[kuler_showcase feature_items]";s:9:"$$hashKey";s:10:"object:292";s:9:"showcases";a:1:{i:0;a:7:{s:9:"mainTitle";s:10:"Showcase 1";s:5:"title";a:2:{s:2:"en";s:10:"Showcase 1";s:2:"ar";s:10:"Showcase 1";}s:6:"active";s:4:"true";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:9:"$$hashKey";s:10:"object:308";s:5:"items";a:1:{i:0;a:23:{s:9:"mainTitle";s:6:"Item 1";s:5:"title";a:2:{s:2:"en";s:6:"Item 1";s:2:"ar";s:6:"Item 1";}s:4:"open";s:4:"true";s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:4:"type";s:7:"product";s:12:"product_type";s:6:"latest";s:16:"product_category";s:2:"91";s:22:"show_product_deal_date";s:1:"0";s:18:"show_product_image";s:1:"1";s:17:"show_product_name";s:1:"1";s:24:"show_product_description";s:1:"0";s:19:"show_product_rating";s:1:"1";s:18:"show_product_price";s:1:"1";s:23:"show_add_to_cart_button";s:1:"1";s:21:"show_wish_list_button";s:1:"1";s:19:"show_compare_button";s:1:"1";s:19:"product_image_width";s:3:"270";s:20:"product_image_height";s:3:"344";s:25:"product_description_limit";s:3:"100";s:13:"product_limit";s:1:"2";s:16:"products_per_row";s:1:"2";s:9:"$$hashKey";s:10:"object:322";}}}}}}', 1),
(740, 0, 'carousel', 'carousel_status', '1', 0),
(749, 0, 'kuler_menu', 'kuler_menu', 'a:6:{i:0;a:16:{s:6:"status";s:1:"1";s:5:"title";a:2:{i:1;s:8:"Category";i:2;s:8:"Category";}s:10:"sort_order";s:1:"1";s:4:"type";s:8:"category";s:16:"enable_hyperlink";s:1:"1";s:4:"link";s:1:"#";s:7:"new_tab";s:1:"1";s:5:"image";s:1:"1";s:14:"image_position";s:10:"float-left";s:11:"description";s:1:"1";s:19:"show_sub_categories";s:1:"1";s:16:"description_text";s:3:"100";s:20:"category_image_width";s:3:"100";s:21:"category_image_height";s:3:"100";s:21:"max_subcategory_items";s:1:"4";s:10:"categories";a:4:{i:0;a:2:{s:11:"category_id";s:2:"59";s:4:"name";s:19:"MEN’S ACCESSORIES";}i:1;a:2:{s:11:"category_id";s:2:"78";s:4:"name";s:21:"WOMEN’S ACCESSORIES";}i:2;a:2:{s:11:"category_id";s:2:"87";s:4:"name";s:15:"WOMEN’S SHOES";}i:3;a:2:{s:11:"category_id";s:2:"70";s:4:"name";s:13:"MEN’S SHIRT";}}}i:1;a:17:{s:6:"status";s:1:"1";s:5:"title";a:2:{i:1;s:8:"products";i:2;s:8:"products";}s:10:"sort_order";s:1:"2";s:4:"type";s:7:"product";s:16:"enable_hyperlink";s:1:"0";s:4:"link";s:0:"";s:7:"new_tab";s:1:"1";s:11:"image_width";s:3:"270";s:12:"image_height";s:3:"344";s:4:"name";s:1:"1";s:5:"price";s:1:"1";s:6:"rating";s:1:"1";s:11:"description";s:1:"1";s:3:"add";s:1:"1";s:8:"wishlist";s:1:"1";s:7:"compare";s:1:"1";s:8:"products";a:4:{i:0;a:2:{s:10:"product_id";s:2:"50";s:4:"name";s:25:"Cheap Monday Zip Backpack";}i:1;a:2:{s:10:"product_id";s:2:"53";s:4:"name";s:32:"Criminal Damage Longline T-Shirt";}i:2;a:2:{s:10:"product_id";s:2:"54";s:4:"name";s:42:"Cropped Boyfriend T-Shirt with Roll Sleeve";}i:3;a:2:{s:10:"product_id";s:2:"63";s:4:"name";s:35:"Esprit Short Sleeve Henley In Pique";}}}i:2;a:8:{s:6:"status";s:1:"1";s:5:"title";a:2:{i:1;s:11:"Custom HTML";i:2;s:11:"Custom HTML";}s:10:"sort_order";s:1:"3";s:4:"type";s:4:"html";s:16:"enable_hyperlink";s:1:"0";s:4:"link";s:0:"";s:7:"new_tab";s:1:"1";s:5:"htmls";a:2:{i:1;s:765:"&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col-md-6&quot;&gt;\r\n&lt;style type=&quot;text/css&quot;&gt;.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; height: auto; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }\r\n&lt;/style&gt;\r\n&lt;div class=&quot;embed-container&quot;&gt;&lt;iframe src=&quot;http://player.vimeo.com/video/26017275&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;col-md-6&quot;&gt;\r\n&lt;div class=&quot;embed-container&quot;&gt;&lt;iframe src=&quot;http://player.vimeo.com/video/51094481&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;";i:2;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";}}i:3;a:9:{s:6:"status";s:1:"1";s:5:"title";a:2:{i:1;s:12:"Custom links";i:2;s:12:"Custom links";}s:10:"sort_order";s:1:"4";s:4:"type";s:6:"custom";s:16:"enable_hyperlink";s:1:"0";s:4:"link";s:0:"";s:7:"new_tab";s:1:"1";s:11:"sub_new_tab";s:1:"0";s:5:"links";a:2:{i:0;a:2:{s:6:"titles";a:2:{i:1;s:11:"Test link 1";i:2;s:11:"Test link 1";}s:4:"link";s:1:"#";}i:1;a:2:{s:6:"titles";a:2:{i:1;s:11:"Test link 2";i:2;s:11:"Test link 2";}s:4:"link";s:1:"#";}}}i:4;a:8:{s:6:"status";s:1:"1";s:5:"title";a:2:{i:1;s:4:"Blog";i:2;s:4:"Blog";}s:10:"sort_order";s:1:"5";s:4:"type";s:6:"custom";s:16:"enable_hyperlink";s:1:"1";s:4:"link";s:26:"index.php?route=module/kbm";s:7:"new_tab";s:1:"0";s:11:"sub_new_tab";s:1:"0";}i:5;a:8:{s:6:"status";s:1:"1";s:5:"title";a:2:{i:1;s:19:"Purchase this theme";i:2;s:19:"Purchase this theme";}s:10:"sort_order";s:1:"6";s:4:"type";s:6:"custom";s:16:"enable_hyperlink";s:1:"1";s:4:"link";s:44:"http://www.kulerthemes.com/theme/start-theme";s:7:"new_tab";s:1:"1";s:11:"sub_new_tab";s:1:"0";}}', 1),
(757, 0, 'kuler_showcase', 'kuler_showcase_status', '1', 0),
(860, 0, 'config', 'config_maintenance', '0', 0),
(861, 0, 'config', 'config_password', '1', 0),
(862, 0, 'config', 'config_encryption', '2c52d1b23620128558b9a75430c5dcaf', 0),
(863, 0, 'config', 'config_compression', '0', 0),
(864, 0, 'config', 'config_error_display', '1', 0),
(865, 0, 'config', 'config_error_log', '1', 0),
(866, 0, 'config', 'config_error_filename', 'error.log', 0),
(NULL, 0, 'config', 'config_google_analytics', '', 0);

--
-- TABLE STRUCTURE FOR: oc_stock_status
--

DROP TABLE IF EXISTS oc_stock_status;

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO oc_stock_status (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days'),
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2-3 Days');

--
-- TABLE STRUCTURE FOR: oc_store
--

DROP TABLE IF EXISTS oc_store;

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_tax_class
--

DROP TABLE IF EXISTS oc_tax_class;

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO oc_tax_class (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

--
-- TABLE STRUCTURE FOR: oc_tax_rate
--

DROP TABLE IF EXISTS oc_tax_rate;

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

INSERT INTO oc_tax_rate (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

--
-- TABLE STRUCTURE FOR: oc_tax_rate_to_customer_group
--

DROP TABLE IF EXISTS oc_tax_rate_to_customer_group;

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_tax_rate_to_customer_group (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

--
-- TABLE STRUCTURE FOR: oc_tax_rule
--

DROP TABLE IF EXISTS oc_tax_rule;

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

INSERT INTO oc_tax_rule (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

--
-- TABLE STRUCTURE FOR: oc_upload
--

DROP TABLE IF EXISTS oc_upload;

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_url_alias
--

DROP TABLE IF EXISTS oc_url_alias;

CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM AUTO_INCREMENT=844 DEFAULT CHARSET=utf8;

INSERT INTO oc_url_alias (`url_alias_id`, `query`, `keyword`) VALUES
(824, 'product_id=48', 'ipod-classic'),
(836, 'category_id=20', 'desktops'),
(834, 'category_id=26', 'pc'),
(835, 'category_id=27', 'mac'),
(730, 'manufacturer_id=8', 'apple'),
(772, 'information_id=4', 'about_us'),
(768, 'product_id=42', 'test'),
(789, 'category_id=34', 'mp3-players'),
(781, 'category_id=36', 'test2'),
(774, 'category_id=18', 'laptop-notebook'),
(775, 'category_id=46', 'macs'),
(776, 'category_id=45', 'windows'),
(777, 'category_id=25', 'component'),
(778, 'category_id=29', 'mouse'),
(779, 'category_id=28', 'monitor'),
(780, 'category_id=35', 'test1'),
(782, 'category_id=30', 'printer'),
(783, 'category_id=31', 'scanner'),
(784, 'category_id=32', 'web-camera'),
(785, 'category_id=57', 'tablet'),
(786, 'category_id=17', 'software'),
(787, 'category_id=24', 'smartphone'),
(788, 'category_id=33', 'camera'),
(790, 'category_id=43', 'test11'),
(791, 'category_id=44', 'test12'),
(792, 'category_id=47', 'test15'),
(793, 'category_id=48', 'test16'),
(794, 'category_id=49', 'test17'),
(795, 'category_id=50', 'test18'),
(796, 'category_id=51', 'test19'),
(797, 'category_id=52', 'test20'),
(798, 'category_id=58', 'test25'),
(799, 'category_id=53', 'test21'),
(800, 'category_id=54', 'test22'),
(801, 'category_id=55', 'test23'),
(802, 'category_id=56', 'test24'),
(803, 'category_id=38', 'test4'),
(804, 'category_id=37', 'test5'),
(805, 'category_id=39', 'test6'),
(806, 'category_id=40', 'test7'),
(807, 'category_id=41', 'test8'),
(808, 'category_id=42', 'test9'),
(809, 'product_id=30', 'canon-eos-5d'),
(840, 'product_id=47', 'hp-lp3065'),
(811, 'product_id=28', 'htc-touch-hd'),
(812, 'product_id=43', 'macbook'),
(813, 'product_id=44', 'macbook-air'),
(814, 'product_id=45', 'macbook-pro'),
(816, 'product_id=31', 'nikon-d300'),
(817, 'product_id=29', 'palm-treo-pro'),
(818, 'product_id=35', 'product-8'),
(819, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(820, 'product_id=33', 'samsung-syncmaster-941bw'),
(821, 'product_id=46', 'sony-vaio'),
(837, 'product_id=41', 'imac'),
(823, 'product_id=40', 'iphone'),
(825, 'product_id=36', 'ipod-nano'),
(826, 'product_id=34', 'ipod-shuffle'),
(827, 'product_id=32', 'ipod-touch'),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(841, 'information_id=6', 'delivery'),
(842, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms');

--
-- TABLE STRUCTURE FOR: oc_user
--

DROP TABLE IF EXISTS oc_user;

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO oc_user (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'demoadmin', '4ea20ce84853e7a35415227597eefbfca8709ec2', 'f9cf0f946', 'Contact', 'Kulerthemes', 'contact@kulerthemes.com', '', '', '1.55.100.8', 1, '2014-11-12 01:23:48');

--
-- TABLE STRUCTURE FOR: oc_user_group
--

DROP TABLE IF EXISTS oc_user_group;

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO oc_user_group (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', 'a:2:{s:6:"access";a:186:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:17:"catalog/recurring";i:10;s:14:"catalog/review";i:11;s:18:"common/column_left";i:12;s:18:"common/filemanager";i:13;s:11:"common/menu";i:14;s:14:"common/profile";i:15;s:12:"common/stats";i:16;s:18:"dashboard/activity";i:17;s:15:"dashboard/chart";i:18;s:18:"dashboard/customer";i:19;s:13:"dashboard/map";i:20;s:16:"dashboard/online";i:21;s:15:"dashboard/order";i:22;s:16:"dashboard/recent";i:23;s:14:"dashboard/sale";i:24;s:13:"design/banner";i:25;s:13:"design/layout";i:26;s:14:"extension/feed";i:27;s:19:"extension/installer";i:28;s:22:"extension/modification";i:29;s:16:"extension/module";i:30;s:17:"extension/openbay";i:31;s:17:"extension/payment";i:32;s:18:"extension/shipping";i:33;s:15:"extension/total";i:34;s:16:"feed/google_base";i:35;s:19:"feed/google_sitemap";i:36;s:15:"feed/openbaypro";i:37;s:20:"localisation/country";i:38;s:21:"localisation/currency";i:39;s:21:"localisation/geo_zone";i:40;s:21:"localisation/language";i:41;s:25:"localisation/length_class";i:42;s:21:"localisation/location";i:43;s:25:"localisation/order_status";i:44;s:26:"localisation/return_action";i:45;s:26:"localisation/return_reason";i:46;s:26:"localisation/return_status";i:47;s:25:"localisation/stock_status";i:48;s:22:"localisation/tax_class";i:49;s:21:"localisation/tax_rate";i:50;s:25:"localisation/weight_class";i:51;s:17:"localisation/zone";i:52;s:19:"marketing/affiliate";i:53;s:17:"marketing/contact";i:54;s:16:"marketing/coupon";i:55;s:19:"marketing/marketing";i:56;s:14:"module/account";i:57;s:16:"module/affiliate";i:58;s:20:"module/amazon_button";i:59;s:13:"module/banner";i:60;s:17:"module/bestseller";i:61;s:15:"module/carousel";i:62;s:15:"module/category";i:63;s:18:"module/ebaydisplay";i:64;s:15:"module/featured";i:65;s:13:"module/filter";i:66;s:22:"module/google_hangouts";i:67;s:11:"module/html";i:68;s:18:"module/information";i:69;s:13:"module/latest";i:70;s:16:"module/pp_button";i:71;s:15:"module/pp_login";i:72;s:16:"module/slideshow";i:73;s:14:"module/special";i:74;s:12:"module/store";i:75;s:14:"openbay/amazon";i:76;s:22:"openbay/amazon_listing";i:77;s:22:"openbay/amazon_product";i:78;s:16:"openbay/amazonus";i:79;s:24:"openbay/amazonus_listing";i:80;s:24:"openbay/amazonus_product";i:81;s:12:"openbay/ebay";i:82;s:20:"openbay/ebay_profile";i:83;s:21:"openbay/ebay_template";i:84;s:12:"openbay/etsy";i:85;s:20:"openbay/etsy_product";i:86;s:21:"openbay/etsy_shipping";i:87;s:17:"openbay/etsy_shop";i:88;s:23:"payment/amazon_checkout";i:89;s:24:"payment/authorizenet_aim";i:90;s:24:"payment/authorizenet_sim";i:91;s:21:"payment/bank_transfer";i:92;s:27:"payment/bluepay_hosted_form";i:93;s:24:"payment/bluepay_redirect";i:94;s:14:"payment/cheque";i:95;s:11:"payment/cod";i:96;s:17:"payment/firstdata";i:97;s:24:"payment/firstdata_remote";i:98;s:21:"payment/free_checkout";i:99;s:22:"payment/klarna_account";i:100;s:22:"payment/klarna_invoice";i:101;s:14:"payment/liqpay";i:102;s:20:"payment/moneybookers";i:103;s:14:"payment/nochex";i:104;s:15:"payment/paymate";i:105;s:16:"payment/paypoint";i:106;s:13:"payment/payza";i:107;s:26:"payment/perpetual_payments";i:108;s:18:"payment/pp_express";i:109;s:18:"payment/pp_payflow";i:110;s:25:"payment/pp_payflow_iframe";i:111;s:14:"payment/pp_pro";i:112;s:21:"payment/pp_pro_iframe";i:113;s:19:"payment/pp_standard";i:114;s:14:"payment/realex";i:115;s:21:"payment/realex_remote";i:116;s:22:"payment/sagepay_direct";i:117;s:22:"payment/sagepay_server";i:118;s:18:"payment/sagepay_us";i:119;s:19:"payment/twocheckout";i:120;s:28:"payment/web_payment_software";i:121;s:16:"payment/worldpay";i:122;s:16:"report/affiliate";i:123;s:25:"report/affiliate_activity";i:124;s:24:"report/customer_activity";i:125;s:22:"report/customer_credit";i:126;s:22:"report/customer_online";i:127;s:21:"report/customer_order";i:128;s:22:"report/customer_reward";i:129;s:16:"report/marketing";i:130;s:24:"report/product_purchased";i:131;s:21:"report/product_viewed";i:132;s:18:"report/sale_coupon";i:133;s:17:"report/sale_order";i:134;s:18:"report/sale_return";i:135;s:20:"report/sale_shipping";i:136;s:15:"report/sale_tax";i:137;s:17:"sale/custom_field";i:138;s:13:"sale/customer";i:139;s:20:"sale/customer_ban_ip";i:140;s:19:"sale/customer_group";i:141;s:10:"sale/order";i:142;s:14:"sale/recurring";i:143;s:11:"sale/return";i:144;s:12:"sale/voucher";i:145;s:18:"sale/voucher_theme";i:146;s:15:"setting/setting";i:147;s:13:"setting/store";i:148;s:16:"shipping/auspost";i:149;s:17:"shipping/citylink";i:150;s:14:"shipping/fedex";i:151;s:13:"shipping/flat";i:152;s:13:"shipping/free";i:153;s:13:"shipping/item";i:154;s:23:"shipping/parcelforce_48";i:155;s:15:"shipping/pickup";i:156;s:19:"shipping/royal_mail";i:157;s:12:"shipping/ups";i:158;s:13:"shipping/usps";i:159;s:15:"shipping/weight";i:160;s:11:"tool/backup";i:161;s:14:"tool/error_log";i:162;s:11:"tool/upload";i:163;s:12:"total/coupon";i:164;s:12:"total/credit";i:165;s:14:"total/handling";i:166;s:16:"total/klarna_fee";i:167;s:19:"total/low_order_fee";i:168;s:12:"total/reward";i:169;s:14:"total/shipping";i:170;s:15:"total/sub_total";i:171;s:9:"total/tax";i:172;s:11:"total/total";i:173;s:13:"total/voucher";i:174;s:8:"user/api";i:175;s:9:"user/user";i:176;s:20:"user/user_permission";i:177;s:15:"module/kuler_cp";i:178;s:17:"module/kuler_menu";i:179;s:25:"module/kuler_layer_slider";i:180;s:21:"module/kuler_showcase";i:181;s:26:"module/kuler_advanced_html";i:182;s:25:"module/kuler_contact_form";i:183;s:10:"module/kbm";i:184;s:29:"module/kbm_mod_recent_article";i:185;s:25:"module/kuler_demo_builder";}s:6:"modify";a:186:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:17:"catalog/recurring";i:10;s:14:"catalog/review";i:11;s:18:"common/column_left";i:12;s:18:"common/filemanager";i:13;s:11:"common/menu";i:14;s:14:"common/profile";i:15;s:12:"common/stats";i:16;s:18:"dashboard/activity";i:17;s:15:"dashboard/chart";i:18;s:18:"dashboard/customer";i:19;s:13:"dashboard/map";i:20;s:16:"dashboard/online";i:21;s:15:"dashboard/order";i:22;s:16:"dashboard/recent";i:23;s:14:"dashboard/sale";i:24;s:13:"design/banner";i:25;s:13:"design/layout";i:26;s:14:"extension/feed";i:27;s:19:"extension/installer";i:28;s:22:"extension/modification";i:29;s:16:"extension/module";i:30;s:17:"extension/openbay";i:31;s:17:"extension/payment";i:32;s:18:"extension/shipping";i:33;s:15:"extension/total";i:34;s:16:"feed/google_base";i:35;s:19:"feed/google_sitemap";i:36;s:15:"feed/openbaypro";i:37;s:20:"localisation/country";i:38;s:21:"localisation/currency";i:39;s:21:"localisation/geo_zone";i:40;s:21:"localisation/language";i:41;s:25:"localisation/length_class";i:42;s:21:"localisation/location";i:43;s:25:"localisation/order_status";i:44;s:26:"localisation/return_action";i:45;s:26:"localisation/return_reason";i:46;s:26:"localisation/return_status";i:47;s:25:"localisation/stock_status";i:48;s:22:"localisation/tax_class";i:49;s:21:"localisation/tax_rate";i:50;s:25:"localisation/weight_class";i:51;s:17:"localisation/zone";i:52;s:19:"marketing/affiliate";i:53;s:17:"marketing/contact";i:54;s:16:"marketing/coupon";i:55;s:19:"marketing/marketing";i:56;s:14:"module/account";i:57;s:16:"module/affiliate";i:58;s:20:"module/amazon_button";i:59;s:13:"module/banner";i:60;s:17:"module/bestseller";i:61;s:15:"module/carousel";i:62;s:15:"module/category";i:63;s:18:"module/ebaydisplay";i:64;s:15:"module/featured";i:65;s:13:"module/filter";i:66;s:22:"module/google_hangouts";i:67;s:11:"module/html";i:68;s:18:"module/information";i:69;s:13:"module/latest";i:70;s:16:"module/pp_button";i:71;s:15:"module/pp_login";i:72;s:16:"module/slideshow";i:73;s:14:"module/special";i:74;s:12:"module/store";i:75;s:14:"openbay/amazon";i:76;s:22:"openbay/amazon_listing";i:77;s:22:"openbay/amazon_product";i:78;s:16:"openbay/amazonus";i:79;s:24:"openbay/amazonus_listing";i:80;s:24:"openbay/amazonus_product";i:81;s:12:"openbay/ebay";i:82;s:20:"openbay/ebay_profile";i:83;s:21:"openbay/ebay_template";i:84;s:12:"openbay/etsy";i:85;s:20:"openbay/etsy_product";i:86;s:21:"openbay/etsy_shipping";i:87;s:17:"openbay/etsy_shop";i:88;s:23:"payment/amazon_checkout";i:89;s:24:"payment/authorizenet_aim";i:90;s:24:"payment/authorizenet_sim";i:91;s:21:"payment/bank_transfer";i:92;s:27:"payment/bluepay_hosted_form";i:93;s:24:"payment/bluepay_redirect";i:94;s:14:"payment/cheque";i:95;s:11:"payment/cod";i:96;s:17:"payment/firstdata";i:97;s:24:"payment/firstdata_remote";i:98;s:21:"payment/free_checkout";i:99;s:22:"payment/klarna_account";i:100;s:22:"payment/klarna_invoice";i:101;s:14:"payment/liqpay";i:102;s:20:"payment/moneybookers";i:103;s:14:"payment/nochex";i:104;s:15:"payment/paymate";i:105;s:16:"payment/paypoint";i:106;s:13:"payment/payza";i:107;s:26:"payment/perpetual_payments";i:108;s:18:"payment/pp_express";i:109;s:18:"payment/pp_payflow";i:110;s:25:"payment/pp_payflow_iframe";i:111;s:14:"payment/pp_pro";i:112;s:21:"payment/pp_pro_iframe";i:113;s:19:"payment/pp_standard";i:114;s:14:"payment/realex";i:115;s:21:"payment/realex_remote";i:116;s:22:"payment/sagepay_direct";i:117;s:22:"payment/sagepay_server";i:118;s:18:"payment/sagepay_us";i:119;s:19:"payment/twocheckout";i:120;s:28:"payment/web_payment_software";i:121;s:16:"payment/worldpay";i:122;s:16:"report/affiliate";i:123;s:25:"report/affiliate_activity";i:124;s:24:"report/customer_activity";i:125;s:22:"report/customer_credit";i:126;s:22:"report/customer_online";i:127;s:21:"report/customer_order";i:128;s:22:"report/customer_reward";i:129;s:16:"report/marketing";i:130;s:24:"report/product_purchased";i:131;s:21:"report/product_viewed";i:132;s:18:"report/sale_coupon";i:133;s:17:"report/sale_order";i:134;s:18:"report/sale_return";i:135;s:20:"report/sale_shipping";i:136;s:15:"report/sale_tax";i:137;s:17:"sale/custom_field";i:138;s:13:"sale/customer";i:139;s:20:"sale/customer_ban_ip";i:140;s:19:"sale/customer_group";i:141;s:10:"sale/order";i:142;s:14:"sale/recurring";i:143;s:11:"sale/return";i:144;s:12:"sale/voucher";i:145;s:18:"sale/voucher_theme";i:146;s:15:"setting/setting";i:147;s:13:"setting/store";i:148;s:16:"shipping/auspost";i:149;s:17:"shipping/citylink";i:150;s:14:"shipping/fedex";i:151;s:13:"shipping/flat";i:152;s:13:"shipping/free";i:153;s:13:"shipping/item";i:154;s:23:"shipping/parcelforce_48";i:155;s:15:"shipping/pickup";i:156;s:19:"shipping/royal_mail";i:157;s:12:"shipping/ups";i:158;s:13:"shipping/usps";i:159;s:15:"shipping/weight";i:160;s:11:"tool/backup";i:161;s:14:"tool/error_log";i:162;s:11:"tool/upload";i:163;s:12:"total/coupon";i:164;s:12:"total/credit";i:165;s:14:"total/handling";i:166;s:16:"total/klarna_fee";i:167;s:19:"total/low_order_fee";i:168;s:12:"total/reward";i:169;s:14:"total/shipping";i:170;s:15:"total/sub_total";i:171;s:9:"total/tax";i:172;s:11:"total/total";i:173;s:13:"total/voucher";i:174;s:8:"user/api";i:175;s:9:"user/user";i:176;s:20:"user/user_permission";i:177;s:15:"module/kuler_cp";i:178;s:17:"module/kuler_menu";i:179;s:25:"module/kuler_layer_slider";i:180;s:21:"module/kuler_showcase";i:181;s:26:"module/kuler_advanced_html";i:182;s:25:"module/kuler_contact_form";i:183;s:10:"module/kbm";i:184;s:29:"module/kbm_mod_recent_article";i:185;s:25:"module/kuler_demo_builder";}}'),
(10, 'Demonstration', '');

--
-- TABLE STRUCTURE FOR: oc_voucher
--

DROP TABLE IF EXISTS oc_voucher;

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_voucher_history
--

DROP TABLE IF EXISTS oc_voucher_history;

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- TABLE STRUCTURE FOR: oc_voucher_theme
--

DROP TABLE IF EXISTS oc_voucher_theme;

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO oc_voucher_theme (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

--
-- TABLE STRUCTURE FOR: oc_voucher_theme_description
--

DROP TABLE IF EXISTS oc_voucher_theme_description;

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO oc_voucher_theme_description (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

--
-- TABLE STRUCTURE FOR: oc_weight_class
--

DROP TABLE IF EXISTS oc_weight_class;

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO oc_weight_class (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

--
-- TABLE STRUCTURE FOR: oc_weight_class_description
--

DROP TABLE IF EXISTS oc_weight_class_description;

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO oc_weight_class_description (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 2, 'Pound ', 'lb'),
(6, 2, 'Ounce', 'oz');

--
-- TABLE STRUCTURE FOR: oc_zone
--

DROP TABLE IF EXISTS oc_zone;

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4222 DEFAULT CHARSET=utf8;

INSERT INTO oc_zone (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M\'Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu\'a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark\'unik\'', 'GEG', 1),
(184, 11, 'Kotayk\'', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik\'', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots\' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore\'s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel\'skaya (Homyel\')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George\'s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith\'s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M\'Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O\'Hi', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chi', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '\'Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma\'iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa\'id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina\'', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina\'', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d\'Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand\'Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1428, 97, 'Bacs-Kiskun', 'BK', 1),
(1429, 97, 'Baranya', 'BA', 1),
(1430, 97, 'Bekes', 'BE', 1),
(1431, 97, 'Bekescsaba', 'BS', 1),
(1432, 97, 'Borsod-Abauj-Zemplen', 'BZ', 1),
(1433, 97, 'Budapest', 'BU', 1),
(1434, 97, 'Csongrad', 'CS', 1),
(1435, 97, 'Debrecen', 'DE', 1),
(1436, 97, 'Dunaujvaros', 'DU', 1),
(1437, 97, 'Eger', 'EG', 1),
(1438, 97, 'Fejer', 'FE', 1),
(1439, 97, 'Gyor', 'GY', 1),
(1440, 97, 'Gyor-Moson-Sopron', 'GM', 1),
(1441, 97, 'Hajdu-Bihar', 'HB', 1),
(1442, 97, 'Heves', 'HE', 1),
(1443, 97, 'Hodmezovasarhely', 'HO', 1),
(1444, 97, 'Jasz-Nagykun-Szolnok', 'JN', 1),
(1445, 97, 'Kaposvar', 'KA', 1),
(1446, 97, 'Kecskemet', 'KE', 1),
(1447, 97, 'Komarom-Esztergom', 'KO', 1),
(1448, 97, 'Miskolc', 'MI', 1),
(1449, 97, 'Nagykanizsa', 'NA', 1),
(1450, 97, 'Nograd', 'NO', 1),
(1451, 97, 'Nyiregyhaza', 'NY', 1),
(1452, 97, 'Pecs', 'PE', 1),
(1453, 97, 'Pest', 'PS', 1),
(1454, 97, 'Somogy', 'SO', 1),
(1455, 97, 'Sopron', 'SP', 1),
(1456, 97, 'Szabolcs-Szatmar-Bereg', 'SS', 1),
(1457, 97, 'Szeged', 'SZ', 1),
(1458, 97, 'Szekesfehervar', 'SE', 1),
(1459, 97, 'Szolnok', 'SL', 1),
(1460, 97, 'Szombathely', 'SM', 1),
(1461, 97, 'Tatabanya', 'TA', 1),
(1462, 97, 'Tolna', 'TO', 1),
(1463, 97, 'Vas', 'VA', 1),
(1464, 97, 'Veszprem', 'VE', 1),
(1465, 97, 'Zala', 'ZA', 1),
(1466, 97, 'Zalaegerszeg', 'ZZ', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Pondicherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta\'mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be\'er Sheva', 'BS', 1),
(1613, 104, 'Bika\'at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '\'Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al \'Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa\'', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa\'', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma\'an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P\'yongan-bukto', 'PYB', 1),
(1769, 112, 'P\'yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P\'yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 1),
(1774, 113, 'Ch\'ungch\'ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch\'on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t\'ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al \'Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra\'', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale\'s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha\'s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al \'Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati\'', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke\'s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa\'id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul\'yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust\'-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A\'ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa\'asaleleaga', 'FA', 1),
(2856, 181, 'Gaga\'emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa\'itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va\'a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '\'Asir', 'AS', 1),
(2882, 184, 'Ha\'il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand\' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand\' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A\'ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa\'iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t\'ou', 'NT', 1),
(3145, 206, 'P\'eng-hu', 'PH', 1),
(3146, 206, 'P\'ing-tung', 'PT', 1),
(3147, 206, 'T\'ai-chung', 'TG', 1),
(3148, 206, 'T\'ai-nan', 'TA', 1),
(3149, 206, 'T\'ai-pei county', 'TP', 1),
(3150, 206, 'T\'ai-tung', 'TT', 1),
(3151, 206, 'T\'ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T\'ai-chung', 'TH', 1),
(3157, 206, 'T\'ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T\'ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha\'apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava\'u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkasy', 'CK', 1),
(3481, 220, 'Chernihiv', 'CH', 1),
(3482, 220, 'Chernivtsi', 'CV', 1),
(3483, 220, 'Crimea', 'CR', 1),
(3484, 220, 'Dnipropetrovs\'k', 'DN', 1),
(3485, 220, 'Donets\'k', 'DO', 1),
(3486, 220, 'Ivano-Frankivs\'k', 'IV', 1),
(3487, 220, 'Kharkiv Kherson', 'KL', 1),
(3488, 220, 'Khmel\'nyts\'kyy', 'KM', 1),
(3489, 220, 'Kirovohrad', 'KR', 1),
(3490, 220, 'Kiev', 'KV', 1),
(3491, 220, 'Kyyiv', 'KY', 1),
(3492, 220, 'Luhans\'k', 'LU', 1),
(3493, 220, 'L\'viv', 'LV', 1),
(3494, 220, 'Mykolayiv', 'MY', 1),
(3495, 220, 'Odesa', 'OD', 1),
(3496, 220, 'Poltava', 'PO', 1),
(3497, 220, 'Rivne', 'RI', 1),
(3498, 220, 'Sevastopol', 'SE', 1),
(3499, 220, 'Sumy', 'SU', 1),
(3500, 220, 'Ternopil\'', 'TE', 1),
(3501, 220, 'Vinnytsya', 'VI', 1),
(3502, 220, 'Volyn\'', 'VO', 1),
(3503, 220, 'Zakarpattya', 'ZK', 1),
(3504, 220, 'Zaporizhzhya', 'ZA', 1),
(3505, 220, 'Zhytomyr', 'ZH', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '\'Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubayy', 'DU', 1),
(3511, 221, 'R\'as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg\'ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma\'rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa\'dah', 'SD', 1),
(3805, 235, 'San\'a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta\'izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1);

--
-- TABLE STRUCTURE FOR: oc_zone_to_geo_zone
--

DROP TABLE IF EXISTS oc_zone_to_geo_zone;

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

INSERT INTO oc_zone_to_geo_zone (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

