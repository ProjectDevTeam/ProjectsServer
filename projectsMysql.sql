/*
 Navicat Premium Data Transfer

 Source Server         : family-photo-set
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : projectsMysql

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 31/05/2022 18:10:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sysConfig
-- ----------------------------
DROP TABLE IF EXISTS `sysConfig`;
CREATE TABLE `sysConfig` (
  `config` varchar(255) NOT NULL,
  `data` varchar(255) DEFAULT NULL,
  `exp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sysConfig
-- ----------------------------
BEGIN;
INSERT INTO `sysConfig` (`config`, `data`, `exp`) VALUES ('theme', '0,1', 'dark,light');
COMMIT;

-- ----------------------------
-- Table structure for userInfo
-- ----------------------------
DROP TABLE IF EXISTS `userInfo`;
CREATE TABLE `userInfo` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cookie` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  `theme` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userInfo
-- ----------------------------
BEGIN;
INSERT INTO `userInfo` (`id`, `userName`, `password`, `cookie`, `endTime`, `theme`) VALUES ('01', 'admin', 'admin', '1653963062587995551107', '1653967213831', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
