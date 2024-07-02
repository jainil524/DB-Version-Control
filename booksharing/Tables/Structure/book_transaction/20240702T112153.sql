CREATE TABLE `book_transaction` (
  `book_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'This is book id',
  `book_name` varchar(255) NOT NULL COMMENT 'This is book name',
  `book_price` int(255) NOT NULL COMMENT 'This is book price',
  `book_category` int(60) NOT NULL,
  `book_author` varchar(255) NOT NULL COMMENT 'This is book publisher name',
  `book_coverpage` text DEFAULT NULL COMMENT 'This is image of book cover',
  `book_publish_year` year(4) NOT NULL COMMENT 'This is book publish date',
  `book_description` text NOT NULL COMMENT 'This is book description',
  `seller_id` int(255) NOT NULL COMMENT 'This is seller id',
  `buyer_id` int(11) DEFAULT NULL,
  `delivery_guy_id` int(60) DEFAULT NULL,
  `upload_time` datetime NOT NULL DEFAULT current_timestamp(),
  `BookPin` int(6) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `Book` (`BookPin`),
  KEY `book_category` (`book_category`),
  KEY `buyer` (`buyer_id`),
  KEY `seller` (`seller_id`),
  KEY `delivery_guy` (`delivery_guy_id`),
  CONSTRAINT `buyer` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `delivery_guy` FOREIGN KEY (`delivery_guy_id`) REFERENCES `delivery_guy` (`delivery_guy_id`),
  CONSTRAINT `seller` FOREIGN KEY (`seller_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;