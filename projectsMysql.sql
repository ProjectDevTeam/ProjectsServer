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

 Date: 15/06/2022 21:44:43
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
  `userId` int NOT NULL,
  PRIMARY KEY (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sysConfig
-- ----------------------------
BEGIN;
INSERT INTO `sysConfig` (`config`, `data`, `exp`, `userId`) VALUES ('theme', '0,1', 'dark,light', 1);
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
-- Table structure for theme-tool-colorField
-- ----------------------------
DROP TABLE IF EXISTS `theme-tool-colorField`;
CREATE TABLE `theme-tool-colorField` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `value` (`value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of theme-tool-colorField
-- ----------------------------
BEGIN;
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (1, 'color-1', 'rgba(10, 10, 10, 0.8)');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (2, 'color-2', '#a7a5a5');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (3, 'color-3', '#ff4d4f');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (4, 'color-4', '#52c41a');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (5, 'color-5', '#faad14');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (6, 'color-6', '#1890ff');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (7, 'color-7', 'rgba(10, 10, 10, 1)');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (8, 'image-1', '-webkit-linear-gradient(\n	right,\n	rgb(0, 255, 51),\n	#034f56,\n	rgb(248, 248, 245)\n)');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (9, 'color-10', 'rgb(115, 124, 117)');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (10, 'color-8', '#888888');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (11, 'color-9', '#04b373');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (12, 'color-11', '#242424');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (13, 'color-12', '#b0b0b0');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (14, 'color-13', 'rgb(200,200,200)');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (15, 'color-14', '#5e5e5e');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (16, 'color-15', '#2d2d2d');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (17, 'color-16', '#404040');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (18, 'color-17', '#2f2f2f');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (19, 'color-20', '#4e4e4e');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (20, 'color-18', '#3b3b3b');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (21, 'color-19', '#d9d9d9');
INSERT INTO `theme-tool-colorField` (`id`, `name`, `value`) VALUES (22, 'color-21', '#585858');
COMMIT;

-- ----------------------------
-- Table structure for theme-tool-dark
-- ----------------------------
DROP TABLE IF EXISTS `theme-tool-dark`;
CREATE TABLE `theme-tool-dark` (
  `id` int NOT NULL AUTO_INCREMENT,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `group` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `attribute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` int NOT NULL,
  `editor` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of theme-tool-dark
-- ----------------------------
BEGIN;
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (1, 'notifacation', NULL, '', '', 'background-color', '1', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (2, 'notifacation', NULL, 'message', NULL, 'color', '2', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (3, 'notifacation', NULL, 'close', NULL, 'color', '2', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (4, 'notifacation', 'error', 'message', NULL, 'color', '3', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (5, 'notifacation', 'error', 'icon', NULL, 'color', '3', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (6, 'notifacation', 'success', 'message', NULL, 'color', '4', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (7, 'notifacation', 'success', 'icon', NULL, 'color', '4', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (8, 'notifacation', 'warning', 'message', NULL, 'color', '5', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (9, 'notifacation', 'warning', 'icon', NULL, 'color', '5', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (10, 'notifacation', 'info', 'message', NULL, 'color', '6', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (11, 'notifacation', 'info', 'icon', NULL, 'color', '6', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (12, 'app', 'head', NULL, NULL, 'background-color', '7', 1, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (13, 'app', 'head', 'logo-text', NULL, 'background-image', '8', 1, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (14, 'app', 'head', 'nav', NULL, 'color', '10', 1, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (15, 'app', 'head', 'nav', 'active', 'color', '11', 1, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (16, 'app', 'head', 'nav', NULL, 'border-color', '9', 1, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (17, 'app', 'head', 'nav2', NULL, 'background-color', '1', 1, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (18, 'app', NULL, NULL, NULL, 'background-color', '12', 1, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (19, 'app', NULL, NULL, NULL, 'color', '13', 1, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (20, 'button', NULL, NULL, NULL, 'background', '16', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (21, 'button', NULL, NULL, NULL, 'color', '14', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (22, 'button', NULL, NULL, NULL, 'border-color', '15', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (23, 'button', NULL, NULL, 'hover', 'background', '17', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (24, 'button', NULL, NULL, 'hover', 'color', '14', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (25, 'button', NULL, NULL, 'hover', 'border-color', '15', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (26, 'button', 'primary', NULL, NULL, 'background', '12', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (27, 'table', 'body', NULL, NULL, 'color', '10', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (28, 'table', 'body', NULL, NULL, 'background', '18', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (29, 'table', 'body', 'TrTd', NULL, 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (30, 'table', 'body', 'TrTd', 'hover', 'background', '20', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (31, 'table', 'head', 'TrTh', '', 'color', '10', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (32, 'table', 'head', 'TrTh', NULL, 'background-color', '17', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (33, 'table', 'head', 'TrTh', NULL, 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (34, 'table', 'pagenation', NULL, NULL, 'color', '10', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (35, 'table', 'pagenation', NULL, NULL, 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (36, 'table', 'pagenation', NULL, 'hover', 'color', '21', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (37, 'table', 'pagenation', NULL, 'hover', 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (38, 'table', 'pagenation', NULL, 'disabled', 'color', '12', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (39, 'table', 'pagenation', NULL, 'disabled', 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (40, 'table', 'pagenation', 'prev', NULL, 'background-color', '20', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (41, 'table', 'pagenation', 'next', NULL, 'background-color', '20', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (42, 'table', 'pagenation', 'item', NULL, 'background-color', '20', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (43, 'table', 'pagenation', 'item', NULL, 'border', '12', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (44, 'table', 'pagenation', 'item', NULL, 'color', '10', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (45, 'table', 'pagenation', 'item', 'hover', 'border', '12', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (46, 'table', 'pagenation', 'item', 'hover', 'color', '21', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (47, 'table', 'pagenation', 'item', 'active', 'background', '20', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (48, 'table', 'pagenation', 'item', 'active', 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (49, 'table', 'pagenation', 'item', 'active', 'color', '21', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (50, 'input', NULL, NULL, NULL, 'background', '18', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (51, 'input', NULL, NULL, NULL, 'color', '10', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (52, 'input', NULL, NULL, NULL, 'border', '20', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (53, 'input', NULL, NULL, 'focus', 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (54, 'input', NULL, NULL, 'focus', 'box-shadow', '19', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (55, 'input', NULL, NULL, 'hover', 'background-color', '20', 0, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (56, 'app', 'body', 'title', NULL, 'color', '11', 1, 0);
INSERT INTO `theme-tool-dark` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (57, 'form', NULL, NULL, NULL, 'color', '13', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for theme-tool-light
-- ----------------------------
DROP TABLE IF EXISTS `theme-tool-light`;
CREATE TABLE `theme-tool-light` (
  `id` int NOT NULL AUTO_INCREMENT,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `group` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `attribute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` int NOT NULL,
  `editor` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of theme-tool-light
-- ----------------------------
BEGIN;
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (1, 'notifacation', NULL, '', '', 'background-color', '1', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (2, 'notifacation', NULL, 'message', NULL, 'color', '2', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (3, 'notifacation', NULL, 'close', NULL, 'color', '2', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (4, 'notifacation', 'error', 'message', NULL, 'color', '3', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (5, 'notifacation', 'error', 'icon', NULL, 'color', '3', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (6, 'notifacation', 'success', 'message', NULL, 'color', '4', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (7, 'notifacation', 'success', 'icon', NULL, 'color', '4', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (8, 'notifacation', 'warning', 'message', NULL, 'color', '5', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (9, 'notifacation', 'warning', 'icon', NULL, 'color', '5', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (10, 'notifacation', 'info', 'message', NULL, 'color', '6', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (11, 'notifacation', 'info', 'icon', NULL, 'color', '6', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (12, 'app', 'head', NULL, NULL, 'background-color', '7', 1, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (13, 'app', 'head', 'logo-text', NULL, 'background-image', '8', 1, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (14, 'app', 'head', 'nav', NULL, 'color', '10', 1, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (15, 'app', 'head', 'nav', 'active', 'color', '11', 1, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (16, 'app', 'head', 'nav', NULL, 'border-color', '9', 1, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (17, 'app', 'head', 'nav2', NULL, 'background-color', '1', 1, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (18, 'app', NULL, NULL, NULL, 'background-color', '12', 1, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (19, 'app', NULL, NULL, NULL, 'color', '13', 1, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (20, 'button', NULL, NULL, NULL, 'background', '16', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (21, 'button', NULL, NULL, NULL, 'color', '14', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (22, 'button', NULL, NULL, NULL, 'border-color', '15', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (23, 'button', NULL, NULL, 'hover', 'background', '17', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (24, 'button', NULL, NULL, 'hover', 'color', '14', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (25, 'button', NULL, NULL, 'hover', 'border-color', '15', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (26, 'button', 'primary', NULL, NULL, 'background', '12', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (27, 'table', 'body', NULL, NULL, 'color', '10', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (28, 'table', 'body', NULL, NULL, 'background', '18', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (29, 'table', 'body', 'TrTd', NULL, 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (30, 'table', 'body', 'TrTd', 'hover', 'background', '20', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (31, 'table', 'head', 'TrTh', '', 'color', '10', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (32, 'table', 'head', 'TrTh', NULL, 'background-color', '17', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (33, 'table', 'head', 'TrTh', NULL, 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (34, 'table', 'pagenation', NULL, NULL, 'color', '10', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (35, 'table', 'pagenation', NULL, NULL, 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (36, 'table', 'pagenation', NULL, 'hover', 'color', '21', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (37, 'table', 'pagenation', NULL, 'hover', 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (38, 'table', 'pagenation', NULL, 'disabled', 'color', '12', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (39, 'table', 'pagenation', NULL, 'disabled', 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (40, 'table', 'pagenation', 'prev', NULL, 'background-color', '20', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (41, 'table', 'pagenation', 'next', NULL, 'background-color', '20', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (42, 'table', 'pagenation', 'item', NULL, 'background-color', '20', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (43, 'table', 'pagenation', 'item', NULL, 'border', '12', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (44, 'table', 'pagenation', 'item', NULL, 'color', '10', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (45, 'table', 'pagenation', 'item', 'hover', 'border', '12', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (46, 'table', 'pagenation', 'item', 'hover', 'color', '21', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (47, 'table', 'pagenation', 'item', 'active', 'background', '20', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (48, 'table', 'pagenation', 'item', 'active', 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (49, 'table', 'pagenation', 'item', 'active', 'color', '21', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (50, 'input', NULL, NULL, NULL, 'background', '18', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (51, 'input', NULL, NULL, NULL, 'color', '10', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (52, 'input', NULL, NULL, NULL, 'border', '20', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (53, 'input', NULL, NULL, 'focus', 'border-color', '12', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (54, 'input', NULL, NULL, 'focus', 'box-shadow', '19', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (55, 'input', NULL, NULL, 'hover', 'background-color', '20', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (56, 'app', 'body', 'title', NULL, 'color', '11', 1, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (57, 'form', NULL, NULL, NULL, 'color', '13', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (58, 'tabs', NULL, NULL, NULL, 'color', '13', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (59, 'tabs', 'tab', NULL, 'active', 'color', '11', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (60, 'tabs', 'link-bar', NULL, NULL, 'background', '11', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (61, 'tabs', 'content', NULL, NULL, 'color', '13', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (62, 'tabs', 'top', NULL, NULL, 'border-color', '22', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (63, 'tabs', 'tab', NULL, 'hover', 'color', '11', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (64, 'tabs', 'tab', NULL, 'focus', 'color', '11', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (65, 'scrollbar', 'thumb', NULL, NULL, 'background', '19', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (66, 'scrollbar', 'track', NULL, NULL, 'background', '18', 0, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (67, 'app', 'searchTable', 'splitLine', NULL, 'color', '13', 1, 0);
INSERT INTO `theme-tool-light` (`id`, `component`, `group`, `position`, `status`, `attribute`, `value`, `type`, `editor`) VALUES (68, 'table', 'tbody', 'placeholder', 'hover', 'background-color', '17', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for userInfo
-- ----------------------------
DROP TABLE IF EXISTS `userInfo`;
CREATE TABLE `userInfo` (
  `id` int NOT NULL,
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
INSERT INTO `userInfo` (`id`, `userName`, `password`, `cookie`, `endTime`, `theme`, `routes`) VALUES (1, 'admin', 'admin', '1655291391330106239285', '1655304125207', 1, '1,2,3,4,5,6');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
