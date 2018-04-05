/*
Navicat MySQL Data Transfer

Source Server         : jeesite
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : watch_sell

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-05 23:18:29
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
INSERT INTO `sys_user` VALUES ('7d1211b196dc4a8ab81a5a9a0ca90f4e', 'weilihong', '314cd370f3d2a9e88331f043a731029cf0ddea2bc67f4ef159950dae', '123', null, null, '0', 'vip1', null, '0', '0');

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
INSERT INTO `watch` VALUES ('09c10439c0fb425e8eba68396c593157', '061176832eac40748777ea2f38db6306', 'e90ae503f730422484d1e54bea867cac', '68b11c01944e4a46987379120f3eb364', null, 'test', '123', '123', '123', '123', '123', '123', '123', '123', '131', '31', '2131', '1231', '3132123', '132131', '0');
INSERT INTO `watch` VALUES ('0ad450ed108f4b388e55ed73527edd26', '13b900fef0bd4a7c8ab0904a5169e7ff', 'e870b42bbfe04ee9b152065c211a9fe2', '68b11c01944e4a46987379120f3eb364', null, '12313', '121', '123123', '1231', '31231', '31313', '3131', '313', '313', '3131', '313', '3131', '313123', '1312', '3131', '0');
INSERT INTO `watch` VALUES ('1', null, null, null, null, '测试', '测试', '测试', 'A111', '5000', '3800', '20', null, null, null, null, null, null, null, null, '0');
INSERT INTO `watch` VALUES ('17e804749e1543a89f8af516c5afa753', '13b900fef0bd4a7c8ab0904a5169e7ff', 'e870b42bbfe04ee9b152065c211a9fe2', '68b11c01944e4a46987379120f3eb364', null, '瑞士艺术制表大师爱宝时（EPOS）-Emotion情感系列 罗马假期-水蓝版 3390.152.20.16.25 机械男表', '3390.152.20.16.25', '褐尽繁华 保留腕表原始的魅力 渐变太阳纹表盘 简约 不简单', '42471', '5800', '5600', '100', 'ETA 2892-A2', 'ETA 2892-A2', '表盘宽度41mm 表盘厚度9mm 表耳20mm 纵向表耳间距50mm 蓝色', '牛皮 黑色', '针扣', '2014年', '200g', '50米', '0');
INSERT INTO `watch` VALUES ('52b7fe3df22e483f976cec3e88b4216a', '1d746af421c44d8b98ecbd71a4b09359', 'e870b42bbfe04ee9b152065c211a9fe2', '68b11c01944e4a46987379120f3eb364', null, '瑞士艺术制表大师爱宝时（EPOS）-Originale原创系列', '3408.208.24.10.15', '唯有超一流的工艺加上坚持不懈的创作方可成就这一精品超薄腕表', '25502', '16000', '14000', '100', '13213', '13213', '3123', '313', '31231', '31231', '1231', '1323', '0');

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
  `cart_product_number` int(64) DEFAULT NULL,
  `cart_create_time` varchar(64) DEFAULT NULL COMMENT '购物车创建时间',
  `cart_state` varchar(1) DEFAULT NULL COMMENT '购物车状态',
  `watch_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `del_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_cart
-- ----------------------------

-- ----------------------------
-- Table structure for watch_comment
-- ----------------------------
DROP TABLE IF EXISTS `watch_comment`;
CREATE TABLE `watch_comment` (
  `id` varchar(64) NOT NULL,
  `comment_content` varchar(600) DEFAULT NULL COMMENT '评论内容',
  `comment_answer` varchar(600) DEFAULT NULL COMMENT '回复内容',
  `user_name` varchar(255) DEFAULT NULL COMMENT '评论的用户名',
  `user_id` varchar(64) DEFAULT NULL,
  `watch_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_comment
-- ----------------------------

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
INSERT INTO `watch_order` VALUES ('1', '1231', '13123', '31313', '2018-9-3', '2019-8-2', '2018-9-2', '2017-3-3', '12', '12', '12', 'qeqeq', 'wdqw', '12312313', '0');

-- ----------------------------
-- Table structure for watch_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `watch_order_detail`;
CREATE TABLE `watch_order_detail` (
  `id` varchar(64) NOT NULL,
  `order_id` varchar(64) DEFAULT NULL COMMENT '订单id',
  `watch_id` varchar(64) DEFAULT NULL COMMENT '手表id',
  `order_watch_serial_number` varchar(64) DEFAULT NULL COMMENT '手表序列号',
  `order_detail_old_price` varchar(64) DEFAULT NULL COMMENT '商品原价',
  `order_detail_discount_price` varchar(64) DEFAULT NULL COMMENT '优惠价格',
  `order_watch_number` int(64) DEFAULT NULL COMMENT '产品数量',
  `order_detail_picture` varchar(255) DEFAULT NULL COMMENT '产品主图',
  `order_detail_state` varchar(1) DEFAULT NULL COMMENT '订单产品详情状态：交易成功，退货',
  `order_detail_time` datetime DEFAULT NULL COMMENT '时间',
  `del_flag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_order_detail
-- ----------------------------
INSERT INTO `watch_order_detail` VALUES ('1', '1', '1', 'A001', '1200', '999', '12', '132', '0', '2018-03-01 11:13:06', '0');
INSERT INTO `watch_order_detail` VALUES ('2', '2', '2', 'A002', '5335', '343', '10', '1231', '0', '2018-03-01 08:14:03', '0');
INSERT INTO `watch_order_detail` VALUES ('3', '3', '1', 'A001', '4244', null, '5', '123', '0', '2018-03-02 09:17:55', '0');
INSERT INTO `watch_order_detail` VALUES ('4', '4', '4', 'A004', null, null, '8', '2131', '0', '2018-03-03 11:15:11', '0');
INSERT INTO `watch_order_detail` VALUES ('5', '5', '2', 'A002', null, null, '7', '213', '0', '2018-03-03 11:16:10', '0');
INSERT INTO `watch_order_detail` VALUES ('6', '6', '2', 'A002', null, null, '6', '312', '0', '2018-03-03 11:16:22', '0');
INSERT INTO `watch_order_detail` VALUES ('7', '1', '2', 'A002', '1231', '3131', '12', '31231', '0', '2018-04-04 22:38:00', '0');

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
INSERT INTO `watch_picture` VALUES ('19c65e83baae435482d68f9f44873029', 'c0fb7c1a6bc847b884eefd10c79f1d2a.jpg', null, '2', '0ad450ed108f4b388e55ed73527edd26');
INSERT INTO `watch_picture` VALUES ('1b797dfeaa1e45358c1cfcdb763e496b', '7c29e4c6511b4b5ea6f7f8bf76351abe.jpg', null, '2', '52b7fe3df22e483f976cec3e88b4216a');
INSERT INTO `watch_picture` VALUES ('24894e4df5a741eb8a8db9c595047bd2', 'fc76fd7e8b8b4db4ab8b3d2093aecabd.jpg', null, '3', '52b7fe3df22e483f976cec3e88b4216a');
INSERT INTO `watch_picture` VALUES ('4a7ca535e11e4ce79a0757363aa64f02', '6d9d6152d2c34471b84acf3f1644fd72.jpg', null, '3', '17e804749e1543a89f8af516c5afa753');
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
