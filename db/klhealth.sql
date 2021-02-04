/*
 Navicat Premium Data Transfer

 Source Server         : 106.52.219.93
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : 106.52.219.93:3306
 Source Schema         : klhealth

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 05/02/2021 00:30:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for epi_class_manage
-- ----------------------------
DROP TABLE IF EXISTS `epi_class_manage`;
CREATE TABLE `epi_class_manage`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cla_id` int NULL DEFAULT NULL COMMENT '被管理班级	外键，班级表id',
  `user_id` int NULL DEFAULT NULL COMMENT '管理人（班主任，辅导员）	外键，user表id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态	0：正常，-1：异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_class_manage
-- ----------------------------
INSERT INTO `epi_class_manage` VALUES (1, 1, 1, '2021-01-27 14:38:40', 0);

-- ----------------------------
-- Table structure for epi_classes
-- ----------------------------
DROP TABLE IF EXISTS `epi_classes`;
CREATE TABLE `epi_classes`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `major` bigint NULL DEFAULT NULL COMMENT '专业	外键，部门机构表id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级,例如2018',
  `graduate_time` date NULL DEFAULT NULL COMMENT '毕业时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态	0：正常，-1：异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_classes
-- ----------------------------
INSERT INTO `epi_classes` VALUES (1, 6, '大数18计科本3', '666', '2018', '2021-01-17', '2021-01-17 23:14:56', '2021-01-19 23:00:35', '6', 0);
INSERT INTO `epi_classes` VALUES (2, 6, '大数18计科本1', '555', '2018', '2021-01-17', '2021-01-17 23:18:00', '2021-01-19 22:59:18', '5555', 0);
INSERT INTO `epi_classes` VALUES (3, 6, '大数18计科本4', '777', '2018', '2021-01-30', '2021-01-17 23:25:31', '2021-01-19 22:59:49', '444', 0);
INSERT INTO `epi_classes` VALUES (4, 6, '大数18计科本2', '444', '2018', '2021-01-29', '2021-01-18 12:34:10', '2021-01-19 23:00:21', '444', 0);

-- ----------------------------
-- Table structure for epi_dept
-- ----------------------------
DROP TABLE IF EXISTS `epi_dept`;
CREATE TABLE `epi_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称	学校，机构，分院，专业',
  `no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态	0：正常，-1：异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_dept
-- ----------------------------
INSERT INTO `epi_dept` VALUES (1, NULL, '贵州地区', NULL, NULL, 0);
INSERT INTO `epi_dept` VALUES (2, 1, '凯里学院', NULL, NULL, 0);
INSERT INTO `epi_dept` VALUES (3, 2, '大数据工程学院', 'zg001', '贵州省黔东南州民族大学', 0);
INSERT INTO `epi_dept` VALUES (4, 1, '黔东南民族职业技术学院', 'gz002', '黔东南民族职业技术学院', 0);
INSERT INTO `epi_dept` VALUES (5, 4, '厨师学院', 'qdn002', '厨师学院', 0);
INSERT INTO `epi_dept` VALUES (6, 3, '计算机科学与技术', 'DS0001', NULL, 0);

-- ----------------------------
-- Table structure for epi_health_info
-- ----------------------------
DROP TABLE IF EXISTS `epi_health_info`;
CREATE TABLE `epi_health_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `health_img` varchar(9999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '健康码',
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '经纬度',
  `temperature` decimal(10, 2) NULL DEFAULT NULL COMMENT '体温',
  `isnormal` tinyint NULL DEFAULT 0 COMMENT '是否正常 0：正常，1：发热，2：咳嗽，3：感冒，4：其他，-1：异常',
  `is_cat_dangerous` tinyint NULL DEFAULT 0 COMMENT '是否与风险人员接触 0：否 1：是',
  `zone_action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '活动区域',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '健康记录数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of epi_health_info
-- ----------------------------
INSERT INTO `epi_health_info` VALUES (1, 222, 'https://bkimg.cdn.bcebos.com/pic/18d8bc3eb13533fa828b0a124299ea1f4134970aedfe?x-bce-process=image/resize,m_lfit,w_220,limit_1', '36.4', 36.00, 1, 0, '贵州', '无', '2021-01-28 13:28:55');
INSERT INTO `epi_health_info` VALUES (2, 525, 'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2690241947,3277352908&fm=26&gp=0.jpg', '36.7', 36.50, 0, 0, '广西', '无', '2021-01-27 13:28:57');
INSERT INTO `epi_health_info` VALUES (3, 2340, 'https://img.iplaysoft.com/wp-content/uploads/2020/p/oculus-quest2/oculus_quest2_2x.jpg!300x200.webp', '37.6', 36.50, 0, 1, '贵州', NULL, '2021-01-25 13:29:00');
INSERT INTO `epi_health_info` VALUES (4, 333, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3373150905,1355266795&fm=26&gp=0.jpg', '37.8', 33.60, 0, 0, '广西', '去过广州', '2021-01-19 13:29:04');
INSERT INTO `epi_health_info` VALUES (5, 1, 'hahah', '107.9804,26.56756', 35.50, 0, 0, '云南', '', '2021-01-13 13:29:07');
INSERT INTO `epi_health_info` VALUES (6, 4, '0', '107.9804,26.56756', 36.30, 0, 0, '北京', '', '2020-12-31 13:29:11');
INSERT INTO `epi_health_info` VALUES (7, 4, 'http://tmp/BUm5JIx9ladY7940745303170b35d8c53c4ded32fa92.jpg', '107.9804,26.56756', 36.90, 2, 1, '重庆', '', '2021-01-23 13:29:14');

-- ----------------------------
-- Table structure for epi_message
-- ----------------------------
DROP TABLE IF EXISTS `epi_message`;
CREATE TABLE `epi_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `user_id` bigint NULL DEFAULT NULL COMMENT '发消息人ID',
  `sand_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `sand_type` int NULL DEFAULT 0 COMMENT '消息类型 0：一般 1：紧急',
  `status` int NULL DEFAULT 0 COMMENT '信息状态 0：待发送 1：已发送 -1：异常',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_message
-- ----------------------------
INSERT INTO `epi_message` VALUES (1, '标题', '内容', 1, '2021-02-03 00:00:00', 1, 1, '');

-- ----------------------------
-- Table structure for epi_message_sand
-- ----------------------------
DROP TABLE IF EXISTS `epi_message_sand`;
CREATE TABLE `epi_message_sand`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msg_id` bigint NOT NULL DEFAULT 0 COMMENT '外键 epi_message表id',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '发送给谁 user表id',
  `status` int NOT NULL DEFAULT 0 COMMENT '消息状态 0：待接收 1：已接收',
  `sand_time` datetime(0) NULL DEFAULT NULL COMMENT '接收时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息发送表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_message_sand
-- ----------------------------

-- ----------------------------
-- Table structure for epi_motion_info
-- ----------------------------
DROP TABLE IF EXISTS `epi_motion_info`;
CREATE TABLE `epi_motion_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '外键 user表id',
  `steps` int NOT NULL DEFAULT 0 COMMENT '运动步数',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '运动开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '运动结束时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运动记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_motion_info
-- ----------------------------
INSERT INTO `epi_motion_info` VALUES (1, 1, 10000, '2021-01-18 22:33:10', '2021-01-18 22:33:13', NULL);
INSERT INTO `epi_motion_info` VALUES (2, 4, 500, '2021-01-27 19:49:12', '2021-01-27 19:49:15', NULL);

-- ----------------------------
-- Table structure for epi_news
-- ----------------------------
DROP TABLE IF EXISTS `epi_news`;
CREATE TABLE `epi_news`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '标题',
  `subhead` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `news_type` tinyint NULL DEFAULT 1 COMMENT '新闻类型，外键。类型表',
  `type` int NOT NULL DEFAULT 1 COMMENT '类型 1：原创 2：转载 3：其他',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者名字，原创就是创建者',
  `reviewer` bigint NULL DEFAULT NULL COMMENT '审核人,外键 user表id',
  `rview_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `release_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `status` int NOT NULL COMMENT '文章状态 0：创建 1审核 2：发布 -1：异常',
  `creater` bigint NOT NULL COMMENT '创建者 外键 user表id',
  `ceate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `look_num` bigint NULL DEFAULT 0 COMMENT '浏览量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_news
-- ----------------------------
INSERT INTO `epi_news` VALUES (1, '31省区市新增确诊103例 本土88例', '疫情', '1月19日0—24时，31个省（自治区、直辖市）和新疆生产建设兵团报告新增确诊病例103例，其中境外输入病例15例（上海4例，广东3例，浙江2例，四川2例，陕西2例，天津1例，福建1例），本土病例88例（吉林46例，河北19例，黑龙江16例，北京7例）；无新增死亡病例；无新增疑似病例。', 1, 1, '百度', 1, '2021-01-20 15:01:42', '2021-01-20 15:01:46', 2, 1, '2021-01-20 14:59:36', 0, NULL);

-- ----------------------------
-- Table structure for epi_student_classes
-- ----------------------------
DROP TABLE IF EXISTS `epi_student_classes`;
CREATE TABLE `epi_student_classes`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `cls_id` bigint NULL DEFAULT NULL COMMENT '班级,外键，班级表id',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '加入时间',
  `exit_time` datetime(0) NULL DEFAULT NULL COMMENT '退出时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态 0：正常，-1：异常,1:退出，2：休学',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生班级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_student_classes
-- ----------------------------
INSERT INTO `epi_student_classes` VALUES (2, '222', 2, '2021-01-18 21:00:10', NULL, '2021-01-18 21:01:07', 0);
INSERT INTO `epi_student_classes` VALUES (5, '2020202018', 3, '2021-01-31 18:19:08', NULL, '2021-02-01 12:13:22', 0);

-- ----------------------------
-- Table structure for epi_task
-- ----------------------------
DROP TABLE IF EXISTS `epi_task`;
CREATE TABLE `epi_task`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_type` tinyint NULL DEFAULT 0 COMMENT '任务类型，预留，0：作业',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '任务标题',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '任务描述',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '创建任务人，外键user表id',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `sand_target` tinyint(1) NULL DEFAULT NULL COMMENT '发送目标	0：全部，1：学生，2教师，3,其他',
  `sand_type` int NOT NULL DEFAULT 0 COMMENT '类型 0：一般 1：紧急',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态 0：未执行 1：执行中 2：完成 3：未完成 -1：异常',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_task
-- ----------------------------
INSERT INTO `epi_task` VALUES (1, 0, '测试健康', '0', 1, '2021-01-27 17:18:26', '2021-01-27 17:18:28', 1, 0, 1, NULL);
INSERT INTO `epi_task` VALUES (2, 0, '中午健康', '0', 1, '2021-01-27 17:58:19', '2021-01-27 18:58:21', 1, 0, 1, NULL);
INSERT INTO `epi_task` VALUES (3, 0, '下午健康', '0', 1, '2021-01-27 19:58:42', '2021-01-27 21:58:46', 1, 0, 1, NULL);
INSERT INTO `epi_task` VALUES (4, 0, '测试昨天', '0', 1, '2021-01-26 18:00:23', '2021-01-26 19:00:27', 1, 0, 0, NULL);
INSERT INTO `epi_task` VALUES (5, 0, '中午测试', '0', 1, '2021-01-30 12:36:44', '2021-01-30 16:37:04', 1, 0, 0, NULL);
INSERT INTO `epi_task` VALUES (6, 0, '下午测试', '0', 1, '2021-01-30 18:36:48', '2021-01-30 20:37:12', 0, 0, 1, NULL);
INSERT INTO `epi_task` VALUES (7, 0, '晚上测试', '0', 1, '2021-01-30 20:36:58', '2021-01-30 23:37:19', 3, 0, 0, NULL);
INSERT INTO `epi_task` VALUES (8, 0, '晚上', '0', 1, '2021-02-04 21:07:35', '2021-02-04 22:07:37', 2, 0, 1, NULL);
INSERT INTO `epi_task` VALUES (9, 0, '十点钟', '11', 1, '2021-02-04 22:01:13', '2021-02-04 23:47:21', 1, 0, 0, NULL);
INSERT INTO `epi_task` VALUES (10, 0, '5号任务', '学生提交健康码', 1, '2021-02-05 00:10:31', '2021-02-05 01:10:32', 1, 0, 0, '');
INSERT INTO `epi_task` VALUES (11, 1, '5号其他任务', '其他紧急教师任务', 1, '2021-02-05 00:15:49', '2021-02-05 05:15:52', 1, 1, 1, '');
INSERT INTO `epi_task` VALUES (12, 0, '5号发送目标', '5号发送目标教师', 1, '2021-02-05 00:20:08', '2021-02-05 02:20:11', 1, 0, 1, '');
INSERT INTO `epi_task` VALUES (13, 0, '5和O', '222', 1, '2021-02-05 00:22:12', '2021-02-05 00:22:13', 1, 0, 0, '');
INSERT INTO `epi_task` VALUES (14, 0, '3434', '234', 1, '2021-02-05 00:23:48', '2021-02-05 00:23:49', 2, 1, 0, '');

-- ----------------------------
-- Table structure for epi_task_sand
-- ----------------------------
DROP TABLE IF EXISTS `epi_task_sand`;
CREATE TABLE `epi_task_sand`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_id` bigint NOT NULL DEFAULT 0 COMMENT '外键epi_task表id',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '外键 user表id',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态 0：待完成 1：已完成',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '接收时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务发送表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_task_sand
-- ----------------------------
INSERT INTO `epi_task_sand` VALUES (1, 1, 4, -1, NULL, NULL);
INSERT INTO `epi_task_sand` VALUES (2, 2, 4, 0, NULL, NULL);
INSERT INTO `epi_task_sand` VALUES (3, 3, 4, 1, NULL, NULL);
INSERT INTO `epi_task_sand` VALUES (4, 4, 4, -1, NULL, NULL);
INSERT INTO `epi_task_sand` VALUES (5, 5, 4, 0, NULL, NULL);
INSERT INTO `epi_task_sand` VALUES (6, 6, 4, 0, NULL, NULL);
INSERT INTO `epi_task_sand` VALUES (7, 7, 4, 0, NULL, NULL);
INSERT INTO `epi_task_sand` VALUES (8, 8, 4, 0, NULL, NULL);
INSERT INTO `epi_task_sand` VALUES (9, 9, 4, 1, NULL, NULL);
INSERT INTO `epi_task_sand` VALUES (10, 2, 1, 0, '2021-02-05 00:04:20', NULL);
INSERT INTO `epi_task_sand` VALUES (11, 2, 2, 0, '2021-02-05 00:04:20', NULL);
INSERT INTO `epi_task_sand` VALUES (12, 2, 4, 0, '2021-02-05 00:04:20', NULL);
INSERT INTO `epi_task_sand` VALUES (13, 2, 7, 0, '2021-02-05 00:04:20', NULL);
INSERT INTO `epi_task_sand` VALUES (14, 6, 1, 0, '2021-02-05 00:04:33', NULL);
INSERT INTO `epi_task_sand` VALUES (15, 6, 2, 0, '2021-02-05 00:04:33', NULL);
INSERT INTO `epi_task_sand` VALUES (16, 6, 4, 0, '2021-02-05 00:04:33', NULL);
INSERT INTO `epi_task_sand` VALUES (17, 6, 7, 0, '2021-02-05 00:04:33', NULL);
INSERT INTO `epi_task_sand` VALUES (18, 3, 1, 0, '2021-02-05 00:05:55', NULL);
INSERT INTO `epi_task_sand` VALUES (19, 3, 2, 0, '2021-02-05 00:05:55', NULL);
INSERT INTO `epi_task_sand` VALUES (20, 3, 4, 0, '2021-02-05 00:05:55', NULL);
INSERT INTO `epi_task_sand` VALUES (21, 3, 7, 0, '2021-02-05 00:05:55', NULL);
INSERT INTO `epi_task_sand` VALUES (22, 12, 1, 0, '2021-02-05 00:24:43', NULL);
INSERT INTO `epi_task_sand` VALUES (23, 12, 2, 0, '2021-02-05 00:24:43', NULL);
INSERT INTO `epi_task_sand` VALUES (24, 12, 4, 0, '2021-02-05 00:24:43', NULL);
INSERT INTO `epi_task_sand` VALUES (25, 12, 7, 0, '2021-02-05 00:24:43', NULL);
INSERT INTO `epi_task_sand` VALUES (26, 11, 1, 0, '2021-02-05 00:25:14', NULL);
INSERT INTO `epi_task_sand` VALUES (27, 11, 2, 0, '2021-02-05 00:25:14', NULL);
INSERT INTO `epi_task_sand` VALUES (28, 11, 4, 0, '2021-02-05 00:25:14', NULL);
INSERT INTO `epi_task_sand` VALUES (29, 11, 7, 0, '2021-02-05 00:25:14', NULL);

-- ----------------------------
-- Table structure for epi_user
-- ----------------------------
DROP TABLE IF EXISTS `epi_user`;
CREATE TABLE `epi_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学工号，教师工号 其他',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `type` int NULL DEFAULT 0 COMMENT '类型，0：学生，1：教师，2：其他',
  `sex` int NULL DEFAULT 0 COMMENT '性别 0：女 男：1',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态	0：正常，-1：异常',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '疫情系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_user
-- ----------------------------
INSERT INTO `epi_user` VALUES (1, 'xiao', '123', '12345689', '222', '肖光鼎', '2222', 0, 0, NULL, '22', '2021-01-18 15:53:37', '2021-01-18 15:53:55');
INSERT INTO `epi_user` VALUES (2, 'DFM', '123456', '12345678910', '2020202018', '刘财', '1111', 0, 1, 0, NULL, '2021-01-31 14:32:55', '2021-02-01 13:12:59');
INSERT INTO `epi_user` VALUES (4, 'ovRTz0Mfo8dpsqLFb7aG4JNPuhBI', '123456', NULL, NULL, '肖光鼎2', NULL, 0, 0, NULL, NULL, '2021-01-27 15:57:41', '2021-01-27 15:57:41');
INSERT INTO `epi_user` VALUES (7, 'qiiq', '123456', NULL, NULL, '琪琪', NULL, 0, 0, NULL, NULL, '2021-02-02 23:21:28', '2021-02-02 23:21:28');

-- ----------------------------
-- Table structure for epi_user_banding
-- ----------------------------
DROP TABLE IF EXISTS `epi_user_banding`;
CREATE TABLE `epi_user_banding`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方登录ID 微信ID qqID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方的昵称',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `type` int NULL DEFAULT NULL COMMENT '类型 0：微信 1:QQ 2：其他',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '绑定时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账号绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_user_banding
-- ----------------------------
INSERT INTO `epi_user_banding` VALUES (1, 'weix00001', 1, '西瓜刀', NULL, 1, '2021-01-18 18:56:34', '111');
INSERT INTO `epi_user_banding` VALUES (4, 'ovRTz0Mfo8dpsqLFb7aG4JNPuhBI', 4, '肖', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLZCGBIwHxDicjdQed6dZbicKuN87FMqjictqIsWmvmZ64YCWXCkXQh3nia2O1XutgKPrRXasgP1tlNow/132', 0, '2021-02-05 00:27:23', NULL);

-- ----------------------------
-- Table structure for epi_user_base_info
-- ----------------------------
DROP TABLE IF EXISTS `epi_user_base_info`;
CREATE TABLE `epi_user_base_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学工号，教师工号 其他',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `type` int NULL DEFAULT 0 COMMENT '类型，0：学生，1：教师，2：其他',
  `sex` int NULL DEFAULT 0 COMMENT '性别 0：女 男：1',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态	0：正常，-1：异常',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '疫情系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_user_base_info
-- ----------------------------

-- ----------------------------
-- Table structure for epi_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `epi_user_dept`;
CREATE TABLE `epi_user_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户	外键，用户表id',
  `dept_id` int NULL DEFAULT NULL COMMENT '部门id	外键，部门机构表id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态	0：正常，-1：异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epi_user_dept
-- ----------------------------
INSERT INTO `epi_user_dept` VALUES (1, 1, 6, '2021-01-18 17:51:45', '2021-01-18 17:51:49', 0);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000177005FFA507874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'PC-20201117KVRV1612455592860', 1612456168191, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int NULL DEFAULT NULL,
  `INT_PROP_2` int NULL DEFAULT NULL,
  `LONG_PROP_1` bigint NULL DEFAULT NULL,
  `LONG_PROP_2` bigint NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PRIORITY` int NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1612456200000, -1, 5, 'WAITING', 'CRON', 1610619441000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000177005FFA507874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2021-01-14 18:10:26');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 189 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-14 18:30:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-14 23:30:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-17 12:00:01');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-17 12:30:01');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-17 13:00:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-17 18:00:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-17 18:30:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-17 19:00:01');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-17 19:30:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-17 20:00:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-17 20:30:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-17 21:00:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-17 21:30:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-17 22:00:01');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-17 22:30:01');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-17 23:00:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-17 23:30:01');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 4, '2021-01-18 00:00:01');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-18 10:30:01');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-18 11:00:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 11:30:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 12:00:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 12:30:01');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 13:00:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-18 13:30:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-18 14:00:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 14:30:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 15:00:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 15:30:01');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 16:00:01');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-18 16:30:01');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 17:00:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-18 17:30:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 18:00:01');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 18:30:01');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-18 19:00:01');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 19:30:01');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 21:00:01');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 21:30:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-18 22:00:01');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-18 22:30:01');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 23:00:01');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-18 23:30:00');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 5, '2021-01-19 00:00:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-19 12:30:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-19 13:30:01');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-19 14:00:01');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-19 18:30:01');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-19 19:30:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-19 20:00:01');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-19 20:30:00');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-19 21:00:01');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-19 21:30:01');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-19 22:00:01');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-19 22:30:03');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-19 23:00:01');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-19 23:30:01');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-20 12:30:01');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-20 13:00:04');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES (69, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-20 14:00:00');
INSERT INTO `schedule_job_log` VALUES (70, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-20 14:30:00');
INSERT INTO `schedule_job_log` VALUES (71, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES (72, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-20 15:30:00');
INSERT INTO `schedule_job_log` VALUES (73, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-20 16:00:00');
INSERT INTO `schedule_job_log` VALUES (74, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES (75, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-20 17:00:01');
INSERT INTO `schedule_job_log` VALUES (76, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-20 17:30:00');
INSERT INTO `schedule_job_log` VALUES (77, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-20 18:00:00');
INSERT INTO `schedule_job_log` VALUES (78, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-20 18:30:00');
INSERT INTO `schedule_job_log` VALUES (79, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-23 12:30:00');
INSERT INTO `schedule_job_log` VALUES (80, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-23 13:00:00');
INSERT INTO `schedule_job_log` VALUES (81, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-23 13:30:00');
INSERT INTO `schedule_job_log` VALUES (82, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-23 14:00:00');
INSERT INTO `schedule_job_log` VALUES (83, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-25 13:30:01');
INSERT INTO `schedule_job_log` VALUES (84, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-25 14:00:00');
INSERT INTO `schedule_job_log` VALUES (85, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-25 14:30:00');
INSERT INTO `schedule_job_log` VALUES (86, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-25 15:00:00');
INSERT INTO `schedule_job_log` VALUES (87, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-25 15:30:00');
INSERT INTO `schedule_job_log` VALUES (88, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-25 16:00:00');
INSERT INTO `schedule_job_log` VALUES (89, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES (90, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-25 17:00:01');
INSERT INTO `schedule_job_log` VALUES (91, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-25 17:30:00');
INSERT INTO `schedule_job_log` VALUES (92, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-25 18:00:00');
INSERT INTO `schedule_job_log` VALUES (93, 1, 'testTask', 'renren', 0, NULL, 3, '2021-01-25 18:30:00');
INSERT INTO `schedule_job_log` VALUES (94, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES (95, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-26 17:00:00');
INSERT INTO `schedule_job_log` VALUES (96, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-26 17:30:00');
INSERT INTO `schedule_job_log` VALUES (97, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-26 18:00:00');
INSERT INTO `schedule_job_log` VALUES (98, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-27 14:30:00');
INSERT INTO `schedule_job_log` VALUES (99, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-27 15:00:02');
INSERT INTO `schedule_job_log` VALUES (100, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-27 15:30:00');
INSERT INTO `schedule_job_log` VALUES (101, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES (102, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-27 16:30:00');
INSERT INTO `schedule_job_log` VALUES (103, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-27 17:00:00');
INSERT INTO `schedule_job_log` VALUES (104, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-27 17:30:00');
INSERT INTO `schedule_job_log` VALUES (105, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES (106, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES (107, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-27 19:00:00');
INSERT INTO `schedule_job_log` VALUES (108, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-27 19:30:01');
INSERT INTO `schedule_job_log` VALUES (109, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-27 20:00:01');
INSERT INTO `schedule_job_log` VALUES (110, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-27 20:30:00');
INSERT INTO `schedule_job_log` VALUES (111, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-27 21:00:00');
INSERT INTO `schedule_job_log` VALUES (112, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-27 21:30:00');
INSERT INTO `schedule_job_log` VALUES (113, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-27 22:00:01');
INSERT INTO `schedule_job_log` VALUES (114, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-27 22:30:00');
INSERT INTO `schedule_job_log` VALUES (115, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES (116, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 12:00:02');
INSERT INTO `schedule_job_log` VALUES (117, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-28 12:30:00');
INSERT INTO `schedule_job_log` VALUES (118, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-28 13:00:00');
INSERT INTO `schedule_job_log` VALUES (119, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 13:30:00');
INSERT INTO `schedule_job_log` VALUES (120, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 14:00:00');
INSERT INTO `schedule_job_log` VALUES (121, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 14:30:00');
INSERT INTO `schedule_job_log` VALUES (122, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-28 15:00:00');
INSERT INTO `schedule_job_log` VALUES (123, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 15:30:00');
INSERT INTO `schedule_job_log` VALUES (124, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 16:00:00');
INSERT INTO `schedule_job_log` VALUES (125, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 16:30:00');
INSERT INTO `schedule_job_log` VALUES (126, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 17:00:00');
INSERT INTO `schedule_job_log` VALUES (127, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-28 17:30:00');
INSERT INTO `schedule_job_log` VALUES (128, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 18:00:00');
INSERT INTO `schedule_job_log` VALUES (129, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 18:30:01');
INSERT INTO `schedule_job_log` VALUES (130, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 19:00:01');
INSERT INTO `schedule_job_log` VALUES (131, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-28 19:30:03');
INSERT INTO `schedule_job_log` VALUES (132, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 20:00:01');
INSERT INTO `schedule_job_log` VALUES (133, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-28 20:30:01');
INSERT INTO `schedule_job_log` VALUES (134, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 21:00:01');
INSERT INTO `schedule_job_log` VALUES (135, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-28 21:30:01');
INSERT INTO `schedule_job_log` VALUES (136, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 22:00:01');
INSERT INTO `schedule_job_log` VALUES (137, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-28 22:30:00');
INSERT INTO `schedule_job_log` VALUES (138, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-28 23:00:01');
INSERT INTO `schedule_job_log` VALUES (139, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-29 11:00:00');
INSERT INTO `schedule_job_log` VALUES (140, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-29 11:30:00');
INSERT INTO `schedule_job_log` VALUES (141, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-29 12:00:02');
INSERT INTO `schedule_job_log` VALUES (142, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-29 12:30:00');
INSERT INTO `schedule_job_log` VALUES (143, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-29 13:00:02');
INSERT INTO `schedule_job_log` VALUES (144, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-29 13:30:00');
INSERT INTO `schedule_job_log` VALUES (145, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-29 14:00:00');
INSERT INTO `schedule_job_log` VALUES (146, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-29 14:30:00');
INSERT INTO `schedule_job_log` VALUES (147, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-29 15:00:00');
INSERT INTO `schedule_job_log` VALUES (148, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-29 15:30:00');
INSERT INTO `schedule_job_log` VALUES (149, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-29 16:00:00');
INSERT INTO `schedule_job_log` VALUES (150, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-29 16:30:00');
INSERT INTO `schedule_job_log` VALUES (151, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-29 23:00:00');
INSERT INTO `schedule_job_log` VALUES (152, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-29 23:30:00');
INSERT INTO `schedule_job_log` VALUES (153, 1, 'testTask', 'renren', 0, NULL, 2, '2021-01-30 12:00:00');
INSERT INTO `schedule_job_log` VALUES (154, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-30 12:30:00');
INSERT INTO `schedule_job_log` VALUES (155, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-30 14:30:00');
INSERT INTO `schedule_job_log` VALUES (156, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-30 15:00:00');
INSERT INTO `schedule_job_log` VALUES (157, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-30 15:30:00');
INSERT INTO `schedule_job_log` VALUES (158, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-30 16:00:00');
INSERT INTO `schedule_job_log` VALUES (159, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-30 17:00:00');
INSERT INTO `schedule_job_log` VALUES (160, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-30 17:30:01');
INSERT INTO `schedule_job_log` VALUES (161, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-30 18:00:01');
INSERT INTO `schedule_job_log` VALUES (162, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-31 12:30:00');
INSERT INTO `schedule_job_log` VALUES (163, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-31 13:00:00');
INSERT INTO `schedule_job_log` VALUES (164, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-31 13:30:01');
INSERT INTO `schedule_job_log` VALUES (165, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-31 14:00:01');
INSERT INTO `schedule_job_log` VALUES (166, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-31 14:30:01');
INSERT INTO `schedule_job_log` VALUES (167, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-31 15:00:00');
INSERT INTO `schedule_job_log` VALUES (168, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-31 15:30:00');
INSERT INTO `schedule_job_log` VALUES (169, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-31 16:00:00');
INSERT INTO `schedule_job_log` VALUES (170, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-31 16:30:01');
INSERT INTO `schedule_job_log` VALUES (171, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-31 17:00:01');
INSERT INTO `schedule_job_log` VALUES (172, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-31 17:30:00');
INSERT INTO `schedule_job_log` VALUES (173, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-31 18:00:01');
INSERT INTO `schedule_job_log` VALUES (174, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-31 19:00:00');
INSERT INTO `schedule_job_log` VALUES (175, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-31 19:30:01');
INSERT INTO `schedule_job_log` VALUES (176, 1, 'testTask', 'renren', 0, NULL, 1, '2021-01-31 20:00:01');
INSERT INTO `schedule_job_log` VALUES (177, 1, 'testTask', 'renren', 0, NULL, 0, '2021-01-31 20:30:01');
INSERT INTO `schedule_job_log` VALUES (178, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-01 12:00:01');
INSERT INTO `schedule_job_log` VALUES (179, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-01 12:30:00');
INSERT INTO `schedule_job_log` VALUES (180, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-01 13:00:00');
INSERT INTO `schedule_job_log` VALUES (181, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-01 13:30:00');
INSERT INTO `schedule_job_log` VALUES (182, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-01 14:30:00');
INSERT INTO `schedule_job_log` VALUES (183, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-01 15:00:01');
INSERT INTO `schedule_job_log` VALUES (184, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-01 15:30:00');
INSERT INTO `schedule_job_log` VALUES (185, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-01 16:00:00');
INSERT INTO `schedule_job_log` VALUES (186, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-01 16:30:00');
INSERT INTO `schedule_job_log` VALUES (187, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-02 23:00:00');
INSERT INTO `schedule_job_log` VALUES (188, 1, 'testTask', 'renren', 0, NULL, 2, '2021-02-02 23:30:01');
INSERT INTO `schedule_job_log` VALUES (189, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-04 21:30:00');
INSERT INTO `schedule_job_log` VALUES (190, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-04 22:30:00');
INSERT INTO `schedule_job_log` VALUES (191, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-04 23:00:00');
INSERT INTO `schedule_job_log` VALUES (192, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-04 23:30:00');
INSERT INTO `schedule_job_log` VALUES (193, 1, 'testTask', 'renren', 0, NULL, 4, '2021-02-05 00:00:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('0433b08d-2f11-4e97-8550-e0b983ab48d1', 'c7eng', '2021-01-19 19:19:10');
INSERT INTO `sys_captcha` VALUES ('1a763acb-35a5-4414-8f3b-89e9023adeb2', '6ndfy', '2021-01-14 23:39:43');
INSERT INTO `sys_captcha` VALUES ('2cd4267b-9e8b-4f62-879c-18f65ac47ecc', '625fw', '2021-01-19 14:42:46');
INSERT INTO `sys_captcha` VALUES ('39b154f6-9599-4d64-8fa1-1c3a3852fa24', '2g76n', '2021-02-04 21:11:37');
INSERT INTO `sys_captcha` VALUES ('3a3ddce0-cd5a-4bda-8c39-20e3e56e7030', 'nn6bn', '2021-01-17 12:13:34');
INSERT INTO `sys_captcha` VALUES ('3ac09982-1cc8-48ea-8ac9-585aa2419f3e', '2cbw2', '2021-01-18 20:41:48');
INSERT INTO `sys_captcha` VALUES ('3d5e2ebd-da63-4cc1-8268-1b31c572aba9', 'ax5ad', '2021-01-17 11:58:22');
INSERT INTO `sys_captcha` VALUES ('4565524e-1ccd-4da7-85c5-ccee5feeea38', '8m645', '2021-01-29 22:57:18');
INSERT INTO `sys_captcha` VALUES ('4ee4a46b-2beb-410b-8899-5b0de3843731', 'cna3n', '2021-01-19 15:28:10');
INSERT INTO `sys_captcha` VALUES ('562378a6-7396-41e7-8a8a-8da2df6b354f', '73b48', '2021-01-18 13:55:58');
INSERT INTO `sys_captcha` VALUES ('56a873ab-077c-4dd8-82ff-a83084d93e48', '8w3pm', '2021-01-17 11:58:20');
INSERT INTO `sys_captcha` VALUES ('603e02cd-dd38-44e3-832c-0fc6323e7315', '5xbnf', '2021-01-18 23:08:09');
INSERT INTO `sys_captcha` VALUES ('83ed866b-da95-4b45-8f16-18b0d0c4c170', 'yey74', '2021-01-28 11:33:29');
INSERT INTO `sys_captcha` VALUES ('8c211357-2014-425c-8942-74f0a4497a9b', '26nxn', '2021-01-17 11:57:54');
INSERT INTO `sys_captcha` VALUES ('aa0d6634-9ebf-4947-81a4-a920358e7858', 'gdd2w', '2021-01-28 12:00:27');
INSERT INTO `sys_captcha` VALUES ('abeb99e2-11ff-4217-8f69-f58562c4a90c', 'bwpdw', '2021-01-18 23:47:10');
INSERT INTO `sys_captcha` VALUES ('e8d052d9-7025-4585-8e67-ef04ad25361d', '33546', '2021-01-17 15:19:06');
INSERT INTO `sys_captcha` VALUES ('f9ea1d23-afe7-48af-81ac-713c098a00f9', 'yc78d', '2021-01-28 16:04:52');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":101,\"parentId\":0,\"name\":\"疫情管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"role\",\"orderNum\":0}]', 98, '0:0:0:0:0:0:0:1', '2021-01-17 11:58:26');
INSERT INTO `sys_log` VALUES (2, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":101,\"name\":\"班级表\",\"url\":\"epi/classes\",\"type\":1,\"icon\":\"admin\",\"orderNum\":6}]', 162, '0:0:0:0:0:0:0:1', '2021-01-17 11:59:24');
INSERT INTO `sys_log` VALUES (3, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":101,\"name\":\"班级管理表\",\"url\":\"epi/classmanage\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 226, '0:0:0:0:0:0:0:1', '2021-01-17 11:59:47');
INSERT INTO `sys_log` VALUES (4, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":101,\"name\":\"部门机构表\",\"url\":\"epi/dept\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 135, '0:0:0:0:0:0:0:1', '2021-01-17 12:00:08');
INSERT INTO `sys_log` VALUES (5, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":101,\"name\":\"健康记录数据表\",\"url\":\"epi/healthinfo\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 167, '0:0:0:0:0:0:0:1', '2021-01-17 12:00:25');
INSERT INTO `sys_log` VALUES (6, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":101,\"name\":\"消息表\",\"url\":\"epi/message\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 147, '0:0:0:0:0:0:0:1', '2021-01-17 12:00:44');
INSERT INTO `sys_log` VALUES (7, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":61,\"parentId\":101,\"name\":\"运动记录表\",\"url\":\"epi/motioninfo\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 136, '0:0:0:0:0:0:0:1', '2021-01-17 12:01:01');
INSERT INTO `sys_log` VALUES (8, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":56,\"parentId\":101,\"name\":\"消息发送表\",\"url\":\"epi/messagesand\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 207, '0:0:0:0:0:0:0:1', '2021-01-17 12:01:19');
INSERT INTO `sys_log` VALUES (9, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":66,\"parentId\":101,\"name\":\"新闻表\",\"url\":\"epi/news\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 203, '0:0:0:0:0:0:0:1', '2021-01-17 12:02:08');
INSERT INTO `sys_log` VALUES (10, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":71,\"parentId\":101,\"name\":\"学生班级表\",\"url\":\"epi/studentclasses\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 262, '0:0:0:0:0:0:0:1', '2021-01-17 12:06:01');
INSERT INTO `sys_log` VALUES (11, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":76,\"parentId\":101,\"name\":\"任务表\",\"url\":\"epi/task\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 187, '0:0:0:0:0:0:0:1', '2021-01-17 12:06:11');
INSERT INTO `sys_log` VALUES (12, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":76,\"parentId\":101,\"name\":\"任务表\",\"url\":\"epi/task\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 131, '0:0:0:0:0:0:0:1', '2021-01-17 12:06:26');
INSERT INTO `sys_log` VALUES (13, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":81,\"parentId\":101,\"name\":\"任务发送表\",\"url\":\"epi/tasksand\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 321, '0:0:0:0:0:0:0:1', '2021-01-17 12:06:37');
INSERT INTO `sys_log` VALUES (14, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":86,\"parentId\":101,\"name\":\"用户账号绑定表\",\"url\":\"epi/userbanding\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 144, '0:0:0:0:0:0:0:1', '2021-01-17 12:06:53');
INSERT INTO `sys_log` VALUES (15, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":91,\"parentId\":101,\"name\":\"用户基本信息表\",\"url\":\"epi/userbaseinfo\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 9128, '0:0:0:0:0:0:0:1', '2021-01-17 12:07:28');
INSERT INTO `sys_log` VALUES (16, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":91,\"parentId\":101,\"name\":\"用户基本信息表\",\"url\":\"epi/userbaseinfo\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 227, '0:0:0:0:0:0:0:1', '2021-01-17 12:07:30');
INSERT INTO `sys_log` VALUES (17, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":96,\"parentId\":101,\"name\":\"用户部门表\",\"url\":\"epi/userdept\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 159, '0:0:0:0:0:0:0:1', '2021-01-17 12:07:46');
INSERT INTO `sys_log` VALUES (18, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":101,\"parentId\":0,\"name\":\"疫情管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"role\",\"orderNum\":1}]', 119, '0:0:0:0:0:0:0:1', '2021-01-17 12:08:04');
INSERT INTO `sys_log` VALUES (19, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":2}]', 110, '0:0:0:0:0:0:0:1', '2021-01-17 12:09:41');
INSERT INTO `sys_log` VALUES (20, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":101,\"name\":\"部门机构管理\",\"url\":\"epi/dept\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 137, '0:0:0:0:0:0:0:1', '2021-01-17 17:39:14');
INSERT INTO `sys_log` VALUES (21, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":44,\"parentId\":41,\"name\":\"修改\",\"perms\":\"epi:dept:update;epi:dept:select\",\"type\":2,\"orderNum\":6}]', 181, '0:0:0:0:0:0:0:1', '2021-01-17 19:41:50');
INSERT INTO `sys_log` VALUES (22, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":44,\"parentId\":41,\"name\":\"修改\",\"perms\":\"epi:dept:update,epi:dept:select\",\"type\":2,\"orderNum\":6}]', 182, '0:0:0:0:0:0:0:1', '2021-01-17 19:42:03');
INSERT INTO `sys_log` VALUES (23, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":102,\"parentId\":101,\"name\":\"疫情系统用户表\",\"url\":\"epi/user\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 139, '0:0:0:0:0:0:0:1', '2021-01-18 15:09:06');
INSERT INTO `sys_log` VALUES (24, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":107,\"parentId\":1,\"name\":\"健康记录数据表\",\"url\":\"epi/healthinfo\",\"perms\":\"epi:healthinfo:list\",\"type\":1,\"icon\":\"config\",\"orderNum\":0}]', 166, '0:0:0:0:0:0:0:1', '2021-01-19 13:40:29');
INSERT INTO `sys_log` VALUES (25, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[46]', 49, '0:0:0:0:0:0:0:1', '2021-01-19 13:42:59');
INSERT INTO `sys_log` VALUES (26, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":101,\"name\":\"健康记录数据表\",\"url\":\"epi/healthinfo\",\"type\":0,\"icon\":\"config\",\"orderNum\":5}]', 156, '0:0:0:0:0:0:0:1', '2021-01-19 13:43:29');
INSERT INTO `sys_log` VALUES (27, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[46]', 45, '0:0:0:0:0:0:0:1', '2021-01-19 13:43:52');
INSERT INTO `sys_log` VALUES (28, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[50]', 246, '0:0:0:0:0:0:0:1', '2021-01-19 13:44:05');
INSERT INTO `sys_log` VALUES (29, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[47]', 243, '0:0:0:0:0:0:0:1', '2021-01-19 13:44:20');
INSERT INTO `sys_log` VALUES (30, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[47]', 229, '0:0:0:0:0:0:0:1', '2021-01-19 13:44:23');
INSERT INTO `sys_log` VALUES (31, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[47]', 227, '0:0:0:0:0:0:0:1', '2021-01-19 13:44:26');
INSERT INTO `sys_log` VALUES (32, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[48]', 249, '0:0:0:0:0:0:0:1', '2021-01-19 13:44:42');
INSERT INTO `sys_log` VALUES (33, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[49]', 239, '0:0:0:0:0:0:0:1', '2021-01-19 13:44:48');
INSERT INTO `sys_log` VALUES (34, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[46]', 246, '0:0:0:0:0:0:0:1', '2021-01-19 13:45:05');
INSERT INTO `sys_log` VALUES (35, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":107,\"parentId\":101,\"name\":\"健康记录数据表\",\"url\":\"epi/healthinfo\",\"perms\":\"epi:healthinfo:list\",\"type\":1,\"icon\":\"config\",\"orderNum\":0}]', 148, '0:0:0:0:0:0:0:1', '2021-01-19 13:49:48');
INSERT INTO `sys_log` VALUES (36, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":107,\"parentId\":101,\"name\":\"健康记录数据表\",\"url\":\"epi/epihealthinfo\",\"perms\":\"epi:epihealthinfo:list\",\"type\":1,\"icon\":\"config\",\"orderNum\":0}]', 144, '0:0:0:0:0:0:0:1', '2021-01-19 14:46:46');
INSERT INTO `sys_log` VALUES (37, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":107,\"parentId\":101,\"name\":\"健康记录数据表\",\"url\":\"epi/epihealthinfo\",\"perms\":\"epi:epihealthinfo:list\",\"type\":1,\"icon\":\"config\",\"orderNum\":0}]', 141, '0:0:0:0:0:0:0:1', '2021-01-19 15:08:14');
INSERT INTO `sys_log` VALUES (38, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":107,\"parentId\":101,\"name\":\"健康记录数据表\",\"url\":\"epi/healthinfo\",\"perms\":\"epi:healthinfo:list\",\"type\":1,\"icon\":\"config\",\"orderNum\":0}]', 138, '0:0:0:0:0:0:0:1', '2021-01-19 18:14:47');
INSERT INTO `sys_log` VALUES (39, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":108,\"parentId\":76,\"name\":\"执行任务\",\"perms\":\"epi:task:startTask\",\"type\":2,\"orderNum\":6}]', 129, '0:0:0:0:0:0:0:1', '2021-02-04 23:29:18');
INSERT INTO `sys_log` VALUES (40, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,101,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,108,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,102,103,104,105,106,107,-666666],\"createTime\":\"Feb 4, 2021 11:40:45 PM\"}]', 6409, '0:0:0:0:0:0:0:1', '2021-02-04 23:40:51');
INSERT INTO `sys_log` VALUES (41, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"password\":\"9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 304, '0:0:0:0:0:0:0:1', '2021-02-04 23:41:24');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 2);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (31, 101, '班级表', 'epi/classes', NULL, 1, 'admin', 6);
INSERT INTO `sys_menu` VALUES (32, 31, '查看', NULL, 'epi:classes:list,epi:classes:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (33, 31, '新增', NULL, 'epi:classes:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (34, 31, '修改', NULL, 'epi:classes:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (35, 31, '删除', NULL, 'epi:classes:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (36, 101, '班级管理表', 'epi/classmanage', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (37, 36, '查看', NULL, 'epi:classmanage:list,epi:classmanage:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (38, 36, '新增', NULL, 'epi:classmanage:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (39, 36, '修改', NULL, 'epi:classmanage:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (40, 36, '删除', NULL, 'epi:classmanage:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (41, 101, '部门机构管理', 'epi/dept', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (42, 41, '查看', NULL, 'epi:dept:list,epi:dept:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (43, 41, '新增', NULL, 'epi:dept:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (44, 41, '修改', NULL, 'epi:dept:update,epi:dept:select', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (45, 41, '删除', NULL, 'epi:dept:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (51, 101, '消息表', 'epi/message', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (52, 51, '查看', NULL, 'epi:message:list,epi:message:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (53, 51, '新增', NULL, 'epi:message:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (54, 51, '修改', NULL, 'epi:message:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (55, 51, '删除', NULL, 'epi:message:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (56, 101, '消息发送表', 'epi/messagesand', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (57, 56, '查看', NULL, 'epi:messagesand:list,epi:messagesand:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (58, 56, '新增', NULL, 'epi:messagesand:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (59, 56, '修改', NULL, 'epi:messagesand:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (60, 56, '删除', NULL, 'epi:messagesand:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (61, 101, '运动记录表', 'epi/motioninfo', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (62, 61, '查看', NULL, 'epi:motioninfo:list,epi:motioninfo:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (63, 61, '新增', NULL, 'epi:motioninfo:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (64, 61, '修改', NULL, 'epi:motioninfo:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (65, 61, '删除', NULL, 'epi:motioninfo:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (66, 101, '新闻表', 'epi/news', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (67, 66, '查看', NULL, 'epi:news:list,epi:news:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (68, 66, '新增', NULL, 'epi:news:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (69, 66, '修改', NULL, 'epi:news:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (70, 66, '删除', NULL, 'epi:news:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (71, 101, '学生班级表', 'epi/studentclasses', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (72, 71, '查看', NULL, 'epi:studentclasses:list,epi:studentclasses:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (73, 71, '新增', NULL, 'epi:studentclasses:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (74, 71, '修改', NULL, 'epi:studentclasses:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (75, 71, '删除', NULL, 'epi:studentclasses:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (76, 101, '任务表', 'epi/task', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (77, 76, '查看', NULL, 'epi:task:list,epi:task:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (78, 76, '新增', NULL, 'epi:task:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (79, 76, '修改', NULL, 'epi:task:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (80, 76, '删除', NULL, 'epi:task:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (81, 101, '任务发送表', 'epi/tasksand', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (82, 81, '查看', NULL, 'epi:tasksand:list,epi:tasksand:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (83, 81, '新增', NULL, 'epi:tasksand:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (84, 81, '修改', NULL, 'epi:tasksand:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (85, 81, '删除', NULL, 'epi:tasksand:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (86, 101, '用户账号绑定表', 'epi/userbanding', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (87, 86, '查看', NULL, 'epi:userbanding:list,epi:userbanding:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (88, 86, '新增', NULL, 'epi:userbanding:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (89, 86, '修改', NULL, 'epi:userbanding:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (90, 86, '删除', NULL, 'epi:userbanding:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (91, 101, '用户基本信息表', 'epi/userbaseinfo', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (92, 91, '查看', NULL, 'epi:userbaseinfo:list,epi:userbaseinfo:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (93, 91, '新增', NULL, 'epi:userbaseinfo:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (94, 91, '修改', NULL, 'epi:userbaseinfo:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (95, 91, '删除', NULL, 'epi:userbaseinfo:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (96, 101, '用户部门表', 'epi/userdept', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (97, 96, '查看', NULL, 'epi:userdept:list,epi:userdept:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (98, 96, '新增', NULL, 'epi:userdept:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (99, 96, '修改', NULL, 'epi:userdept:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (100, 96, '删除', NULL, 'epi:userdept:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (101, 0, '疫情管理', '', '', 0, 'role', 1);
INSERT INTO `sys_menu` VALUES (102, 101, '疫情系统用户表', 'epi/user', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (103, 102, '查看', NULL, 'epi:user:list,epi:user:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (104, 102, '新增', NULL, 'epi:user:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (105, 102, '修改', NULL, 'epi:user:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (106, 102, '删除', NULL, 'epi:user:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (107, 101, '健康记录数据表', 'epi/healthinfo', 'epi:healthinfo:list', 1, 'config', 0);
INSERT INTO `sys_menu` VALUES (108, 76, '执行任务', NULL, 'epi:task:startTask', 2, NULL, 6);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '超级管理员', 1, '2021-02-04 23:40:45');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1, 2);
INSERT INTO `sys_role_menu` VALUES (3, 1, 15);
INSERT INTO `sys_role_menu` VALUES (4, 1, 16);
INSERT INTO `sys_role_menu` VALUES (5, 1, 17);
INSERT INTO `sys_role_menu` VALUES (6, 1, 18);
INSERT INTO `sys_role_menu` VALUES (7, 1, 3);
INSERT INTO `sys_role_menu` VALUES (8, 1, 19);
INSERT INTO `sys_role_menu` VALUES (9, 1, 20);
INSERT INTO `sys_role_menu` VALUES (10, 1, 21);
INSERT INTO `sys_role_menu` VALUES (11, 1, 22);
INSERT INTO `sys_role_menu` VALUES (12, 1, 4);
INSERT INTO `sys_role_menu` VALUES (13, 1, 23);
INSERT INTO `sys_role_menu` VALUES (14, 1, 24);
INSERT INTO `sys_role_menu` VALUES (15, 1, 25);
INSERT INTO `sys_role_menu` VALUES (16, 1, 26);
INSERT INTO `sys_role_menu` VALUES (17, 1, 5);
INSERT INTO `sys_role_menu` VALUES (18, 1, 6);
INSERT INTO `sys_role_menu` VALUES (19, 1, 7);
INSERT INTO `sys_role_menu` VALUES (20, 1, 8);
INSERT INTO `sys_role_menu` VALUES (21, 1, 9);
INSERT INTO `sys_role_menu` VALUES (22, 1, 10);
INSERT INTO `sys_role_menu` VALUES (23, 1, 11);
INSERT INTO `sys_role_menu` VALUES (24, 1, 12);
INSERT INTO `sys_role_menu` VALUES (25, 1, 13);
INSERT INTO `sys_role_menu` VALUES (26, 1, 14);
INSERT INTO `sys_role_menu` VALUES (27, 1, 27);
INSERT INTO `sys_role_menu` VALUES (28, 1, 29);
INSERT INTO `sys_role_menu` VALUES (29, 1, 30);
INSERT INTO `sys_role_menu` VALUES (30, 1, 101);
INSERT INTO `sys_role_menu` VALUES (31, 1, 31);
INSERT INTO `sys_role_menu` VALUES (32, 1, 32);
INSERT INTO `sys_role_menu` VALUES (33, 1, 33);
INSERT INTO `sys_role_menu` VALUES (34, 1, 34);
INSERT INTO `sys_role_menu` VALUES (35, 1, 35);
INSERT INTO `sys_role_menu` VALUES (36, 1, 36);
INSERT INTO `sys_role_menu` VALUES (37, 1, 37);
INSERT INTO `sys_role_menu` VALUES (38, 1, 38);
INSERT INTO `sys_role_menu` VALUES (39, 1, 39);
INSERT INTO `sys_role_menu` VALUES (40, 1, 40);
INSERT INTO `sys_role_menu` VALUES (41, 1, 41);
INSERT INTO `sys_role_menu` VALUES (42, 1, 42);
INSERT INTO `sys_role_menu` VALUES (43, 1, 43);
INSERT INTO `sys_role_menu` VALUES (44, 1, 44);
INSERT INTO `sys_role_menu` VALUES (45, 1, 45);
INSERT INTO `sys_role_menu` VALUES (46, 1, 51);
INSERT INTO `sys_role_menu` VALUES (47, 1, 52);
INSERT INTO `sys_role_menu` VALUES (48, 1, 53);
INSERT INTO `sys_role_menu` VALUES (49, 1, 54);
INSERT INTO `sys_role_menu` VALUES (50, 1, 55);
INSERT INTO `sys_role_menu` VALUES (51, 1, 56);
INSERT INTO `sys_role_menu` VALUES (52, 1, 57);
INSERT INTO `sys_role_menu` VALUES (53, 1, 58);
INSERT INTO `sys_role_menu` VALUES (54, 1, 59);
INSERT INTO `sys_role_menu` VALUES (55, 1, 60);
INSERT INTO `sys_role_menu` VALUES (56, 1, 61);
INSERT INTO `sys_role_menu` VALUES (57, 1, 62);
INSERT INTO `sys_role_menu` VALUES (58, 1, 63);
INSERT INTO `sys_role_menu` VALUES (59, 1, 64);
INSERT INTO `sys_role_menu` VALUES (60, 1, 65);
INSERT INTO `sys_role_menu` VALUES (61, 1, 66);
INSERT INTO `sys_role_menu` VALUES (62, 1, 67);
INSERT INTO `sys_role_menu` VALUES (63, 1, 68);
INSERT INTO `sys_role_menu` VALUES (64, 1, 69);
INSERT INTO `sys_role_menu` VALUES (65, 1, 70);
INSERT INTO `sys_role_menu` VALUES (66, 1, 71);
INSERT INTO `sys_role_menu` VALUES (67, 1, 72);
INSERT INTO `sys_role_menu` VALUES (68, 1, 73);
INSERT INTO `sys_role_menu` VALUES (69, 1, 74);
INSERT INTO `sys_role_menu` VALUES (70, 1, 75);
INSERT INTO `sys_role_menu` VALUES (71, 1, 76);
INSERT INTO `sys_role_menu` VALUES (72, 1, 77);
INSERT INTO `sys_role_menu` VALUES (73, 1, 78);
INSERT INTO `sys_role_menu` VALUES (74, 1, 79);
INSERT INTO `sys_role_menu` VALUES (75, 1, 80);
INSERT INTO `sys_role_menu` VALUES (76, 1, 108);
INSERT INTO `sys_role_menu` VALUES (77, 1, 81);
INSERT INTO `sys_role_menu` VALUES (78, 1, 82);
INSERT INTO `sys_role_menu` VALUES (79, 1, 83);
INSERT INTO `sys_role_menu` VALUES (80, 1, 84);
INSERT INTO `sys_role_menu` VALUES (81, 1, 85);
INSERT INTO `sys_role_menu` VALUES (82, 1, 86);
INSERT INTO `sys_role_menu` VALUES (83, 1, 87);
INSERT INTO `sys_role_menu` VALUES (84, 1, 88);
INSERT INTO `sys_role_menu` VALUES (85, 1, 89);
INSERT INTO `sys_role_menu` VALUES (86, 1, 90);
INSERT INTO `sys_role_menu` VALUES (87, 1, 91);
INSERT INTO `sys_role_menu` VALUES (88, 1, 92);
INSERT INTO `sys_role_menu` VALUES (89, 1, 93);
INSERT INTO `sys_role_menu` VALUES (90, 1, 94);
INSERT INTO `sys_role_menu` VALUES (91, 1, 95);
INSERT INTO `sys_role_menu` VALUES (92, 1, 96);
INSERT INTO `sys_role_menu` VALUES (93, 1, 97);
INSERT INTO `sys_role_menu` VALUES (94, 1, 98);
INSERT INTO `sys_role_menu` VALUES (95, 1, 99);
INSERT INTO `sys_role_menu` VALUES (96, 1, 100);
INSERT INTO `sys_role_menu` VALUES (97, 1, 102);
INSERT INTO `sys_role_menu` VALUES (98, 1, 103);
INSERT INTO `sys_role_menu` VALUES (99, 1, 104);
INSERT INTO `sys_role_menu` VALUES (100, 1, 105);
INSERT INTO `sys_role_menu` VALUES (101, 1, 106);
INSERT INTO `sys_role_menu` VALUES (102, 1, 107);
INSERT INTO `sys_role_menu` VALUES (103, 1, -666666);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, 'ef47ab1e480fcfaedf976dc5f791c9c6', '2021-02-05 12:23:35', '2021-02-05 00:23:35');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
