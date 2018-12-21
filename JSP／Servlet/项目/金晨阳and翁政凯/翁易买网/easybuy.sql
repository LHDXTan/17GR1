/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : easybuy
Target Host     : localhost:3306
Target Database : easybuy
Date: 2018-11-29 17:33:52
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for easy_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `easy_order_detail`;
CREATE TABLE `easy_order_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderld` int(10) NOT NULL,
  `productld` int(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` float(10,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of easy_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for easybuy_news
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_news`;
CREATE TABLE `easybuy_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `createTime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of easybuy_news
-- ----------------------------

-- ----------------------------
-- Table structure for easybuy_order
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_order`;
CREATE TABLE `easybuy_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userld` varchar(10) NOT NULL,
  `loginName` varchar(20) NOT NULL,
  `userAddress` varchar(200) NOT NULL,
  `createTime` date NOT NULL,
  `cost` float NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `serialNumber` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of easybuy_order
-- ----------------------------

-- ----------------------------
-- Table structure for easybuy_product
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_product`;
CREATE TABLE `easybuy_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `desciption` varchar(100) DEFAULT NULL,
  `price` float NOT NULL,
  `stock` int(11) NOT NULL,
  `categorylevel1` int(11) NOT NULL,
  `categorylevel2` int(11) DEFAULT NULL,
  `categorylevel3` varchar(200) NOT NULL,
  `fileName` varchar(200) NOT NULL,
  `isDelete` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of easybuy_product
-- ----------------------------

-- ----------------------------
-- Table structure for easybuy_product_category
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_product_category`;
CREATE TABLE `easybuy_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `parentld` int(11) NOT NULL,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of easybuy_product_category
-- ----------------------------

-- ----------------------------
-- Table structure for easybuy_user
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_user`;
CREATE TABLE `easybuy_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(10) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `identityCode` date DEFAULT NULL,
  `emali` varchar(18) DEFAULT NULL,
  `mobile` varchar(80) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of easybuy_user
-- ----------------------------
