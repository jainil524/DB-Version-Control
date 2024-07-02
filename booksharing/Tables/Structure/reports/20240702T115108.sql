CREATE TABLE `reports` (
  `Report_id` int NOT NULL AUTO_INCREMENT,
  `Report_msg` text COLLATE utf8mb4_general_ci NOT NULL,
  `reporter_user` int NOT NULL,
  `reported_user` int NOT NULL,
  `report_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Report_id`),
  KEY `reported_user` (`reported_user`),
  KEY `reporter_user` (`reporter_user`),
  CONSTRAINT `reported_user` FOREIGN KEY (`reported_user`) REFERENCES `user` (`user_id`),
  CONSTRAINT `reporter_user` FOREIGN KEY (`reporter_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;