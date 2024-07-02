CREATE TABLE `warn_user_delivery_guy` (
  `wanr_id` int NOT NULL AUTO_INCREMENT,
  `warn_user_id` int NOT NULL,
  `warning_message` text COLLATE utf8mb4_general_ci NOT NULL,
  `warn_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wanr_id`),
  KEY `warned_user` (`warn_user_id`),
  CONSTRAINT `warned_user` FOREIGN KEY (`warn_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;