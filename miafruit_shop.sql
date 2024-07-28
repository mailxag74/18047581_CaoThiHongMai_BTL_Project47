CREATE DATABASE  IF NOT EXISTS `miafruit_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `miafruit_shop`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: greeny_shop
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_image` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,'Trái cây');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `rate_date` datetime DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `order_detail_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfwepd0s8syqc9s06xnqa7mdwf` (`order_detail_id`),
  KEY `FK6uv0qku8gsu6x1r2jkrtqwjtn` (`product_id`),
  KEY `FKqi14bvepnwtjbbaxm7m4v44yg` (`user_id`),
  CONSTRAINT `FK6uv0qku8gsu6x1r2jkrtqwjtn` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKfwepd0s8syqc9s06xnqa7mdwf` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`order_detail_id`),
  CONSTRAINT `FKqi14bvepnwtjbbaxm7m4v44yg` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `favorite_id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`favorite_id`),
  KEY `FK6sgu5npe8ug4o42bf9j71x20c` (`product_id`),
  KEY `FK1uphh0glinnprjknyl68k1hw1` (`user_id`),
  CONSTRAINT `FK1uphh0glinnprjknyl68k1hw1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK6sgu5npe8ug4o42bf9j71x20c` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_detail_id` bigint NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
  `discount` int NOT NULL,
  `entered_date` datetime DEFAULT NULL,
  `price` double NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `favorite` bit(1) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES 
(1,'Táo nữ hoàng Queen nhập khẩu 100% từ New Zealand (có giấy chứng nhận xuất xứ). Đạt tiêu chuẩn xuất khẩu toàn cầu. Bảo quản tươi ngon đến tận tay khách hàng. Quả tròn, vỏ mỏng có màu sắc đỏ thẫm đẹp mắt. Thịt táo vàng, lõi nhỏ, vị ngọt nhẹ và mùi thơm đậm\r\n Loại táo này được lai giữa giữa táo Gala và táo Splendour, táo nữ hoàng có dáng tròn, vỏ mỏng màu đỏ thẫm đẹp mắt, vị ngọt thanh và mùi thơm đậm đặc trưng, thịt táo chắc nhưng không quá cứng, được xem là loại trái cây rất thích hợp cho mọi người.\r\n Táo là nguồn cung cấp vitamin C tuyệt vời, có tác dụng tăng cường hệ thống miễn dịch. Mỗi quả táo chứa khoảng 8mg vitamin này, vì thế chúng sẽ cung cấp khoảng 14% nhu cầu vitamin C hàng ngày của cơ thể.\r\n Cũng giống như lê và việt quất, táo có mối liên hệ với việc giảm thiểu nguy cơ mắc bệnh tiểu đường type 2 nhờ chất chống oxy hóa Anthocyanins. Hơn nữa trong táo có chất Triterpenoids có khả năng chống lại các bệnh ung thư gan, ruột kết và ung thư vú.',12,'2022-02-17 00:00:00',200000,'quatao.jpg','Quả táo',1000,NULL,1,_binary '\0'),
(2,'Lựu được xem là một trong những loại trái cây nhiệt đới tốt nhất cho sức khỏe. Trong quả lựu chứa một loạt các hợp chất từ thực vật có lợi mà nhiều loại thực phẩm khác không thể so sánh được. Các nghiên cứu đã cho thấy rằng chúng có nhiều lợi ích và làm giảm nguy cơ mắc nhiều bệnh khác nhau. Với hương vị thơm ngon đặc trưng và giá trị dinh dưỡng đối với sức khỏe, lựu đang được rất nhiều chị em ưa chuộng. Trong quả lựu có chứa nhiều chất oxy hóa, vitamin C và nhiều dưỡng chất khác có tác dụng làm đẹp, tăng cường hệ miễn dịch và bảo vệ sức khỏe.',15,'2022-02-18 00:00:00',130000,'qualuu.jpg','Quả lựu',1000,NULL,1,_binary '\0'),
(3,'Vải thiều là loại trái cây được nhiều người yêu thích, trái vải chín đỏ, mọng nước và thơm ngọt. Ngoài ăn trực tiếp thì vải còn chế biến thành nhiều món ngon như trà vải, vải sấy khô, siro vải, rau câu vải,.... Tuy nhiên mỗi ngày chỉ nên ăn 6-7 trái, nếu ăn nhiều quá có thể dẫn đến nóng trong người.\r\n Cứ đến khoảng tháng 6, tháng 7 là mùa rộ thu hoạch vải thiều ở các tỉnh phía Bắc. Những quả vải thiều chín đỏ, căng mọng và thơm ngọt là món trái cây ưa thích của nhiều gia đình trong mùa hè bởi giá thành không quá cao. Trái vải được lấy từ nhiều nơi khác nhau như vải thiều Thanh Hà, vải thiều Lục Ngạn. Dù vậy, chất lượng vẫn luôn được cam kết, đảm bảo an toàn và tươi ngon.',10,'2022-02-18 00:00:00',70000,'vaithieu.jpg','Vải thiều',1000,NULL,1,_binary '\0'),
(4,'Là một trong những loại trái cây đặc sản của Việt Nam. Vú sữa bơ hồng căng mọng có vị ngọt hương thơm bơ sữa hấp dẫn, quyến rũ. Đặc biệt trong cú sữa có chứa các dưỡng chất như canxi, phốt pho, sắt và magiê rất tốt cho sức khỏe phụ nữa mang thai và thai nhi. Cam kết đúng khối lượng, chất lượng và an toàn.\r\n Vú sữa bơ hồng là một trong những loại trái cây cung cấp dinh dưỡng và sức khoẻ cho người tiêu dùng.Phần thịt có màu sữa trắng, vị ngọt thanh, thơm mùi bơ sữa, có các hạt dẹt màu nâu nhạt. Lợi ích từ vú sửa như sau:\r\n Trong 100gram thịt vú sữa cung cấp chứa 67 kcal, chứa nhiều loại vitamin A, B1, B2, B3, C… nhất là glucid, canxi, sắt, chất xơ, protein và lipid.\r\n Hấp thụ 100 – 200g vú sữa mỗi ngày sẽ giúp phòng ngừa hiện tượng thiếu máu, còi xương ở trẻ.\r\n Vú sữa còn chứa nhiều nước, hàm lượng chất xơ cao giúp cho người dùng có cảm giác no bụng, kiểm soát cân nặng hiệu quả\r\n Lượng calcium không những giúp xương chắc khỏe mà còn ngừa được lượng mỡ thừa trong cơ thể',5,'2022-02-15 00:00:00',70000,'quavusua.jpg','Quả vú sữa',1000,NULL,1,_binary '\0'),
(5,'Vị ngọt thanh, hạt nhỏ, vỏ mỏng, là một trong những loại trái cây nhiệt đới đặc trưng của ngày hè, chôm chôm được nuôi trồng theo những tiêu chuẩn an  toàn và chất lượng. Có thể sử dụng là món tráng miệng sau mỗi bữa ăn hoặc làm trái cây dầm.\r\n Chôm chôm là một loại trái cây vùng nhiệt đới, được trồng nhiều ở vùng đồng bằng sông Cửu Long, đặc biệt là Bến Tre. Đây là loại quả quen thuộc trong đời sống, quả khi chín có vỏ màu đỏ tươi. Khi thưởng thức sẽ cảm nhận phần thịt mọng nước, vị ngọt thanh và độ giòn dai. \r\n Không những hấp dẫn về mùi vị, chôm chôm còn chứa nhiều chất dinh dưỡng như: vitamin C, đồng, mangan, kali, canxi, sắt, phospho, chất xơ,… Vì thế, đây là loại quả rất tốt cho sức khỏe, có khả năng làm đẹp đối với phụ nữ.',6,'2022-02-17 00:00:00',50000,'quachomchom.jpg','Chôm chôm',1000,NULL,1,_binary '\0'),
(6,'Từ vùng trồng nho nổi tiếng cả nước. Nho xanh quả to, tươi ngon, màu sắc đẹp, chứa nhiều vitamin và chất dinh dưỡng có thể ăn trực tiếp hoặc pha chế các loại đồ uống đều ngon. Sản phẩm cam kết bán đúng khối lượng, chất lượng và an toàn tuyệt đối. Bao bì kín đáo, sạch sẽ và hợp vệ ...\r\nNho xanh là loại trái cây nội địa của Việt Nam. Sản phẩm có thịt quả dày và trong, vị ngọt dịu không gắt, chua nhẹ rất hấp dẫn nên được đông đảo người tiêu dùng yêu thích và lựa chọn sử dụng. Nho rất giàu chất dinh dưỡng, lại có rất nhiều lợi ích đối với sức khỏe con người. Chúng ta có thể ăn nho trực tiếp nhưng cũng có thể làm nước ép nho để uống hay chế biến nhiều cách khác nhau.',5,'2022-01-31 00:00:00',170000,'17.jpg','Nho xanh',60,NULL,1,_binary '\0'),
(7,'Cam sành có nguồn gốc từ Việt Nam, được trồng nhiều ở các tỉnh miền Nam và một số tỉnh phía Bắc: Hà Giang, Tuyên Quang, Yên Bái. Cam sành có vỏ dày, sần sùi màu xanh, khi chín có sắc cam, các múi thịt có màu cam. Cam sành rất mọng nước, có vị chua thanh nên thường vắt lấy nước pha chế thành nước giải khát chứ không ăn tươi như những loại cam khác.',3,'2022-01-31 00:00:00',35000,'16.jpg','Cam',98,NULL,1,_binary '\0'),
(8,'Loại trái cây phổ biến được ưa chuộng giàu chất xơ, vitamin, khoáng chất thiết yếu giúp cung cấp chất dinh dưỡng cho cơ thể con người và mang lại nhiều lợi ích tuyệt vời cho hệ tiêu hóa, tim mạch, giúp mắt sáng, làm đẹp da. Xoài keo có quả chắc giòn giòn chua ngọt thơm ngon được nhiều người ưa thích\r\nNhư bạn đã biết thì xoài là một loại trái cây nhiệt đới phổ biến ở nước ta, được nhiều người dùng ưa chuộng. Loại trái cây này cực kỳ giàu chất xơ, vitamin, khoáng chất thiết yếu không chỉ giúp cung cấp chất dinh dưỡng cho cơ thể con người mà còn mang lại nhiều lợi ích tuyệt vời cho sức khỏe. Ăn xoài thường xuyên sẽ giúp hệ tiêu hóa, tim mạch của bạn hoạt động tốt hơn, giúp sáng mắt, làm đẹp da hiệu quả. Xoài còn được biết là loại trái cây tốt cho những người mắc bệnh tiểu đường. Nhờ vị chua và giòn mà xoài keo được xem như là lựa chọn đầu tiên khi làm gỏi, xoài lắc hay ăn sống cùng mắm ruốc, muối tôm cực kỳ ngon.',0,'2022-01-31 00:00:00',22000,'14.jpg','Xoài keo',60,NULL,1,_binary '\0'),
(9,'Chín đỏ đẹp mắt vô cùng hấp dẫn, bao bì sang trọng, kin đáo và an toàn. Dâu tây hộp 500g chứa nhiều loại đường, protein, axít hữu cơ, pectic và giàu vitamin, chất khoáng cũng như nguyên tố vi lượng giúp tăng cường hệ miễn dịch, bảo vệ mắt, chống ung thư, ngăn ngừa vết nhăn,...và nhiều lợi ích khác\r\nDâu tây hay còn gọi là dâu đất, được trồng lấy trái cây ở vùng ôn đới. Với mùi thơm hấp dẫn cùng vị dâu ngọt lẫn chua nên dâu tây được ưa chuộng. Loại trái cây nội địa này có giá trị dinh dưỡng cao, được coi là “nữ hoàng của các loài trái cây”. Dâu tây chứa nhiều loại đường, protein, axít hữu cơ, pectic và giàu vitamin, chất khoáng cũng như nguyên tố vi lượng giúp tăng cường hệ miễn dịch, bảo vệ mắt, chống ung thư, ngăn ngừa vết nhăn,...',5,'2022-01-31 00:00:00',120000,'13.jpg','Dâu tây',90,NULL,1,_binary '\0'),
(10,'Chuối chuyển màu từ xanh đậm sang vàng khi chín, phần thịt trắng ngà hoặc vàng, mềm, nhiều tinh bột khi chin. Chuối vàng là khi chuối chín. Khi chín chuối sẽ có hương vị rất ngon, ăn mềm , dẻo và ngọt, giàu chất xơ, vitamin C, vitamin B6. Chất béo bão hòa, cholesterol và natri trong chuối thấp. Bên cạnh đó, vỏ chuối còn có nhiều công dụng làm đẹp được nhiều chị em phụ nữ áp dụng. Ngoài ra, chuối còn có rất nhiều lợi ích khác.',4,'2022-01-31 00:00:00',25000,'18.jpg','Chuối',79,NULL,1,_binary '\0');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES 
(1,'ROLE_USER'),
(2,'ROLE_USER'),
(4,'ROLE_ADMIN'),
(5,'ROLE_ADMIN'),
(6,'ROLE_USER'),
(7,'ROLE_USER'),
(8,'ROLE_USER'),
(9,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES 
(1,'user.png','nguyenvanA@gmail.com','Nguyễn Văn A','$2a$10$NNFj7.bICFpxqYTsCswbe.BNGHGicL0LZzXmm.UCLz8sWrM3EL3IC','2022-01-29',_binary ''),
(2,'user.png','nguyenvanb@gmail.com','Nguyễn Văn B','$2a$10$.XOXsgTmumdrVdQc74mqUO180lLS0OefXAyPIdiVw0IshtW5WYDMm','2022-01-29',_binary ''),
(3,'user.png','dongthd@fpt.edu.vn','user','$2a$10$UtRFor3y5PqxHKFEt1HgAOOaX7tlQs1oEhJA/VLFoUVGKo3OBkISS','2022-01-30',_binary ''),
(4,'user.png','miafruitshopvn@gmail.com','Admin MiaFruit Shop','$2a$10$Hd54fYSXGv6Pqve.WjeLO.DyNv2gGIq/S2Drilp12ClD6gYzhh4jO','2022-02-15',_binary ''),
(5,'user.png','demo@gmail.com','user1','$2a$10$GtfloNhLVXQaKdXvmueUfu14h6ijuwFHMLb1icK4rsuzpWa6jOh72','2022-02-17',_binary ''),
(6,'user.png','demo2@gmail.com','user2','$2a$10$PUWkbGnEa1OdKmxiQfvw/u3oh3I09nGG6zVHmGLxgigSJC2tCz4Ta','2022-02-17',_binary ''),
(7,'user.png','demo3@gmail.com','user3','$2a$10$ePg/cUabs6dShg4hC4Buv.QaVFx6VqqBUSlmQBntalEOAaWCfY2Hi','2022-02-17',_binary ''),
(8,'user.png','supshop.adm@gmail.com','demo tên','$2a$10$zBgbGqKnEPFiMOceXhqwIem4e/JFMYF2rjRElIcuaBAnO.toFIOCm','2022-02-17',_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`),
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,2),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-17 22:38:48
