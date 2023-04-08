/*
 Navicat Premium Data Transfer

 Source Server         : mysql80
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : yeb

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 06/04/2022 20:16:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号码',
  `telphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家庭电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `userFace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', '17612341234', '17612341234', '某地', 1, 'admin', '$2a$10$Qcvgt86yz37BT.w9z7B0jOikXV.rutLZ/NbAlLhx64btzi2RZZB/m', 'https://images.lichuang.info/images/defaultuser.png', '系统管理员');
INSERT INTO `t_admin` VALUES (2, 'wang', '17612341234', '17612341234', '某地', 1, 'wang', '$2a$10$hUI1bn2gcn75G24UHNckQO37LaBpIlodi0KMrWWfQT9JS2H3SEBCa', 'https://images.lichuang.info/images/defaultuser.png', '测试管理员1');
INSERT INTO `t_admin` VALUES (3, 'jing', '17612341234', '17612341234', '某地', 1, 'jing', '$2a$10$hUI1bn2gcn75G24UHNckQO37LaBpIlodi0KMrWWfQT9JS2H3SEBCa', 'https://images.lichuang.info/images/defaultuser.png', '测试管理员2');
INSERT INTO `t_admin` VALUES (4, 'yuan', '17612341234', '17612341234', '某地', 1, 'yuan', '$2a$10$hUI1bn2gcn75G24UHNckQO37LaBpIlodi0KMrWWfQT9JS2H3SEBCa', 'https://images.lichuang.info/images/defaultuser.png', '测试管理员3');

-- ----------------------------
-- Table structure for t_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `adminId` int(0) NOT NULL COMMENT '用户ID',
  `roleId` int(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `for_ar_admin_id`(`adminId`) USING BTREE,
  INDEX `for_ar_role_id`(`roleId`) USING BTREE,
  CONSTRAINT `for_ar_admin_id` FOREIGN KEY (`adminId`) REFERENCES `t_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `for_ar_role_id` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
INSERT INTO `t_admin_role` VALUES (13, 1, 1);
INSERT INTO `t_admin_role` VALUES (17, 1, 2);
INSERT INTO `t_admin_role` VALUES (22, 2, 2);
INSERT INTO `t_admin_role` VALUES (23, 2, 7);
INSERT INTO `t_admin_role` VALUES (26, 4, 2);
INSERT INTO `t_admin_role` VALUES (27, 4, 9);
INSERT INTO `t_admin_role` VALUES (40, 3, 2);
INSERT INTO `t_admin_role` VALUES (41, 3, 8);

-- ----------------------------
-- Table structure for t_appraise
-- ----------------------------
DROP TABLE IF EXISTS `t_appraise`;
CREATE TABLE `t_appraise`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `eid` int(0) NOT NULL COMMENT '员工ID',
  `app_date` date NOT NULL COMMENT '考评日期',
  `app_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '考评结果',
  `app_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '考评内容',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门名称',
  `parentId` int(0) DEFAULT NULL COMMENT '父ID',
  `depPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
  `enabled` tinyint(1) DEFAULT 1 COMMENT '启用禁用',
  `isParent` tinyint(1) DEFAULT 0 COMMENT '是否父级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES (1, '股东会', -1, '.1', 1, 1);
INSERT INTO `t_department` VALUES (2, '董事会', 1, '.1.2', 1, 1);
INSERT INTO `t_department` VALUES (3, '总办', 2, '.1.2.3', 1, 1);
INSERT INTO `t_department` VALUES (4, '财务部', 3, '.1.2.3.4', 1, 0);
INSERT INTO `t_department` VALUES (5, '市场部', 3, '.1.2.3.5', 1, 1);
INSERT INTO `t_department` VALUES (6, '华东市场部', 5, '.1.2.3.5.6', 1, 1);
INSERT INTO `t_department` VALUES (7, '华南市场部', 5, '.1.2.3.5.7', 1, 0);
INSERT INTO `t_department` VALUES (8, '上海市场部', 6, '.1.2.3.5.6.8', 1, 0);
INSERT INTO `t_department` VALUES (9, '西北市场部', 5, '.1.2.3.5.9', 1, 1);
INSERT INTO `t_department` VALUES (10, '贵阳市场', 9, '.1.2.3.5.9.10', 1, 1);
INSERT INTO `t_department` VALUES (11, '乌当区市场', 10, '.1.2.3.5.9.10.11', 1, 0);
INSERT INTO `t_department` VALUES (12, '技术部', 3, '.1.2.3.12', 1, 1);
INSERT INTO `t_department` VALUES (13, '运维部', 3, '.1.2.3.13', 1, 0);
INSERT INTO `t_department` VALUES (20, '开发部', 12, '.1.2.3.12.20', 1, 0);
INSERT INTO `t_department` VALUES (21, '测试部', 12, '.1.2.3.12.21', 1, 0);

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `idCard` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证号',
  `wedlock` enum('离异','未婚','已婚') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '未婚' COMMENT '婚姻状况',
  `nationId` int(0) DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '籍贯',
  `politicId` int(0) DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `departmentId` int(0) DEFAULT NULL COMMENT '部门ID',
  `jobLevelId` int(0) DEFAULT NULL COMMENT '职称ID',
  `posId` int(0) DEFAULT NULL COMMENT '职位ID',
  `engageForm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree` enum('博士后','博士','硕士','大学','高中','初中','小学') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '高中' COMMENT '学历',
  `specialty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属专业',
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '毕业学校',
  `beginDate` date DEFAULT NULL COMMENT '入职日期',
  `workState` enum('离职','在职') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '在职' COMMENT '在职状态',
  `workId` int(0) DEFAULT NULL COMMENT '工号',
  `contractTerm` double DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date DEFAULT NULL COMMENT '转正日期',
  `notWorkDate` date DEFAULT NULL COMMENT '离职日期',
  `beginContract` date DEFAULT NULL COMMENT '合同开始日期',
  `endContract` date DEFAULT NULL COMMENT '合同终止日期',
  `workAge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工龄',
  `salaryId` int(0) DEFAULT NULL COMMENT '工资账套ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `seq_workId`(`workId`) USING BTREE COMMENT '工号索引确保不重复',
  INDEX `for_posId`(`posId`) USING BTREE,
  INDEX `for_depId`(`departmentId`) USING BTREE,
  INDEX `for_nationId`(`nationId`) USING BTREE,
  INDEX `for_psId`(`politicId`) USING BTREE,
  INDEX `for_joblevelId`(`jobLevelId`) USING BTREE,
  CONSTRAINT `for_depId` FOREIGN KEY (`departmentId`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `for_joblevelId` FOREIGN KEY (`jobLevelId`) REFERENCES `t_joblevel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `for_nationId` FOREIGN KEY (`nationId`) REFERENCES `t_nation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `for_posId` FOREIGN KEY (`posId`) REFERENCES `t_position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `for_psId` FOREIGN KEY (`politicId`) REFERENCES `t_politics_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES (1, '员工0', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '6023@xxxx.com', '1300000xxxx', '地址', 6, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000000, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 6);
INSERT INTO `t_employee` VALUES (2, '员工1000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '414@xxxx.com', '1300000xxxx', '地址', 10, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000001, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (3, '员工2000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '5998@xxxx.com', '1300000xxxx', '地址', 3, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000002, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (4, '员工3000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '7182@xxxx.com', '1300000xxxx', '地址', 4, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000003, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (5, '员工4000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '4512@xxxx.com', '1300000xxxx', '地址', 13, 4, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000004, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (6, '员工5000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 2, '171@xxxx.com', '1300000xxxx', '地址', 11, 1, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000005, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (7, '员工6000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '5475@xxxx.com', '1300000xxxx', '地址', 13, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000006, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (8, '员工7000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 2, '8134@xxxx.com', '1300000xxxx', '地址', 5, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000007, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (9, '员工8000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 1, '7794@xxxx.com', '1300000xxxx', '地址', 6, 2, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000008, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (10, '员工9000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '4715@xxxx.com', '1300000xxxx', '地址', 1, 1, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000009, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (11, '员工10000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '5958@xxxx.com', '1300000xxxx', '地址', 5, 2, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000010, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (12, '员工11000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '2073@xxxx.com', '1300000xxxx', '地址', 11, 4, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000011, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (13, '员工12000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 1, '8070@xxxx.com', '1300000xxxx', '地址', 8, 1, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000012, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (14, '员工13000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '1432@xxxx.com', '1300000xxxx', '地址', 8, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000013, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (15, '员工14000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '8033@xxxx.com', '1300000xxxx', '地址', 5, 3, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000014, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (16, '员工15000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 1, '6172@xxxx.com', '1300000xxxx', '地址', 2, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000015, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (17, '员工16000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 2, '1284@xxxx.com', '1300000xxxx', '地址', 9, 3, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000016, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (18, '员工17000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 2, '2591@xxxx.com', '1300000xxxx', '地址', 4, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000017, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (19, '员工18000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '4863@xxxx.com', '1300000xxxx', '地址', 1, 2, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000018, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (20, '员工19000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '2963@xxxx.com', '1300000xxxx', '地址', 10, 4, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000019, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (21, '员工20000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '1849@xxxx.com', '1300000xxxx', '地址', 8, 2, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000020, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (22, '员工21000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '7501@xxxx.com', '1300000xxxx', '地址', 2, 2, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000021, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (23, '员工22000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '1067@xxxx.com', '1300000xxxx', '地址', 13, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000022, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (24, '员工23000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '597@xxxx.com', '1300000xxxx', '地址', 1, 4, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000023, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (25, '员工24000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '8497@xxxx.com', '1300000xxxx', '地址', 2, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000024, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (26, '员工25000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 2, '6547@xxxx.com', '1300000xxxx', '地址', 2, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000025, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (27, '员工26000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '3253@xxxx.com', '1300000xxxx', '地址', 6, 2, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000026, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (28, '员工27000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '7932@xxxx.com', '1300000xxxx', '地址', 12, 1, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000027, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (29, '员工28000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '9214@xxxx.com', '1300000xxxx', '地址', 10, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000028, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (30, '员工29000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '5634@xxxx.com', '1300000xxxx', '地址', 2, 2, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000029, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (31, '员工30000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '3629@xxxx.com', '1300000xxxx', '地址', 10, 3, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000030, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (32, '员工31000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '9667@xxxx.com', '1300000xxxx', '地址', 6, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000031, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (33, '员工32000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '2671@xxxx.com', '1300000xxxx', '地址', 9, 4, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000032, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (34, '员工33000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 2, '1696@xxxx.com', '1300000xxxx', '地址', 2, 4, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000033, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (35, '员工34000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '6214@xxxx.com', '1300000xxxx', '地址', 6, 2, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000034, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (36, '员工35000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 2, '5879@xxxx.com', '1300000xxxx', '地址', 13, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000035, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (37, '员工36000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '3178@xxxx.com', '1300000xxxx', '地址', 1, 4, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000036, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (38, '员工37000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '5267@xxxx.com', '1300000xxxx', '地址', 8, 3, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000037, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (39, '员工38000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '181@xxxx.com', '1300000xxxx', '地址', 13, 3, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000038, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (40, '员工39000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '2407@xxxx.com', '1300000xxxx', '地址', 3, 4, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000039, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (41, '员工40000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 1, '1764@xxxx.com', '1300000xxxx', '地址', 11, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000040, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (42, '员工41000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '6081@xxxx.com', '1300000xxxx', '地址', 7, 3, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000041, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (43, '员工42000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '3424@xxxx.com', '1300000xxxx', '地址', 9, 2, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000042, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (44, '员工43000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '7396@xxxx.com', '1300000xxxx', '地址', 9, 2, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000043, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (45, '员工44000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '2308@xxxx.com', '1300000xxxx', '地址', 2, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000044, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (46, '员工45000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '2375@xxxx.com', '1300000xxxx', '地址', 11, 4, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000045, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (47, '员工46000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '6464@xxxx.com', '1300000xxxx', '地址', 2, 3, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000046, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (48, '员工47000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '9938@xxxx.com', '1300000xxxx', '地址', 3, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000047, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (49, '员工48000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 2, '5844@xxxx.com', '1300000xxxx', '地址', 3, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000048, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (50, '员工49000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '5151@xxxx.com', '1300000xxxx', '地址', 8, 2, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000049, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (51, '员工50000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '7152@xxxx.com', '1300000xxxx', '地址', 12, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000050, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (52, '员工51000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 2, '6965@xxxx.com', '1300000xxxx', '地址', 1, 3, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000051, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (53, '员工52000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 1, '1152@xxxx.com', '1300000xxxx', '地址', 9, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000052, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (54, '员工53000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '889@xxxx.com', '1300000xxxx', '地址', 13, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000053, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (55, '员工54000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 1, '5517@xxxx.com', '1300000xxxx', '地址', 8, 1, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000054, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (56, '员工55000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 2, '3158@xxxx.com', '1300000xxxx', '地址', 6, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000055, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (57, '员工56000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '8118@xxxx.com', '1300000xxxx', '地址', 3, 2, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000056, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (58, '员工57000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 1, '8356@xxxx.com', '1300000xxxx', '地址', 3, 3, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000057, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (59, '员工58000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 1, '9188@xxxx.com', '1300000xxxx', '地址', 13, 1, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000058, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (60, '员工59000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 1, '4268@xxxx.com', '1300000xxxx', '地址', 9, 2, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000059, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (61, '员工60000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '1076@xxxx.com', '1300000xxxx', '地址', 12, 4, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000060, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (62, '员工61000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 2, '8754@xxxx.com', '1300000xxxx', '地址', 4, 1, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000061, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (63, '员工62000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '8248@xxxx.com', '1300000xxxx', '地址', 8, 2, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000062, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (64, '员工63000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '2996@xxxx.com', '1300000xxxx', '地址', 12, 3, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000063, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (65, '员工64000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '4686@xxxx.com', '1300000xxxx', '地址', 2, 4, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000064, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (66, '员工65000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '8904@xxxx.com', '1300000xxxx', '地址', 13, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000065, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (67, '员工66000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '3178@xxxx.com', '1300000xxxx', '地址', 6, 2, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000066, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (68, '员工67000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 2, '4795@xxxx.com', '1300000xxxx', '地址', 6, 2, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000067, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (69, '员工68000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '2310@xxxx.com', '1300000xxxx', '地址', 8, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000068, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (70, '员工69000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '4475@xxxx.com', '1300000xxxx', '地址', 11, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000069, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (71, '员工70000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '1711@xxxx.com', '1300000xxxx', '地址', 11, 2, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000070, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (72, '员工71000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '6991@xxxx.com', '1300000xxxx', '地址', 8, 4, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000071, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (73, '员工72000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '8243@xxxx.com', '1300000xxxx', '地址', 4, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000072, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (74, '员工73000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '9861@xxxx.com', '1300000xxxx', '地址', 12, 3, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000073, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (75, '员工74000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 2, '5294@xxxx.com', '1300000xxxx', '地址', 13, 3, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000074, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (76, '员工75000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '3153@xxxx.com', '1300000xxxx', '地址', 7, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000075, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (77, '员工76000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 1, '3020@xxxx.com', '1300000xxxx', '地址', 2, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000076, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (78, '员工77000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '8175@xxxx.com', '1300000xxxx', '地址', 9, 3, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000077, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (79, '员工78000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 2, '7663@xxxx.com', '1300000xxxx', '地址', 3, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000078, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (80, '员工79000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '8214@xxxx.com', '1300000xxxx', '地址', 8, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000079, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (81, '员工80000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '4394@xxxx.com', '1300000xxxx', '地址', 11, 1, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000080, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (82, '员工81000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 2, '4309@xxxx.com', '1300000xxxx', '地址', 9, 2, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000081, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (83, '员工82000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '7902@xxxx.com', '1300000xxxx', '地址', 6, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000082, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (84, '员工83000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 2, '2723@xxxx.com', '1300000xxxx', '地址', 9, 2, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000083, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (85, '员工84000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '2633@xxxx.com', '1300000xxxx', '地址', 11, 3, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000084, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (86, '员工85000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '1030@xxxx.com', '1300000xxxx', '地址', 8, 3, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000085, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (87, '员工86000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '1783@xxxx.com', '1300000xxxx', '地址', 10, 2, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000086, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (88, '员工87000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 2, '5773@xxxx.com', '1300000xxxx', '地址', 2, 2, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000087, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (89, '员工88000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 1, '2216@xxxx.com', '1300000xxxx', '地址', 5, 4, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000088, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (90, '员工89000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '1602@xxxx.com', '1300000xxxx', '地址', 7, 2, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000089, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (91, '员工90000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 1, '5432@xxxx.com', '1300000xxxx', '地址', 5, 4, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000090, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (92, '员工91000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '511@xxxx.com', '1300000xxxx', '地址', 1, 4, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000091, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (93, '员工92000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 3, '郑州', 2, '2469@xxxx.com', '1300000xxxx', '地址', 6, 4, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000092, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (94, '员工93000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 1, '9210@xxxx.com', '1300000xxxx', '地址', 7, 3, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000093, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (95, '员工94000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '5379@xxxx.com', '1300000xxxx', '地址', 7, 2, 2, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000094, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (96, '员工95000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 2, '260@xxxx.com', '1300000xxxx', '地址', 12, 2, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000095, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (97, '员工96000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '5923@xxxx.com', '1300000xxxx', '地址', 3, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000096, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (98, '员工97000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, '2916@xxxx.com', '1300000xxxx', '地址', 5, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000097, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (99, '员工98000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 2, '郑州', 1, '4474@xxxx.com', '1300000xxxx', '地址', 7, 4, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000098, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (100, '员工99000', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 1, '郑州', 2, '9177@xxxx.com', '1300000xxxx', '地址', 1, 3, 3, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000099, 9.31, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (101, '张三testMail', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, 'xxxxx@xxx.com', '1300000xxxx', '地址', 6, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000100, 0, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (103, '张三testMaila', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, 'xx123@xx.com', '1300000xxxx', '地址', 6, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000102, 0, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (105, '张三testMaila', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, 'asddaqwe@qxxx.com', '1300000xxxx', '地址', 6, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000103, 0, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (106, '张三testMaila', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, 'asddazxc@xx.com', '1300000xxxx', '地址', 6, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000104, 0, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (107, '张三testMaila', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, 'asdadazasd@x.com', '1300000xxxx', '地址', 6, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000105, 0, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);
INSERT INTO `t_employee` VALUES (108, '张三testMaila', '女', '2022-03-28', '410xxx19xx0101xxxx', '未婚', 4, '郑州', 2, 'asddasdqa@xx.com', '1300000xxxx', '地址', 6, 1, 1, '全职', '高中', '某专业', '某学校', '2022-03-28', '在职', 10000106, 0, '2022-03-28', '2022-03-28', '2022-03-28', '2022-03-28', '无限', 1);

-- ----------------------------
-- Table structure for t_employee_ec
-- ----------------------------
DROP TABLE IF EXISTS `t_employee_ec`;
CREATE TABLE `t_employee_ec`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_employee_remove
-- ----------------------------
DROP TABLE IF EXISTS `t_employee_remove`;
CREATE TABLE `t_employee_remove`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_employee_train
-- ----------------------------
DROP TABLE IF EXISTS `t_employee_train`;
CREATE TABLE `t_employee_train`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_joblevel
-- ----------------------------
DROP TABLE IF EXISTS `t_joblevel`;
CREATE TABLE `t_joblevel`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职称名称',
  `titleLevel` enum('正高级','副高级','中级','初级') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职称等级',
  `createDate` timestamp(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `enabled` tinyint(1) DEFAULT 1 COMMENT '启用禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_joblevel
-- ----------------------------
INSERT INTO `t_joblevel` VALUES (1, '教授', '正高级', '2022-03-27 09:28:40', 1);
INSERT INTO `t_joblevel` VALUES (2, '副教授', '副高级', '2022-03-27 09:28:57', 1);
INSERT INTO `t_joblevel` VALUES (3, '助教', '初级', '2022-03-27 09:30:05', 1);
INSERT INTO `t_joblevel` VALUES (4, '讲师', '中级', '2022-03-27 09:33:15', 0);

-- ----------------------------
-- Table structure for t_mail_log
-- ----------------------------
DROP TABLE IF EXISTS `t_mail_log`;
CREATE TABLE `t_mail_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `msgId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息ID',
  `eid` int(0) DEFAULT NULL COMMENT '接收员工ID',
  `status` int(0) DEFAULT NULL COMMENT '状态',
  `routeKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由键',
  `exchange` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交换机',
  `count` int(0) DEFAULT NULL COMMENT '重试次数',
  `tryTime` datetime(0) DEFAULT NULL COMMENT '重试时间',
  `createTime` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `seq_ml_msgId`(`msgId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mail_log
-- ----------------------------
INSERT INTO `t_mail_log` VALUES (1, 'f1c927f9-b644-435d-a07c-4e870b35011f', 105, 1, 'mail.routing.key', 'mail.exchange', 1, '2022-03-29 13:47:30', '2022-03-29 13:40:48', '2022-03-29 13:46:30');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'url',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'path',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名',
  `iconCls` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '图标',
  `keepAlive` tinyint(1) DEFAULT 1 COMMENT '是否保持激活',
  `requireAuth` tinyint(1) DEFAULT 1 COMMENT '是否要求权限',
  `parentId` int(0) DEFAULT 1 COMMENT '父ID',
  `enabled` tinyint(1) DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '/', '', '', '所有', 'fa fa-camera-retro', 1, NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (2, '/', '/emp', 'Home', '员工管理', 'fa fa-camera-retro', 1, 1, 1, 1);
INSERT INTO `t_menu` VALUES (3, '/', '/per', 'Home', '人事管理', 'fa fa-camera-retro', 1, 1, 1, 1);
INSERT INTO `t_menu` VALUES (4, '/', '/sal', 'Home', '薪资管理', 'fa fa-camera-retro', 1, 1, 1, 1);
INSERT INTO `t_menu` VALUES (5, '/', '/sta', 'Home', '统计管理', 'fa fa-camera-retro', 1, 1, 1, 1);
INSERT INTO `t_menu` VALUES (6, '/', '/sys', 'Home', '系统管理', 'fa fa-camera-retro', 1, 1, 1, 1);
INSERT INTO `t_menu` VALUES (7, '/employee/basic/**', '/emp/basic', 'EmpBasic', '基本资料', 'fa fa-camera-retro', 1, 1, 2, 1);
INSERT INTO `t_menu` VALUES (8, '/employee/advanced/**', '/emp/adv', 'EmpAdv', '高级资料', 'fa fa-camera-retro', 1, 1, 2, 1);
INSERT INTO `t_menu` VALUES (9, '/personnel/emp/**', '/per/emp', 'PerEmp', '员工资料', 'fa fa-camera-retro', 1, 1, 3, 1);
INSERT INTO `t_menu` VALUES (10, '/personnel/ec/**', '/per/ec', 'PerEc', '员工奖惩', 'fa fa-camera-retro', 1, 1, 3, 1);
INSERT INTO `t_menu` VALUES (11, '/personnel/train/**', '/per/train', 'PerTrain', '员工培训', 'fa fa-camera-retro', 1, 1, 3, 1);
INSERT INTO `t_menu` VALUES (12, '/personnel/salary/**', '/per/salary', 'PerSalary', '员工调薪', 'fa fa-camera-retro', 1, 1, 3, 1);
INSERT INTO `t_menu` VALUES (13, '/personnel/move/**', '/per/move', 'PerMove', '员工调动', 'fa fa-camera-retro', 1, 1, 3, 1);
INSERT INTO `t_menu` VALUES (14, '/salary/sob/**', '/sal/sob', 'SalSob', '工资账套管理', 'fa fa-camera-retro', 1, 1, 4, 1);
INSERT INTO `t_menu` VALUES (15, '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', '员工账套设置', 'fa fa-camera-retro', 1, 1, 4, 1);
INSERT INTO `t_menu` VALUES (16, '/salary/table/**', '/sal/table', 'SalTable', '工资表管理', 'fa fa-camera-retro', 1, 1, 4, 1);
INSERT INTO `t_menu` VALUES (17, '/salary/month/**', '/sal/month', 'SalMonth', '月末处理', 'fa fa-camera-retro', 1, 1, 4, 1);
INSERT INTO `t_menu` VALUES (18, '/salary/search/**', '/sal/search', 'SalSearch', '工资表查询', 'fa fa-camera-retro', 1, 1, 4, 1);
INSERT INTO `t_menu` VALUES (19, '/statistics/all/**', '/sta/all', 'StaAll', '综合信息统计', 'fa fa-camera-retro', 1, 1, 5, 1);
INSERT INTO `t_menu` VALUES (20, '/statistics/score/**', '/sta/score', 'StaScore', '员工积分统计', 'fa fa-camera-retro', 1, 1, 5, 1);
INSERT INTO `t_menu` VALUES (21, '/statistics/personnel/**', '/sta/pers', 'StaPers', '人事信息统计', 'fa fa-camera-retro', 1, 1, 5, 1);
INSERT INTO `t_menu` VALUES (22, '/statistics/record/**', '/sta/record', 'StaRecord', '人事记录统计', 'fa fa-camera-retro', 1, 1, 5, 1);
INSERT INTO `t_menu` VALUES (23, '/system/basic/**', '/sys/basic', 'SysBasic', '基础信息设置', 'fa fa-camera-retro', 1, 1, 6, 1);
INSERT INTO `t_menu` VALUES (24, '/system/config/**', '/sys/config', 'SysConfig', '系统设置', 'fa fa-camera-retro', 1, 1, 6, 1);
INSERT INTO `t_menu` VALUES (25, '/system/log/**', '/sys/log', 'SysLog', '操作日志管理', 'fa fa-camera-retro', 1, 1, 6, 1);
INSERT INTO `t_menu` VALUES (26, '/system/admin/**', '/sys/admin', 'SysAdmin', '操作员管理', 'fa fa-camera-retro', 1, 1, 6, 1);
INSERT INTO `t_menu` VALUES (27, '/system/data/**', '/sys/data', 'SysData', '备份恢复数据库', 'fa fa-camera-retro', 1, 1, 6, 1);
INSERT INTO `t_menu` VALUES (28, '/system/init/**', '/sys/init', 'SysInit', '初始化数据库', 'fa fa-camera-retro', 1, 1, 6, 1);

-- ----------------------------
-- Table structure for t_nation
-- ----------------------------
DROP TABLE IF EXISTS `t_nation`;
CREATE TABLE `t_nation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '汉族' COMMENT '民族',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_nation
-- ----------------------------
INSERT INTO `t_nation` VALUES (1, '汉族');
INSERT INTO `t_nation` VALUES (2, '维吾尔族');
INSERT INTO `t_nation` VALUES (3, '朝鲜族');
INSERT INTO `t_nation` VALUES (4, '傣族');

-- ----------------------------
-- Table structure for t_oplog
-- ----------------------------
DROP TABLE IF EXISTS `t_oplog`;
CREATE TABLE `t_oplog`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_politics_status
-- ----------------------------
DROP TABLE IF EXISTS `t_politics_status`;
CREATE TABLE `t_politics_status`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '群众' COMMENT '政治面貌',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_politics_status
-- ----------------------------
INSERT INTO `t_politics_status` VALUES (1, '党员');
INSERT INTO `t_politics_status` VALUES (2, '群众');

-- ----------------------------
-- Table structure for t_position
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职位名称',
  `createDate` datetime(0) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_position
-- ----------------------------
INSERT INTO `t_position` VALUES (1, '技术总监', '2022-03-25 16:30:39', 1);
INSERT INTO `t_position` VALUES (2, '运营总监', '2022-03-25 16:30:51', 1);
INSERT INTO `t_position` VALUES (3, '工程师', '2022-03-25 16:31:03', 1);
INSERT INTO `t_position` VALUES (7, '测试职位1', '2022-04-03 10:53:41', 1);
INSERT INTO `t_position` VALUES (8, '测试职位2', '2022-04-03 10:53:45', 1);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'ROLE_ADMIN', '初始管理员');
INSERT INTO `t_role` VALUES (2, 'ROLE_NORMAL', 'NORMAL');
INSERT INTO `t_role` VALUES (7, 'ROLE_TEST', 'TEST');
INSERT INTO `t_role` VALUES (8, 'ROLE_TEST2', 'TEST2');
INSERT INTO `t_role` VALUES (9, 'ROLE_TEST3', 'TEST3');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `roleId` int(0) NOT NULL COMMENT '角色ID',
  `menuId` int(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `for_rm_menu_id`(`menuId`) USING BTREE,
  INDEX `for_rm_role_id`(`roleId`) USING BTREE,
  CONSTRAINT `for_rm_menu_id` FOREIGN KEY (`menuId`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `for_rm_role_id` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (82, 1, 11);
INSERT INTO `t_role_menu` VALUES (83, 1, 12);
INSERT INTO `t_role_menu` VALUES (84, 1, 13);
INSERT INTO `t_role_menu` VALUES (85, 1, 14);
INSERT INTO `t_role_menu` VALUES (86, 1, 15);
INSERT INTO `t_role_menu` VALUES (87, 1, 16);
INSERT INTO `t_role_menu` VALUES (88, 1, 17);
INSERT INTO `t_role_menu` VALUES (89, 1, 18);
INSERT INTO `t_role_menu` VALUES (90, 1, 19);
INSERT INTO `t_role_menu` VALUES (91, 1, 20);
INSERT INTO `t_role_menu` VALUES (92, 1, 21);
INSERT INTO `t_role_menu` VALUES (93, 1, 22);
INSERT INTO `t_role_menu` VALUES (94, 1, 23);
INSERT INTO `t_role_menu` VALUES (95, 1, 24);
INSERT INTO `t_role_menu` VALUES (96, 1, 25);
INSERT INTO `t_role_menu` VALUES (97, 1, 26);
INSERT INTO `t_role_menu` VALUES (98, 1, 27);
INSERT INTO `t_role_menu` VALUES (99, 1, 28);
INSERT INTO `t_role_menu` VALUES (100, 1, 10);
INSERT INTO `t_role_menu` VALUES (101, 1, 9);
INSERT INTO `t_role_menu` VALUES (102, 1, 7);
INSERT INTO `t_role_menu` VALUES (103, 1, 8);
INSERT INTO `t_role_menu` VALUES (117, 9, 19);
INSERT INTO `t_role_menu` VALUES (118, 9, 20);
INSERT INTO `t_role_menu` VALUES (119, 9, 21);
INSERT INTO `t_role_menu` VALUES (120, 9, 22);
INSERT INTO `t_role_menu` VALUES (121, 9, 7);
INSERT INTO `t_role_menu` VALUES (122, 9, 8);
INSERT INTO `t_role_menu` VALUES (123, 8, 14);
INSERT INTO `t_role_menu` VALUES (124, 8, 15);
INSERT INTO `t_role_menu` VALUES (125, 8, 16);
INSERT INTO `t_role_menu` VALUES (126, 8, 17);
INSERT INTO `t_role_menu` VALUES (127, 8, 18);
INSERT INTO `t_role_menu` VALUES (128, 8, 7);
INSERT INTO `t_role_menu` VALUES (129, 8, 8);
INSERT INTO `t_role_menu` VALUES (158, 7, 7);
INSERT INTO `t_role_menu` VALUES (159, 7, 8);
INSERT INTO `t_role_menu` VALUES (160, 7, 9);
INSERT INTO `t_role_menu` VALUES (161, 7, 10);
INSERT INTO `t_role_menu` VALUES (162, 7, 11);
INSERT INTO `t_role_menu` VALUES (163, 7, 12);
INSERT INTO `t_role_menu` VALUES (164, 7, 13);

-- ----------------------------
-- Table structure for t_salary
-- ----------------------------
DROP TABLE IF EXISTS `t_salary`;
CREATE TABLE `t_salary`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `basicSalary` decimal(10, 2) DEFAULT 0.00 COMMENT '基本工资',
  `bonus` decimal(10, 2) DEFAULT 0.00 COMMENT '奖金',
  `lunchSalary` decimal(10, 2) DEFAULT 0.00 COMMENT '午餐补助',
  `trafficSalary` decimal(10, 2) DEFAULT 0.00 COMMENT '交通补助',
  `allSalary` decimal(10, 0) DEFAULT 0 COMMENT '应发工资',
  `pensionBase` int(0) DEFAULT 0 COMMENT '养老金基数',
  `pensionPer` float DEFAULT 0 COMMENT '养老金比率',
  `createDate` datetime(0) DEFAULT NULL COMMENT '启用时间',
  `medicalBase` int(0) DEFAULT 0 COMMENT '医疗基数',
  `medicalPer` float DEFAULT 0 COMMENT '医疗比率',
  `accumulationFundBase` int(0) DEFAULT 0 COMMENT '公积金基数',
  `accumulationFundPer` float DEFAULT 0 COMMENT '公积金比率',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_salary
-- ----------------------------
INSERT INTO `t_salary` VALUES (1, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, '2022-03-29 15:07:16', 0, 0, 0, 0, '测试账套1测试修改');
INSERT INTO `t_salary` VALUES (6, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, '2022-03-29 16:16:51', 0, 0, 0, 0, '测试账套2');

-- ----------------------------
-- Table structure for t_salary_adjust
-- ----------------------------
DROP TABLE IF EXISTS `t_salary_adjust`;
CREATE TABLE `t_salary_adjust`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_msg
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_msg`;
CREATE TABLE `t_sys_msg`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_msg_content
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_msg_content`;
CREATE TABLE `t_sys_msg_content`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Procedure structure for addDepartment
-- ----------------------------
DROP PROCEDURE IF EXISTS `addDepartment`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addDepartment`(IN `depName` varchar(32),IN `parentId` int,IN `enabled` tinyint,OUT `result` int,OUT `result2` int)
BEGIN
	#Routine body goes here...
DECLARE did int;
DECLARE pDepPath VARCHAR(64);
INSERT INTO t_department SET `name`=depName,parentId=parentId,enabled=enabled;
SELECT row_count() INTO result;
SELECT LAST_INSERT_ID() INTO did;
SET result2=did;
SELECT depPath INTO pDepPath FROM t_department WHERE id=parentId;
UPDATE t_department SET depPath=CONCAT(pDepPath,'.',did) WHERE id=did;
UPDATE t_department SET isParent=TRUE WHERE id=parentId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `delDep`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delDep`(IN `did` int,OUT `result` int)
BEGIN
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delDepartment
-- ----------------------------
DROP PROCEDURE IF EXISTS `delDepartment`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delDepartment`(IN `did` int,OUT `result` int)
BEGIN

	#Routine body goes here...
DECLARE ecount int;
DECLARE pid int;
DECLARE pcount int;
DECLARE a int;
SELECT count(*) INTO a FROM t_department WHERE id=did AND isParent=FALSE;
IF a=0 THEN SET result=-2;
ELSE
SELECT COUNT(*) INTO ecount FROM t_employee WHERE departmentId=did;
IF ecount>0 THEN SET result=-1;
ELSE
SELECT parentId INTO pid FROM t_department WHERE id=did;
DELETE FROM t_department WHERE id=did AND isParent=FALSE;
SELECT ROW_COUNT() INTO result;
SELECT COUNT(*) INTO pcount FROM t_department WHERE parentId=pid;
IF pcount=0 THEN UPDATE t_department SET isParent=FALSE WHERE id=pid;
END IF;
END IF;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GreetWorld
-- ----------------------------
DROP PROCEDURE IF EXISTS `GreetWorld`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GreetWorld`()
SELECT CONCAT(@greeting,'world')
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p1
-- ----------------------------
DROP PROCEDURE IF EXISTS `p1`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p1`()
SET @last_procedure='p1'
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p2
-- ----------------------------
DROP PROCEDURE IF EXISTS `p2`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p2`()
SELECT CONCAT('last_procedure was',@last_procedure)
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
