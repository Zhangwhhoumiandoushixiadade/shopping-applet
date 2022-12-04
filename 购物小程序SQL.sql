/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : shop_xcx

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 04/12/2022 16:56:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'zhangweihao', '052515');

-- ----------------------------
-- Table structure for t_bigtype
-- ----------------------------
DROP TABLE IF EXISTS `t_bigtype`;
CREATE TABLE `t_bigtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bigtype
-- ----------------------------
INSERT INTO `t_bigtype` VALUES (1, '手机', 'Iphone', '1.jpg');
INSERT INTO `t_bigtype` VALUES (2, '电脑平板', '电脑平板描述', '2.jpg');
INSERT INTO `t_bigtype` VALUES (3, '智能穿戴', '智能穿戴描述', '3.jpg');
INSERT INTO `t_bigtype` VALUES (4, '电视', '电视描述', '4.jpg');
INSERT INTO `t_bigtype` VALUES (5, '大家电', '大家电描述', '5.jpg');
INSERT INTO `t_bigtype` VALUES (6, '小家电', '小家电描述', '6.jpg');
INSERT INTO `t_bigtype` VALUES (7, '智能家居', '智能家居描述', '7.jpg');
INSERT INTO `t_bigtype` VALUES (8, '户外出行', '户外出行描述', '8.jpg');
INSERT INTO `t_bigtype` VALUES (9, '日用百货', '日用百货描述', '9.jpg');
INSERT INTO `t_bigtype` VALUES (10, '儿童用品', '儿童用品描述', '10.jpg');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `userId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'openId微信用户ID',
  `totalPrice` decimal(8, 2) NULL DEFAULT NULL COMMENT '总价',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `telNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '订单创建日期',
  `payDate` datetime(0) NULL DEFAULT NULL COMMENT '订单支付日期',
  `status` int(11) NULL DEFAULT 1 COMMENT '订单状态 0 未支付 1 已经支付',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (108, 'SHOPxcx20221119043837000000941', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 36676.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 16:38:38', NULL, 1);
INSERT INTO `t_order` VALUES (109, 'SHOPxcx20221119044206000000060', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 36676.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 16:42:06', NULL, 1);
INSERT INTO `t_order` VALUES (110, 'SHOPxcx20221119044617000000877', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 36676.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 16:46:18', NULL, 1);
INSERT INTO `t_order` VALUES (111, 'SHOPxcx20221119050208000000034', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 36676.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 17:02:08', NULL, 1);
INSERT INTO `t_order` VALUES (112, 'SHOPxcx20221119061558000000025', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 11497.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 18:15:58', NULL, 1);
INSERT INTO `t_order` VALUES (113, 'SHOPxcx20221119061649000000040', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 11497.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 18:16:49', NULL, 1);
INSERT INTO `t_order` VALUES (114, 'SHOPxcx20221119061817000000969', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 11497.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 18:18:18', NULL, 1);
INSERT INTO `t_order` VALUES (115, 'SHOPxcx20221119064800000000928', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 11497.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 18:48:01', NULL, 1);
INSERT INTO `t_order` VALUES (116, 'SHOPxcx20221119065015000000563', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 11497.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 18:50:16', NULL, 1);
INSERT INTO `t_order` VALUES (117, 'SHOPxcx20221119071100000000207', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 11497.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 19:11:00', NULL, 1);
INSERT INTO `t_order` VALUES (118, 'SHOPxcx20221119071115000000969', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 11497.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 19:11:16', NULL, 1);
INSERT INTO `t_order` VALUES (119, 'SHOPxcx20221119071406000000126', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 11497.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 19:14:06', NULL, 2);
INSERT INTO `t_order` VALUES (120, 'SHOPxcx20221119071424000000906', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 11497.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 19:14:25', NULL, 3);
INSERT INTO `t_order` VALUES (121, 'SHOPxcx20221119072049000000347', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 11497.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-19 19:20:49', NULL, 3);
INSERT INTO `t_order` VALUES (122, 'SHOPxcx20221122090151000000303', 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 75980.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-11-22 09:01:51', '2022-11-22 09:01:51', 2);

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mId` int(11) NULL DEFAULT NULL COMMENT '订单主表ID',
  `goodsId` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `goodsNumber` int(11) NULL DEFAULT NULL COMMENT '商品购买数量',
  `goodsPrice` decimal(8, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `goodsName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goodsPic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mId`(`mId`) USING BTREE,
  CONSTRAINT `t_order_detail_ibfk_1` FOREIGN KEY (`mId`) REFERENCES `t_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES (140, 109, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (141, 109, 8, 21, 1199.00, 'Note 9 5G', '3.png');
INSERT INTO `t_order_detail` VALUES (142, 109, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (143, 110, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (144, 110, 8, 21, 1199.00, 'Note 9 5G', '3.png');
INSERT INTO `t_order_detail` VALUES (145, 110, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (146, 111, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (147, 111, 8, 21, 1199.00, 'Note 9 5G', '3.png');
INSERT INTO `t_order_detail` VALUES (148, 111, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (149, 112, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (150, 112, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (151, 113, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (152, 113, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (153, 114, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (154, 114, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (155, 115, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (156, 115, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (157, 116, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (158, 116, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (159, 117, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (160, 117, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (161, 118, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (162, 118, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (163, 119, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (164, 119, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (165, 120, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (166, 120, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (167, 121, 6, 2, 4499.00, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (168, 121, 11, 1, 2499.00, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (169, 122, 4, 20, 3799.00, 'Xiaomi 11', '6.png');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` decimal(65, 2) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `proPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `isHot` bit(1) NULL DEFAULT NULL,
  `isSwiper` bit(1) NULL DEFAULT NULL,
  `swiperPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `swiperSort` int(255) NULL DEFAULT NULL,
  `typeId` int(255) NULL DEFAULT NULL,
  `hotDateTime` datetime(0) NULL DEFAULT NULL,
  `productIntroImgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `productParaImgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (1, '小米电视大师 82英寸', 10999.00, 3451, '20221121091451000000883.jpg', b'0', b'0', '20221121091456000000990.jpg', 3, 14, NULL, '\"\"', '\"\"', '\"\"');
INSERT INTO `t_product` VALUES (4, 'Xiaomi 11', 3799.00, 3232, '6.png', b'1', b'0', 'default.jpg', 0, 2, '2021-07-28 21:36:34', '<img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/11.jpg\'></img>', '<img width=\'100%\' src=\'http://localhost:8080/image/productParaImgs/11.jpg\'></img>', '「全版本领券立减200元，券后价3299元起；享至高24期免息；赠手机保护壳*1;【全款支付套装】赠果冻包」');
INSERT INTO `t_product` VALUES (5, 'Redmi K40 游戏增强版', 2299.00, 2005, '11.png', b'0', b'1', '1.jpg', 1, 39, NULL, '\"\"', '\"\"', '\"\"');
INSERT INTO `t_product` VALUES (6, 'Xiaomi 11 Pro', 4499.00, 2343, '1.png', b'1', b'0', 'default.jpg', 0, 2, '2021-09-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (7, 'Xiaomi MIX FOLD折叠屏手机', 7999.00, 2222, '2.png', b'1', b'0', 'default.jpg', 0, 3, '2021-10-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (8, 'Note 9 5G', 1199.00, 1111, '3.png', b'1', b'0', 'default.jpg', 0, 40, '2021-09-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (9, 'Xiaomi 10S', 2999.00, 1111, '4.png', b'1', b'0', 'default.jpg', 0, 2, '2021-12-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (10, 'Note 9 Pro 5G', 1399.00, 2222, '5.png', b'1', b'0', 'default.jpg', 0, 40, '2021-11-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (11, '黑鲨4', 2499.00, 3322, '7.png', b'1', b'0', 'default.jpg', 0, 41, '2021-11-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (12, 'Redmi  K40 Pro 系列', 2499.00, 3244, '8.png', b'1', b'0', 'default.jpg', 0, 39, '2021-11-28 21:36:34', NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (14, 'Xiaomi Civi', 2599.00, 4444, '9.png', b'0', b'0', 'default.jpg', 0, 1, NULL, '<img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/1.jpg\'></img><img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/2.jpg\'></img><img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/3.jpg\'></img>', '<img width=\'100%\' src=\'http://localhost:8080/image/productParaImgs/1.jpg\'></img><img width=\'100%\' src=\'http://localhost:8080/image/productParaImgs/2.jpg\'></img>', '「购机至高享24期免息；赠Redmi AirDots 2真无线蓝牙耳机；赠Keep会员7天体验卡；+110元得Air2 SE蓝牙耳机」');
INSERT INTO `t_product` VALUES (15, 'Xiaomi 11 Ultra', 5499.00, 4444, '10.png', b'0', b'0', 'default.jpg', 0, 2, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (16, '小米平板5', 1999.00, 444, '13.png', b'0', b'0', 'default.jpg', 0, 5, NULL, '<img src=\'http://localhost:8080/image/productIntroImgs/111.jpg\'></img><img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/222.jpg\'></img><img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/333.jpg\'></img>', '<img width=\'100%\' src=\'http://localhost:8080/image/productParaImgs/111.jpg\'></img>', '11英寸大屏 2.5K超清显示 120Hz高刷新率');
INSERT INTO `t_product` VALUES (17, '小米平板5 Pro', 2499.00, 444, '14.png', b'0', b'0', 'default.jpg', 0, 5, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (19, 'RedmiBook Pro 15 增强版', 5299.00, 444, '15.png', b'0', b'0', 'default.jpg', 0, 6, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (20, 'Redmi G 2021', 6499.00, 1999, '16.png', b'0', b'1', '3.jpg', 2, 6, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (21, 'Redmi G 2021 锐龙版', 7499.00, 2000, '17.png', b'0', b'0', 'default.jpg', 0, 6, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (22, 'RedmiBook Pro 14 增强版', 4999.00, 777, '18.png', b'0', b'0', 'default.jpg', 0, 6, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (23, '小米笔记本 Pro 14 锐龙版', 5499.00, 666, '19.png', b'0', b'0', 'default.jpg', 0, 7, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (24, '小米笔记本 Pro 14 增强版', 5499.00, 666, '20.png', b'0', b'0', 'default.jpg', 0, 7, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (31, '1111111', 111111.00, 1111111, '20221121091228000000391.jpg', b'1', b'1', 'default.jpg', 0, 27, '2022-11-21 21:12:32', NULL, NULL, '11111111212wdadadad');

-- ----------------------------
-- Table structure for t_product_swiper_image
-- ----------------------------
DROP TABLE IF EXISTS `t_product_swiper_image`;
CREATE TABLE `t_product_swiper_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `productId` int(11) NULL DEFAULT NULL COMMENT '所属商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product_swiper_image
-- ----------------------------
INSERT INTO `t_product_swiper_image` VALUES (1, '1.jpg', 1, 14);
INSERT INTO `t_product_swiper_image` VALUES (2, '2.jpg', 2, 14);
INSERT INTO `t_product_swiper_image` VALUES (3, '3.jpg', 3, 14);
INSERT INTO `t_product_swiper_image` VALUES (4, '4.jpg', 4, 14);
INSERT INTO `t_product_swiper_image` VALUES (5, '5.jpg', 5, 14);
INSERT INTO `t_product_swiper_image` VALUES (6, '6.jpg', 6, 14);
INSERT INTO `t_product_swiper_image` VALUES (7, '7.jpg', 7, 14);
INSERT INTO `t_product_swiper_image` VALUES (8, '11.jpg', 1, 4);
INSERT INTO `t_product_swiper_image` VALUES (9, '22.jpg', 2, 4);
INSERT INTO `t_product_swiper_image` VALUES (10, '33.jpg', 3, 4);
INSERT INTO `t_product_swiper_image` VALUES (11, '44.jpg', 4, 4);
INSERT INTO `t_product_swiper_image` VALUES (12, '111.jpg', 1, 16);
INSERT INTO `t_product_swiper_image` VALUES (13, '222.jpg', 2, 16);
INSERT INTO `t_product_swiper_image` VALUES (14, '333.jpg', 3, 16);
INSERT INTO `t_product_swiper_image` VALUES (15, '20221121093002000000287.jpg', 5, 4);

-- ----------------------------
-- Table structure for t_smalltype
-- ----------------------------
DROP TABLE IF EXISTS `t_smalltype`;
CREATE TABLE `t_smalltype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品小类',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `bigTypeId` int(11) NULL DEFAULT NULL COMMENT '商品大类编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bigTypeId`(`bigTypeId`) USING BTREE,
  CONSTRAINT `t_smalltype_ibfk_1` FOREIGN KEY (`bigTypeId`) REFERENCES `t_bigtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_smalltype
-- ----------------------------
INSERT INTO `t_smalltype` VALUES (1, 'Xiaomi Civi', 'Xiaomi Civi', 1);
INSERT INTO `t_smalltype` VALUES (2, 'Xiaomi 数字系列', 'Xiaomi 数字系列', 1);
INSERT INTO `t_smalltype` VALUES (3, 'Xiaomi MIX系列', 'Xiaomi MIX系列', 1);
INSERT INTO `t_smalltype` VALUES (5, '小米平板', '小米平板', 2);
INSERT INTO `t_smalltype` VALUES (6, 'RedmiBook', 'RedmiBook', 2);
INSERT INTO `t_smalltype` VALUES (7, '小米笔记本', '小米笔记本', 2);
INSERT INTO `t_smalltype` VALUES (10, '耳机', '耳机', 3);
INSERT INTO `t_smalltype` VALUES (11, '手表', '手表', 3);
INSERT INTO `t_smalltype` VALUES (12, '手环', '手环', 3);
INSERT INTO `t_smalltype` VALUES (13, '电视', '电视', 4);
INSERT INTO `t_smalltype` VALUES (14, '小米电视大师', '小米电视大师', 4);
INSERT INTO `t_smalltype` VALUES (15, '电视配件', '电视配件', 4);
INSERT INTO `t_smalltype` VALUES (16, '空调', '空调', 5);
INSERT INTO `t_smalltype` VALUES (17, '洗衣机', '洗衣机', 5);
INSERT INTO `t_smalltype` VALUES (18, '冰箱', '冰箱', 5);
INSERT INTO `t_smalltype` VALUES (19, '厨房大电', '厨房大电', 5);
INSERT INTO `t_smalltype` VALUES (20, '厨房小电', '厨房小电', 6);
INSERT INTO `t_smalltype` VALUES (21, '清洁电器', '清洁电器', 6);
INSERT INTO `t_smalltype` VALUES (22, '环境电器', '环境电器', 6);
INSERT INTO `t_smalltype` VALUES (23, '生活电器', '生活电器', 6);
INSERT INTO `t_smalltype` VALUES (24, '小爱音箱', '小爱音箱', 7);
INSERT INTO `t_smalltype` VALUES (25, '路由器', '路由器', 7);
INSERT INTO `t_smalltype` VALUES (26, '智能安防', '智能安防', 7);
INSERT INTO `t_smalltype` VALUES (27, '智能控制', '智能控制', 7);
INSERT INTO `t_smalltype` VALUES (28, '户外出行', '户外出行', 8);
INSERT INTO `t_smalltype` VALUES (29, '箱包', '箱包', 8);
INSERT INTO `t_smalltype` VALUES (30, '家具日用', '家具日用', 9);
INSERT INTO `t_smalltype` VALUES (31, '防护清洁', '防护清洁', 9);
INSERT INTO `t_smalltype` VALUES (32, '会员定制', '会员定制', 9);
INSERT INTO `t_smalltype` VALUES (33, '个人护理', '个人护理', 9);
INSERT INTO `t_smalltype` VALUES (34, '健康', '健康', 9);
INSERT INTO `t_smalltype` VALUES (35, '鞋服配饰', '鞋服配饰', 9);
INSERT INTO `t_smalltype` VALUES (36, '床品家居', '床品家居', 9);
INSERT INTO `t_smalltype` VALUES (37, '礼品周边', '礼品周边', 9);
INSERT INTO `t_smalltype` VALUES (38, '儿童用品', '儿童用品', 10);
INSERT INTO `t_smalltype` VALUES (39, 'Redmi K系列', 'K系列', 1);
INSERT INTO `t_smalltype` VALUES (40, 'Redmi Note系列', 'Note系列', 1);
INSERT INTO `t_smalltype` VALUES (41, '游戏手机', '游戏手机', 1);
INSERT INTO `t_smalltype` VALUES (51, '辣条', '卫龙辣条你的选择', 10);

-- ----------------------------
-- Table structure for t_wxuserinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_wxuserinfo`;
CREATE TABLE `t_wxuserinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户唯一标识',
  `nickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatarUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像图片的 URL',
  `registerDate` datetime(0) NULL DEFAULT NULL COMMENT '注册日期',
  `lastLoginDate` datetime(0) NULL DEFAULT NULL COMMENT '最后登录日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wxuserinfo
-- ----------------------------
INSERT INTO `t_wxuserinfo` VALUES (6, 'oLI6C6uCir96CdjvhjQ_r7DDZBxM', 'ZHANG', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Rgr60EMyax7HhJjY1lWGy8ALNjoq3uOiav0jplo2xc7jcP5K3TGLoJUGmE8RS8RASYebKR6FUsOETHKCEwia1GNQ/132', '2022-11-19 13:39:21', '2022-11-21 23:05:05');

SET FOREIGN_KEY_CHECKS = 1;
