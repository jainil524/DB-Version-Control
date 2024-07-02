CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(190) COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(90) COLLATE utf8mb4_general_ci NOT NULL,
  `Profile_photo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'media/profile_photos/default_photo.svg',
  `address` text COLLATE utf8mb4_general_ci NOT NULL,
  `pincode` int NOT NULL,
  `create_date` date NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `IsRestricted` tinyint(1) NOT NULL DEFAULT '0',
  `is_madarchod` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;