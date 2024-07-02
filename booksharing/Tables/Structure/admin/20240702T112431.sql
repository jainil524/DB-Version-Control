CREATE TABLE `admin` (
  `admin_id` int(60) NOT NULL AUTO_INCREMENT COMMENT 'This is admin id',
  `admin_name` varchar(255) NOT NULL COMMENT 'this is admin name',
  `admin_email` varchar(255) NOT NULL COMMENT 'This is admin email id',
  `password` varchar(255) NOT NULL COMMENT 'this is admin password',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;