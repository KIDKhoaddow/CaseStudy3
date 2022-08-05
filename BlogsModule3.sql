-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blogs
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_title` varchar(100) DEFAULT NULL,
  `category_content` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'khoaa111111','món ăn mang tính biểu tượng cao'),(2,'Ẩm thực: Đồ Nước','món ăn mang theo giá trị dinh dưỡng cao'),(3,'Ẩm thực: Cho mọi lứa tuổi','Món ăn phổ biến cho mọi nhà'),(4,'Ẩm thực: Đường phố','Món ăn đường phố được ưa chuộng'),(5,'Ẩm thực: Đây không phải ẩm thực','Món không nên ăn thử, không dành cho phụ nữ và đàn ông đang cho con bú'),(6,'Ẩm thực: Đồ tráng miệng','Món ăn tráng miệng vào mùa hè'),(7,' Ẩm thực: Đây không phải ẩm thực','Đồ nhà triều cần cân nhắc trước khi thử sử dụng');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `count_post`
--

DROP TABLE IF EXISTS `count_post`;
/*!50001 DROP VIEW IF EXISTS `count_post`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `count_post` AS SELECT 
 1 AS `count(post_id)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `count_post_of_user`
--

DROP TABLE IF EXISTS `count_post_of_user`;
/*!50001 DROP VIEW IF EXISTS `count_post_of_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `count_post_of_user` AS SELECT 
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `count_post`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `count_post_year`
--

DROP TABLE IF EXISTS `count_post_year`;
/*!50001 DROP VIEW IF EXISTS `count_post_year`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `count_post_year` AS SELECT 
 1 AS `count(post_id)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `count_user`
--

DROP TABLE IF EXISTS `count_user`;
/*!50001 DROP VIEW IF EXISTS `count_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `count_user` AS SELECT 
 1 AS `count(user_id)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `like_of_post`
--

DROP TABLE IF EXISTS `like_of_post`;
/*!50001 DROP VIEW IF EXISTS `like_of_post`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `like_of_post` AS SELECT 
 1 AS `post_id`,
 1 AS `count_like`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `author_id` int DEFAULT NULL,
  `category_post_id` int DEFAULT NULL,
  `post_update_at` date DEFAULT NULL,
  `post_summary` varchar(200) DEFAULT NULL,
  `post_create_at` date DEFAULT NULL,
  `post_title` varchar(100) DEFAULT NULL,
  `post_content` text,
  `post_status` varchar(50) DEFAULT NULL,
  `post_picture` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `FK_post_category` (`category_post_id`),
  KEY `FK_postauthor` (`author_id`),
  CONSTRAINT `FK_post_category` FOREIGN KEY (`category_post_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_postauthor` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,1,'2021-10-19','Cẩu thực grass dream là món ăn đặc sản dân tộc mang nhiều chất dinh dưỡng','2019-07-19','Cách làm thịt gogo aaaaa','                                                                                                                                                                Nguyên liệu cho cách làm thịt chó miền Bắc:\r\n+ Thịt chó: 0.5 kg\r\n+ Sả: 5 -6 củ\r\n+ Riềng: 3 củ\r\n+ Ớt: 2 quả\r\n+ Tiết chó: ½ bát con\r\n+ Cà ri bột nhỏ, ngũ vị hương\r\n+ Gia vị: Muối, nước mắm, mắm tôm, một chút bột ngọt, hạt tiêu, rượu trắng\r\nBước 1: Trong cách nấu thịt chó miền Bắc thì đầu tiên bạn rửa sạch riềng rồi cạo hết vỏ. Sả thì tước bỏ đi phần già nằm ở lớp ngoài già rồi cũng đem thái nhỏ như riềng. Ớt rửa sạch, băm nhỏ đến nhuyễn hoặc thái lát mỏng. Tiếp theo thì bạn sẽ cho chúng vào cối giã đến khi mịn, bông tay hoặc cho trực tiếp vào máy xay đều được.\r\nBước 2: Bây giờ chính là lúc bạn ướp phần thịt chó đã chuẩn bị với riềng, sả xay nhuyễn cùng gia vị: muối, mì chính, mắm tôm, hạt tiêu và chút cà ri cùng ngũ hương thêm cả phần tiết chó đã chuẩn bị bên trên sao cho phù hợp với khẩu vị. Đảo hỗn hợp đều tay, càng kỹ càng tốt để giúp thịt chó ngấm gia vị đều hơn rồi để ướp khoảng 30 phút.\r\nBước 3: Cách nấu thịt chó miền Bắc một cách chuẩn vị không hề khó khăn và quá mất thời gian như bạn nghĩ và trong khâu chế biến tiếp theo này thì mọi thứ \r\n                                \r\n                                \r\n                                \r\n                                \r\n                                \r\n                                \r\n                                ','verify','picture/infinity-essence-koncept-kar 1080.jpg'),(2,1,2,'2021-10-15','Súp Cua Óc Heo','2019-07-10','Cách làm súp cua óc heo','Nguyên liệu làm Súp cua óc heo\n Cua biển 1 kg Óc heo 100 gr Xương gà 1 kg Trứng gà 3 quả Trứng cút 30 quả Bắp Mỹ 2 quả Nấm đông cô khô 12 cái Gừng tươi 1 củ(cỡ lớn) Ngò rí 1 nhánh Bột năng 100 gr Dầu mè 2 muỗng canh Gia vị thông dụng\n Sơ chế thịt cua\nSau khi mua cua về, khoan hãy cắt dây cột cua. Lật ngửa yếm dưới bụng cua và lấy đầu kéo hoặc dao nhọn chọc thẳng vào phần hõm cho tới khi chân và càng đều duỗi thẳng, rồi rửa sạch với nước muối','verify','https://cdn.tgdd.vn/Files/2020/10/18/1300089/cach-nau-sup-cua-ngon-bo-duong-chuan-vi-don-gian-tai-nha-202205251250388279.jpg'),(3,6,3,'2022-05-19','sữa chua','2022-05-16','Cách làm sữa chua','Trộn hỗn hợp làm sữa chua.\nCho vào tô lớn 380gr sữa đặc, 700ml nước sôi rồi khuấy đều cho sữa tan. Tiếp theo, cho thêm 440ml sữa tươi không đường vào tô và tiếp khuấy nhẹ nhàng theo một chiều.\nCuối cùng, cho vào 2 hộp sữa chua, khuấy đều thêm 1 lần nữa là hoàn tất.','verify','https://cdn.tgdd.vn/2021/09/CookDish/cach-lam-sua-chua-com-xanh-deo-ngon-don-gian-ngon-khong-kem-avt-1200x676.jpg'),(4,5,4,'2020-07-20','Ốc xào chuối đậu','2020-07-19','cách làm ôc xào chuối đậu',' nhặt ốc, nhặt chuối, rán đậu, xào ốc-- xong','verify','https://i-giadinh.vnecdn.net/2022/04/23/Thanh-pham-1-1-4875-1650708542.jpg'),(5,7,5,'2022-08-15','Tên lửa u cà xả ớt :) ','2022-07-28','Cách cưa bom','nhặt bom, tìm cưa nhặt xả ớt, cưa ! xong','verify','https://image.thanhnien.vn/w1024/Uploaded/2022/churovh/2021_10_22/ten-lua-boi-sieu-thanh-335.jpeg'),(6,3,6,'2022-07-27','Dưa chuột dầm ','2022-07-20','cách dầm dưa chuột ','nhặt dưa chuột, đường , muối','verify','https://img-global.cpcdn.com/recipes/fcb3721ee9424c51/680x482cq70/d%C6%B0a-leo-d%E1%BA%A7m-mu%E1%BB%91i-%E1%BB%9Bt-an-li%E1%BB%81n-recipe-main-photo.jpg'),(7,1,7,'2021-10-18',' châu chấu rán giòn','2021-10-15','cách làm châu chấu ăn ngon','Châu chấu vặt cho sạch cánh, càng, râu, bỏ đầu, ruột đem xóc muối và rửa lại nước ấm, để ráo ăn luôn','verify','https://thitchuadatto.vn/wp-content/uploads/2021/06/anh-2.jpg');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comment`
--

DROP TABLE IF EXISTS `post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comment_user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `comment_content` text,
  `comment_create_at` date DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_postcomment` (`post_id`),
  KEY `FK_post_user_comment` (`comment_user_id`),
  CONSTRAINT `FK_post_user_comment` FOREIGN KEY (`comment_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_postcomment` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comment`
--

LOCK TABLES `post_comment` WRITE;
/*!40000 ALTER TABLE `post_comment` DISABLE KEYS */;
INSERT INTO `post_comment` VALUES (1,7,1,'tôi là linh, tôi sống ở u cà chưa bao giờ tôi được ăn loại thịt nào ngon như này','2021-10-19'),(2,1,2,'very good','2021-10-15'),(3,6,3,'Món ăn không bao giờ chán','2020-05-22'),(4,5,4,'Tôi nghĩ món này khá ngon','2020-07-21'),(5,7,5,'Món này nghe hơi lạ, không biết có ăn được không','2022-05-18'),(6,3,6,'Khá mát vào mùa hè, bánh cuốn','2022-07-20'),(7,7,7,'Thằng triều không nên xuất hiện ở trong cái dtb này','2021-10-19');
/*!40000 ALTER TABLE `post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_like`
--

DROP TABLE IF EXISTS `post_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_like` (
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `FK_postlike` (`post_id`),
  KEY `FK_postuser` (`user_id`),
  CONSTRAINT `FK_postlike` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `FK_postuser` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_like`
--

LOCK TABLES `post_like` WRITE;
/*!40000 ALTER TABLE `post_like` DISABLE KEYS */;
INSERT INTO `post_like` VALUES (1,1),(1,2),(2,1),(3,6),(4,5),(5,7),(6,3),(7,1),(7,3);
/*!40000 ALTER TABLE `post_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `post_id` int DEFAULT NULL,
  `tag_id` int DEFAULT NULL,
  KEY `FK_posttag` (`post_id`),
  KEY `FK_tagpost` (`tag_id`),
  CONSTRAINT `FK_posttag` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `FK_tagpost` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `table_like_of_post`
--

DROP TABLE IF EXISTS `table_like_of_post`;
/*!50001 DROP VIEW IF EXISTS `table_like_of_post`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `table_like_of_post` AS SELECT 
 1 AS `post_id`,
 1 AS `user_name`,
 1 AS `category_title`,
 1 AS `post_title`,
 1 AS `post_create_at`,
 1 AS `count_like`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `tag_title` varchar(100) DEFAULT NULL,
  `tag_content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Ẩm thực ngon','thịt go go món ăn dân tộc'),(2,'Ẩm thực các món súp','súp cua óc heo-món ăn bổ dưỡng'),(3,'Ẩm thực các món tráng miệng','Sữa chua -món ăn mát mẻ cho ngày hè'),(4,'Ẩm thực phổ biến ','Ốc chuối đậu-món ăn phổ biến thơn ngon'),(5,'Ẩm thực nguy hiểm','Tên lửa u cà - món ăn nên cân nhắc'),(6,'Ẩm thực dân dã tụ nhiên','Dưa chuột dầm -món ăn vặt khó cưỡng'),(7,'Ẩm thực lạ nhà Triều','châu chấu rán - món ăn dễ đưa bạn đi viện');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_ten_post_user`
--

DROP TABLE IF EXISTS `top_ten_post_user`;
/*!50001 DROP VIEW IF EXISTS `top_ten_post_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_ten_post_user` AS SELECT 
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `count_like`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  `user_birthday` date DEFAULT NULL,
  `user_phone` varchar(12) DEFAULT NULL,
  `user_status` varchar(50) DEFAULT 'offline',
  `user_verify` varchar(50) DEFAULT 'active',
  `regis_date` date DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `user_avatar` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nguyễn Hoàng Triều','Trieumomnhom@gmail.com','123456','Mỹ Đình','2003-01-19','0326894654','online','active','2019-07-20','2022-08-03 12:02:25','picture/2015-mazda-koeru-concept-3828 1080.jpg'),(2,'Shiego Tokuda','Tokudaego@gmail.com','Tokuda123','japan','1950-05-20',' 0356489654','offline','active','2019-03-01','2022-07-20 00:00:00','https://gamek.mediacdn.vn/zoom/700_438/133514250583805952/2020/5/16/photo-1-15896097558091974904037.png'),(3,'Phạm Đăng Khoa','khoadang@gmail.com','khoa123','Đặng Xá','1997-07-26','0321568975','offline','active','2019-03-01','2022-08-01 10:43:16','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLS8AjtD0YqBOocgNCpR1jtTJaGje2Lmq5wQ&usqp=CAU'),(4,'Maria ozawa','maria@gmail.com','maria123','Japan','1990-05-26','0359876452','offline','active','2017-08-26','2022-07-28 00:00:00','https://cdn.tamhoang.net/noi-dung/uploads/2022/01/21184bf0-mariaozawaava1-1642671844-7272-1642672155.jpg'),(5,'super mario','mario@gmail.con','mario123','USA','1945-05-26','0649298764','online','active','2020-10-10','2022-07-20 00:00:00','https://game.toposhop.vn/storage/media/J5sdK3cRIG4KDVBkPY9Ve0m6z5CGjfp0lShgFJcz.jpeg'),(6,'Trần Trọng Huy','huytran@gmail.com','huy123','Hồ Chí Minh','1994-01-01','0792267690','offline','active','2018-08-09','2022-05-19 00:00:00','https://i.pinimg.com/736x/31/82/f6/3182f66aa69a399263522935eef297b5.jpg'),(7,'Lương Nhật Linh','linhnhat@gmail.com','linhnhat123','Ukranei','1996-02-06','0372729220','offline','active','2017-09-15','2022-07-28 00:00:00','https://vcdn-vnexpress.vnecdn.net/2017/08/09/20638646-479817389043736-28216-9799-1179-1502264052.jpg'),(8,'Nguyễn Thế An','thean@gmail.com','thean123','Đông Anh','1996-09-17','0987228496','offline','active','2015-09-28','2022-05-25 00:00:00','https://upanh123.com/wp-content/uploads/2020/10/hinh-anh-hai-huoc-ve-cuoc-song000.jpg'),(9,'Vũ Hải Đăng','haidang@gmail.com','haidang123','Hải Phòng','1995-08-29','0964785869','offline','active','2018-02-27','2022-07-26 00:00:00','https://znews-photo.zingcdn.me/w660/Uploaded/znottb/2013_08_18/i2fun.com-funny-asians-p127-015.jpg'),(10,'Lê Vũ Anh','vuanh@gmailcom','vuanh123','Mỹ Đình','1995-10-08','0339550830','offline','active','2017-10-10','2020-10-30 00:00:00','https://photo-cms-viettimes.zadn.vn/w666/Uploaded/2022/aohuooh/2018_12_20/8381410-image-crop-540x696-1544116872-728-7464e41a31-1544707432.jpg'),(11,'Lê Vũ Anh','vuanh1@gmailcom','vuanh123','Mỹ Đình','1995-10-08','0339550830','offline','active','2017-10-10','2020-10-30 00:00:00','https://photo-cms-viettimes.zadn.vn/w666/Uploaded/2022/aohuooh/2018_12_20/8381410-image-crop-540x696-1544116872-728-7464e41a31-1544707432.jpg'),(12,'Phạm Đăng Khoa','khoadang1@gmail.com','khoa123','Đặng Xá','1997-07-26','0321568975','offline','active','2019-03-01','2022-07-27 00:00:00','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLS8AjtD0YqBOocgNCpR1jtTJaGje2Lmq5wQ&usqp=CAU'),(13,'Phạm Đăng Khoa','khoadang2@gmail.com','khoa123','Đặng Xá','1997-07-26','0321568975','online','active','2019-03-01','2022-07-27 00:00:00','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLS8AjtD0YqBOocgNCpR1jtTJaGje2Lmq5wQ&usqp=CAU'),(14,'Phạm Đăng Khoa','khoadang3@gmail.com','khoa123','Đặng Xá','1997-07-26','0321568975','offline','active','2019-03-01','2022-07-27 00:00:00','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLS8AjtD0YqBOocgNCpR1jtTJaGje2Lmq5wQ&usqp=CAU'),(15,'Phạm Đăng Khoa','khoadang4@gmail.com','khoa123','Đặng Xá','1997-07-26','0321568975','offline','active','2019-03-01','2022-07-27 00:00:00','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLS8AjtD0YqBOocgNCpR1jtTJaGje2Lmq5wQ&usqp=CAU'),(16,NULL,'khoa@gmail.com','khoa123',NULL,NULL,NULL,'offline','active',NULL,'2020-07-19 12:00:03',NULL),(17,NULL,'khoakhoa260797@gmail.com','12345678',NULL,NULL,NULL,'offline','active',NULL,NULL,NULL),(18,NULL,'khoakhoa1260797@gmail.com','123456',NULL,NULL,NULL,'offline','active','2022-07-30','2022-08-01 10:45:36',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_online`
--

DROP TABLE IF EXISTS `user_online`;
/*!50001 DROP VIEW IF EXISTS `user_online`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_online` AS SELECT 
 1 AS `count(user_id)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!50001 DROP VIEW IF EXISTS `user_post`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_post` AS SELECT 
 1 AS `user_name`,
 1 AS `post_id`,
 1 AS `post_title`,
 1 AS `post_update_at`,
 1 AS `post_create_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_view`
--

DROP TABLE IF EXISTS `user_view`;
/*!50001 DROP VIEW IF EXISTS `user_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_view` AS SELECT 
 1 AS `user_name`,
 1 AS `user_email`,
 1 AS `user_password`,
 1 AS `user_status`,
 1 AS `regis_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `users_blogs`
--

DROP TABLE IF EXISTS `users_blogs`;
/*!50001 DROP VIEW IF EXISTS `users_blogs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_blogs` AS SELECT 
 1 AS `post_id`,
 1 AS `user_name`,
 1 AS `category_title`,
 1 AS `post_update_at`,
 1 AS `post_create_at`,
 1 AS `post_title`,
 1 AS `post_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user`
--

DROP TABLE IF EXISTS `view_user`;
/*!50001 DROP VIEW IF EXISTS `view_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_user` AS SELECT 
 1 AS `user_name`,
 1 AS `user_address`,
 1 AS `user_birthday`,
 1 AS `user_phone`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `count_post`
--

/*!50001 DROP VIEW IF EXISTS `count_post`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_post` AS select count(`post`.`post_id`) AS `count(post_id)` from `post` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `count_post_of_user`
--

/*!50001 DROP VIEW IF EXISTS `count_post_of_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_post_of_user` AS select `u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,count(`p`.`post_id`) AS `count_post` from (`post` `p` join `user` `u` on((`u`.`user_id` = `p`.`author_id`))) group by `p`.`author_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `count_post_year`
--

/*!50001 DROP VIEW IF EXISTS `count_post_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_post_year` AS select count(`post`.`post_id`) AS `count(post_id)` from `post` where (year(`post`.`post_create_at`) = '2022') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `count_user`
--

/*!50001 DROP VIEW IF EXISTS `count_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_user` AS select count(`user`.`user_id`) AS `count(user_id)` from `user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `like_of_post`
--

/*!50001 DROP VIEW IF EXISTS `like_of_post`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `like_of_post` AS select `post_like`.`post_id` AS `post_id`,count(`post_like`.`user_id`) AS `count_like` from `post_like` group by `post_like`.`post_id` order by `post_like`.`post_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `table_like_of_post`
--

/*!50001 DROP VIEW IF EXISTS `table_like_of_post`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_like_of_post` AS select `p`.`post_id` AS `post_id`,`u`.`user_name` AS `user_name`,`c`.`category_title` AS `category_title`,`p`.`post_title` AS `post_title`,`p`.`post_create_at` AS `post_create_at`,if(`p`.`post_id` in (select `like_of_post`.`post_id` from `like_of_post`) is false,0,(select `like_of_post`.`count_like` from `like_of_post` where (`p`.`post_id` = `like_of_post`.`post_id`))) AS `count_like` from ((`post` `p` join `user` `u` on((`u`.`user_id` = `p`.`author_id`))) join `category` `c` on((`c`.`category_id` = `p`.`category_post_id`))) order by if(`p`.`post_id` in (select `like_of_post`.`post_id` from `like_of_post`) is false,0,(select `like_of_post`.`count_like` from `like_of_post` where (`p`.`post_id` = `like_of_post`.`post_id`))) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_ten_post_user`
--

/*!50001 DROP VIEW IF EXISTS `top_ten_post_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_ten_post_user` AS select `u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,if(`u`.`user_id` in (select `count_post_of_user`.`user_id` from `count_post_of_user`) is false,0,(select `count_post_of_user`.`count_post` from `count_post_of_user` where (`count_post_of_user`.`user_id` = `u`.`user_id`))) AS `count_like` from `user` `u` order by `count_like` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_online`
--

/*!50001 DROP VIEW IF EXISTS `user_online`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_online` AS select count(`user`.`user_id`) AS `count(user_id)` from `user` where (`user`.`user_status` = 'online') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_post`
--

/*!50001 DROP VIEW IF EXISTS `user_post`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_post` AS select `u`.`user_name` AS `user_name`,`p`.`post_id` AS `post_id`,`p`.`post_title` AS `post_title`,`p`.`post_update_at` AS `post_update_at`,`p`.`post_create_at` AS `post_create_at` from (`post` `p` join `user` `u` on((`u`.`user_id` = `p`.`author_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_view`
--

/*!50001 DROP VIEW IF EXISTS `user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_view` AS select `user`.`user_name` AS `user_name`,`user`.`user_email` AS `user_email`,`user`.`user_password` AS `user_password`,`user`.`user_status` AS `user_status`,`user`.`regis_date` AS `regis_date` from `user` where ((0 <> `user`.`user_name`) and (0 <> `user`.`user_email`) and (0 <> `user`.`user_password`) and (0 <> `user`.`user_status`) and (`user`.`regis_date` is not null)) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_blogs`
--

/*!50001 DROP VIEW IF EXISTS `users_blogs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_blogs` AS select `p`.`post_id` AS `post_id`,`u`.`user_name` AS `user_name`,`c`.`category_title` AS `category_title`,`p`.`post_update_at` AS `post_update_at`,`p`.`post_create_at` AS `post_create_at`,`p`.`post_title` AS `post_title`,`p`.`post_status` AS `post_status` from ((`post` `p` join `user` `u` on((`p`.`author_id` = `u`.`user_id`))) join `category` `c` on((`p`.`category_post_id` = `c`.`category_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user`
--

/*!50001 DROP VIEW IF EXISTS `view_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user` AS select `user`.`user_name` AS `user_name`,`user`.`user_address` AS `user_address`,`user`.`user_birthday` AS `user_birthday`,`user`.`user_phone` AS `user_phone` from `user` where ((0 <> `user`.`user_name`) and (0 <> `user`.`user_address`) and (0 <> `user`.`user_birthday`) and (`user`.`user_phone` is not null)) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-05 17:30:14
