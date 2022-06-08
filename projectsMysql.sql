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

 Date: 08/06/2022 21:23:45
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
  `static-tb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t-routes
-- ----------------------------
BEGIN;
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`, `static-tb`) VALUES (1, '/home', '主页', NULL, NULL);
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`, `static-tb`) VALUES (2, '/themetool', '主题设计', NULL, 'thme-tool');
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`, `static-tb`) VALUES (3, '/speedtest', '网速平台', NULL, NULL);
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`, `static-tb`) VALUES (4, '/charts', '报表平台', NULL, NULL);
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`, `static-tb`) VALUES (5, '/acerdior', '在线编辑器', NULL, NULL);
INSERT INTO `t-routes` (`id`, `path`, `name`, `children`, `static-tb`) VALUES (6, '/photoset', '相册平台', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for theme-tool-light
-- ----------------------------
DROP TABLE IF EXISTS `theme-tool-light`;
CREATE TABLE `theme-tool-light` (
  `id` int NOT NULL AUTO_INCREMENT,
  `component` varchar(255) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of theme-tool-light
-- ----------------------------
BEGIN;
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (1, 'notifacation', NULL, '', '', 'background-color', '1');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (2, 'notifacation', NULL, 'message', NULL, 'color', '2');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (3, 'notifacation', NULL, 'close', NULL, 'color', '2');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (4, 'notifacation', 'error', 'message', NULL, 'color', '3');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (5, 'notifacation', 'error', 'icon', NULL, 'color', '3');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (6, 'notifacation', 'success', 'message', NULL, 'color', '4');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (7, 'notifacation', 'success', 'icon', NULL, 'color', '4');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (8, 'notifacation', 'warning', 'message', NULL, 'color', '5');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (9, 'notifacation', 'warning', 'icon', NULL, 'color', '5');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (10, 'notifacation', 'info', 'message', NULL, 'color', '6');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (11, 'notifacation', 'info', 'icon', NULL, 'color', '6');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (12, 'app', 'head', NULL, NULL, 'background-color', '7');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (13, 'app', 'head', 'logo-text', NULL, 'background-image', '8');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (14, 'app', 'head', 'nav', NULL, 'color', '10');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (15, 'app', 'head', 'nav', 'active', 'color', '11');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (16, 'app', 'head', 'nav', NULL, 'border-color', '9');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (17, 'app', 'head', 'nav2', NULL, 'background-color', '1');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (18, 'app', NULL, NULL, NULL, 'background-color', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (19, 'app', NULL, NULL, NULL, 'color', '13');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (20, 'button', NULL, NULL, NULL, 'background', '16');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (21, 'button', NULL, NULL, NULL, 'color', '14');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (22, 'button', NULL, NULL, NULL, 'border-color', '15');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (23, 'button', NULL, NULL, 'hover', 'background', '17');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (24, 'button', NULL, NULL, 'hover', 'color', '14');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (25, 'button', NULL, NULL, 'hover', 'border-color', '15');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (26, 'button', 'primary', NULL, NULL, 'background', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (27, 'table', 'body', NULL, NULL, 'color', '10');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (28, 'table', 'body', NULL, NULL, 'background', '18');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (29, 'table', 'body', 'TrTd', NULL, 'border-color', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (30, 'table', 'body', 'TrTd', 'hover', 'background', '20');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (31, 'table', 'head', 'TrTh', '', 'color', '10');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (32, 'table', 'head', 'TrTh', NULL, 'background-color', '17');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (33, 'table', 'head', 'TrTh', NULL, 'border-color', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (34, 'table', 'pagenation', NULL, NULL, 'color', '10');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (35, 'table', 'pagenation', NULL, NULL, 'border-color', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (36, 'table', 'pagenation', NULL, 'hover', 'color', '21');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (37, 'table', 'pagenation', NULL, 'hover', 'border-color', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (38, 'table', 'pagenation', NULL, 'disabled', 'color', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (39, 'table', 'pagenation', NULL, 'disabled', 'border-color', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (40, 'table', 'pagenation', 'prev', NULL, 'background-color', '20');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (41, 'table', 'pagenation', 'next', NULL, 'background-color', '20');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (42, 'table', 'pagenation', 'item', NULL, 'background-color', '20');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (43, 'table', 'pagenation', 'item', NULL, 'border', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (44, 'table', 'pagenation', 'item', NULL, 'color', '10');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (45, 'table', 'pagenation', 'item', 'hover', 'border', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (46, 'table', 'pagenation', 'item', 'hover', 'color', '21');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (47, 'table', 'pagenation', 'item', 'active', 'background', '20');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (48, 'table', 'pagenation', 'item', 'active', 'border-color', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (49, 'table', 'pagenation', 'item', 'active', 'color', '21');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (50, 'input', NULL, NULL, NULL, 'background', '18');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (51, 'input', NULL, NULL, NULL, 'color', '10');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (52, 'input', NULL, NULL, NULL, 'border', '20');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (53, 'input', NULL, NULL, 'focus', 'border-color', '12');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (54, 'input', NULL, NULL, 'focus', 'box-shadow', '19');
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`) VALUES (55, 'input', NULL, NULL, 'hover', 'background-color', '20');
COMMIT;

-- ----------------------------
-- Table structure for theme-tool-value-list
-- ----------------------------
DROP TABLE IF EXISTS `theme-tool-value-list`;
CREATE TABLE `theme-tool-value-list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `value` (`value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of theme-tool-value-list
-- ----------------------------
BEGIN;
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (1, 'color-1', 'rgba(10, 10, 10, 0.8)');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (2, 'color-2', '#a7a5a5');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (3, 'color-3', '#ff4d4f');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (4, 'color-4', '#52c41a');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (5, 'color-5', '#faad14');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (6, 'color-6', '#1890ff');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (7, 'color-7', 'rgba(10, 10, 10, 1)');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (8, 'image-1', '-webkit-linear-gradient(\n	right,\n	rgb(0, 255, 51),\n	#034f56,\n	rgb(248, 248, 245)\n)');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (9, 'color-10', 'rgb(115, 124, 117)');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (10, 'color-8', '#888888');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (11, 'color-9', '#04b373');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (12, 'color-11', '#242424');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (13, 'color-12', '#b0b0b0');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (14, 'color-13', 'rgb(200,200,200)');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (15, 'color-14', '#5e5e5e');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (16, 'color-15', '#2d2d2d');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (17, 'color-16', '#404040');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (18, 'color-17', '#2f2f2f');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (19, 'color-20', '#4e4e4e');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (20, 'color-18', '#3b3b3b');
INSERT INTO `theme-tool-value-list` (`id`, `name`, `value`) VALUES (21, 'color-19', '#d9d9d9');
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
INSERT INTO `userInfo` (`id`, `userName`, `password`, `cookie`, `endTime`, `theme`, `routes`) VALUES ('01', 'admin', 'admin', '1654507524356929103359', '1654511124356', 1, '1,2,3,4,5,6');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
