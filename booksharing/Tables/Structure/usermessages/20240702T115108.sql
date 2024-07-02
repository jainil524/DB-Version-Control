CREATE TABLE `usermessages` (
  `msgid` int NOT NULL AUTO_INCREMENT,
  `sender` int NOT NULL,
  `receiver` int NOT NULL,
  `usermsg` text COLLATE utf8mb4_general_ci NOT NULL,
  `send_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`msgid`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`),
  CONSTRAINT `receiver` FOREIGN KEY (`receiver`) REFERENCES `user` (`user_id`),
  CONSTRAINT `sender` FOREIGN KEY (`sender`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;