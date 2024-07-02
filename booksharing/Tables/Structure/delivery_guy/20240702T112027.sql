CREATE TABLE `delivery_guy` (
  `delivery_guy_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'This is delivery guy id',
  `delivery_guy_name` varchar(255) NOT NULL COMMENT 'This is delivery guy name',
  `delivery_guy_email` varchar(255) NOT NULL COMMENT 'This is delivery guy email',
  `delivery_guy_dob` date NOT NULL COMMENT 'This is delivery guy date of birth',
  `Profile_photo` varchar(70) NOT NULL,
  `delivery_guy_address` varchar(255) NOT NULL,
  `delivery_guy_pincode` int(255) NOT NULL COMMENT 'This is delivery guy pincode',
  `delivery_guy_password` varchar(255) NOT NULL COMMENT 'This is delivery guy password',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`delivery_guy_id`),
  UNIQUE KEY `delivery_guy_email` (`delivery_guy_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;