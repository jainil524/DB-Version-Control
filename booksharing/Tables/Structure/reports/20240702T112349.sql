CREATE TABLE `reports` (
  `Report_id` int(12) NOT NULL AUTO_INCREMENT,
  `Report_msg` text NOT NULL,
  `reporter_user` int(12) NOT NULL,
  `reported_user` int(12) NOT NULL,
  `report_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Report_id`),
  KEY `reported_user` (`reported_user`),
  KEY `reporter_user` (`reporter_user`),
  CONSTRAINT `reported_user` FOREIGN KEY (`reported_user`) REFERENCES `user` (`user_id`),
  CONSTRAINT `reporter_user` FOREIGN KEY (`reporter_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;