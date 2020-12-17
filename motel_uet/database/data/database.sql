/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.22-0ubuntu0.20.04.3 : Database - motels
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`motels` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `motels`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`slug`,`created_at`,`updated_at`) values 
(1,'Phòng trọ cho thuê','phong-tro-cho-thue',NULL,NULL),
(2,'Ở ghép','o-ghep',NULL,NULL),
(3,'Nhà nguyên căn','nha-nguyen-can',NULL,NULL),
(4,'Chung cư','chung-cu',NULL,NULL);

/*Table structure for table `districts` */

DROP TABLE IF EXISTS `districts`;

CREATE TABLE `districts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `districts` */

insert  into `districts`(`id`,`name`,`slug`,`created_at`,`updated_at`) values 
(1,'Hải Châu','hai-chau',NULL,NULL),
(2,'Thanh Khê','thanh-khe',NULL,NULL),
(3,'Sơn Trà','son-tra',NULL,NULL),
(4,'Ngũ Hành Sơn','ngu-hanh-son',NULL,NULL),
(5,'Liên Chiểu','lien-chieu',NULL,NULL),
(6,'Cẩm Lệ','cam-le',NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2018_03_11_083541_create_table_motel_rooms',1),
(4,'2018_03_11_085624_create_table_districts',1),
(5,'2018_03_11_085744_create_table_categories',1),
(6,'2018_04_22_122641_add_column__status_for_user',1),
(7,'2018_04_22_152143_add_ondelete_cascade_for_motelroom',1),
(8,'2018_05_06_030849_add_col_phone_for__motelroom_table',1),
(9,'2018_05_12_063610_add_column_approve_for_motelroom',1),
(10,'2018_05_13_064120_add_table_report',1),
(11,'2018_05_19_033745_add_column_slug_table_motelroom',1);

/*Table structure for table `motelrooms` */

DROP TABLE IF EXISTS `motelrooms`;

CREATE TABLE `motelrooms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `area` int NOT NULL,
  `count_view` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latlng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `category_id` int NOT NULL,
  `district_id` int NOT NULL,
  `utilities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approve` int NOT NULL DEFAULT '0',
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `motelrooms_user_id_foreign` (`user_id`),
  CONSTRAINT `motelrooms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `motelrooms` */

insert  into `motelrooms`(`id`,`title`,`description`,`price`,`area`,`count_view`,`address`,`latlng`,`images`,`user_id`,`category_id`,`district_id`,`utilities`,`created_at`,`updated_at`,`phone`,`approve`,`slug`) values 
(1,'Phòng trọ 2,7tr, ngõ 255 Cầu Giấy, Dịch Vọng, Cầu Giấy','Cho thuê phòng trọ, 25m2, ngã tư trần văn giảng và Nguyễn duy trinh. \r\nGiá 1,3tr/1 tháng, điện Nước tự lo \r\n* không chung chủ, phòng có nhà vs riêng *gần biển, phòng sạch sẽ, thoáng mát. \r\n* Wi-Fi free',2700000,25,16,'ngõ 255 Cầu Giấy, Dịch Vọng, Cầu Giấy, Hà Nội, Việt Nam','{\"0\":\"15.985249429644863\",\"1\":\"108.27054466270442\"}','{\"0\":\"phongtro-6O7N4-32783828_1207853946018675_1556571610645790720_n.jpg\"}',6,1,4,'{\"0\":\"Wifi mi\\u1ec5n ph\\u00ed\",\"1\":\"C\\u00f3 g\\u00e1c l\\u1eedng\",\"2\":\"Kh\\u00f4ng chung ch\\u1ee7\",\"3\":\"V\\u1ec7 sinh ri\\u00eang\"}','2020-05-14 14:33:17','2020-12-17 02:09:24','0915325634',1,'cho-thue-phong-tro-25m2-nga-tu-tran-van-giang-va-nguyen-duy-trinh'),
(2,'Cho thuê phòng trọ gần trường Đại Học Kinh Tế Quốc Dân','???CHO THUÊ PHÒNG TRỌ???\r\nNhà mình hiện còn 1 phòng 20m2( toilet riêng) thoáng mát có cửa sổ, sân phơi đồ, sân để xe. \r\n?Gần chợ Bắc Mỹ An, gần trường Đại Học Kinh Tế, gần biển \r\n♦️Chỉ cho Nữ thuê\r\n? Phòng 1 người ở 1tr5, 2 người ở 1tr6, 3 người ở 1tr7( ko bao gồm điện nước)- Giờ giấc thoải mái\r\n? ‭0128 2585079‬( cô Hường)',1700000,20,21,'16 ngõ 41 phố Vọng, 16 Ngõ 41 Phố Vọng, Đồng Tâm, Hai Bà Trưng, Hà Nội, Việt Nam','{\"0\":\"16.047517\",\"1\":\"108.23898009999994\"}','{\"0\":\"phongtro-UKRmv-phongtro2.jpg\"}',6,1,1,'{\"0\":\"Wifi mi\\u1ec5n ph\\u00ed\",\"1\":\"V\\u1ec7 sinh ri\\u00eang\",\"2\":\"Gi\\u1edd gi\\u1ea5c t\\u1ef1 do\"}','2020-05-17 22:07:15','2020-12-17 01:56:40','01282585079',1,'cho-thue-phong-tro-gan-truong-dai-hoc-kinh-te'),
(3,'Cho thuê phòng trọ 2.3tr, gần trường Đại Học Hà Nội','CHO THUÊ PHÒNG TRỌ.\r\nĐịa chỉ:số 02-04 TÔN ĐẢN(cạnh sát ngã ba huế)\r\n? Có thể ở từ 2 - 4 người.\r\n? Phòng rộng rãi.\r\n? Phòng có nhà WC riêng.\r\n? Có camera an ninh.\r\n? Có chỗ để xe thoải mái.\r\n? Giờ giấc tự do ( kg chung chủ).\r\nGiá: 1.200.000đ\r\nLiên hệ: 01677.661.114-0236.6542.111 để xem và đặt phòng',2300000,25,3,'345 Phố Giảng Võ, Giảng Võ, Đống Đa, Hà Nội, Việt Nam','{\"0\":\"16.0600903\",\"1\":\"108.17674770000008\"}','{\"0\":\"phongtro-gyGbK-phongtro3.jpg\",\"1\":\"phongtro-pt1t9-phongtro4.jpg\"}',6,1,6,'{\"0\":\"Wifi mi\\u1ec5n ph\\u00ed\",\"1\":\"Kh\\u00f4ng chung ch\\u1ee7\",\"2\":\"Gi\\u1edd gi\\u1ea5c t\\u1ef1 do\",\"3\":\"V\\u1ec7 sinh ri\\u00eang\"}','2020-05-23 11:17:20','2020-12-17 02:12:48','01677661114',1,'phong-tro-cho-thue-so-02-04-ton-dan-canh-sat-nga-ba-hue'),
(4,'Phòng trọ 2,1tr, ngách 6/30 Đội Nhân, Vĩnh Phú, Ba Đình, Hà Nội, Việt Nam','Góc nhượng trọ \r\nDo có việc nên mình phải chuyển đi cần nhượng trọ 93 phan thanh đã đóng tiền 1 tháng và ở 10 ngày. Phòng có thể ở 1 đn 2 người giờ giấc thoải mái. \r\nBạn nào cần có thể liên hệ \r\nCảm ơn đã đọc tin !',2100000,20,3,'Ngách 6/30 Đội Nhân, Vĩnh Phú','{\"0\":\"16.063204\",\"1\":\"108.20853299999999\"}','{\"0\":\"no_img_room.png\"}',6,1,2,'{\"0\":\"Wifi mi\\u1ec5n ph\\u00ed\",\"1\":\"C\\u00f3 g\\u00e1c l\\u1eedng\",\"2\":\"Kh\\u00f4ng chung ch\\u1ee7\",\"3\":\"Gi\\u1edd gi\\u1ea5c t\\u1ef1 do\",\"4\":\"V\\u1ec7 sinh ri\\u00eang\"}','2020-05-09 01:22:54','2020-12-17 01:28:52','0912425617',1,'phong-tro-93-phan-thanh-thanh-khe-tai-da-nang'),
(6,'Phòng trọ 2,3tr, ngách 6/30 Đội Nhân, Vĩnh Phú, Ba Đình','Diện tích : 30 m2 _ PHÙ HỢP CHO VỢ CHỒNG MỚI CƯỚI, NGƯỜI ĐI LÀM.\r\n* Vị Trí: Đường Cù Chính Lan đi vào đường 5.5m\r\n* Giá thuê:\r\n+ Phòng : 4 triệu / tháng.\r\n+ Có wifi\r\n+ Toilet riêng\r\n+ Sân phơi\r\n+ Đường 5,5m khu dân cư yên tĩnh. Có chỗ để xe riêng.\r\n+ Cách cầu vượt ngã 3 Huế 50m.\r\n+ Ngay trung tâm thuận tiện cho việc đi làm. đi học.\r\n+ Phòng ở được đến 4-5 người',2300000,30,2,'ngách 6/30 Đội Nhân, Vĩnh Phú, Ba Đình, Hà Nội, Việt Nam','{\"0\":\"16.0650124\",\"1\":\"108.18574539999997\"}','{\"0\":\"phongtro-syCRY-phongtro6.jpg\",\"1\":\"phongtro-HiKhQ-phongtro7.jpg\"}',6,1,1,'{\"0\":\"Wifi mi\\u1ec5n ph\\u00ed\",\"1\":\"Gi\\u1edd gi\\u1ea5c t\\u1ef1 do\",\"2\":\"V\\u1ec7 sinh ri\\u00eang\"}','2020-05-15 06:38:17','2020-06-10 03:48:02','0935441138',1,'cho-thue-tro-o-duong-cu-chinh-lan-di-vao-5m'),
(7,'Cần ghép người ở chung phòng trọ Hoàng Hoa Thám','Cần tìm một bạn nữ ở ghép, tiền phòng và điện nước chia đôi.\r\nYêu cầu thật thà, không tính toán, vui vẻ.\r\nMình đi làm cả ngày nên chỉ về phòng ở buổi tối thôi.',1500000,14,23,'515 Hoàng Hoa Thám, Vĩnh Phú, Hoàn Kiếm, Hà Nội, Việt Nam','{\"0\":\"16.069526612710362\",\"1\":\"108.2096887698059\"}','{\"0\":\"no_img_room.png\"}',6,2,2,'{\"0\":\"Wifi mi\\u1ec5n ph\\u00ed\",\"1\":\"C\\u00f3 g\\u00e1c l\\u1eedng\",\"2\":\"Kh\\u00f4ng chung ch\\u1ee7\",\"3\":\"Gi\\u1edd gi\\u1ea5c t\\u1ef1 do\",\"4\":\"V\\u1ec7 sinh ri\\u00eang\"}','2020-05-23 03:40:17','2020-12-17 02:50:03','0934162386',1,'can-ghep-nguoi-o-chung-phong-tro-hoang-hoa-tham'),
(8,'Cho thuê phòng trọ 25m2, số 12 ngõ 3 phố Núi Trúc, Ba Đình','Cho thuê phòng trọ, 25m2,  tại số 12, ngõ 3 Phố Núi Trúc, Ba Đình, Hanoi, Vietnam\r\nGiá 3,3tr/1 tháng, điện Nước tự lo \r\n* không chung chủ, phòng có nhà vs riêng *gần biển, phòng sạch sẽ, thoáng mát. \r\n* Wi-Fi free',2300000,25,0,'19A Phố Núi Trúc, Giảng Võ, Ba Đình, Hà Nội, Vietnam','{\"0\":\"21.03082\",\"1\":\"105.822\"}','{\"0\":\"phongtro-HPCDi-phongtro-6O7N4-32783828_1207853946018675_1556571610645790720_n.jpg\"}',6,1,1,'{\"0\":\"C\\u00f3 g\\u00e1c l\\u1eedng\",\"1\":\"Kh\\u00f4ng chung ch\\u1ee7\",\"2\":\"T\\u1ee7 + gi\\u01b0\\u1eddng\",\"3\":\"Gi\\u1edd gi\\u1ea5c t\\u1ef1 do\"}','2020-12-17 01:48:56','2020-12-17 02:50:33','0386357848',1,'cho-thue-phong-tro-25m2-so-12-ngo-3-pho-nui-truc-ba-dinh'),
(9,'Cần ghép người ở chung phòng trọ Xuân Thủy, Cầu Giấy','Cần tìm một bạn nữ ở ghép, tiền phòng và điện nước chia đôi.\r\nYêu cầu thật thà, không tính toán, vui vẻ.\r\nMình đi làm cả ngày nên chỉ về phòng ở buổi tối thôi.',2100000,18,0,'53 Ngõ 133 Xuân Thủy, Dịch Vọng Hậu, Cầu Giấy, Hà Nội, Vietnam','{\"0\":\"21.0357942\",\"1\":\"105.7848307\"}','{\"0\":\"phongtro-4EwyS-phongtro-pt1t9-phongtro4.jpg\"}',6,2,1,'{\"0\":\"C\\u00f3 g\\u00e1c l\\u1eedng\",\"1\":\"Chung ch\\u1ee7\",\"2\":\"V\\u1ec7 sinh ri\\u00eang\"}','2020-12-17 02:12:26','2020-12-17 02:50:40','0354837345',1,'can-ghep-nguoi-o-chung-phong-tro-xuan-thuy-cau-giay');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `reports` */

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_motelroom` int NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reports` */

insert  into `reports`(`id`,`ip_address`,`id_motelroom`,`status`,`created_at`,`updated_at`) values 
(1,'127.0.0.1',7,2,'2018-05-19 08:30:32','2018-05-19 08:30:32'),
(2,'127.0.0.1',7,1,'2018-05-24 14:24:17','2018-05-24 14:24:17'),
(3,'127.0.0.1',1,2,'2018-05-24 14:24:33','2018-05-24 14:24:33');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `right` int NOT NULL DEFAULT '0',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no-avatar.jpg',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tinhtrang` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`username`,`email`,`password`,`right`,`phone`,`avatar`,`remember_token`,`created_at`,`updated_at`,`tinhtrang`) values 
(1,'Thành Trung','admin','thanhtrungit.dev@gmail.com','$2y$10$0U/rTGgDXcZFEz0VCRAX2umuSMpYCIWCfBj8WdPx6wj1eCf20P9ga',1,NULL,'avatar-admin-1526708699.jpg','NRwQx67cNhuCY0Zs92qKRusGZmYMA40QB0RrOdroYDLcMZOSnqDVrBJPUCRJ','2018-05-19 05:44:01','2018-05-19 05:44:59',1),
(2,'Tất Nhạc','tatnhac','tatnhac@gmail.com','$2y$10$w68K356705u4SR1HUmzchOBR1nklo6yDvZ/VzvG0bhQRB9j4QFzwK',0,NULL,'no-avatar.jpg','j4m9NmrzLAKw6E6MxKE067XbMQegswMBoAjuC5PvnUcAjrF7FpZcPkfrqLbR','2018-05-19 07:50:52','2018-05-19 07:50:52',1),
(3,'Văn Phúc','vanphuc','vanphuc@gmail.com','$2y$10$Dbd1QmmlWGV.uYqi9KpTVuD2yKMgqs5fbHVNn5jMeOReaqh79T7gq',0,NULL,'no-avatar.jpg','BxvBGC60U40Wu1TADa2zk3MrPujWPoaymjboNSoCk9jQethQp2TXEXWO9EbG','2018-05-19 08:02:17','2018-05-19 08:02:17',1),
(4,'Bảo Ngọc','baongoc','baongoc@gmail.com','$2y$10$eMiGI1HA.u0IWJpLT1Wjlec3ojGbDhAmmnITN5Erga6t/GUpzjex.',0,NULL,'avatar-baongoc-1526717688.png','o9qTtYf2aoyY3imWqUmqLBkNoR7luVz3qoD3JslTmVpQyfapdx6JnZ0r3A9e','2018-05-19 08:11:11','2018-05-19 08:14:48',1),
(5,'hopdt','hopdt','17021389@vnu.edu.vn','$2y$10$.4BhmMGaWEFhvpGVY.eNM.aBeu3JJUi9pmCdOkjAG6TnhWVfI95fO',1,NULL,'no-avatar.jpg',NULL,'2020-12-16 14:29:05','2020-12-16 14:29:05',1),
(6,'Lâm Anh Lê','anhltl','17020570@vnu.edu.vn','$2y$10$AYxvjYt5jHnWfrZIJ2c6NuY11t4PVmx6zmHQH8.EjIH4golLMqaxm',0,NULL,'no-avatar.jpg',NULL,'2020-12-17 00:25:54','2020-12-17 00:25:54',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
