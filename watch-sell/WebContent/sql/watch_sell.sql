/*
Navicat MySQL Data Transfer

Source Server         : jeesite
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : watch_sell

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-11 18:03:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `menu_name` varchar(64) NOT NULL,
  `sort` int(10) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `del_flag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', null, '在线客服', '10', '/a/back', '1', '0');
INSERT INTO `sys_menu` VALUES ('2', '', '订单', '20', '/a/order/list', '1', '0');
INSERT INTO `sys_menu` VALUES ('3', '', '图表化', '31', '/a/chart', '1', '0');
INSERT INTO `sys_menu` VALUES ('35a9aff23061421bba4eb7ab9c9a492c', null, '名表', '80', '/a/watch/list', '1', '0');
INSERT INTO `sys_menu` VALUES ('4', null, '客服', '40', '/a/kufu/ak', '1', '0');
INSERT INTO `sys_menu` VALUES ('5', null, '订单', '50', '/a/dindan', '1', '0');
INSERT INTO `sys_menu` VALUES ('6', null, '系统设置', '60', '/a/user/list', '1', '0');
INSERT INTO `sys_menu` VALUES ('7', null, '类别', '70', '/a/type/brand/list', '1', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL,
  `role_name` varchar(64) NOT NULL,
  `del_flag` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '0');
INSERT INTO `sys_role` VALUES ('2', '客服', '0');
INSERT INTO `sys_role` VALUES ('3', '顾客', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL,
  `menu_id` varchar(64) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '35a9aff23061421bba4eb7ab9c9a492c');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '7');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sex` int(1) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `user_type` int(1) DEFAULT NULL,
  `vip` varchar(64) DEFAULT 'vip1',
  `phone_num` varchar(64) DEFAULT NULL,
  `credits` int(10) DEFAULT '0',
  `del_flag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1231', 'weilihong', '314cd370f3d2a9e88331f043a731029cf0ddea2bc67f4ef159950dae', '1510491769@qq.com', '1', '19940307', '2', 'vip1', '1231312321', '100', '0');
INSERT INTO `sys_user` VALUES ('1232', 'weiwei', '65de6c3f438bae0e4c7c27c15c770d6a0dfcade13bba5c421f131041', '123@qq.com', '1', '2018-03-15', '1', 'vip1', '33333333', '100', '0');
INSERT INTO `sys_user` VALUES ('3a7f860c1c3e464a8b9cb81101e31fed', null, '29fdff78ebb128732def3f9ef986dd6a69618f0710835110992f5507', 'www', '1', null, '2', 'vip1', null, '0', '0');
INSERT INTO `sys_user` VALUES ('7d1211b196dc4a8ab81a5a9a0ca90f4e', 'wwww', '93a4b672123b02fa219d48a90a0f9061bf4cd34328efb103fe66c535', '123', '0', '', '0', 'vip1', '', '0', '0');
INSERT INTO `sys_user` VALUES ('8e44cd2948284e2e937f2c5465825d31', '111', '82a510c0d81490bb5a779b69774bce70d440060d3aca3611cd20b8de', '111', null, null, '0', 'vip1', null, '0', '0');
INSERT INTO `sys_user` VALUES ('a3699712ec60429582f35d19caadcf42', '2222', 'b545ef1ef5f6a7974c213e51618b755745a894c961f6edec0399213c', '222', null, null, '0', 'vip1', null, '0', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1231', '1');
INSERT INTO `sys_user_role` VALUES ('1231', '2');
INSERT INTO `sys_user_role` VALUES ('3a7f860c1c3e464a8b9cb81101e31fed', '1');

-- ----------------------------
-- Table structure for user_reception
-- ----------------------------
DROP TABLE IF EXISTS `user_reception`;
CREATE TABLE `user_reception` (
  `id` varchar(64) NOT NULL,
  `rec_name` varchar(64) NOT NULL,
  `rec_phone` varchar(64) NOT NULL,
  `rec_address` varchar(255) NOT NULL,
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `user_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_reception
-- ----------------------------
INSERT INTO `user_reception` VALUES ('1', '1232', '3213', '123131', '0', '7d1211b196dc4a8ab81a5a9a0ca90f4e');
INSERT INTO `user_reception` VALUES ('2', 'ewqeqw', '13213123', 'sds发顺丰', '1', '7d1211b196dc4a8ab81a5a9a0ca90f4e');
INSERT INTO `user_reception` VALUES ('3', 'eqweqwe', '1232136765756', '安达市达到', '0', '7d1211b196dc4a8ab81a5a9a0ca90f4e');
INSERT INTO `user_reception` VALUES ('850d2759430b49e7ab5623c976ccafe4', '11111', '1111111', '无穷大大所', '1', '7d1211b196dc4a8ab81a5a9a0ca90f4e');
INSERT INTO `user_reception` VALUES ('e67ff4ddefd345dba122243721c9c368', '22222222', '2222222222', '驱蚊器二群', '1', '7d1211b196dc4a8ab81a5a9a0ca90f4e');

-- ----------------------------
-- Table structure for user_vip
-- ----------------------------
DROP TABLE IF EXISTS `user_vip`;
CREATE TABLE `user_vip` (
  `id` varchar(64) NOT NULL,
  `vip_level` varchar(64) NOT NULL,
  `vip_credits` int(10) NOT NULL,
  `vip_discount` varchar(10) DEFAULT NULL,
  `vip_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_vip
-- ----------------------------
INSERT INTO `user_vip` VALUES ('1', 'vip1', '0', '1', '普通会员');
INSERT INTO `user_vip` VALUES ('2', 'vip2', '100', '0.95', '白银会员');
INSERT INTO `user_vip` VALUES ('3', 'vip3', '200', '0.90', '白金会员');
INSERT INTO `user_vip` VALUES ('4', 'vip4', '300', '0.8', '至尊会员');

-- ----------------------------
-- Table structure for watch
-- ----------------------------
DROP TABLE IF EXISTS `watch`;
CREATE TABLE `watch` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '腕表id',
  `brand_id` varchar(64) DEFAULT NULL,
  `crowd_id` varchar(64) DEFAULT NULL,
  `movement_id` varchar(64) DEFAULT NULL,
  `promotion_id` varchar(64) DEFAULT NULL,
  `watch_title` varchar(500) DEFAULT '' COMMENT '头信息',
  `watch_model` varchar(64) DEFAULT NULL COMMENT '型号',
  `watch_introduce` varchar(500) DEFAULT NULL COMMENT '介绍',
  `watch_serial_number` varchar(64) DEFAULT NULL,
  `watch_org_price` int(64) DEFAULT NULL COMMENT '原价',
  `watch_pre_price` int(64) DEFAULT NULL COMMENT '现价',
  `watch_number` int(64) DEFAULT NULL COMMENT '数量',
  `watch_movement` varchar(255) DEFAULT NULL COMMENT '机芯',
  `watch_shell` varchar(255) DEFAULT NULL COMMENT '外壳',
  `watch_dial` varchar(255) DEFAULT NULL COMMENT '表盘',
  `watch_strap` varchar(255) DEFAULT NULL COMMENT '表带',
  `watch_clasp` varchar(255) DEFAULT NULL COMMENT '表扣',
  `watch_year` varchar(32) DEFAULT NULL COMMENT '年份',
  `watch_weight` varchar(64) DEFAULT NULL COMMENT '重量',
  `watch_waterproof` varchar(64) DEFAULT NULL COMMENT '防水',
  `del_flag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch
-- ----------------------------
INSERT INTO `watch` VALUES ('09c10439c0fb425e8eba68396c593157', '13b900fef0bd4a7c8ab0904a5169e7ff', 'e90ae503f730422484d1e54bea867cac', '68b11c01944e4a46987379120f3eb364', null, '瑞士艺术制表大师爱宝时（EPOS）-Emotion情感系列', '3390.152.20.16.25', '唯有超一流的工艺加上坚持不懈的创作方可成就这一精品超薄腕表', '42471', '123', '123', '120', '123', '123', '131', '31', '2131', '1231', '3132123', '132131', '0');
INSERT INTO `watch` VALUES ('0ad450ed108f4b388e55ed73527edd26', '13b900fef0bd4a7c8ab0904a5169e7ff', 'e870b42bbfe04ee9b152065c211a9fe2', '68b11c01944e4a46987379120f3eb364', null, '瑞士艺术制表大师爱宝时（EPOS）-Emotion情感系列', '121', '123123', '1231', '31231', '31313', '3131', '313', '313', '3131', '313', '3131', '313123', '1312', '3131', '0');
INSERT INTO `watch` VALUES ('1', null, null, null, null, '测试', '测试', '测试', 'A111', '5000', '3800', '20', null, null, null, null, null, null, null, null, '0');
INSERT INTO `watch` VALUES ('17e804749e1543a89f8af516c5afa753', '13b900fef0bd4a7c8ab0904a5169e7ff', 'e870b42bbfe04ee9b152065c211a9fe2', '68b11c01944e4a46987379120f3eb364', null, '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '3390.152.20.16.25', '褐尽繁华 保留腕表原始的魅力 渐变太阳纹表盘 简约 不简单', '42471', '5800', '5600', '100', 'ETA 2892-A2', 'ETA 2892-A2', '表盘宽度41mm 表盘厚度9mm 表耳20mm 纵向表耳间距50mm 蓝色', '牛皮 黑色', '针扣', '2014年', '200g', '50米', '0');
INSERT INTO `watch` VALUES ('52b7fe3df22e483f976cec3e88b4216a', '13b900fef0bd4a7c8ab0904a5169e7ff', 'e870b42bbfe04ee9b152065c211a9fe2', '68b11c01944e4a46987379120f3eb364', null, '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '3408.208.24.10.15', '唯有超一流的工艺加上坚持不懈的创作方可成就这一精品超薄腕表', '25502', '16000', '14000', '100', '13213', '13213', '3123', '313', '31231', '31231', '1231', '1323', '0');

-- ----------------------------
-- Table structure for watch_brand
-- ----------------------------
DROP TABLE IF EXISTS `watch_brand`;
CREATE TABLE `watch_brand` (
  `id` varchar(64) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名',
  `del_flag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌类表';

-- ----------------------------
-- Records of watch_brand
-- ----------------------------
INSERT INTO `watch_brand` VALUES ('061176832eac40748777ea2f38db6306', '宝玑', '0');
INSERT INTO `watch_brand` VALUES ('13b900fef0bd4a7c8ab0904a5169e7ff', '爱宝时', '0');
INSERT INTO `watch_brand` VALUES ('1d746af421c44d8b98ecbd71a4b09359', '天梭', '0');
INSERT INTO `watch_brand` VALUES ('2edf9be40bd24dc7bcd87886a47018e2', '百达翡丽', '0');
INSERT INTO `watch_brand` VALUES ('513a99ed2fd34953aafcb791f4705d3c', '卡西欧', '0');
INSERT INTO `watch_brand` VALUES ('58e98f9fbe3140719d83a96c9f1548dd', '爱马仕', '0');
INSERT INTO `watch_brand` VALUES ('5d0c9df1b5874446a3fe3425b18c1f9a', '宝柏', '0');
INSERT INTO `watch_brand` VALUES ('931440fd5725464897823348860ed2c9', '卡西欧', '1');
INSERT INTO `watch_brand` VALUES ('a450edfb3e55432996210ab1d0a01b13', '西铁城', '0');
INSERT INTO `watch_brand` VALUES ('aec7a55d5ac64087b3a24c24fb5fcad4', '飞亚达', '0');
INSERT INTO `watch_brand` VALUES ('bb6a746433544dae82a70c54b3226119', '欧米茄', '0');
INSERT INTO `watch_brand` VALUES ('bc7b835a57b14921ac8e39ab85ef3316', 'CK', '0');
INSERT INTO `watch_brand` VALUES ('d6e50460ab0942db8b4ef9fa5f55f8d6', '浪琴', '0');

-- ----------------------------
-- Table structure for watch_cart
-- ----------------------------
DROP TABLE IF EXISTS `watch_cart`;
CREATE TABLE `watch_cart` (
  `id` varchar(64) NOT NULL,
  `cart_product_number` int(64) DEFAULT NULL COMMENT '购买数量',
  `cart_create_time` varchar(64) DEFAULT NULL COMMENT '购物车创建时间',
  `cart_state` varchar(1) DEFAULT NULL COMMENT '购物车状态',
  `watch_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `del_flag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_cart
-- ----------------------------
INSERT INTO `watch_cart` VALUES ('1', '2', '2018-04-09 14:14:15', '0', '09c10439c0fb425e8eba68396c593157', '7d1211b196dc4a8ab81a5a9a0ca90f4e', '0');
INSERT INTO `watch_cart` VALUES ('84550ca703784a13bdd08fcf4d471186', '1', '2018-04-09 14:14:15', '0', '09c10439c0fb425e8eba68396c593157', '7d1211b196dc4a8ab81a5a9a0ca90f4e', '0');

-- ----------------------------
-- Table structure for watch_comment
-- ----------------------------
DROP TABLE IF EXISTS `watch_comment`;
CREATE TABLE `watch_comment` (
  `id` varchar(64) NOT NULL,
  `comment_content` varchar(600) DEFAULT NULL COMMENT '评论内容',
  `comment_content_time` varchar(64) DEFAULT NULL COMMENT '评论时间',
  `comment_answer` varchar(600) DEFAULT NULL COMMENT '回复内容',
  `comment_answer_time` varchar(64) DEFAULT NULL COMMENT '回复时间',
  `user_name` varchar(255) DEFAULT NULL COMMENT '评论的用户名',
  `user_id` varchar(64) DEFAULT NULL,
  `watch_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_comment
-- ----------------------------
INSERT INTO `watch_comment` VALUES ('1', '啊大大大的大剧院加油加油', '2018-4-3 13:12:34', null, null, 'dsada', '7d1211b196dc4a8ab81a5a9a0ca90f4e', '09c10439c0fb425e8eba68396c593157');
INSERT INTO `watch_comment` VALUES ('2', '发沙发舒服撒发顺丰个好看看看人头', '2018-4-3 13:12:34', '', '', 'dada', '7d1211b196dc4a8ab81a5a9a0ca90f4e', '09c10439c0fb425e8eba68396c593157');
INSERT INTO `watch_comment` VALUES ('3', '回电话滑动平均同意家庭影院', '2018-4-3 13:12:34', '', '', 'dasdada', '7d1211b196dc4a8ab81a5a9a0ca90f4e', '09c10439c0fb425e8eba68396c593157');
INSERT INTO `watch_comment` VALUES ('4', '回电话6防辐射服的说法是否收到影院', '2018-4-3 13:12:34', '', '', 'asdadsad', '7d1211b196dc4a8ab81a5a9a0ca90f4e', '09c10439c0fb425e8eba68396c593157');
INSERT INTO `watch_comment` VALUES ('5', '借古讽今国家管控力拉风我认为而去', '2018-4-3 13:12:34', '', '', 'dasdasdad', '7d1211b196dc4a8ab81a5a9a0ca90f4e', '09c10439c0fb425e8eba68396c593157');
INSERT INTO `watch_comment` VALUES ('5efa7fbf875c4a36b9c62588aa0e7ac5', '这是我的评论，第一个', '2018-04-11 14:11:15', null, null, 'wwww', '7d1211b196dc4a8ab81a5a9a0ca90f4e', '09c10439c0fb425e8eba68396c593157');
INSERT INTO `watch_comment` VALUES ('8edea64b303e4680ba75a8b7b3134d68', '这是一个真实的评论，第二个', '2018-04-11 14:38:08', null, null, 'wwww', '7d1211b196dc4a8ab81a5a9a0ca90f4e', '09c10439c0fb425e8eba68396c593157');
INSERT INTO `watch_comment` VALUES ('c39eaa5b84f94130a3865c6d1caa31f7', '这是一个真实的评论，第一个', '2018-04-11 14:38:06', null, null, 'wwww', '7d1211b196dc4a8ab81a5a9a0ca90f4e', '09c10439c0fb425e8eba68396c593157');
INSERT INTO `watch_comment` VALUES ('cd50bbdb21ec418289428043582b68d0', '这是我的评论，第二个', '2018-04-11 14:11:16', null, null, 'wwww', '7d1211b196dc4a8ab81a5a9a0ca90f4e', '09c10439c0fb425e8eba68396c593157');

-- ----------------------------
-- Table structure for watch_crowd
-- ----------------------------
DROP TABLE IF EXISTS `watch_crowd`;
CREATE TABLE `watch_crowd` (
  `id` varchar(64) NOT NULL,
  `crowd_name` varchar(255) DEFAULT NULL COMMENT '人群名',
  `del_flag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_crowd
-- ----------------------------
INSERT INTO `watch_crowd` VALUES ('83a8c5859ade4d1094325b14bcdbcd03', '男表', '1');
INSERT INTO `watch_crowd` VALUES ('e870b42bbfe04ee9b152065c211a9fe2', '中性', '0');
INSERT INTO `watch_crowd` VALUES ('e90ae503f730422484d1e54bea867cac', '女表', '0');

-- ----------------------------
-- Table structure for watch_movement
-- ----------------------------
DROP TABLE IF EXISTS `watch_movement`;
CREATE TABLE `watch_movement` (
  `id` varchar(255) NOT NULL,
  `movement_name` varchar(255) DEFAULT NULL,
  `del_flag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_movement
-- ----------------------------
INSERT INTO `watch_movement` VALUES ('68b11c01944e4a46987379120f3eb364', '机械', '0');
INSERT INTO `watch_movement` VALUES ('f88b6f807e5f412987363dfeaf54101a', '自动机械', '1');

-- ----------------------------
-- Table structure for watch_order
-- ----------------------------
DROP TABLE IF EXISTS `watch_order`;
CREATE TABLE `watch_order` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `order_state` varchar(1) DEFAULT NULL COMMENT '0-创建订单成功 1-支付成功 ，待发货 2-已发货 3-已收货 4-退货中5-退货成功6-交易完成',
  `order_trade_number` varchar(255) DEFAULT NULL COMMENT '交易号',
  `order_create_time` varchar(255) DEFAULT NULL COMMENT '订单创建时间',
  `order_pay_time` varchar(255) DEFAULT NULL COMMENT '订单支付时间',
  `order_send_time` varchar(255) DEFAULT NULL COMMENT '发货时间',
  `order_close_time` varchar(255) DEFAULT NULL COMMENT '订单完成时间',
  `order_all_price` int(64) DEFAULT NULL COMMENT '订单总价',
  `order_discount` int(64) DEFAULT NULL COMMENT '订单优惠金额',
  `order_send_price` int(64) DEFAULT NULL COMMENT '邮费',
  `order_get_name` varchar(255) DEFAULT NULL COMMENT '收货人',
  `order_get_address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `order_get_phone` varchar(255) DEFAULT NULL COMMENT '收货人电话',
  `del_flag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_order
-- ----------------------------
INSERT INTO `watch_order` VALUES ('1', '1231', '13123', null, '31313', '2018-9-3', '2019-8-2', '2018-9-2', '2017-3-3', '12', '12', '12', 'qeqeq', 'wdqw', '12312313', '0');
INSERT INTO `watch_order` VALUES ('1a45e9a32aa2447eaf594444726e12f0', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523338915229', '2', '1523354176695', '2018-04-10 13:41:55', '2018-04-10 17:56:16', '2018-04-10 17:56:16', null, '369', '0', '0', '1232', '123131', '3213', '0');
INSERT INTO `watch_order` VALUES ('1ec49578d3504b1490792e3a48be9f3b', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330784821', '0', '1523330784821', '2018-04-10 11:26:24', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('2493c7490875434e9c2be0b5d8a64f3d', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523328203135', '0', '1523328203136', '2018-04-10 10:43:23', null, null, null, '1107', '0', '0', '1232', '123131', '3213', '0');
INSERT INTO `watch_order` VALUES ('2b6fd07355b142138b749acf0a73ae08', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523329219422', '7', '1523353957693', '2018-04-10 11:00:19', '2018-04-10 17:52:37', '2018-04-10 17:52:37', null, '984', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('2dcae2d8f14b44ba90913aefc7623c00', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330112057', '0', '1523330112057', '2018-04-10 11:15:12', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('3038e1d883964f8ea6eea127d6833afc', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330722476', '0', '1523330722476', '2018-04-10 11:25:22', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('30bf176d4f9f48c58e9c1bd95086a4ed', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523339072700', '4', '1523352382585', '2018-04-10 13:44:32', '2018-04-10 17:26:22', '2018-04-10 17:26:22', null, '369', '0', '0', '1232', '123131', '3213', '0');
INSERT INTO `watch_order` VALUES ('349f811d94d945f9941d5d7d84c6008d', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523329984407', '0', '1523329984407', '2018-04-10 11:13:04', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('40bd0ae5d211403fa02cc82233b35a13', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523329554947', '0', '1523329554947', '2018-04-10 11:05:54', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('4179e1488578428b8a228323bc273324', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330566917', '6', '1523428566464', '2018-04-10 11:22:46', '2018-04-11 14:36:06', '2018-04-11 14:36:06', null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('444bfbbc419240fe86a26f85715b83c9', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523328909440', '2', '1523328909440', '2018-04-10 10:55:09', null, null, null, '984', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('46ee3e3ddfec4eb2abfbc096e972ac2c', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330823152', '0', '1523330823152', '2018-04-10 11:27:03', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('54c219b5b7da4259bc0f03980c4500a0', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523329131896', '0', '1523329131896', '2018-04-10 10:58:51', null, null, null, '984', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('5d3a94acdb0b45869cb5eb5cb143c7fa', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523329498547', '0', '1523329498547', '2018-04-10 11:04:58', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('6a0000662b754398ac088f0641ada872', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523328895318', '2', '1523328895318', '2018-04-10 10:54:55', null, null, null, '984', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('83d56579ca3143dfa827c90d9be68fe2', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523339095364', '0', '1523339095364', '2018-04-10 13:44:55', null, null, null, '369', '0', '0', '1232', '123131', '3213', '0');
INSERT INTO `watch_order` VALUES ('8c59be1ff9ba45c0b76cdd3c43f9b113', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523328869741', '0', '1523328869741', '2018-04-10 10:54:29', null, null, null, '984', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('8e8dc2dbe0914ed0b10a7694d78808df', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523431588826', '2', '1523431591853', '2018-04-11 15:26:28', '2018-04-11 15:26:31', '2018-04-11 15:26:31', null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('92588073212441b895f769453d12e3d9', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330705817', '0', '1523330705817', '2018-04-10 11:25:05', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('96a130eec3314a05b42fff111daa5ab4', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523328883311', '0', '1523328883311', '2018-04-10 10:54:43', null, null, null, '984', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('a0a15d9af20f4eba8a528bb679cd7943', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523329955440', '0', '1523329955440', '2018-04-10 11:12:35', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('a4dd1ce22a3a4bccad1bf29c992a9c45', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330673172', '0', '1523330673172', '2018-04-10 11:24:33', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('ac49448c90e343eebf2b57381f5e7cea', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523329687682', '0', '1523329687682', '2018-04-10 11:08:07', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('c7b671a2618c4eeeb9f85f12e34895aa', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523329656062', '0', '1523329656062', '2018-04-10 11:07:36', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('ce4a6f57b4c74f08a49c18f883606b1c', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523329592082', '0', '1523329592082', '2018-04-10 11:06:32', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('d108b604de584f5abda7beced759e2f0', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330754275', '0', '1523330754275', '2018-04-10 11:25:54', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('da89eaea29be4f3b8c537f8ad018b1e8', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330632817', '0', '1523330632817', '2018-04-10 11:23:52', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('e517f4b3f5a945e6b98b88818d928c6f', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330860208', '0', '1523330860208', '2018-04-10 11:27:40', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('e90d9036fa14427f8ece1e7edbcab280', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330580171', '0', '1523330580171', '2018-04-10 11:23:00', null, null, null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('f882a504f55640608e3deb09a56f83b9', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523328750207', '0', '1523328750207', '2018-04-10 10:52:30', null, null, null, '984', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('f8941932d69a4535b7bfeb9f29b18e85', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523330083577', '4', '1523412552161', '2018-04-10 11:14:43', '2018-04-11 10:09:12', '2018-04-11 10:09:12', null, '369', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '0');
INSERT INTO `watch_order` VALUES ('faeb4c95214243f0aecb4fb452a85c37', '7d1211b196dc4a8ab81a5a9a0ca90f4e', 'O1523329087331', '0', '1523329087331', '2018-04-10 10:58:07', null, null, null, '984', '0', '0', 'eqweqwe', '安达市达到', '1232136765756', '1');

-- ----------------------------
-- Table structure for watch_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `watch_order_detail`;
CREATE TABLE `watch_order_detail` (
  `id` varchar(64) NOT NULL,
  `order_id` varchar(64) DEFAULT NULL COMMENT '订单id',
  `watch_id` varchar(64) DEFAULT NULL COMMENT '手表id',
  `order_watch_serial_number` varchar(64) DEFAULT NULL COMMENT '手表序列号',
  `order_watch_title` varchar(255) DEFAULT NULL COMMENT '商品标题',
  `order_detail_old_price` varchar(64) DEFAULT NULL COMMENT '商品原价',
  `order_detail_discount_price` varchar(64) DEFAULT NULL COMMENT '优惠价格',
  `order_watch_number` int(64) DEFAULT NULL COMMENT '产品数量',
  `order_detail_picture` varchar(255) DEFAULT NULL COMMENT '产品主图',
  `order_detail_state` varchar(1) DEFAULT NULL COMMENT '订单产品详情状态：交易成功，退货',
  `order_detail_time` datetime DEFAULT NULL COMMENT '时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '评论',
  `del_flag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_order_detail
-- ----------------------------
INSERT INTO `watch_order_detail` VALUES ('044a66314cf9451bba95c881a7a66a2a', '46ee3e3ddfec4eb2abfbc096e972ac2c', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('0900289e6c0642899820f1a5e44ef4d5', 'ce4a6f57b4c74f08a49c18f883606b1c', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('0b663b2167d24b81911af1b11f430b18', '8e8dc2dbe0914ed0b10a7694d78808df', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Emotion情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-11 15:26:17', null, '0');
INSERT INTO `watch_order_detail` VALUES ('1', '1', '1', 'A001', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '1200', '999', '12', '132', '0', '2018-03-01 11:13:06', null, '0');
INSERT INTO `watch_order_detail` VALUES ('12d998ceae454842acf22e337dd06910', 'c7b671a2618c4eeeb9f85f12e34895aa', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('138375c1eee24fbbb28559f175b4d9fe', 'a0a15d9af20f4eba8a528bb679cd7943', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('14cc1ca0a91c4a18adeca8385bb4ee76', 'e90d9036fa14427f8ece1e7edbcab280', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('1d69e38e9b7347ab8bb2474a7ea0e096', 'da89eaea29be4f3b8c537f8ad018b1e8', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('2', '2', '2', 'A002', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '5335', '343', '10', '1231', '0', '2018-03-01 08:14:03', null, '0');
INSERT INTO `watch_order_detail` VALUES ('2a353b77a5a842e2926e57371d56d1dd', '30bf176d4f9f48c58e9c1bd95086a4ed', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '1', '2018-04-10 13:41:38', null, '0');
INSERT INTO `watch_order_detail` VALUES ('2cf391068d084a8e9fa03dac2eef5ae6', '83d56579ca3143dfa827c90d9be68fe2', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 13:41:37', null, '0');
INSERT INTO `watch_order_detail` VALUES ('3', '3', '1', 'A001', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '4244', null, '5', '123', '0', '2018-03-02 09:17:55', null, '0');
INSERT INTO `watch_order_detail` VALUES ('357fe93529a84a85995c8fc950a8ef1e', '6a0000662b754398ac088f0641ada872', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:23', null, '0');
INSERT INTO `watch_order_detail` VALUES ('367ad14fafab43f8aff003e02213f2fe', '444bfbbc419240fe86a26f85715b83c9', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:23', null, '0');
INSERT INTO `watch_order_detail` VALUES ('36dab19f98dc463696172c5956ed11c3', '3038e1d883964f8ea6eea127d6833afc', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('3afeec4b2f484a91a9bd25e846ea0cb0', '3038e1d883964f8ea6eea127d6833afc', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('3f3a71e219214539b88565f4c2938bdc', '444bfbbc419240fe86a26f85715b83c9', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:22', null, '0');
INSERT INTO `watch_order_detail` VALUES ('4', '4', '4', 'A004', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', null, null, '8', '2131', '0', '2018-03-03 11:15:11', null, '0');
INSERT INTO `watch_order_detail` VALUES ('4034b1348cb9495287738a2eb19bcd43', 'ac49448c90e343eebf2b57381f5e7cea', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('47d0ab0453d943d7bc5b67a9365b242a', 'ac49448c90e343eebf2b57381f5e7cea', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('49288f65985548ca8374595f3eeffd62', 'f882a504f55640608e3deb09a56f83b9', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:23', null, '0');
INSERT INTO `watch_order_detail` VALUES ('4955a8e52309466fbb55534921d85045', '5d3a94acdb0b45869cb5eb5cb143c7fa', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('5', '5', '2', 'A002', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', null, null, '7', '213', '0', '2018-03-03 11:16:10', null, '0');
INSERT INTO `watch_order_detail` VALUES ('5130f1f6f5744518a728607d9bc98da5', '2dcae2d8f14b44ba90913aefc7623c00', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('590c9c8252e949f3924acb05ef9541af', '30bf176d4f9f48c58e9c1bd95086a4ed', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '1', '2018-04-10 13:41:37', null, '0');
INSERT INTO `watch_order_detail` VALUES ('5c955d2f735b43f986ab26275ea500a2', 'a0a15d9af20f4eba8a528bb679cd7943', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('6', '6', '2', 'A002', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', null, null, '6', '312', '0', '2018-03-03 11:16:22', null, '0');
INSERT INTO `watch_order_detail` VALUES ('618784eb4d7a419a8ff850a796ad1d5a', '2493c7490875434e9c2be0b5d8a64f3d', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '5', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:43:02', null, '0');
INSERT INTO `watch_order_detail` VALUES ('623d67f2c91044cf8cb9971aca1a3ca4', '8c59be1ff9ba45c0b76cdd3c43f9b113', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:23', null, '0');
INSERT INTO `watch_order_detail` VALUES ('62f700041d12459e90a8c82823f2628e', 'da89eaea29be4f3b8c537f8ad018b1e8', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('66550472255148a0bdb1b9d5473369c2', 'faeb4c95214243f0aecb4fb452a85c37', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:22', null, '0');
INSERT INTO `watch_order_detail` VALUES ('677f0f82385943a8b1e1c2f9b5d65509', 'e517f4b3f5a945e6b98b88818d928c6f', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('7', '1', '2', 'A002', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '1231', '3131', '12', '31231', '0', '2018-04-04 22:38:00', null, '0');
INSERT INTO `watch_order_detail` VALUES ('712de373b2d5489a9fd36f5ccbac2b0a', '2493c7490875434e9c2be0b5d8a64f3d', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:43:01', null, '0');
INSERT INTO `watch_order_detail` VALUES ('71aae21464294b7abcf47b9e9c9c88d6', 'f882a504f55640608e3deb09a56f83b9', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:22', null, '0');
INSERT INTO `watch_order_detail` VALUES ('72c197ba4ddb4020b544f8ee07e22de5', '4179e1488578428b8a228323bc273324', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('7b78cb585dfb4f63bf7332c46dc9e31e', '92588073212441b895f769453d12e3d9', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('823cf2ded2ee40d8bbeca64d0ca3642a', 'faeb4c95214243f0aecb4fb452a85c37', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:23', null, '0');
INSERT INTO `watch_order_detail` VALUES ('857788aa594f424683fe79577a9e74cb', 'a4dd1ce22a3a4bccad1bf29c992a9c45', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('8d93eb4526524142a49254af27c56388', 'd108b604de584f5abda7beced759e2f0', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('9636c9d1968f45d88de3e52516ebf84d', 'd108b604de584f5abda7beced759e2f0', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('9a55c8fc45354eb8bba7106f7921c812', '2b6fd07355b142138b749acf0a73ae08', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:22', '这是一个真实的评论，第一个', '0');
INSERT INTO `watch_order_detail` VALUES ('9e131e5a557c4fbc8083f896188d6949', '4179e1488578428b8a228323bc273324', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('a0527c1e5eae41a8a5567b865c623eb9', '2b6fd07355b142138b749acf0a73ae08', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:23', '这是一个真实的评论，第二个', '0');
INSERT INTO `watch_order_detail` VALUES ('a3d8c4111259421da0b6ceae3becacae', '83d56579ca3143dfa827c90d9be68fe2', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 13:41:38', null, '0');
INSERT INTO `watch_order_detail` VALUES ('a5c8a66cb2d94dbc8c2cb3254aa27839', '92588073212441b895f769453d12e3d9', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('abb6b81f6a2e4b41845d24c33bd29369', '1a45e9a32aa2447eaf594444726e12f0', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 13:41:38', null, '0');
INSERT INTO `watch_order_detail` VALUES ('acf51cb3a13e43d7aff4b0557ce6dfc6', '6a0000662b754398ac088f0641ada872', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:22', null, '0');
INSERT INTO `watch_order_detail` VALUES ('b1c0c87982aa4bbeb351d8cfcc3acbab', '40bd0ae5d211403fa02cc82233b35a13', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('b3fadb2782a04a95ae2d32c1c950ff1d', 'ce4a6f57b4c74f08a49c18f883606b1c', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('b488198c607f48b1ad6568e2ed41020a', '349f811d94d945f9941d5d7d84c6008d', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('b5fe6fd77f3940679dc5c867216da26a', 'f8941932d69a4535b7bfeb9f29b18e85', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '1', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('c029d49c5a1e426fb01044c71bab86c2', '96a130eec3314a05b42fff111daa5ab4', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:23', null, '0');
INSERT INTO `watch_order_detail` VALUES ('c1393461b9674d8cb6d9e06bbc2202ef', '349f811d94d945f9941d5d7d84c6008d', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('c696b3cb858647fc8ff83df26a435c2f', '1a45e9a32aa2447eaf594444726e12f0', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 13:41:37', null, '0');
INSERT INTO `watch_order_detail` VALUES ('c738d06dc9214828954d207c58c2175d', 'e90d9036fa14427f8ece1e7edbcab280', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('c80e548ecf2f40cdb3892b9873c08f5e', '46ee3e3ddfec4eb2abfbc096e972ac2c', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('c8ecf8997aa3410699f91488194fb0da', '40bd0ae5d211403fa02cc82233b35a13', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('cd323cffb95649858668954c97d94e37', '54c219b5b7da4259bc0f03980c4500a0', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:23', null, '0');
INSERT INTO `watch_order_detail` VALUES ('d5624981e6db4b668b84be3517b7dd17', 'a4dd1ce22a3a4bccad1bf29c992a9c45', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('d7878b2fe59a442a9bc9aeeffe97679e', '54c219b5b7da4259bc0f03980c4500a0', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:22', null, '0');
INSERT INTO `watch_order_detail` VALUES ('d874c4dbb1f24730863911befbf63431', '8e8dc2dbe0914ed0b10a7694d78808df', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Emotion情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-11 15:26:17', null, '0');
INSERT INTO `watch_order_detail` VALUES ('daa011476ff34835b3b5c9ff18510e2b', '5d3a94acdb0b45869cb5eb5cb143c7fa', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('dc7051da3201463a915f2410d20f5ee9', '1ec49578d3504b1490792e3a48be9f3b', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('e4254a2cb357499fbe0e5c301ff16e26', 'f8941932d69a4535b7bfeb9f29b18e85', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '1', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('e4f9e7f54a304966a456908590fb5868', 'e517f4b3f5a945e6b98b88818d928c6f', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('e875f74ba9ca49dfb04a17d2bcbd3c68', '2dcae2d8f14b44ba90913aefc7623c00', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('f031a8d3c6d149998376faf3766225fd', 'c7b671a2618c4eeeb9f85f12e34895aa', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '1', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('f2c0e6140c384760aefaf1ff979ff475', '1ec49578d3504b1490792e3a48be9f3b', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '2', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 11:04:50', null, '0');
INSERT INTO `watch_order_detail` VALUES ('f9967e9f68634db4b71b1eec3afba7f8', '8c59be1ff9ba45c0b76cdd3c43f9b113', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:22', null, '0');
INSERT INTO `watch_order_detail` VALUES ('fc6a3456b563446cb08179090cf615d8', '96a130eec3314a05b42fff111daa5ab4', '09c10439c0fb425e8eba68396c593157', '42471', '瑞士艺术制表大师爱宝时（EPOS）-Weilihong情感系列', '123', null, '4', '6d9d6152d2c34471b84acf3f1644fd72.jpg', '0', '2018-04-10 10:52:22', null, '0');

-- ----------------------------
-- Table structure for watch_picture
-- ----------------------------
DROP TABLE IF EXISTS `watch_picture`;
CREATE TABLE `watch_picture` (
  `id` varchar(255) NOT NULL,
  `picture_src` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `picture_type` varchar(32) DEFAULT NULL COMMENT '图片类型',
  `picture_sort` varchar(32) DEFAULT NULL COMMENT '图片排序',
  `watch_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_picture
-- ----------------------------
INSERT INTO `watch_picture` VALUES ('19c65e83baae435482d68f9f44873029', 'c0fb7c1a6bc847b884eefd10c79f1d2a.jpg', null, '1', '09c10439c0fb425e8eba68396c593157');
INSERT INTO `watch_picture` VALUES ('1b797dfeaa1e45358c1cfcdb763e496b', '7c29e4c6511b4b5ea6f7f8bf76351abe.jpg', null, '2', '52b7fe3df22e483f976cec3e88b4216a');
INSERT INTO `watch_picture` VALUES ('24894e4df5a741eb8a8db9c595047bd2', 'fc76fd7e8b8b4db4ab8b3d2093aecabd.jpg', null, '3', '52b7fe3df22e483f976cec3e88b4216a');
INSERT INTO `watch_picture` VALUES ('4a7ca535e11e4ce79a0757363aa64f02', '6d9d6152d2c34471b84acf3f1644fd72.jpg', null, '0', '09c10439c0fb425e8eba68396c593157');
INSERT INTO `watch_picture` VALUES ('623fd70897d642089008b16fd680e927', '27e81f06b85e4854b22c7a83d4b2e3d0.jpg', null, '4', '52b7fe3df22e483f976cec3e88b4216a');
INSERT INTO `watch_picture` VALUES ('b136d022efbb408cba5e75598acb862f', '724a7b893de84c448975de285a7c4f05.jpg', null, '1', '52b7fe3df22e483f976cec3e88b4216a');
INSERT INTO `watch_picture` VALUES ('b929af59b8c341adab1be22371fa3a31', 'a6b62fcacb7c4a8ab74310b11263029a.jpg', null, '1', '0ad450ed108f4b388e55ed73527edd26');
INSERT INTO `watch_picture` VALUES ('c29c2b9807ed42d0af7a1b4f3affbb0b', 'd648b42426f84ff482f66b3cc181ea35.jpg', null, '3', '52b7fe3df22e483f976cec3e88b4216a');
INSERT INTO `watch_picture` VALUES ('f533116322254b069806529ace3534bc', 'eeaba00f28a848e185b3151bf2bd7548.jpg', null, '0', '0ad450ed108f4b388e55ed73527edd26');

-- ----------------------------
-- Table structure for watch_promotion
-- ----------------------------
DROP TABLE IF EXISTS `watch_promotion`;
CREATE TABLE `watch_promotion` (
  `id` varchar(64) NOT NULL,
  `promotion_name` varchar(255) DEFAULT NULL COMMENT '折扣内容',
  `promotion_discount` varchar(10) DEFAULT NULL COMMENT '折扣价格',
  `del_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_promotion
-- ----------------------------
