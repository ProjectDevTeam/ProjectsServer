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

 Date: 01/06/2022 18:15:40
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
-- Table structure for t-routes
-- ----------------------------
DROP TABLE IF EXISTS `t-routes`;
CREATE TABLE `t-routes` (
  `id` int NOT NULL,
  `path` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `children` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t-routes
-- ----------------------------
BEGIN;
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`) VALUES (1, '/home', '主页', NULL);
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`) VALUES (2, '/themetool', '主题设计', NULL);
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`) VALUES (3, '/speedtest', '网速平台', NULL);
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`) VALUES (4, '/charts', '报表平台', NULL);
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`) VALUES (5, '/acerdior', '在线编辑器', NULL);
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`) VALUES (6, '/photoset', '相册平台', NULL);
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
  `routes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userInfo
-- ----------------------------
BEGIN;
INSERT INTO `userInfo` (`id`, `userName`, `password`, `cookie`, `endTime`, `theme`, `routes`) VALUES ('01', 'admin', 'admin', '165406283015444536996', '1654067571281', 1, '1,2,3,4,5,6');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
