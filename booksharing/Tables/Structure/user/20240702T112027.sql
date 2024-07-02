CREATE TABLE `user` (
  `user_id` int(30) NOT NULL AUTO_INCREMENT,
  `fname` varchar(190) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `email` varchar(90) NOT NULL,
  `Profile_photo` varchar(255) NOT NULL DEFAULT 'media/profile_photos/default_photo.svg',
  `address` text NOT NULL,
  `pincode` int(20) NOT NULL,
  `create_date` date NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL,
  `IsRestricted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;