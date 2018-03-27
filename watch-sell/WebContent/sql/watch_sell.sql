/*
Navicat MySQL Data Transfer

Source Server         : jeesite
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : watch_sell

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-21 18:42:19
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
INSERT INTO `sys_menu` VALUES ('2', '', '订单', '20', '/a/back/d', '1', '0');
INSERT INTO `sys_menu` VALUES ('3', '', '图表化', '31', '/a/utu', '1', '1');
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
  `vip` varchar(64) DEFAULT NULL,
  `phone_num` varchar(64) DEFAULT NULL,
  `credits` int(10) DEFAULT NULL,
  `del_flag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1231', 'weilihong', '314cd370f3d2a9e88331f043a731029cf0ddea2bc67f4ef159950dae', '1510491769@qq.com', '1', '19940307', '2', 'vip1', '1231312321', '100', '0');
INSERT INTO `sys_user` VALUES ('1232', 'weiwei', '65de6c3f438bae0e4c7c27c15c770d6a0dfcade13bba5c421f131041', '123@qq.com', '1', '2018-03-15', '1', 'vip1', '33333333', '100', '0');
INSERT INTO `sys_user` VALUES ('7d1211b196dc4a8ab81a5a9a0ca90f4e', 'weilihong', '314cd370f3d2a9e88331f043a731029cf0ddea2bc67f4ef159950dae', '123', null, null, '0', null, null, null, '0');

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
INSERT INTO `watch` VALUES ('1', null, null, null, null, '测试', '测试', '测试', 'A111', '5000', '3800', '20', null, null, null, null, null, null, null, null, '0');

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
INSERT INTO `watch_brand` VALUES ('513a99ed2fd34953aafcb791f4705d3c', '卡西欧', '0');

-- ----------------------------
-- Table structure for watch_cart
-- ----------------------------
DROP TABLE IF EXISTS `watch_cart`;
CREATE TABLE `watch_cart` (
  `id` varchar(64) NOT NULL,
  `cart_price` int(255) DEFAULT NULL,
  `cart_product_number` int(64) DEFAULT NULL,
  `watch_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `del_flag` varchar(1) DEFAULT NULL,
  `cart_state` varchar(1) DEFAULT NULL COMMENT '购物车状态',
  `order_id` varchar(64) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watch_order
-- ----------------------------

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
