-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-11-16 23:58:52
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `huimin2`
--

-- --------------------------------------------------------

--
-- 表的结构 `address_list`
--

CREATE TABLE `address_list` (
  `id` int(11) NOT NULL COMMENT '唯一编号',
  `userid` int(11) NOT NULL COMMENT '用户id',
  `name` text NOT NULL COMMENT '收货名字',
  `phone` char(11) NOT NULL COMMENT '联系手机',
  `address` text NOT NULL COMMENT '用户地址',
  `isdefault` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认 1为默认'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `address_list`
--

INSERT INTO `address_list` (`id`, `userid`, `name`, `phone`, `address`, `isdefault`) VALUES
(1, 10000, '张三', '13838383388', '张三的家', 0),
(2, 10000, '李四', '19099889988', '李四的家', 1);

-- --------------------------------------------------------

--
-- 表的结构 `comment_list`
--

CREATE TABLE `comment_list` (
  `id` int(11) NOT NULL COMMENT '评论编号',
  `type` int(11) NOT NULL COMMENT '评论类型 （1新闻，2讨论，3商品）',
  `typeid` int(11) NOT NULL COMMENT '所属编号',
  `userid` int(11) NOT NULL COMMENT '发表用户编号',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '评论内容',
  `date` int(11) NOT NULL COMMENT '发布时间',
  `zan` int(11) NOT NULL DEFAULT '0' COMMENT '点赞',
  `cai` int(11) NOT NULL DEFAULT '0' COMMENT '点踩'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `comment_list`
--

INSERT INTO `comment_list` (`id`, `type`, `typeid`, `userid`, `content`, `date`, `zan`, `cai`) VALUES
(32, 3, 37, 10000, '太好了这个商品，，，', 1698994817, 0, 0),
(23, 3, 37, 10000, '太好吃了', 1698947410, 0, 0),
(24, 3, 37, 10000, '前无古人，后无来者', 1698947536, 0, 0),
(64, 3, 37, 10000, 'aaaaaaaaaaaaaa', 1699282476, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `db_bk`
--

CREATE TABLE `db_bk` (
  `id` int(11) NOT NULL COMMENT '唯一编号',
  `title` char(20) NOT NULL COMMENT '板块名称',
  `icon_type` tinyint(1) NOT NULL COMMENT '图标类型',
  `icon_name` char(100) NOT NULL COMMENT '板块图标'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='板块列表';

--
-- 转存表中的数据 `db_bk`
--

INSERT INTO `db_bk` (`id`, `title`, `icon_type`, `icon_name`) VALUES
(1, '农用产品', 1, 'icon icon-yewu_zhuchangyunyingguanli'),
(2, '家畜养殖', 1, 'icon icon-yewu_zhu'),
(3, '疫苗用药', 1, 'icon icon-yewu_mianyi'),
(4, '学习更多', 1, 'icon icon-yewu_kechengxuexi'),
(5, '新闻公告', 2, 'newspaper-o'),
(6, '互惠奖章', 2, 'award-o'),
(7, '礼品专区', 2, 'gift-o'),
(8, '客服服务', 2, 'ervice-o');

-- --------------------------------------------------------

--
-- 表的结构 `db_bk_list`
--

CREATE TABLE `db_bk_list` (
  `id` int(11) NOT NULL COMMENT '唯一编号',
  `_bk` int(11) NOT NULL COMMENT '所属板块'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `db_bk_list`
--

INSERT INTO `db_bk_list` (`id`, `_bk`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `db_shop`
--

CREATE TABLE `db_shop` (
  `id` int(11) NOT NULL COMMENT '唯一编号',
  `shop_image` text NOT NULL COMMENT '商品封面',
  `shop_uid` int(11) NOT NULL COMMENT '商品编号',
  `shop_name` text NOT NULL COMMENT '商品名称',
  `shop_desc` text NOT NULL COMMENT '商品描述',
  `shop_price` double NOT NULL COMMENT '商品价格',
  `shop_user` int(11) NOT NULL COMMENT '发布用户'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `db_shop`
--

INSERT INTO `db_shop` (`id`, `shop_image`, `shop_uid`, `shop_name`, `shop_desc`, `shop_price`, `shop_user`) VALUES
(1, '', 1, '测试商品', '', 200.99, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dingdan`
--

CREATE TABLE `dingdan` (
  `id` int(11) NOT NULL COMMENT '唯一编号',
  `shop` text NOT NULL COMMENT '购买的商品',
  `userid` int(11) NOT NULL COMMENT '购买的用户',
  `address` text NOT NULL COMMENT '地址',
  `time` int(11) NOT NULL COMMENT '购买时间',
  `price` text NOT NULL COMMENT '物品单价',
  `count` int(11) NOT NULL COMMENT '物品数量',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态 0待发货，1已发货，2待收货，3订单完成'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dingdan`
--

INSERT INTO `dingdan` (`id`, `shop`, `userid`, `address`, `time`, `price`, `count`, `state`) VALUES
(47, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"1\",\"userid\":\"10000\",\"name\":\"u5f20u4e09\",\"phone\":\"13838383388\",\"address\":\"u5f20u4e09u7684u5bb6\",\"isdefault\":\"0\"}', 1699189152, '177.60', 2, 0),
(46, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699188385, '177.60', 2, 0),
(45, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699188383, '177.60', 2, 0),
(44, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699188380, '177.60', 2, 0),
(43, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699188350, '177.60', 2, 0),
(42, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699188347, '177.60', 2, 0),
(41, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699188344, '177.60', 2, 0),
(40, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699188332, '177.60', 2, 0),
(39, '[{\"checked\":true,\"count\":1,\"price\":\"78.8\",\"shop\":{\"id\":\"28\",\"shop_type\":\"1\",\"shop_name\":\"u987au4e30u798fu5efau5976u6cb9u7ea2u5fc3u82adu4e509u65a4u5b55u5987u6c34u679cu8f6fu5fc3u756au77f3u69b4u80edu8102u7ea2u65b0u9c9cu5df4u4e50u6574u7bb15\",\"shop_content\":\"u54c1u724cuff1au6797u54c7u7cfbu5217uff1au7ea2u5fc3u82adu4e50u89c4u683cuff1au7cbeu9009u5927u679c\r\n\",\"shop_price\":\"78.8\",\"shop_count\":\"3597\",\"_tid\":\"0\",\"images\":[{\"id\":\"69\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1573278347.png\"},{\"id\":\"70\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1541873276.png\"},{\"id\":\"71\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1664487910.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"78.8\",\"shop\":{\"id\":\"28\",\"shop_type\":\"1\",\"shop_name\":\"u987au4e30u798fu5efau5976u6cb9u7ea2u5fc3u82adu4e509u65a4u5b55u5987u6c34u679cu8f6fu5fc3u756au77f3u69b4u80edu8102u7ea2u65b0u9c9cu5df4u4e50u6574u7bb15\",\"shop_content\":\"u54c1u724cuff1au6797u54c7u7cfbu5217uff1au7ea2u5fc3u82adu4e50u89c4u683cuff1au7cbeu9009u5927u679c\r\n\",\"shop_price\":\"78.8\",\"shop_count\":\"3597\",\"_tid\":\"0\",\"images\":[{\"id\":\"69\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1573278347.png\"},{\"id\":\"70\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1541873276.png\"},{\"id\":\"71\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1664487910.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699188042, '945.60', 2, 0),
(38, '[{\"checked\":true,\"count\":1,\"price\":\"78.8\",\"shop\":{\"id\":\"28\",\"shop_type\":\"1\",\"shop_name\":\"u987au4e30u798fu5efau5976u6cb9u7ea2u5fc3u82adu4e509u65a4u5b55u5987u6c34u679cu8f6fu5fc3u756au77f3u69b4u80edu8102u7ea2u65b0u9c9cu5df4u4e50u6574u7bb15\",\"shop_content\":\"u54c1u724cuff1au6797u54c7u7cfbu5217uff1au7ea2u5fc3u82adu4e50u89c4u683cuff1au7cbeu9009u5927u679c\r\n\",\"shop_price\":\"78.8\",\"shop_count\":\"3597\",\"_tid\":\"0\",\"images\":[{\"id\":\"69\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1573278347.png\"},{\"id\":\"70\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1541873276.png\"},{\"id\":\"71\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1664487910.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"78.8\",\"shop\":{\"id\":\"28\",\"shop_type\":\"1\",\"shop_name\":\"u987au4e30u798fu5efau5976u6cb9u7ea2u5fc3u82adu4e509u65a4u5b55u5987u6c34u679cu8f6fu5fc3u756au77f3u69b4u80edu8102u7ea2u65b0u9c9cu5df4u4e50u6574u7bb15\",\"shop_content\":\"u54c1u724cuff1au6797u54c7u7cfbu5217uff1au7ea2u5fc3u82adu4e50u89c4u683cuff1au7cbeu9009u5927u679c\r\n\",\"shop_price\":\"78.8\",\"shop_count\":\"3597\",\"_tid\":\"0\",\"images\":[{\"id\":\"69\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1573278347.png\"},{\"id\":\"70\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1541873276.png\"},{\"id\":\"71\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1664487910.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699187572, '945.60', 2, 0),
(37, '[{\"checked\":true,\"count\":1,\"price\":\"78.8\",\"shop\":{\"id\":\"28\",\"shop_type\":\"1\",\"shop_name\":\"u987au4e30u798fu5efau5976u6cb9u7ea2u5fc3u82adu4e509u65a4u5b55u5987u6c34u679cu8f6fu5fc3u756au77f3u69b4u80edu8102u7ea2u65b0u9c9cu5df4u4e50u6574u7bb15\",\"shop_content\":\"u54c1u724cuff1au6797u54c7u7cfbu5217uff1au7ea2u5fc3u82adu4e50u89c4u683cuff1au7cbeu9009u5927u679c\r\n\",\"shop_price\":\"78.8\",\"shop_count\":\"3597\",\"_tid\":\"0\",\"images\":[{\"id\":\"69\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1573278347.png\"},{\"id\":\"70\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1541873276.png\"},{\"id\":\"71\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1664487910.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"78.8\",\"shop\":{\"id\":\"28\",\"shop_type\":\"1\",\"shop_name\":\"u987au4e30u798fu5efau5976u6cb9u7ea2u5fc3u82adu4e509u65a4u5b55u5987u6c34u679cu8f6fu5fc3u756au77f3u69b4u80edu8102u7ea2u65b0u9c9cu5df4u4e50u6574u7bb15\",\"shop_content\":\"u54c1u724cuff1au6797u54c7u7cfbu5217uff1au7ea2u5fc3u82adu4e50u89c4u683cuff1au7cbeu9009u5927u679c\r\n\",\"shop_price\":\"78.8\",\"shop_count\":\"3597\",\"_tid\":\"0\",\"images\":[{\"id\":\"69\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1573278347.png\"},{\"id\":\"70\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1541873276.png\"},{\"id\":\"71\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1664487910.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699187539, '945.60', 2, 0),
(36, '[{\"checked\":true,\"count\":1,\"price\":\"78.8\",\"shop\":{\"id\":\"28\",\"shop_type\":\"1\",\"shop_name\":\"u987au4e30u798fu5efau5976u6cb9u7ea2u5fc3u82adu4e509u65a4u5b55u5987u6c34u679cu8f6fu5fc3u756au77f3u69b4u80edu8102u7ea2u65b0u9c9cu5df4u4e50u6574u7bb15\",\"shop_content\":\"u54c1u724cuff1au6797u54c7u7cfbu5217uff1au7ea2u5fc3u82adu4e50u89c4u683cuff1au7cbeu9009u5927u679c\r\n\",\"shop_price\":\"78.8\",\"shop_count\":\"3597\",\"_tid\":\"0\",\"images\":[{\"id\":\"69\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1573278347.png\"},{\"id\":\"70\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1541873276.png\"},{\"id\":\"71\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1664487910.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"78.8\",\"shop\":{\"id\":\"28\",\"shop_type\":\"1\",\"shop_name\":\"u987au4e30u798fu5efau5976u6cb9u7ea2u5fc3u82adu4e509u65a4u5b55u5987u6c34u679cu8f6fu5fc3u756au77f3u69b4u80edu8102u7ea2u65b0u9c9cu5df4u4e50u6574u7bb15\",\"shop_content\":\"u54c1u724cuff1au6797u54c7u7cfbu5217uff1au7ea2u5fc3u82adu4e50u89c4u683cuff1au7cbeu9009u5927u679c\r\n\",\"shop_price\":\"78.8\",\"shop_count\":\"3597\",\"_tid\":\"0\",\"images\":[{\"id\":\"69\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1573278347.png\"},{\"id\":\"70\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1541873276.png\"},{\"id\":\"71\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1664487910.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699186391, '945.60', 2, 0),
(48, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"1\",\"userid\":\"10000\",\"name\":\"u5f20u4e09\",\"phone\":\"13838383388\",\"address\":\"u5f20u4e09u7684u5bb6\",\"isdefault\":\"0\"}', 1699189985, '177.60', 2, 0),
(49, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":11,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"1\",\"userid\":\"10000\",\"name\":\"u5f20u4e09\",\"phone\":\"13838383388\",\"address\":\"u5f20u4e09u7684u5bb6\",\"isdefault\":\"0\"}', 1699190011, '177.60', 2, 0),
(50, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":4,\"price\":\"36.68\",\"shop\":{\"id\":\"40\",\"shop_type\":\"1\",\"shop_name\":\"u4e1cu5317u7279u4ea7u9e21u5fc3u679cu5e94u5b63u6c34u679cu65b0u9c9cu5c0fu6c99u679cu6d77u68e0u679cu73b0u6458u73b0u53d1u5c0fu82f9u679cu6574u7bb1u5305u90ae \",\"shop_content\":\"u54c1u724c: u9e21u5fc3u679c u7cfbu5217: u9e21u5fc3u679c u4ea7u5730: u4e2du56fdu5927u9646\r\nu7701u4efd: u8fbdu5b81u7701 u57ceu5e02: u978du5c71u5e02\",\"shop_price\":\"36.68\",\"shop_count\":\"256\",\"_tid\":\"0\",\"images\":[{\"id\":\"102\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1622410592.png\"},{\"id\":\"103\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1582182149.png\"},{\"id\":\"104\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1507763055.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":5,\"price\":\"24.8\",\"shop\":{\"id\":\"36\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu9ed1u76aeu7518u8517u65b0u9c9cu8106u751cu6c34u679c9u65a4u5e94u5f53u5b63u6c34u679cu7279u4ea7u73b0u780du6574u6839u751cu6574u7bb1u5305u90ae \",\"shop_content\":\"u4ea7u5730: u4e2du56fdu5927u9646 u7701u4efd: u5e7fu897fu58eeu65cfu81eau6cbbu533a u57ceu5e02: u5357u5b81u5e02\r\nu5305u88c5u65b9u5f0f: u98dfu7528u519cu4ea7u54c1 u6c34u679cu79cdu7c7b: u7518u8517\",\"shop_price\":\"24.8\",\"shop_count\":\"959\",\"_tid\":\"0\",\"images\":[{\"id\":\"90\",\"shop_id\":\"36\",\"img\":\"/uploads/images/shop/1698891727_1451765766.png\"},{\"id\":\"91\",\"shop_id\":\"36\",\"img\":\"/uploads/images/shop/1698891727_1516894479.png\"},{\"id\":\"92\",\"shop_id\":\"36\",\"img\":\"/uploads/images/shop/1698891727_1681880168.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699191002, '285.52', 3, 0),
(51, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":4,\"price\":\"36.68\",\"shop\":{\"id\":\"40\",\"shop_type\":\"1\",\"shop_name\":\"u4e1cu5317u7279u4ea7u9e21u5fc3u679cu5e94u5b63u6c34u679cu65b0u9c9cu5c0fu6c99u679cu6d77u68e0u679cu73b0u6458u73b0u53d1u5c0fu82f9u679cu6574u7bb1u5305u90ae \",\"shop_content\":\"u54c1u724c: u9e21u5fc3u679c u7cfbu5217: u9e21u5fc3u679c u4ea7u5730: u4e2du56fdu5927u9646\r\nu7701u4efd: u8fbdu5b81u7701 u57ceu5e02: u978du5c71u5e02\",\"shop_price\":\"36.68\",\"shop_count\":\"256\",\"_tid\":\"0\",\"images\":[{\"id\":\"102\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1622410592.png\"},{\"id\":\"103\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1582182149.png\"},{\"id\":\"104\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1507763055.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":5,\"price\":\"24.8\",\"shop\":{\"id\":\"36\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu9ed1u76aeu7518u8517u65b0u9c9cu8106u751cu6c34u679c9u65a4u5e94u5f53u5b63u6c34u679cu7279u4ea7u73b0u780du6574u6839u751cu6574u7bb1u5305u90ae \",\"shop_content\":\"u4ea7u5730: u4e2du56fdu5927u9646 u7701u4efd: u5e7fu897fu58eeu65cfu81eau6cbbu533a u57ceu5e02: u5357u5b81u5e02\r\nu5305u88c5u65b9u5f0f: u98dfu7528u519cu4ea7u54c1 u6c34u679cu79cdu7c7b: u7518u8517\",\"shop_price\":\"24.8\",\"shop_count\":\"959\",\"_tid\":\"0\",\"images\":[{\"id\":\"90\",\"shop_id\":\"36\",\"img\":\"/uploads/images/shop/1698891727_1451765766.png\"},{\"id\":\"91\",\"shop_id\":\"36\",\"img\":\"/uploads/images/shop/1698891727_1516894479.png\"},{\"id\":\"92\",\"shop_id\":\"36\",\"img\":\"/uploads/images/shop/1698891727_1681880168.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699191397, '285.52', 3, 0),
(52, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699280951, '14.80', 1, 0),
(53, '[{\"checked\":true,\"count\":6,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699282793, '88.80', 1, 0),
(54, '[{\"checked\":true,\"count\":6,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699284099, '88.80', 1, 0),
(55, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699284198, '14.80', 1, 0),
(56, '[{\"checked\":true,\"count\":6,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699284218, '88.80', 1, 0),
(57, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"1\",\"userid\":\"10000\",\"name\":\"u5f20u4e09\",\"phone\":\"13838383388\",\"address\":\"u5f20u4e09u7684u5bb6\",\"isdefault\":\"0\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699998500, '14.80', 1, 0),
(58, '[{\"checked\":true,\"count\":4,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"1\",\"userid\":\"10000\",\"name\":\"u5f20u4e09\",\"phone\":\"13838383388\",\"address\":\"u5f20u4e09u7684u5bb6\",\"isdefault\":\"0\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1699998539, '74.00', 2, 0),
(59, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":1,\"price\":\"78.8\",\"shop\":{\"id\":\"28\",\"shop_type\":\"1\",\"shop_name\":\"u987au4e30u798fu5efau5976u6cb9u7ea2u5fc3u82adu4e509u65a4u5b55u5987u6c34u679cu8f6fu5fc3u756au77f3u69b4u80edu8102u7ea2u65b0u9c9cu5df4u4e50u6574u7bb15\",\"shop_content\":\"u54c1u724cuff1au6797u54c7u7cfbu5217uff1au7ea2u5fc3u82adu4e50u89c4u683cuff1au7cbeu9009u5927u679c\r\n\",\"shop_price\":\"78.8\",\"shop_count\":\"3597\",\"_tid\":\"0\",\"images\":[{\"id\":\"69\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1573278347.png\"},{\"id\":\"70\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1541873276.png\"},{\"id\":\"71\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1664487910.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":1,\"price\":\"36.68\",\"shop\":{\"id\":\"40\",\"shop_type\":\"1\",\"shop_name\":\"u4e1cu5317u7279u4ea7u9e21u5fc3u679cu5e94u5b63u6c34u679cu65b0u9c9cu5c0fu6c99u679cu6d77u68e0u679cu73b0u6458u73b0u53d1u5c0fu82f9u679cu6574u7bb1u5305u90ae \",\"shop_content\":\"u54c1u724c: u9e21u5fc3u679c u7cfbu5217: u9e21u5fc3u679c u4ea7u5730: u4e2du56fdu5927u9646\r\nu7701u4efd: u8fbdu5b81u7701 u57ceu5e02: u978du5c71u5e02\",\"shop_price\":\"36.68\",\"shop_count\":\"256\",\"_tid\":\"0\",\"images\":[{\"id\":\"102\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1622410592.png\"},{\"id\":\"103\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1582182149.png\"},{\"id\":\"104\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1507763055.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1700092649, '130.28', 3, 0);
INSERT INTO `dingdan` (`id`, `shop`, `userid`, `address`, `time`, `price`, `count`, `state`) VALUES
(60, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":1,\"price\":\"78.8\",\"shop\":{\"id\":\"28\",\"shop_type\":\"1\",\"shop_name\":\"u987au4e30u798fu5efau5976u6cb9u7ea2u5fc3u82adu4e509u65a4u5b55u5987u6c34u679cu8f6fu5fc3u756au77f3u69b4u80edu8102u7ea2u65b0u9c9cu5df4u4e50u6574u7bb15\",\"shop_content\":\"u54c1u724cuff1au6797u54c7u7cfbu5217uff1au7ea2u5fc3u82adu4e50u89c4u683cuff1au7cbeu9009u5927u679c\r\n\",\"shop_price\":\"78.8\",\"shop_count\":\"3597\",\"_tid\":\"0\",\"images\":[{\"id\":\"69\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1573278347.png\"},{\"id\":\"70\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1541873276.png\"},{\"id\":\"71\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1664487910.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":1,\"price\":\"36.68\",\"shop\":{\"id\":\"40\",\"shop_type\":\"1\",\"shop_name\":\"u4e1cu5317u7279u4ea7u9e21u5fc3u679cu5e94u5b63u6c34u679cu65b0u9c9cu5c0fu6c99u679cu6d77u68e0u679cu73b0u6458u73b0u53d1u5c0fu82f9u679cu6574u7bb1u5305u90ae \",\"shop_content\":\"u54c1u724c: u9e21u5fc3u679c u7cfbu5217: u9e21u5fc3u679c u4ea7u5730: u4e2du56fdu5927u9646\r\nu7701u4efd: u8fbdu5b81u7701 u57ceu5e02: u978du5c71u5e02\",\"shop_price\":\"36.68\",\"shop_count\":\"256\",\"_tid\":\"0\",\"images\":[{\"id\":\"102\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1622410592.png\"},{\"id\":\"103\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1582182149.png\"},{\"id\":\"104\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1507763055.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1700092668, '130.28', 3, 0),
(61, '[{\"checked\":true,\"count\":1,\"price\":\"14.8\",\"shop\":{\"id\":\"37\",\"shop_type\":\"1\",\"shop_name\":\"u5e7fu897fu6b66u9e23u6c83u67d110u65a4u65b0u9c9cu6c34u679cu5f53u5b63u6574u7bb1u6c99u7cd6u871cu6a58u7802u7cd6u67d1u6a58u6854u5b50u6a58u5b505u65a4\",\"shop_content\":\"u54c1u724cuff1au84ddu541bu7cfbu5217uff1au65b0u9c9cu6c83u67d1 u4ea7u5730uff1au4e2du56fdu5927u9646u7701u4efduff1au5e7fu897fu58eeu65cfu81eau6cbbu533au57ceu5e02uff1au5357u5b81u5e02\",\"shop_price\":\"14.8\",\"shop_count\":\"652\",\"_tid\":\"0\",\"images\":[{\"id\":\"93\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1655684314.png\"},{\"id\":\"94\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1672969130.png\"},{\"id\":\"95\",\"shop_id\":\"37\",\"img\":\"/uploads/images/shop/1698891946_1593675809.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":1,\"price\":\"78.8\",\"shop\":{\"id\":\"28\",\"shop_type\":\"1\",\"shop_name\":\"u987au4e30u798fu5efau5976u6cb9u7ea2u5fc3u82adu4e509u65a4u5b55u5987u6c34u679cu8f6fu5fc3u756au77f3u69b4u80edu8102u7ea2u65b0u9c9cu5df4u4e50u6574u7bb15\",\"shop_content\":\"u54c1u724cuff1au6797u54c7u7cfbu5217uff1au7ea2u5fc3u82adu4e50u89c4u683cuff1au7cbeu9009u5927u679c\r\n\",\"shop_price\":\"78.8\",\"shop_count\":\"3597\",\"_tid\":\"0\",\"images\":[{\"id\":\"69\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1573278347.png\"},{\"id\":\"70\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1541873276.png\"},{\"id\":\"71\",\"shop_id\":\"28\",\"img\":\"/uploads/images/shop/1698889816_1664487910.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}},{\"checked\":true,\"count\":1,\"price\":\"36.68\",\"shop\":{\"id\":\"40\",\"shop_type\":\"1\",\"shop_name\":\"u4e1cu5317u7279u4ea7u9e21u5fc3u679cu5e94u5b63u6c34u679cu65b0u9c9cu5c0fu6c99u679cu6d77u68e0u679cu73b0u6458u73b0u53d1u5c0fu82f9u679cu6574u7bb1u5305u90ae \",\"shop_content\":\"u54c1u724c: u9e21u5fc3u679c u7cfbu5217: u9e21u5fc3u679c u4ea7u5730: u4e2du56fdu5927u9646\r\nu7701u4efd: u8fbdu5b81u7701 u57ceu5e02: u978du5c71u5e02\",\"shop_price\":\"36.68\",\"shop_count\":\"256\",\"_tid\":\"0\",\"images\":[{\"id\":\"102\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1622410592.png\"},{\"id\":\"103\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1582182149.png\"},{\"id\":\"104\",\"shop_id\":\"40\",\"img\":\"/uploads/images/shop/1698892230_1507763055.png\"}]},\"address\":{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}}]', 10000, '{\"id\":\"2\",\"userid\":\"10000\",\"name\":\"u674eu56db\",\"phone\":\"19099889988\",\"address\":\"u674eu56dbu7684u5bb6\",\"isdefault\":\"1\"}', 1700092686, '130.28', 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `forum_images`
--

CREATE TABLE `forum_images` (
  `id` int(11) NOT NULL COMMENT '唯一编号',
  `img` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '图片路径',
  `forumid` int(11) NOT NULL COMMENT '帖子编号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `forum_images`
--

INSERT INTO `forum_images` (`id`, `img`, `forumid`) VALUES
(63, '/uploads/images/forum/1698937438_1603816308.png', 77),
(62, '/uploads/images/forum/1698937280_1539646941.png', 76),
(68, '/uploads/images/forum/1698937964_1644448180.png', 82),
(60, '/uploads/images/forum/1698890625_1514884423.png', 74),
(67, '/uploads/images/forum/1698937844_1547678285.png', 81),
(66, '/uploads/images/forum/1698937776_1665297122.png', 80),
(65, '/uploads/images/forum/1698937709_1421596322.png', 79),
(64, '/uploads/images/forum/1698937549_1559094447.png', 78),
(69, '/uploads/images/forum/1698938029_1662970003.png', 83),
(70, '/uploads/images/forum/1698938158_1439474573.png', 84),
(71, '/uploads/images/forum/1698938213_1587305025.png', 85),
(72, '/uploads/images/forum/1698938290_1555154211.png', 86),
(73, '/uploads/images/forum/1698938351_1450979084.png', 87),
(74, '/uploads/images/forum/1698938419_1666893333.png', 88),
(75, '/uploads/images/forum/1698938419_1502815437.png', 89),
(76, '/uploads/images/forum/1698938459_1442260366.png', 90),
(77, '/uploads/images/forum/1698938524_1435154913.png', 91),
(78, '/uploads/images/forum/1698938817_1658483493.png', 92),
(79, '/uploads/images/forum/1698938890_1588134118.png', 93),
(80, '/uploads/images/forum/1698938930_1420388617.png', 94),
(81, '/uploads/images/forum/1698938974_1573641123.png', 95),
(82, '/uploads/images/forum/1698939018_1410100671.png', 96),
(83, '/uploads/images/forum/1698939071_1631304833.png', 97),
(84, '/uploads/images/forum/1698939109_1434123524.png', 98),
(85, '/uploads/images/forum/1698939167_1618619074.png', 99),
(86, '/uploads/images/forum/1698939208_1508845649.png', 100),
(87, '/uploads/images/forum/1698939249_1476791669.png', 101),
(88, '/uploads/images/forum/1698939296_1596791416.png', 102),
(89, '/uploads/images/forum/1698939358_1592797929.png', 103),
(90, '/uploads/images/forum/1698939411_1617367416.png', 104),
(91, '/uploads/images/forum/1698939603_1544999137.png', 105),
(92, '/uploads/images/forum/1698939667_1584290933.png', 106),
(93, '/uploads/images/forum/1698939818_1451569947.png', 107),
(94, '/uploads/images/forum/1698939886_1647967223.png', 108),
(95, '/uploads/images/forum/1698940691_1645279075.png', 109),
(96, '/uploads/images/forum/1698992761_1448103513.png', 113),
(103, '/uploads/images/forum/1698995234_1616199487.png', 120),
(98, '/uploads/images/forum/1698993101_1469494506.png', 115),
(99, '/uploads/images/forum/1698994466_1629125269.png', 116),
(100, '/uploads/images/forum/1698994577_1517558557.png', 117),
(101, '/uploads/images/forum/1698994699_1492014531.png', 118),
(102, '/uploads/images/forum/1698994816_1670091295.png', 119);

-- --------------------------------------------------------

--
-- 表的结构 `forum_list`
--

CREATE TABLE `forum_list` (
  `id` int(11) NOT NULL COMMENT '讨论编号',
  `typeid` int(11) NOT NULL COMMENT '分类编号',
  `userid` int(11) NOT NULL COMMENT '发布用户',
  `title` text NOT NULL COMMENT '讨论标题',
  `content` text NOT NULL COMMENT '讨论内容',
  `date` char(10) NOT NULL COMMENT '发布日期',
  `zan` int(11) NOT NULL DEFAULT '0' COMMENT '点赞量',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0 正常 1 异常',
  `_tid` int(11) DEFAULT NULL COMMENT '时间戳id值'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `forum_list`
--

INSERT INTO `forum_list` (`id`, `typeid`, `userid`, `title`, `content`, `date`, `zan`, `view`, `status`, `_tid`) VALUES
(78, 10, 10000, '科学栽培木瓜有诀窍', '木瓜喜温暖湿润气候，较耐寒，不耐旱。对土壤要求不严，但适宜在阳光充足，土层深厚、肥沃的地方生长。木瓜为二年生枝条成花，二至三年的粗壮短枝结果率较高。虽开花较多，但常落花落果。\r\n\r\n选地种植；选阳光充足、土质肥沃、湿润且排水良好、中性或微碱性的壤土或沙壤土，也可利用田边地角、山坡地、房前屋后种植。\r\n\r\n田间管理：定植成活后，每年春秋二季结合施肥中耕除草二次，锄松土壤，除净杂草。冬季松土时要培土，以利防冻。追肥；生长期喷促花王3号，能把植物营养生长机能转化成生殖机能，抑制主梢疯长，促进花芽分化，多开花，多坐果，促发育。再在幼果期喷壮果蒂灵，提高营养输送量。防落花、落果、僵果、畸形果的产生。使果实着色靓丽、果型美、品味佳。果实采收后，追施以氮肥为主的复合肥。\r\n\r\n整形修剪：木瓜幼树以整形扩冠为目的。第1年冬剪对留作主枝的枝条进行短截，留30-40厘米为宜，幼树以轻剪为主，主要是疏除过密枝、竞争枝、交叉枝、重叠枝，对有空间的枝条进行短截，留20-30厘米为宜，次年长到40厘米时及时摘心，形成结果枝组。注意在修剪口涂愈伤防腐膜，促进伤口愈合。\r\n\r\n病虫害防治：主要病害有叶枯病，主要虫害有桃蛀螟、天牛、蚜虫、红蜘蛛。轮换使用多种针对性药物，以免产生抗药性。药剂中添加新高脂膜增强治疗效果。', '1698937549', 0, 0, 0, 0),
(76, 10, 10000, '胡萝卜的种植方法和时间', '1、一月下旬到二月上旬、三月下旬到四月上旬、五月下旬到六月上旬，这三个时间段都很适合种植胡萝卜。\r\n\r\n2、种植胡萝卜要选择疏松、肥沃、排水性好的土壤。\r\n\r\n3、在种植胡萝卜之前，要先将土壤里的杂草去除、施上基肥再将地整平并消毒，就可以播种了。\r\n\r\n注意事项：\r\n\r\n在播种前可以在表面盖一层油菜杆或者是玉米杆，播种最好选在下雨后或者是下雨前一天，这样有利于种子的发芽。\r\n\r\n播种胡萝卜之前，要先将种子在水中浸泡一下，等到种子露白在晾干，最后再播种。\r\n\r\n等到胡萝卜长到4-5厘米的时候进行第一次施肥，第二次施肥就要等到胡萝卜长大之后了。\r\n\r\n比较干旱的时候要进行及时的浇水，夏天雨水比较多的时候要去田间将排水沟疏通，便于将水分排出。\r\n\r\n', '1698937280', 0, 0, 0, 0),
(77, 10, 10000, '水稻苗床后期管理', '1、控制温度，防止徒长。要随时注意天气变化，调节棚室温度，保证秧苗生长发育。2叶到3叶期，白天温度控制在20―23℃，夜间15―18℃，此时秧苗抵御外界侵害能力弱，白天注意通风控温，蹲苗促根，夜间注意保温防冻，一般通风掌握在早期在晴天早8点到下午3点，打开棚头通风口，以后随着外界温度升高，通风口逐渐加大，晴天低温过后，应提前通风，保证温度缓慢升高，避免在根系发育不好的苗床，造成秧苗青枯；到3叶―4叶期的秧苗，白天棚外温度高，也正是秧苗炼苗的关键时期，因此，要加大通风量，一般在没有霜冻的情况下，可以大通风或全通风，\r\n\r\n2、对苗床水分状况做出正确判断\r\n\r\n（1）、早晚秧苗无露珠或露珠小，有缺水可能。\r\n\r\n（2）、床土表面干燥发白，甚至出现裂缝，是缺水表现。\r\n\r\n（3）、中午新生叶卷曲，有缺水可能。\r\n\r\n3、掌握不同时期水分标准，采取科学的浇水方法出苗-3叶期，缺水补水，并且浇水要一次性浇透。插秧前，在不使秧苗萎蔫的前提下，进一步控制秧田水分，蹲苗、壮根。\r\n\r\n（1）、苗床用水要提前储备，水温达到12-16℃，刚从井里刚抽出来的冷水不能作为苗床用水。\r\n\r\n（2）、秧苗根部土壤温度低于8℃，外界气温低于10℃时都不能浇水。\r\n\r\n（3）、浇水要避开中午高温期，最好是上午8点前，或下午3点到5点期间浇水，阴天不浇水。\r\n\r\n4、实时注意水稻青枯病、立枯病和水稻稻水象甲的发生和防治。\r\n\r\n5、做好水稻移栽前的准备\r\n\r\n因苗而宜，巧施送嫁肥药。苗床施肥，要看秧苗长势而定，送嫁肥最好在秧苗移栽前5―7天，亩施尿素5-7公斤。', '1698937438', 0, 0, 0, 0),
(79, 10, 10000, '葡萄套好袋，售价可高五成', '葡萄套袋是当前生产优质、高档果品的一项重要技术。经套袋后的果穗色泽鲜艳、光洁、无污染，大大提高了市场竞争力，套袋葡萄的市场销售价比不套袋的要高20%—50%。\r\n\r\n套袋目的：葡萄套袋，可减少果实生长期病虫鸟害，减少日灼，减轻农药和灰尘的污染，提高果面光洁度；改善果实生长的微环境，使果实着色均匀，色彩鲜艳，果皮细腻，提高果品质量。\r\n\r\n套袋选择：应根据微环境对果实外观、内在品质形成的影响，依品种选择具有抗风雨能力强、透气性能好、透光度高、疏水度高、防菌等特点的纸袋。报纸等制成的果袋疏水性差、抗拉力差、破损率高，易滋生果实病害；无纺布透气性好但易产生日灼。目前生产中以塑料薄膜与专用纸结合的葡萄专用袋为最好，可用于不同要求的生产。\r\n\r\n套袋时间：套袋时间早晚也直接影响到套袋的效果，套早了不利于疏果，套晚了病害侵染果穗，如果套袋过晚，6月中旬以后果穗易侵染病菌，特别是白腐病、炭疽病、酸腐病、灰霉病等。一般在坐果后15—20天后进行套袋，即果粒长到豆粒大小时经疏粒、整穗后立即套袋。在阴雨连绵后突然晴天，不要立即套袋，因为会使日灼加重。要经过一两天，果实稍微适应高温环境后再套袋。套袋时间最好是在上午10时之前或下午4时以后，可减轻日灼。对于容易产生气灼的品种，如阳光玫瑰、蓝宝石等，要等到硬核期过后再进行套袋，以免由于套袋过早加重气灼的发生。\r\n\r\n去袋：去袋后至采收前主要是让浆果着色，在日照不足、色泽不良的情况下，必须在采前2—3周去掉纸袋，提高着色效果（青色葡萄可以不去袋）。去袋后根据果穗状况适当转动果穗一两次，使果粒及果串着色均匀。', '1698937709', 0, 0, 0, 0),
(74, 10, 10000, '红椎的栽种技术', '红椎是我国珍贵的树种，源于南非，但它在我国已经发展了数千年，分布在广西、广东、福建等地区，下面一起来了解红椎的栽种技术。\r\n1、选地整地\r\n\r\n红椎喜潮湿、温暖的习性，在选地栽培时应选择海拔不超过500m的地区，降雨量与热量最好选择其适应的区间。土壤选择可以考虑砂页岩、变质岩、花岗岩等发育来的土壤，土壤PH值在4.5～6，土层的厚度应当在80cm以上。\r\n\r\n2、移栽\r\n\r\n在春季移栽较好，在移栽之前，最好选择一年生健壮的营养袋苗进行造林，在去除苗袋时注意确保营养土团的完整性和根部的健康，并保证苗木的高度至少有35cm，将苗木栽种在穴中之后，进行表土回填，然后将土压实，若是在阴雨天气种植，可以不用再人工浇灌，晴天栽种，需要及时灌水，保证其成活率。\r\n\r\n3、整形修剪\r\n\r\n红椎苗木移栽成功，且林分郁闭度达到0.7之后，下部枝条呈现衰弱状态时，要及时进行修剪，当林分郁闭度达到0.8之后，即可开始间伐。灵活的修剪方式与间伐方式才能保证红椎的健康生长。\r\n\r\n4、施肥管理\r\n\r\n当红椎处于苗期时，适当地追肥三四次，每次施肥不要太浓，以施稀肥的方式多施几次，而且前期肥料应以氮肥和磷肥为主，后期应以磷肥与钾肥为主。当苗木成功移栽之后，进行施肥时，首先应除去苗木周边的其他灌木、杂草，给刚移栽不久的苗木施肥规格是每株100g复合肥和50g尿素，时间选在当年的8—9月为宜。\r\n\r\n5、水分管理\r\n\r\n苗木在移栽成功之后，可以根据天气情况浇水，若是近段时间内，天气晴朗少雨，可以保持15天浇水一次。造林面积大的区域，可以采取人工降雨的方式，提高浇灌效率。红椎苗木虽喜潮湿的环境，但并不耐水涝，应做好防洪抗涝的准备工作，方便在雨季及时将多余的水排除出去。\r\n\r\n6、病虫害防治\r\n\r\n红椎苗期为害地下的害虫主要有地老虎、蟋蟀、蝼蛄、白蚁和金龟子等幼虫，可用90%的敌百虫，或者是52%的马拉松乳剂500～600倍液进行喷杀。为害嫩叶的害虫主要有卷叶虫、竹节虫，可用90%敌百虫1500～2000倍液进行喷洒防治。\r\n\r\n以上就是关于红椎的栽种技术介绍了，红椎不仅具有很强的工业价值和药用价值，而且种植红椎有不错的经济效益，可以考虑栽种。', '1698890595', 0, 0, 0, 0),
(80, 7, 10000, '防治有机黄瓜茶黄螨措施', '有机黄瓜是一种很常见的蔬菜，有很高的营养价值。有机黄瓜在种植过程中没有使用有毒有害农药，更加健康。下面就具体介绍一下：\r\n\r\n茶黄螨，其食性极杂，寄主植物广泛，有机黄瓜已经成为为害蔬菜的主要害螨之一。目前，玉田县温室黄瓜生产中经常发生。\r\n\r\n一般温度18℃-20℃，7-10天可发育1代;28℃-30℃，4-5天发生1代。以成螨和幼螨集中在黄瓜植株幼嫩部分刺吸为害。受害叶片背面呈灰褐或黄褐色，油渍状，叶片边缘向下卷曲;受害嫩茎、嫩枝变黄褐色，扭曲变形，严重时植株顶部干枯;受害果皮变黄褐色。\r\n\r\n生产管理中，有机黄瓜菜农首先要根据为害症状进行辨别，如果是茶黄螨为害的，建议大家采取药剂防治。可以选用的药剂有15%哒螨灵乳油3000倍液、1.8%阿维菌素乳油4000倍液、56%阿维菌素炔螨特微乳剂2000倍液、20%三唑锡悬浮剂2000倍液等，每隔7天喷1次，连喷2-3次。药液要均匀地喷到植株嫩叶、嫩茎、花器和果实上，注意轮换用药。\r\n\r\n以上是为大家介绍的，希望可以给大家带来帮助。', '1698937776', 0, 0, 0, 0),
(81, 10, 10000, '红薯生长后期喷叶面肥可提高产量', '红薯是一种地下生长作物，在它的生长后期，如果我们合理施叶面肥等肥料可以防止植株早衰，保持叶片的同化能力，促使养分向块根输送，从而提高产量，获得更多的收益，下面给大家分析一下。\r\n\r\n叶面喷肥，红薯进入生长后期以后，根系的吸收能力减弱，可分类进行叶面喷肥。对长势弱的丘陵坡地、平原沙地或有早衰趋势的田块可喷施0.5％的尿素液；对长势偏旺、肥力水平较高的田块可喷施0.2％的磷酸二氢钾溶液或2%～3％的过磷酸钙浸出液；对一般田块可喷施0.4%～0.5％的尿素和磷酸二氢钾混合液，每隔7～10天喷施1次，共喷2～3次，每次每亩喷施肥液70～100公斤，喷施时间以晴天傍晚为宜。\r\n\r\n肥水灌缝用3%～5％的硫酸钾溶液或10%～20％的草木灰浸出液顺垄灌缝施入，每亩用肥液100～150公斤。对于有早衰趋势的田块，可用2％的三元复合肥溶液追施。', '1698937844', 0, 0, 0, 0),
(82, 10, 10000, '有机蓖麻栽培技术要领', '晒种，播前选择晴天晒种3～5天。催芽，将精选好的芽率在95%以上的种子，播前7天左右用新高脂膜浸种，浸种后捞出晾干即可下种。可保温、保湿、吸胀，提高种子发芽率，使幼苗健壮。驱避地下虫害，隔离病毒感染。也可与种衣剂混用。然后用沙培法催芽或放在温炕上进行催芽，露白即可播种。一般株距80厘米，行距60厘米，公顷保苗2万株。\r\n\r\n田间管理，及时查补苗,若发现有缺苗现象及时催芽补种。及时间苗、定苗，当小苗长出3片真叶时间苗、5片真叶时定苗。补水抗旱,干旱年份可根据旱情及时灌溉。追肥，看土壤肥力，底肥多少及幼苗生长状况而定，若土壤瘠薄，底肥不足，植株有脱肥现象，可在果穗形成期进行喷施叶面肥可提高农作物受粉、受精、灌浆质量，增加千粒重。', '1698937964', 0, 0, 0, 0),
(83, 10, 10000, '香水柠檬树的养殖方法和注意事项', '1、土壤：养殖香水柠檬树时，需要选用有机质含量丰富的沙壤土。2、光照：保证香水柠檬树每日接受5-7个小时的光照。3、施肥：在给香水柠檬树施肥时，需要对肥料进行稀释。4、注意事项：冬季时将香水柠檬树移到5℃以上的室内。\r\n\r\n香水柠檬树如何养殖\r\n\r\n1、适宜土壤\r\n\r\n在种植香水柠檬树时，应该使用有机质含量丰富、透气性好的沙壤土，同时在种植前需要将土壤中的杂质全部清除，并且向土壤中混合适量的肥料。在养护过程中则需要定期松土，维持土壤的透气性良好。\r\n\r\n2、适当光照\r\n\r\n香水柠檬树适合生长在光照充足的环境中，在养护过程中需要提供适宜的光照，最好将其栽种在向阳的环境中。但是在光照过强的时间段需要对植株进行遮荫，以免影响植株的生长。\r\n\r\n3、适量施肥\r\n\r\n香水柠檬树的生长对于养分的需求较低，在养护过程中需要减少肥料的使用，以免施肥过多造成肥害，导致植株死亡。在施肥时最好可以将肥料溶解在清水中浇灌给植株，避免肥害发生。\r\n\r\n4、注意事项\r\n\r\n香水柠檬树的耐寒性较差，在冬季养护时需要采取适当的保暖措施，最好将其移入室内养护，并且将温度控制在十度以上，同时在冬季浇水时需要注意水温，以免导致植株根部冻伤。\r\n\r\n柠檬叶子发黄怎么办\r\n\r\n浇水过多：浇水过多会导致盆土内积水，使植株的根部吸收不良导致黄叶。此时，要及时脱盆，剪除烂根再重新栽种。施肥不当：施肥过多会烧坏它的根部，导致黄叶。此时，要及时脱盆洗根，再用没有积肥的土壤重新栽种。温度太高：长期处在温度太高的环境中，柠檬也很容易出现黄叶。此时，要通风降温，等它恢复。\r\n\r\n柠檬果实多久成熟\r\n\r\n柠檬树从开始挂果到果实成熟，一般需要5个月以上的时间，但是它们的成熟时间的长短不一致，会有一定的差异。如果是春季开花的话，果期一般是从四月份开始，到十月份的时候就陆续开始成熟并且上市了。如果是夏季开花的话，果期是从七月份到12月份，总体时间是在5个月以上才能成熟。', '1698938029', 0, 0, 0, 0),
(84, 10, 10000, '黑珍珠番茄种植方法', '1、育苗\r\n\r\n将种子浸入50~55度的热水中进行温汤浸种30分钟并搅拌至常温，水量不宜过大，如果只是少量种子的，一般一小碗水即可。将种子捞出用清水洗净，然后放在清水中浸泡6~8小时，捞出后用湿纱布包好，放在26~30度左右的地方进行催芽，注意要保湿。一般有条件的用催芽箱进行催芽。等种子有一半左右露白时即可进行播种。\r\n\r\n2、苗床\r\n\r\n苗床尽量用配制好的营养土，或用肥沃疏松的田园土，不要用化肥，可施少量的充分腐熟的有机肥。将苗床浇透水，等水渗下去后，将种子掺沙均匀地撒在苗床上，也可以用穴盘或营养钵育苗更好。再用土对种子进行覆盖0.5CM左右，在上面搭拱棚进行保湿。要加强苗床的通风管理及时预防猝倒病。苗期可喷施0.2%磷酸二氢钾进行壮苗，保持苗床湿润，浇水不要过大，以防徒长，要适当进行炼苗。\r\n\r\n3、定植\r\n\r\n定植前，地块进行深耕深翻，要进行轮作，不要连茬。在土壤中施足充分腐熟的有机肥和一定量的复合肥，一般亩施土杂肥2000~4000公斤，三元复合肥50公斤。定植时，一般用高垄双行或单行进行种植，具体行株距要根据自己的种植方式进行选择。种植穴浇足水，将苗种植好，覆上土，再铺上地膜就可以了。地膜一定要压好，包括根部也要用土埋好。\r\n\r\n4、种后管理\r\n\r\n在第一穗果实膨大前，一般不浇水。如果确实旱了，可以浇小水，要进行壮苗，防止徒长。在花期不可缺水，要保持土壤湿润。黑珍珠樱桃番茄如果是露地种植，建议采用双干整枝，如果是保护地密植的，多采用单干整枝。要及时进行整枝绑蔓和打杈等工作。\r\n\r\n5、花的授粉\r\n\r\n可进行人工授粉或熊蜂授粉，也可用防落素等激素进行喷花处理。\r\n\r\n6、肥水管理\r\n\r\n黑珍珠番茄喜肥喜水，结果前少浇肥水，座果后加大肥水供应，氮肥不要施过多，要增加钾肥的比例。\r\n\r\n7、病虫害\r\n\r\n病虫害防治要及时，进行综合防治。主要虫害为白粉虱，可张挂黄色诱虫板诱杀，或用蚍虫啉等农药进行防治。病害主要防治灰雾病、疫病、叶霉病等多种病害，可用针对性地农药进行防治。\r\n\r\n什么是黑珍珠番茄\r\n\r\n黑珍珠番茄是近年从国外引进的番茄新品种，果实为红黑色，药食兼用，营养价值高，适合鲜食。在欧美国家，黑珍珠番茄是目前非常盛行的优质养生果蔬，产品供不应求。近年来在我国许多城市也有生产和销售。宁夏地处西部内陆地区，光照充足，气温适中，干旱少雨，但有黄河自流灌溉，非常适合番茄的生产栽培，黑珍珠番茄在宁夏地区保护地和露地皆可种植。一般单株产量2～4kg，单产可达10万一13万kg／km2。\r\n\r\n黑珍珠番茄的特征特性\r\n\r\n黑珍珠番茄是从国外引进的一代杂交种，为无限生产类型，中熟，从定植到初次采收需要60～65d。其植株生长健壮，连续结果性较强，每穗结果10个以上，果实为圆球形，红黑色，单果重20g左右。果实的外形颜色与巨峰葡萄果实相似，口感酸甜适中，具有浓郁的番茄味，特别适合鲜食。适应性广，耐热性较好，抗寒性中等，抗叶霉、晚疫病。', '1698938158', 0, 0, 0, 0),
(85, 10, 10000, '种莴笋的方法和步骤', '1、选种：种植莴笋前需选择健康、饱满、抗性好的莴笋种子，种植时间是在6月份左右。2、土壤：莴笋适宜生长在疏松、肥沃、透气的土壤中，种植前需将土壤深耕消毒。3、种植：将处理好的莴笋种子均匀地撒播在土壤中，然后盖上一层薄土，最后适量补充水分即可。\r\n\r\n莴笋的养护\r\n\r\n待莴笋苗长到4~5片真叶时，需选择傍晚或者阴天的时候进行移栽，移栽时要注意,莴笋的行距应该在30厘米以上,株距在35厘米左右,而且在移栽的时候还要注意大小苗分别移栽。\r\n\r\n莴笋生长期间对水分需求量大，种植前需保持土壤湿润，生长期间需及时补充水分，但注意浇水量不宜过多，保持土壤微湿即可，雨季需及时排出土壤中的积水。\r\n\r\n莴笋根系浅，且生长速度快，需肥水较多，故田间管理应重施肥水，以利植株长势繁茂，在幼苗活棵后，间隔3~5天结合浇水追施一次稀粪水。', '1698938213', 0, 0, 0, 0),
(86, 10, 10000, '无花果发芽什么时间施肥', '有关无花果的种植知识，无花果发芽之后，应该在什么时间施肥，很多无花果果农并没有把握好这个时间，基肥不足时是否要进行追肥，下面具体来看下。\r\n\r\n无花果发芽后施肥时间\r\n\r\n1、基肥不足时\r\n\r\n无花果发芽后，若基肥不足，则需要进行追肥。\r\n\r\n2、施肥方法\r\n\r\n在离主根40厘米处，株施腐熟杂肥5约公斤，盆栽无花果则施入约1公斤。\r\n\r\n无花果树成龄后，应株施腐熟农家肥约15公斤，在落叶前后施入基肥，在新梢旺长期及果实膨大期，进行适当追肥即可。\r\n\r\n3、注意事项\r\n\r\n在给无花果施用肥料时，尽量不接触根系，避免烧根。对水浇施或撒施联结浇水进行。\r\n\r\n一年生苗木，株高达1米以上，枝梢充实，芽粒丰满，根系发达，侧根较多，基部直径达1.5—2厘米为壮苗标准。\r\n\r\n对生长势茂盛的苗木，注意适当节制氮肥用量。施用氮肥过多、过迟时，容易引起秋梢徒长，下降抗寒能力，易受冻害', '1698938290', 0, 0, 0, 0),
(87, 7, 10000, '秋季大棚草莓的高产栽培技术', '草莓含有丰富的营养，是水果中的“精品”，但是通常只在春夏之交的时候上市，到了秋冬季节的时候就空缺无货，为了满足人们秋季食用草莓的需求，结合本人从事基层农技推广体系项目建设需要，从浙江引进“红艳”“丰香”、宁德引进“法兰地”等草莓新品种，利用薄膜钢架大棚，在松山镇吕洞村种植。具体是对草莓的秋季大棚栽培技术进行探讨。\r\n\r\n一、秋季大棚草莓对环境的需求\r\n\r\n1.温度\r\n\r\n草莓适应环境的能力比较强，但是从总体上来讲是喜阴不喜热，最适宜草莓生长的温度是15-25℃，在5℃的时候就能够生长发芽，温度低于-7℃的时候芽苗就会受冻，温度低于-10℃的时候芽苗就会冻死。因此在秋季大棚种植草莓的时候，就需要控制好温度，防止芽苗因为温度而受伤。草莓花芽分化的界限是3-17℃，开花的温度是25-28℃，夜温要控制在5℃以上；结果期白天的温度基本维持在20-25℃，夜温要控制在10℃.\r\n\r\n2.湿度\r\n\r\n草莓的根系比较浅、叶子比较宽大，因此草莓是不抗旱的植物，因此就需要在大棚中控制好较高的湿度。通常要求土壤的含水量要维持在70%，花期适当降低为60%，结果期则需要适当提升土壤的含水量为80%。在控制空气的湿度的时候，要在花期和果实成熟期适当降低空气的湿度，湿度过大就会影响植株的授粉或者造成果实腐烂。\r\n\r\n3.光照\r\n\r\n草莓是喜光植物，但是又具有一定的耐阴性。因此在秋季大棚种植期间就需要控制好光照，不能够过强，否则就会使得植株和果实都过小，光照过弱的话，那么就会影响果实的产量。草莓的不同生长期对于光照的要求也不同，在花期的光照要维持在12-15h，花芽分化期要维持10-12h以下的光照，在草莓的休眠期则需要维持10h以下的短日照。\r\n\r\n4.土壤\r\n\r\n草莓适宜在弱酸性的土壤中生长，土壤应该疏松、肥沃并且透水性要好，盐碱地、石灰地以及沼泽地都不适合草莓的生长，草莓不适合连作，如果需要连作的话，那么就需要用氯化苦和溴甲烷的混合气体来对土壤进行熏蒸消毒，从而使得土壤中的病菌杀死。\r\n\r\n二、秋季草莓的栽种方法\r\n\r\n1.选择合适的植株\r\n\r\n在进行品种选择的时候，应该选用容易栽培、品质优良的“红艳”、“丰香”、“法兰地”等品种，这样才能够保证果型整齐、果实大以及抗逆性强，特别是浙江引进的“红艳”果实特香特甜特受大家喜爱。在植株进入到休眠期以前，要对大棚进行升温，并且要喷洒上赤霉素或者进行人工补光，这样才能够使得植株的休眠期缩短，从而有利于栽培。在进行主要品种栽培的时候，还可以配上1-2个授粉的品种，这样有利于提高草莓的产量和质量。\r\n\r\n2.整地施肥\r\n\r\n草莓的根系比较浅，因此对于土壤的要求就比较高，一般选用富含有机质的肥沃土地，土层较为深厚。土壤的选择要处于通风性良好、灌溉方便以及背风向阳的位置，土壤的前茬作物是草莓或者蔬菜的话，还需要对土壤进行化学消毒或者太阳能消毒。\r\n\r\n3.苗圃管理\r\n\r\n在植株开始抽生花序时要将花序及时地清除，这样才能够有利于匍匐茎以及幼苗的生长，防止一些没有必要的营养流失，去除花序的时间越早越好。在对植物定株前或者定株后要用48%的氟乐灵来对土壤表面进行杂草的清除，在撒药以后要进行覆土，防止遇光分解。当匍匐茎开始抽搐幼芽的时候，前端要用细土来进行按压，尽量使得生长点外漏，当匍匐茎开始布满苗床的时候，需要将多余的匍匐茎除去。此外，还需要用40mg/kg的赤霉素溶液喷洒植物，这样既能够有效促发匍匐茎，有能够有效抑制植株的开花。\r\n\r\n4.定株\r\n\r\n适时的定株有利于草莓的生长发育，这样才能够保证草莓的收获时间和产量，定株过早的话不利于成活和产量，定株过晚的话，就会影响草莓的根部发育，在秋季进行定株的时候，一般选在9月下旬进行定株。在进行定株的时候要充分利用好土地和光照，合理植株的密度，这样才能够达到高产的目的，亩株一般控制在8000株，定株最好在阴天进行，在定株的时候，要要注意浅栽不露根，覆土后要踩实，定株以后要进行定期浇水。\r\n\r\n5.扣棚\r\n\r\n当秋季的外界温度降到8-10℃的时候，就需要来对草莓植株进行扣棚管理扣棚以后，棚内白天的温度应该维持在28-30℃，夜间温度应该维持在12-15℃，当外界温度逐渐降低的时候，要在棚上放置上草苫进行保温。\r\n\r\n6.管理\r\n\r\n在对大棚进行管理的时候，最重要的就是要进行温度管理，要维持在20-25℃的温度范围。同时保温的时候要注重选择适宜的时间，时间过早的话就会影响草莓的产量，过晚的话就会使得草莓进入休眠，发育不良，这就失去了大棚栽植的意义。在草莓出现花蕾到开花的一段时间，棚内温度要控制在24-26℃，开花期应该控制在22-24℃，果实成熟期要控制在22-23℃。当大棚内的温度和湿度较高的时候，要进行必要的通风换气。在整个生长期都需要保持足够的水分，尤其是从开花到浆果成熟期这段时间内，要保持土壤的湿润，但是又要防止湿度过大容易造成浆果的腐烂。\r\n\r\n在草莓的生长期要注意随时将病叶和老叶除去，在开花期的时候要将抽生的匍匐茎及时地移除，这样才能够保证草莓的质量和产量。同时还需要做好疏果，从而能够集中养分对果实的个头进行增大。疏花的时间要安排在开花之前，将低品质的花蕾去除。疏果应该是在幼果时期，及时将畸形或者受到病菌感染的的果实移除。\r\n\r\n7.采摘\r\n\r\n由于草莓比较脆弱，在采摘过程中很容易就受到机械损伤而腐烂，因此采摘的环节就极为重要，也是影响最终销售的关键。草莓比较柔嫩，因此不容易储存，常常采用的就是随采随销的方式，这样就能够保证草莓的品质，尽量减少没有必要的损伤。草莓的采摘要适时，过早就会影响草莓的口味，过晚就会影响草莓的储藏，采摘的标准是草莓的表面着色达到70%。草莓储藏的容器一般是10cm高的塑料容器，内部较为光滑，并且要有软的内垫。\r\n\r\n8.储藏\r\n\r\n草莓在采摘后没有后熟的作用，因此在低温下就能够保持草莓的品质。较为适宜的存储条件是0-1℃，湿度90-95%，二氧化碳10-20%，氧气2-3%。在储存的时候应该避免暴晒，放置在阴凉通风处。\r\n\r\n通过上述的培育、栽种以及储存的方法，就能够有效保证草莓的质量，从而提高经济效益。', '1698938351', 0, 0, 0, 0),
(88, 10, 10000, '种植黑苦瓜怎么高产？该掌握哪些方法', '黑苦瓜是一种新型苦瓜品种，皮色为墨绿色，蔬果比普通的瓜要长，苦味比较淡，口感十分清脆爽口，所以备受消费者的喜爱，可以炒食、凉拌、烧汤，虽然苦味淡，但其清热祛火的功效却丝毫不差。而且还可以延缓衰老，抗病能力强，适应性广，产量高，目前被农民朋友广泛种植，那么要种植高产的黑苦瓜应该掌握哪些方法呢？接下来一起去看看吧。\r\n\r\n1、土壤选择\r\n\r\n黑苦瓜耐肥不耐瘠,宜选择肥沃的粘壤土或砂壤土的地块，不宜与瓜类作物连作。\r\n\r\n2、播种育苗及定植\r\n\r\n黑苦瓜和普通苦瓜种植时间是一样的。保护地栽培可以选择在10～11月,早春栽培可在2月中下旬播种,但宜集中在薄膜棚内进行,以防冻害。在幼苗二叶一心时选择晴天下午移栽。深耕翻土,做成高畦,畦上覆盖黑色或者双色地膜(上面银色,下面黑色)。\r\n\r\n3、肥水管理\r\n\r\n施肥种植苦瓜是非常重要的，基肥要施得很充足，亩施纯有机肥1500公斤，过磷酸钙30公斤。春种时，幼苗期应少施肥,以免徒长而受冻害;夏秋种应从子叶展后开始不断追肥。开花结果期间要施两次以上重肥，一般初花时亩用花生麸25公斤或优质发酵牛羊粪肥50公斤,复合肥30公斤，结合培土施一次；第一次采收后,亩用复合肥25公斤再施一次。以后每收2～3次后,看长势情况亩施15公斤的复合肥。同时要跟上供水,保证黑苦瓜的肥水所需。\r\n\r\n4、整枝引蔓\r\n\r\n春种时，距离地面50～80厘米以下的侧芽和老叶病叶应及时摘除，以透光通风，减少养分损失。或在结第一个瓜后，将基部侧枝一律去掉，及时疏掉多余的雌瓜和雌花，在瓜与瓜之间有2～3个空节。5节左右绑1次。采收两个果实后,看侧枝1～3节有无雌花，有则保留,没有则剪去。到盛果期还要进行2次整枝。栽培中引蔓要勤，一般引主蔓沿竹杆直上，侧蔓向支架左右方向横引。引蔓最好在晴天的下午进行。另外,最好采用棚架栽培，以利于采摘果实及病虫害防治。\r\n\r\n5、保护地人工授粉\r\n\r\n大棚温室栽培黑苦瓜每天早晨用雄花花蕊点碰雌花的花蕊,一个雄花可以授粉2～3朵雌花。有条件的可以使用蜜蜂授粉。\r\n\r\n6、及时采收\r\n\r\n一般开花后12～15天即可采收,当果实充分膨大,果皮墨绿有光泽,瘤状突起变粗,尖端平滑的时候就是采收的最佳时期。\r\n\r\n7、病虫害防治\r\n\r\n黑苦瓜的病害主要有病毒病、白粉病、灰霉病和霜霉病;虫害主要有蚜虫、白粉虱、美洲潜叶蝇。保护地栽培一定要减少湿度，另外可以利用天敌或者使用生物和植物药剂(农用链霉素、新植霉素、苦参碱)进行病虫害的防治。\r\n\r\n综上所述，如果农民朋友想种植出高产的黑苦瓜，就要掌握专业的种植技巧和管理方法，希望本文对大家有所帮助。', '1698938419', 0, 0, 0, 0),
(89, 10, 10000, '种植黑苦瓜怎么高产？该掌握哪些方法', '黑苦瓜是一种新型苦瓜品种，皮色为墨绿色，蔬果比普通的瓜要长，苦味比较淡，口感十分清脆爽口，所以备受消费者的喜爱，可以炒食、凉拌、烧汤，虽然苦味淡，但其清热祛火的功效却丝毫不差。而且还可以延缓衰老，抗病能力强，适应性广，产量高，目前被农民朋友广泛种植，那么要种植高产的黑苦瓜应该掌握哪些方法呢？接下来一起去看看吧。\r\n\r\n1、土壤选择\r\n\r\n黑苦瓜耐肥不耐瘠,宜选择肥沃的粘壤土或砂壤土的地块，不宜与瓜类作物连作。\r\n\r\n2、播种育苗及定植\r\n\r\n黑苦瓜和普通苦瓜种植时间是一样的。保护地栽培可以选择在10～11月,早春栽培可在2月中下旬播种,但宜集中在薄膜棚内进行,以防冻害。在幼苗二叶一心时选择晴天下午移栽。深耕翻土,做成高畦,畦上覆盖黑色或者双色地膜(上面银色,下面黑色)。\r\n\r\n3、肥水管理\r\n\r\n施肥种植苦瓜是非常重要的，基肥要施得很充足，亩施纯有机肥1500公斤，过磷酸钙30公斤。春种时，幼苗期应少施肥,以免徒长而受冻害;夏秋种应从子叶展后开始不断追肥。开花结果期间要施两次以上重肥，一般初花时亩用花生麸25公斤或优质发酵牛羊粪肥50公斤,复合肥30公斤，结合培土施一次；第一次采收后,亩用复合肥25公斤再施一次。以后每收2～3次后,看长势情况亩施15公斤的复合肥。同时要跟上供水,保证黑苦瓜的肥水所需。\r\n\r\n4、整枝引蔓\r\n\r\n春种时，距离地面50～80厘米以下的侧芽和老叶病叶应及时摘除，以透光通风，减少养分损失。或在结第一个瓜后，将基部侧枝一律去掉，及时疏掉多余的雌瓜和雌花，在瓜与瓜之间有2～3个空节。5节左右绑1次。采收两个果实后,看侧枝1～3节有无雌花，有则保留,没有则剪去。到盛果期还要进行2次整枝。栽培中引蔓要勤，一般引主蔓沿竹杆直上，侧蔓向支架左右方向横引。引蔓最好在晴天的下午进行。另外,最好采用棚架栽培，以利于采摘果实及病虫害防治。\r\n\r\n5、保护地人工授粉\r\n\r\n大棚温室栽培黑苦瓜每天早晨用雄花花蕊点碰雌花的花蕊,一个雄花可以授粉2～3朵雌花。有条件的可以使用蜜蜂授粉。\r\n\r\n6、及时采收\r\n\r\n一般开花后12～15天即可采收,当果实充分膨大,果皮墨绿有光泽,瘤状突起变粗,尖端平滑的时候就是采收的最佳时期。\r\n\r\n7、病虫害防治\r\n\r\n黑苦瓜的病害主要有病毒病、白粉病、灰霉病和霜霉病;虫害主要有蚜虫、白粉虱、美洲潜叶蝇。保护地栽培一定要减少湿度，另外可以利用天敌或者使用生物和植物药剂(农用链霉素、新植霉素、苦参碱)进行病虫害的防治。\r\n\r\n综上所述，如果农民朋友想种植出高产的黑苦瓜，就要掌握专业的种植技巧和管理方法，希望本文对大家有所帮助。', '1698938419', 0, 0, 0, 0),
(90, 10, 10000, '春天发财树叶子发黄怎么办？', '一、春天发财树叶子发黄怎么办\r\n\r\n提高温度，适当遮阴，减少浇水，及时施肥。春天温度比较适宜，但如果发生倒春寒，温度就会降低，导致发财树冻伤，使其叶子发黄，需要多关注天气情况，如果清晨傍晚温度较低，需要将发财树放到室内温暖处。如果植株不是很大，可以用袋子将其罩上，有一定的保暖效果。\r\n\r\n发黄原因：春末午后的阳光比较强烈，而发财树不宜受到强光照射，很容易导致其叶子发黄。\r\n\r\n解决方法：将发财树放到半阴处，适当的接受散光照射。在冬季和春季，光照不强烈的时候，可以将它放到向阳处。夏季和秋季需要遮阴，不仅能避免被暴晒，还能防止温度过高。\r\n\r\n发黄原因：发财树有一定的耐旱性，浇水少一点也可以正常生长。浇的多会导致根系缺氧，还可能滋生细菌使其腐烂，导致叶子发黄。\r\n\r\n解决方法：如果盆中还有积水，需要先将水排出。再把它从盆中取出，将烂根剪除后重栽。新的盆土要干燥一点，重栽后不要浇太多水，保持盆土微润即可。\r\n\r\n发黄原因：春季发财树开始恢复生长，此时要及时施肥。养分不充足会使其生长不良，导致叶子发黄。\r\n\r\n解决方法：通常黄叶是由于缺氮导致的，但施肥不宜偏施，否则容易导致它徒长。需要用氮磷钾复合肥，施肥前先稀释一下，避免浓肥伤及根部。\r\n\r\n二、春天发财树多久浇一次水\r\n\r\n发财树春天给发财树浇水,可以依照气候环境浇水,一般是5-7天给它浇一次水。不过,在天气好的时候,浇水次数就可以适当的增加,但不能让土壤里有积水出现。在进行浇水的时候,要把水浇到盆土中,并且还要彻底的浇透,不然盆土上面潮湿,下面干燥,这样不利于植株根部吸收水分。\r\n\r\n三、春天发财树怎么打理\r\n\r\n发财树喜欢高温高湿的生长环境，所以需要将它放在光线比较充沛的地方比较好。补给水分的时候不宜太多。需要每隔15天，给它施用一次液肥为宜。春天发财树生长较快，对水分的需求也慢慢增多，这个时候养护它，可根据其实际生长状态、盆土干燥情况、及气温变化等循序渐进地增加浇水量，尽量使盆土保持微润不干的状态。', '1698938459', 0, 0, 0, 0),
(91, 10, 10000, '柑橘科学管理能增甜', '科学控水。在水分供应基本满足需要的前提下，一定时期内适度的水分亏缺对果实品质无不良影响。在果实膨大后期适当保持柑橘园土壤干燥，可以降低对氮的吸收，还能使果实汁液中可溶性固形物和含糖量有所提高，有利于增进果实品质。\r\n\r\n叶面喷肥。在开花前，幼果期，膨大期及时喷施壮果蒂灵，可激活植物生态生长正能量，拓宽植物导管路径，提升植物吸水吸肥力度，提升果实产量和质量。于挂果后的早、中、晚期，增施含有机质叶面肥，可选用含腐植酸叶面肥配合光合营养膜肥一起喷施，可提高叶片光合作用，提升抗逆性，促进着色，改善品质，且能提早成熟。\r\n\r\n多施用有机肥。在柑橘生产中多施有机肥，既能及时满足生长所需的氮、磷、钾，同时还能补充镁、锌等中微量元素，更可改善土壤的酸度和土壤的容重，提高肥料利用率，改善柑橘缺素症状，提高土壤肥力，从而增加其甜度。\r\n\r\n适时采收。不同品种、不同地区成熟期不同，应根据果实成熟程度来决定是否采收，过早或过晚都不适宜。', '1698938524', 0, 0, 0, 0),
(92, 7, 10000, '播种机主要由哪几部分组成，它是怎样完成播种作业的？', '种子箱是播种机的一个重要组成部分。种子箱通常位于机器的上部或后部，用于储存种子。种子箱具有一定的容量，可以根据农作物的需求进行种子的装载。种子箱的设计通常考虑到方便种子的加装和更换，以及防止种子漏出的问题。\r\n\r\n播种器是播种机的核心部件。播种器负责将种子从种子箱中取出，并将其均匀地分布到耕地上。播种器通常由一个或多个种子盘组成，种子盘上有许多孔，每个孔可以放置一个种子。当播种机行走时，种子盘会转动，将种子从种子箱中取出，并通过孔洞将其投放到地面上。\r\n\r\n除了种子箱和播种器，播种机还配备了行走装置。行走装置通常由轮子或履带组成，使播种机能够在田地上平稳地行走。行走装置的设计考虑到土壤的不同情况，以确保播种机能够在不同地形上稳定地行走，并完成播种作业。\r\n\r\n播种机配备了控制系统，用于控制播种机的运行和播种的精度。控制系统通常由液压或电子控制器组成，可以根据农作物的需求调整播种机的速度和种子的投放量，以确保播种的均匀性和准确性。', '1698938817', 0, 0, 0, 0),
(93, 7, 10000, '拖拉机空气滤清器的维护保养技术要点？', '定期清洁滤清器是保持其正常工作的关键。应根据拖拉机使用频率和工作环境，每隔一段时间对空气滤清器进行清洁。清洁滤清器的方法有多种，可以采用吹气、刷洗或水冲洗等方式。在清洁滤清器时要注意避免损坏滤清器滤芯，可以先用空气吹除附在滤芯上的尘土，然后用清洁剂和软毛刷进行彻底清洗。\r\n\r\n定期更换滤芯也是滤清器维护保养的重要环节。滤芯的寿命与滤清器的使用寿命密切相关，因此应定期检查滤芯的状况并根据需要进行更换。一般来说，滤芯使用一段时间后会逐渐失去滤清能力，严重影响发动机的进气量和燃烧效率。因此，定期更换滤芯可以确保拖拉机发动机的正常运行。\r\n\r\n此外，保持滤清器的密封性也是维护保养的重要方面。滤清器需要保持良好的密封性能，以避免发动机进入未经滤净的空气。检查滤清器的密封圈是否完好，如有磨损或老化应及时更换。另外，在拆卸和安装滤清器的过程中要注意保持清洁，避免灰尘和杂质进入滤清器内部。\r\n\r\n定期检查滤清器的工作状态也是必要的。应定期检查滤清器的滤芯是否损坏或堵塞，如果发现问题应及时修理或更换。同时，还需检查滤清器外壳是否有裂缝或变形，以及固定螺栓是否松动。', '1698938890', 0, 0, 0, 0),
(94, 7, 10000, '拖拉机田间作业翻车有什么原因造成的？', '不当的驾驶操作是拖拉机翻车的常见原因之一。驾驶员可能会在操纵拖拉机时过于急躁或缺乏经验，导致操作不当，从而使拖拉机失去平衡。例如，在急转弯或行驶过程中突然变速，驾驶员的不熟练操作可能导致拖拉机丧失控制，瞬间翻车。此外，驾驶员还可能在不平整的地形上行驶，不注意地势的变化，导致拖拉机翻倒。\r\n\r\n拖拉机的维护不当也是翻车的原因之一。由于长时间的使用和磨损，拖拉机的零部件可能会出现松动或磨损。如果未及时发现并修复这些问题，就会增加拖拉机发生翻车的风险。例如，制动系统的失效、转向机构的故障或悬挂系统的问题，都可能导致拖拉机在作业过程中失控。\r\n\r\n此外，地形和环境条件也是造成拖拉机翻车的重要因素之一。不同地区的土地起伏不平、有坡度或存在陡坡，这些因素会增加拖拉机翻车的风险。此外，湿滑的田地或不良的气候条件也会增加拖拉机翻车的可能性。例如，雨水使得田地湿滑，拖拉机在行驶过程中容易打滑，导致不稳定和翻车。\r\n\r\n悬挂重量超载也是拖拉机翻车的原因之一。拖拉机的悬挂系统在设计时通常会考虑到其最大载重能力。然而，有时农民为了提高产量或节约时间，可能会超载拖拉机。当拖拉机悬挂的重量超过其最大承载能力时，拖拉机在行驶过程中容易失去平衡，发生翻车事故。', '1698938930', 0, 0, 0, 0),
(95, 7, 10000, '造成农机事故，机器原因指什么？', '机器原因可能是由于农机设备的设计或制造问题引起的。农机设备在设计和制造过程中，如果存在设计缺陷、制造不合格或使用低质量材料等问题，就有可能导致机器本身的故障或失效。例如，农机设备的结构强度不足，无法承受正常使用条件下的负荷，容易发生机械破裂或零部件脱落，从而引发事故。\r\n\r\n机器原因还包括农机设备的维护保养不到位。农机设备在使用过程中，需要进行定期的保养和维修，以确保其正常运行和安全使用。如果农机设备的维护保养工作得不到及时、正确地执行，就会导致设备的机械性能下降，使用安全性降低，从而增加事故发生的风险。例如，农机设备的润滑不足或润滑剂使用不当，会导致零部件的摩擦增加，从而引发机械故障。\r\n\r\n此外，机器原因还可能涉及到农机设备的老化和磨损。随着时间的推移和使用频率的增加，农机设备的零部件会逐渐磨损和老化，从而导致设备的性能下降和可靠性降低。如果不及时更换磨损的零部件或进行必要的维修，农机设备在作业过程中就会出现故障，进而引发事故。', '1698938974', 0, 0, 0, 0),
(96, 7, 10000, '轮式拖拉机的行走系由哪几部分组成？', '轮式拖拉机是一种广泛应用于农业生产、土地开垦、运输等领域的机械设备。其行走系统是拖拉机的关键部分，由多个部件组成，下面就来逐一介绍。\r\n\r\n一、导向系统\r\n\r\n导向系统是轮式拖拉机行走系统的重要组成部分。它包括转向轮、转向系统和转向柱等。转向轮是拖拉机的前轮，用于转向和控制拖拉机行进方向。转向系统是转向轮转向的关键部分，包括转向齿轮、转向杆、转向缸等。转向柱则是将操作者的方向盘操作转化为转向轮转向的机械连接部件。\r\n\r\n二、传动系统\r\n\r\n传动系统是拖拉机行走的动力系统，包括发动机、离合器、变速箱和驱动轴等。发动机是拖拉机的动力来源，可以为拖拉机提供驱动力。离合器和变速箱可以将发动机产生的动力传递到驱动轴上，驱动轴则将动力传递到轮胎上，使拖拉机前进。\r\n\r\n三、制动系统\r\n\r\n制动系统是保证拖拉机行驶安全的重要部分，包括制动器、制动踏板、刹车片等。当拖拉机行驶时，制动器可以使拖拉机减速或停止行驶。制动踏板则是控制制动器的机械部件，操作者踩下制动踏板后，制动器便可以起到制动作用。\r\n\r\n四、悬挂系统\r\n\r\n悬挂系统是拖拉机行驶过程中减少震动和颠簸的重要部分，包括悬挂器、弹簧和减震器等。悬挂器可以使拖拉机在行驶过程中保持平稳，减少颠簸和晃动。弹簧和减震器则可以起到缓冲作用，使拖拉机行进更加平滑。', '1698939018', 0, 0, 0, 0),
(97, 7, 10000, '联合收割机在路上行驶时对于速度有要求吗？', '联合收割机在路上行驶时确实有一定的速度要求。这是为了保证行车安全，防止事故的发生。一般来说，联合收割机在路上行驶时的速度应该控制在20-30公里/小时之间。这个速度既不会过快导致失控，也不会过慢影响交通流畅。同时，驾驶员应该根据路况和交通情况灵活调整速度，确保安全行驶。\r\n\r\n联合收割机在路上行驶时速度的控制也涉及到法律法规的规定。根据《道路交通安全法》规定，机动车行驶在道路上应当按照规定的速度行驶，并且不得妨碍其他车辆和行人的正常通行。因此，联合收割机驾驶员需要遵守交通法规，合理控制车速，确保行车安全。\r\n\r\n此外，联合收割机在路上行驶时还需要注意其他的安全问题。例如，要确保车辆的照明灯光齐全、清晰可见，以提高夜间行车的安全性。还要注意行车间隔，与其他车辆保持安全距离，避免碰撞事故的发生。同时，驾驶员还应该时刻关注路况，特别是在拐弯、超车等关键时刻，注意观察周围情况，确保安全行驶。', '1698939071', 0, 0, 0, 0),
(98, 7, 10000, '大型的秸秆打捆机，一天能打捆多少亩？', '我们需要了解大型的秸秆打捆机的工作原理。这些机器通常由一个强大的发动机驱动，具有强大的切割和压缩能力。它们通过移动在田地上，将散落在地上的秸秆捡拾起来，然后通过切割和压缩的方式将秸秆打捆成方便储存和运输的形状。\r\n\r\n一天能够打捆多少亩，取决于多个因素。首先是机器的工作效率和运转速度。一些先进的大型打捆机具有高效的工作机制，能够以较快的速度完成打捆任务。其次是田地的情况和秸秆的密度。如果秸秆密度较高，机器就可以快速完成打捆任务；而如果密度较低，打捆机可能需要更长的时间来捡拾和压缩秸秆。最后是操作人员的经验和技术水平。熟练的操作人员可以更好地掌握机器的工作效率和运转速度，从而提高工作效率。\r\n\r\n根据经验和数据，大型的秸秆打捆机一天通常可以打捆大约10-15亩的田地。当然，这只是一个大致的估计，实际情况会有所不同。一些先进的打捆机可能会有更高的工作效率，而一些老旧的机器可能会有较低的工作效率。', '1698939109', 0, 0, 0, 0),
(99, 7, 10000, '各地农机具补贴最高比例是多少？', '从整体来看，各地农机具补贴最高比例一般在30%至50%之间。例如，甘肃省对农机具补贴比例的规定为30%，这意味着农民购买农机具的时候，可以获得总价值的30%作为补贴。而江苏省则将农机具补贴比例提高到50%，以鼓励农民更多地投入现代化农机设备，提高农业生产效益。\r\n\r\n此外，一些地区还根据农机具的类型和功能来确定不同的补贴比例。例如，山西省对于小型农机具的补贴比例为40%，而对于大型农机具则降低到30%。这是因为小型农机具在农业生产中发挥的作用更为广泛，农民购买的需求也更为迫切，因此给予更高的补贴比例。\r\n\r\n另外，一些地区还根据农机具的使用情况来确定补贴比例。例如，河南省对于农机具的补贴比例根据年度使用时间进行了划分，根据不同的使用时间段来给予不同的补贴比例。这样的规定旨在鼓励农民充分利用农机具，提高农业生产效益。\r\n\r\n', '1698939167', 0, 0, 0, 0),
(100, 7, 10000, '要深入推进农业机械化供给？', '要加强农业机械化供给体系建设。政府应加大投入力度，完善农业机械化供给体系，提高设备适用性和性能，并提供技术支持和培训服务。同时，要推动农机企业加强研发和创新，提高产品质量和技术含量，满足农业生产的多样化需求。\r\n\r\n要加强农业机械化供给渠道建设。政府应加大对农机合作社、农业机械服务站等供给渠道的支持力度，提供资金和技术支持，推动其健康发展。同时，要加强市场监管，打击假冒伪劣产品，保障农民购买到优质、正规的农业机械化产品。\r\n\r\n要加强农业机械化供给政策支持。政府应出台有利于农业机械化发展的政策措施，包括加大财政补贴力度，降低农机购置成本，提高农机购置补贴的覆盖面和标准，鼓励农民购买和使用农机设备。同时，要加强对农机设备的技术标准和质量监管，提高产品的安全性和可靠性。\r\n\r\n要加强农民的农业机械化意识和能力培养。政府应加大对农民的培训力度，提高农民的技术水平和操作能力，使其能够熟练使用农机设备，提高农业生产效益。同时，要鼓励农民参与农机合作社和农业机械服务站的建设，提高农民的组织能力和集约化经营水平。', '1698939208', 0, 0, 0, 0),
(101, 7, 10000, '农业机械按作业机具与拖拉机的联结方式可分为哪几种？', '最常见的联结方式是三点悬挂系统。这种方式利用拖拉机后部的三个点与作业机具的悬挂机构相连接，实现二者之间的牵引和传递力。三点悬挂系统具有结构简单、方便快捷的特点，广泛应用于各种农业作业，如犁耕、播种、收割等。\r\n\r\n还有挂接式联结方式。这种方式采用拖拉机后部的挂接杆或挂接臂与作业机具的挂接钩相连接，实现二者之间的联结。挂接式联结方式适用于一些重型作业机具，如大型犁耙、土壤整地机等，它们需要更牢固的联结方式来承受较大的作业压力。\r\n\r\n此外，还有半挂接式联结方式。这种方式类似于挂接式联结，但是拖拉机和作业机具之间通过一根转动的连接杆相联，实现二者之间的联结。半挂接式联结方式一般用于较大的作业机具，如铲运机、收割机等，它们需要更灵活的联结方式来适应不同的作业情况。\r\n\r\n还有其他特殊的联结方式。根据具体需求，农业机械的联结方式还可以采用其他特殊设计，如吊挂式联结、牵引式联结等。这些特殊的联结方式适用于一些特殊的农业作业，如果园管理、蔬菜种植等。', '1698939249', 0, 0, 0, 0),
(102, 7, 10000, '联合收割机安全作业注意事项有哪些？', '使用联合收割机之前，必须确保机器处于良好的工作状态。检查机器的各个部件是否正常运转，包括发动机、传动系统、刀片等。如果发现有任何故障或异常情况，必须及时修理或更换零件，确保机器的正常运行。\r\n\r\n操作人员在作业过程中要穿戴合适的防护装备。联合收割机的刀片旋转速度非常高，一旦发生意外，可能会导致严重的伤害。因此，操作人员应该戴上安全帽、防护眼镜、耳塞等防护装备，以减少潜在的伤害风险。\r\n\r\n另外，操作人员在使用联合收割机时，要注意安全操作规程。首先，要确保周围没有其他人员或动物，以免发生伤害事故。其次，要保持专注，不要分心或疲劳驾驶，以免造成操作失误。还要注意机器的平稳运行，避免突然转弯或急剧加速，以免造成倾翻或损坏机器。\r\n\r\n作业完成后，要及时对联合收割机进行清洁和维护。清除机器上的秸秆、泥土等杂物，避免积累导致机器故障。检查刀片是否正常，如有磨损或损坏应及时更换。同时，定期对机器进行保养，包括润滑、紧固螺栓等，以保证机器的长时间稳定运行。', '1698939296', 0, 0, 0, 0),
(103, 7, 10000, '发动机水冷式冷却系统由什么组成？', '水冷式冷却系统的核心组成部分是散热器。散热器位于发动机前部，通常由多排平行管道组成。冷却剂通过这些管道流动，与散热器外表面的空气进行热交换。这样，热量就会被散热器带走，冷却剂再次回到发动机中循环。散热器的设计和材料选用会直接影响其散热效果。\r\n\r\n水泵是水冷式冷却系统中另一个重要的组成部分。水泵通常由一个轴和叶轮组成，轴通过发动机的动力传动装置驱动。当发动机运转时，水泵的叶轮旋转，将冷却剂从发动机底部抽吸出来，并将其推送到散热器。水泵的工作稳定性和流量效率对冷却系统的性能至关重要。\r\n\r\n另外，水冷式冷却系统还包括冷却液箱、冷却液管路和节温器等组成部分。冷却液箱通常位于引擎舱内，用于储存冷却剂。冷却液管路用于将冷却剂连接到发动机和散热器之间。节温器则是负责控制冷却系统的温度，确保发动机在适宜的工作温度范围内运行。\r\n\r\n冷却液也是水冷式冷却系统中的关键组成部分。冷却液通常是一种特殊的防冻液，它具有较高的沸点和较低的结冰点。冷却液不仅可以带走热量，还可以起到防锈和防腐的作用。同时，冷却液还需要具备良好的热传导性能和流动性能，以确保整个冷却系统的正常工作。', '1698939358', 0, 0, 0, 0),
(104, 7, 10000, '申请拖拉机驾驶证相关条件有哪些？', '年龄是申请拖拉机驾驶证的重要条件之一。通常来说，大多数国家对拖拉机驾驶证的申请者年龄都有规定。一般来说，农村地区的法律规定，申请人必须年满18岁才能申请拖拉机驾驶证。这是因为拖拉机是一种较为庞大的农用车辆，驾驶者需要具备一定的成熟度和责任心，以确保驾驶安全。\r\n\r\n申请拖拉机驾驶证的条件还包括身体健康状况。由于拖拉机驾驶需要一定的体力和耐力，因此申请人需要经过身体健康检查，并符合相关的身体条件。通常要求申请人没有严重的视力问题、听力问题以及一些严重的慢性病，如心脏病、癫痫等。这是为了确保驾驶者能够在需要的时候正确地应对紧急情况。\r\n\r\n此外，申请拖拉机驾驶证还需要具备相关的驾驶技能和知识。通常申请人需要参加一定的培训课程或考试，以掌握正确的驾驶技巧和了解拖拉机的基本知识。这些技能和知识包括正确驾驶拖拉机的操作、掌握拖拉机的特点和性能、掌握安全驾驶的法规和规范等。这是为了确保驾驶者能够熟练、安全地驾驶拖拉机。', '1698939411', 0, 0, 0, 0),
(105, 11, 10000, '对田园生活的向往', '常被朋友圈分享的一些田园生活吸引，生活充满了诗情画意，充满了田园的小美好。原本一颗喜欢田园的心又开始蠢蠢欲动起来，也想象在一个小山村里租一片地，再租一间屋子，把房子按照自己的想法装修起来，房屋简单装修，处处都体现自己的用心自己的喜好。然后在田地里种上喜欢的瓜果蔬菜，种些蔷薇、种些格桑花、种些四叶草、把小院收拾得充满田园气息。\r\n\r\n在夏日的清晨，提着竹篮子到果园里去摘些新鲜的水果，桃子、杏子，再采摘一些西红柿，黄瓜，割把韭菜再摘几个茄子。那些没有上过任何农药，纯天然、绿色无污染的蔬菜，吃到嘴里一定是清甜可口的滋味，像小时候母亲在菜地里种的那些蔬菜的味道。\r\n\r\n久居城里的我们已经离田园的生活越来越远，也越来越向往了。偶尔有空时才能去郊外转转感受花草树木的清新，和大自然接近。\r\n\r\n在城市里打拼的人就像困在笼中的小鸟，被日复一日的工作困住身心，城市是人们负重前行努力的地方， 在城市里工作的人，奋斗着努力着，丝毫没有心灵舒放自在的感觉，人是紧绷的状态。乡村变成了享受生活的地方，那些清风明月、随风摇曳的野花，在乡村里是常见的景，美好又清新。\r\n\r\n于是渐渐地便有越来越多的人选择了去乡下生活或山里居住。', '1698939603', 0, 0, 0, 0),
(106, 11, 10000, '田园综合体：田园生活+养生养老', '农作，指的是农业生产和农村经济活动，包括作物栽培、树木栽植、畜牧饲养和水产品捕捞、养殖，以及农产品加工、建筑、流通、服务等；农事，指的是农村中除农业生产和农村经济活动之外的其他一切社会事务，包括政治活动、村庄建设、乡风文明和宗教信仰等；农活，指的是农村中的日常生活，包括食、穿、住、行等。\r\n\r\n这其实还是说的本人早先提出的“六风”资源，即：田园风光、村落风貌、民间风俗、传统风物、乡土风情和乡村风味，涉及生态、生产和生活，目的就是通过田园养生，提高城乡人生命质量。（参阅《乡村旅游之“五生、五风和五味”》）', '1698939667', 0, 0, 0, 0),
(107, 11, 10000, '种田是种什么体验？', '在重庆农村呆过4年，因此体验过4年的种田经历。（6岁就开始下田了，我厉害吧！）\r\n因为重庆是丘陵地形（至少我老家那里是这样），所以都是梯田。\r\n找了一下我以前拍的照片，发现没有比较显著的梯田的照片，用这张凑数吧。\r\n作者：知乎用户\r\n链接：https://www.zhihu.com/question/29993770/answer/79137857\r\n来源：知乎\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\r\n\r\n种田之前需要先用牛带着犁头犁田，目的应该就是松土吧，然后要撒肥料什么的。再接下来就是插秧。如果没记错的话，应该是春天还比较冷的时候下田插秧。 插秧是算是整个种田活动中对小孩最友好的部分了吧，因为可以名正言顺的下田玩水。水稻的苗就跟小葱差不多，是一把一把的。需要把它们分成3根一小把插在一起。对了，为了种的整齐还会牵线来帮助对齐。当然比较恶心的地方就是不注意的话会被蚂蟥咬。然后夏天的时候如果遇到田里缺水需要从临近的池塘引水到田里。有两种方式，如果是往高处就需要用抽水机，如果是往低处，就翻水（如果没记错，应该是叫这个词吧，利用虹吸原理引水），或者直接从池塘放水出来。然后这期间是青蛙活跃的季节，晚上没事就会拿着麻袋和电筒去田里捉青蛙。当然苦活都是大人干啦，小孩主要负责围观和吃。然后收谷子了，收谷子需要先把稻子用镰刀割下来，然后捆成一大绑然后用下面的这个工具挑回自己的坝坝。', '1698939818', 0, 0, 0, 0),
(108, 7, 10000, '种田', '种田之前需要先用牛带着犁头犁田，目的应该就是松土吧，然后要撒肥料什么的。再接下来就是插秧。如果没记错的话，应该是春天还比较冷的时候下田插秧。 插秧是算是整个种田活动中对小孩最友好的部分了吧，因为可以名正言顺的下田玩水。水稻的苗就跟小葱差不多，是一把一把的。需要把它们分成3根一小把插在一起。对了，为了种的整齐还会牵线来帮助对齐。当然比较恶心的地方就是不注意的话会被蚂蟥咬。然后夏天的时候如果遇到田里缺水需要从临近的池塘引水到田里。有两种方式，如果是往高处就需要用抽水机，如果是往低处，就翻水（如果没记错，应该是叫这个词吧，利用虹吸原理引水），或者直接从池塘放水出来。然后这期间是青蛙活跃的季节，晚上没事就会拿着麻袋和电筒去田里捉青蛙。当然苦活都是大人干啦，小孩主要负责围观和吃。然后收谷子了，收谷子需要先把稻子用镰刀割下来，然后捆成一大绑然后用下面的这个工具挑回自己的坝坝。', '1698939886', 0, 0, 0, 0),
(109, 7, 10000, '“大不了回家种地去”，回家种地真的是你的退路吗？', '生活中，职场中，遇到困难时，常听人说，大不了回村种地去，以后回乡下种田养老去！\r\n\r\n说这些话的，大部分是从农村出来，在城里生活的年轻人。父母或家人在乡村，在村里有房有地。\r\n\r\n回到村里容易，但你真的会种地吗？\r\n\r\n在城市生活已久，我们似乎忘记了自己原先也弄过田种过地。\r\n\r\n只浅浅了解父母种地，觉得好像也不怎么难；只在网上看到李子柒和乡愁等博主的田园生活，便觉得乡村生活很美好，对田园生活很向往。\r\n\r\n但是，实际的乡村种田生活，真的如此吗？\r\n\r\n假如乡村生活如此美好，还会有那么多的年轻人逃离农村吗？\r\n\r\n你看到的农村美好，只是表象，真实的生活远不如表象那么美好。\r\n\r\n作为农村出生，农村长大，真正感受过种田生活，感受过农村与城市生活差异的人来说，我还是有一些发言权的。\r\n\r\n如果你很有钱，生活无忧，回到乡村，只是想感受一下田园生活，过过惬意自在的日子，当我没说。\r\n\r\n如果你没啥钱，想回到乡下，真的要靠种田赚钱、生活创业之类的，那回村，真的没那么容易。\r\n\r\n你的种田日记\r\n首先，种田是项技术活，不是人人都能把地种好的。\r\n对半路出家的人来说，要学的种地知识太多了。\r\n\r\n你知道水稻小麦啥时候播种吗？你知道种子要买什么样的吗？你知道施肥要买什么肥料吗？你知道病虫害怎么处理吗？\r\n\r\n不知道的，要学的太多了，有些甚至有经验的老农都不一定了解。家里有父母指导还好说，没有的话找人学习人家也不一定会教好。\r\n\r\n\r\n\r\n其次，种田风险大。\r\n自古农民都是靠天吃饭。想要丰收就要风调雨顺。而天气的事情，人力无法触达。\r\n\r\n大家都知道，最近几年天气反常，极端天气非常多，各种气候灾难频频。\r\n\r\n比如河南特大暴雨，西南泥石流，干旱，雨水不断等等，都对农业生产影响很大，更有甚者颗粒无收，一年不仅白干还要欠债。\r\n\r\n\r\n\r\n然后，种田弄地要赚钱，市场意识不可少。\r\n农业生产本质上也需要和市场行情挂钩。农业产品种类千千万万，要有敏锐的市场嗅觉，发掘出潜力农产品。\r\n\r\n就如同金融市场玩股票基金，看好行情，买定离手，剩下的就看命了。\r\n\r\n就像前些年的农产品价格暴涨，“蒜你狠 豆你玩 姜你军 猪你涨 向钱葱”。不仅要因地制宜选产品，还得根据市场看行情。\r\n\r\n\r\n\r\n再次，小规模发不了大财，大规模投入成本高。\r\n全中国农民千千万，大部分家庭式小农经济，一家也就几亩几十亩百来亩田地，还得自己思量分配多少地种什么农产品。\r\n\r\n你见过哪个靠种地小富的？只有大规模生产承包，才有可能年赚几十万上百万。\r\n\r\n但是大规模生产，必须靠机械，投入成本大，承担的风险更高。一旦有个天灾人祸，没有资本后盾，裤衩都得赔掉。\r\n\r\n\r\n\r\n然后，谷贵饿农，谷贱伤农。\r\n农业生产事关国计民生，和每个人的吃喝拉撒息息相关。它受国家宏观调控，并不完全由市场控制。\r\n\r\n价格太高必然会被管控，恩格尔系数是必然要下降的。\r\n\r\n这么多年生活下来，买米买菜，一些基础的农产品是不是从来没有高价？国家要让每个人都买得起米，吃得起饭啊。\r\n\r\n\r\n\r\n最后，种田是真的很辛苦很辛苦。\r\n家里是种田的，小时候一定帮家里干过农活。\r\n\r\n我五六岁就开始帮家里干农活了。那时候人比水稻高不了多少，就拿根小木棍一头挑一小捆水稻来来回回往家跑。\r\n\r\n下田还遇到蚂蟥爬脚背，怕的要死。花生播种时，顶着烈日，口渴的感觉还记忆犹新。\r\n\r\n秋冬收包菜，那时候包菜丰收，价格太低了，一两分钱一斤，收包菜的满了车要开走了，我和爸爸担着包菜筐追着车跑，拼命把包菜扔到车里去，就为了收回家的包菜能被菜贩子收走，换上几块钱，而不是当做肥料烂掉。\r\n\r\n每次想到抱着包菜追着货车跑的画面，都觉得辛苦又心酸。\r\n\r\n小时候就觉得苦，长大了享受过不用种田的幸福，真的还能吃的了种田的苦吗？\r\n\r\n\r\n\r\n乡村社会你受得了吗？\r\n还有重要的一点，回到农村生活，流言蜚语、家长里短、你来我往、风凉话小动作，你受得了吗？\r\n\r\n农村的哪个人没被说？狗路过村口都得被骂两句。说几句倒没啥，就怕有人眼红，背后搞你。之前新闻不是有家人养鱼赚钱，就被人下药把鱼都毒死了。\r\n\r\n\r\n\r\n所以，还真不能轻易“大不了回家种地去”，这样想想，好像乡下出来的年轻人挺可怜的，融不进的城市，回不去的乡村。\r\n\r\n不过随着社会发展，城市化进程加快，回乡发展并不是不可能。\r\n\r\n要是像李子柒一样通过乡村田园生活发展自媒体，像沈丹一样通过乡村自媒体发展乡村经济，也是个不错的回家种地方向。\r\n', '1698940691', 0, 0, 0, 0),
(110, 12, 10000, '望重视！！！！', '你们这是什么网站啊，你们这是害人不浅啊你们这个网站。我儿子现在还想着种田，你叫我儿子怎么办啊，他都24岁了好不好。我跟你们说你们这帮人啊，一天到晚搞这些什么种田啊养殖啊会害死你们的！你们没有前途我跟你们说。', '1698941037', 0, 0, 0, 0),
(111, 12, 10000, '关掉！关掉！一定要关掉', '关掉！关掉！\r\n一定要关掉！\r\n再不关掉那些种田网站，\r\n小孩哪有美好的未来，\r\n哪有美好的前程，\r\n祖国哪有栋梁之才！', '1698941894', 0, 0, 0, 0),
(112, 12, 10000, '我向佛祖许愿', '我向佛祖许愿，希望农民都能健健康康\r\n佛说：只能四天\r\n我说：行，春天，夏天，秋天，冬天\r\n佛说：不行，只能三天\r\n我说：行，昨天，今天和明天\r\n佛说：不行，只能两天\r\n我说：行，黑天和白天\r\n佛说：不行，只能一天\r\n我说：行，那就每一天\r\n佛哭了', '1698942199', 0, 0, 0, 0),
(113, 11, 10000, '走向田园', '美国作家梭罗则在失去了情人后说，不必给我爱；在失去兄长和朋友后说，不必给我金钱与荣誉。不同时期不同国度的两个大文豪，在尘世漂泊多年后，作出的抉择却是那么惊人地一致。那就是：远离喧嚣，走向田园。', '1698992761', 0, 0, 0, 0),
(120, 11, 10000, '秋日', '秋天，是一个收获的季节，乡村变成金色的海洋。山野稻田换上了耀眼的新装。玉米成熟了，高粱、大豆也成熟了。水稻的稻秆都擎起了丰满的穗儿，微风中稻一浪一犹如优美的五线谱，一个个稻穗儿，就是一个个跃动的音符，谱写着农民伯伯丰收后的欢乐与喜悦，记录着农民伯伯所奉献的辛劳与汗水。', '1698995234', 0, 0, 0, 0),
(115, 11, 10000, '人源自于自然', '一个人在都市生活久了，离恬静纯朴的大自然越来越远。整天萦绕于心的是焦灼和忧虑，回旋在耳畔的是嘈杂和浮躁。人毕竟来源于自然，是自然之子，崇尚自然之情尚存、亲近自然之心难泯，或许这就是我向往田园的缘故吧。', '1698993101', 0, 0, 0, 0),
(116, 11, 10000, '向往田园生活', '好向往某种田园生活，类似隐居的。就在荒无人烟的地方盖一栋小房子，不漏雨不漏风就好。开辟一小块田来自给自足，我可以吃得很少。衣服需要买几套耐穿的，厚薄的棉被也都买足了。最好再收一只猫或狗作伴。那种生活该多美好，醒来值得惦记的就只是我的粮食长得怎么样，我的猫咪小狗还在不在，或者我的屋顶是不是要修补了。不需要想着成绩，只捡我爱看的闲书看看，发呆也行。不需要和人打交道，没有争吵也没有戏谑，一整天不说话都无所谓。除了生死以外，没有值得让我焦虑的事情，我所关心的就只是人类生活本身。这该有多美好。', '1698994466', 0, 0, 0, 0),
(117, 11, 10000, '乡村田野', '在乡村的田野里，映入眼帘的不是黄色，就是绿色、黄色是广阔的麦田。春天，它们绿油油的，有点像可爱的小草，又像披上了嫩绿的服装；夏天，麦田换上了耀眼的浅黄色新装；每根麦秆都擎起了丰满的穗儿，可爱极了。那绿色就在蔬菜上了。你看：卷心菜、萝卜、土豆、油菜花、玉米它们都在你的眼前红色、紫色就在田野边上的花朵中。瞧，有几只小蜜蜂正兴高采烈得在花芯中嗡嗡地采蜂蜜。', '1698994577', 0, 0, 0, 0),
(118, 11, 10000, '乡村的小溪', '乡村，美在小溪里。乡村的小溪，叮叮咚咚的流水声，谱成了一首欢快的歌曲，写在肥沃的土地上。小溪清澈见底，可以看见水底的沙石和一条条欢快的鱼儿。岸边，一排排垂柳一一向水，倒映水中，构成了一幅美丽的图画。夏天，小伙伴们欢乐的笑声荡漾在小溪中，小溪也笑了，尽管小伙伴们浑身都湿透了，可还是舍不得离开小溪。', '1698994699', 0, 0, 0, 0),
(119, 11, 10000, '春日田野', '田野里，不时地飘来泥土的芳香。放眼望去，满眼都是嫩绿的麦苗，一直延伸到遥远的地平线，而霞光将它的眷恋留给苍穹的同时，也留给了大地。太阳快落山时，可天还是很亮。这时，天上只有几朵白云，就像是在大海上行驶的几艘帆船。这个时候，在树上和地上的鸟儿已经几乎回巢了，可还有些鸟儿在外出觅食。突然，不只是一只鸟儿受了惊吓，拖着长长的叫声，飞向远方。', '1698994816', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `forum_type`
--

CREATE TABLE `forum_type` (
  `id` int(11) NOT NULL COMMENT '分类编号',
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '分类标题'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `forum_type`
--

INSERT INTO `forum_type` (`id`, `title`) VALUES
(7, '农业科技'),
(10, '技术帮扶'),
(11, '田园生活'),
(12, '意见箱');

-- --------------------------------------------------------

--
-- 表的结构 `news_images`
--

CREATE TABLE `news_images` (
  `_id` int(11) NOT NULL COMMENT '唯一编号',
  `_newsid` int(11) NOT NULL COMMENT '文章编号',
  `_img` text NOT NULL COMMENT '图片路径'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `news_list`
--

CREATE TABLE `news_list` (
  `news_id` int(11) NOT NULL COMMENT '新闻编号',
  `news_image` text COMMENT '新闻封面路径',
  `news_name` text NOT NULL COMMENT '新闻标题',
  `news_content` text NOT NULL COMMENT '新闻内容',
  `news_author` text NOT NULL COMMENT '新闻作者',
  `news_userid` int(11) NOT NULL COMMENT '发布用户ID',
  `news_date` char(10) NOT NULL COMMENT '发布日期',
  `news_zan` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数量',
  `news_view` int(11) NOT NULL DEFAULT '0' COMMENT '新闻浏览量',
  `news_status` int(11) NOT NULL DEFAULT '0' COMMENT '新闻状态0可用1异常',
  `_tid` int(11) DEFAULT NULL COMMENT '时间戳id值'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `news_list`
--

INSERT INTO `news_list` (`news_id`, `news_image`, `news_name`, `news_content`, `news_author`, `news_userid`, `news_date`, `news_zan`, `news_view`, `news_status`, `_tid`) VALUES
(119, '/uploads/images/news/1698939077_1660670016.png', '疫情期间不误农时 合众思壮助力春耕提质增效', '《新闻联播》报道，“农业大省山东把眼下的春耕作为打造乡村振兴齐鲁样板的最大抓手，在春耕中全面推广新装备、新模式，提高农业生产效率。这两天，在山东莱西市马连庄镇抬上村，农机手赵振东的四台大型智能化拖拉机正在进行土地深耕、起垄。今年春耕，他的拖拉机上有了新装备，靠北斗导航来精准把控作业行进路线。”农机手赵振东在接受采访时表示：“我这个自动驾驶的拖拉机，一天能干150多亩地，顶八九十个劳力，八九个村的活我一周就干完了。”农机手列举的多个数据说明，这套新装备在提高农业生产效率，节省人力和物力，降低劳动强度等方面发挥了突出的成效。而这套新装备正是由合众思壮自主研发的慧农®EAS100。\r\n\r\n\r\n\r\n自主研发 远程操控\r\n\r\n慧农®EAS100是合众思壮依托北斗高精度应用领域全产业链优势，完全自主研发的全新自动驾驶系统。系统优势有1.电机扭矩大，对农机进行精准控制，作业精度达2.5cm；2.采用全新安卓显控软件，界面简洁，操作流畅，操作更得心应手；3.无需安装角度传感器，安装维护方便，根据不同作业场景可选装；4.多种先进应用：超低速作业、全路径无人驾驶对角线耙地和多种曲线作业，适应不同作业应用场景，提高作业效率，节省劳动力；5.智能引导界面，远程桌面协助、升级和授权，维护更轻松，疫情期间，足不出户就能指导用户高效作业，解决用户遇到的问题。\r\n\r\n慧农®EAS100轻松适配多种类型农机和工程车辆：拖拉机、收割机、插秧机、植保机、压路机、桥梁检测车等。可用于多种作业场景：播种、起垄、耙地、喷药、收割和开沟等。\r\n\r\n\r\n\r\n高效便捷 经济环保\r\n\r\n用户通过使用这套系统，可实现无人驾驶模式，单台农机均日作业量较人工驾驶提高超过30%，农作物产量提高约5%，土地有效利用率提高约7%，燃油消耗节约10%。作业不受限于时间问题，白天黑夜均可连续作业，单作业季一台农机节本增效达3000元人民币的突破。\r\n\r\n同时，确保农机车辆精密循迹和自动规划，农田可重复性作业，解决了农机播种作业中出现的“播不直、接不上茬”的问题。系统高效便捷，价格亲民，经济环保，对于提升农业综合效益和核心竞争力有着积极的促进作用。目前，该产品已在新疆、东北、河北、山东等地应用。\r\n\r\n合众思壮在精准农业领域提供慧农®“云+端”解决方案，以慧农®信息化平台为核心的云平台，支持多种终端和系统接入。除文中提到的慧农®EAS100外，慧农®RinoSteer液压自动驾驶系统、全新慧农®EAS201自动驾驶系统、慧农®PT系列北斗定位终端和慧农®辅助导航系统，均可接入慧农®云平台，实现远程农机定位监控，并对农机进行科学调度，可有效提高农机资源利用率。用户可根据自身不同需求，选择适合的产品服务。\r\n\r\n依托卫星导航定位领域的优势资源，合众思壮将继续保持勇于进取的开拓精神，凭借自身深厚的研发实力和技术储备，为用户提供优质的线上线下产品服务，为推进我国精准农业现代化发展不懈努力。\r\n\r\n小贴士：北京合众思壮科技股份有限公司(股票代码：002383)是北斗导航行业龙头企业，与中国卫星导航产业共同发展，实现了全产业链布局，拥有了从高精度核心技术、板卡部件、终端设备、解决方案到服务平台的全产业链产品与服务。合众思壮已形成全球化业务布局和服务能力，以全球化视野进行全球资源配置，构建了以中国、美国、加拿大、意大利在内的国内、外产品研发生产与营销架构体系，业务遍布全球的90多个国家和地区，为推动北斗全球发展奠定坚实基础。2019年10月，兴港投资集团成为合众思壮控股股东，加快了北斗导航与5G+物联网等战略新兴产业落地实验区的步伐。未来，双方将以郑州航空港区的智慧城市应用需求为基础，发展“云+端”时空物联应用示范区，形成智慧城市和智慧行业的典型应用，逐步向河南省和全国进行推广，打造时空物联产业应用。同时带动上下游产业的孵化和发展，在航空港打造北斗导航产业集群，推动区域新兴产业加速集聚，助力航空港实验区“重装上阵、二次出发”，为郑州国家中心城市建设、中原更加出彩做出新的更大贡献。（作者：思壮快讯公众号）', '思壮快讯公众号', 10000, '1698939077', 0, 0, 0, 0),
(120, '/uploads/images/news/1698939134_1587120460.png', '农业农村部：落实藏粮于地、藏粮于技战略，确保今年粮食产量保持在1.3万亿斤以上', '近期，“三农”领域政策频出。\r\n\r\n2月21日，2021年中央一号文件下发，提出把全面推进乡村振兴作为实现中华民族伟大复兴的一项重大任务，举全党全社会之力加快农业农村现代化，让广大农民过上更加美好的生活。\r\n\r\n2月23日，《关于加快推进乡村人才振兴的意见》下发，提出培养造就一支懂农业、爱农村、爱农民的“三农”工作队伍，为全面推进乡村振兴、加快农业农村现代化提供有力人才支撑。\r\n\r\n2月25日，国家乡村振兴局正式挂牌。同一天，农业农村部印发《关于落实好党中央、国务院2021年农业农村重点工作部署的实施意见》（以下简称《意见》），以期更好地对这些政策文件进行贯彻落实。', '张蕊', 10000, '1698939134', 0, 0, 0, 0),
(121, '/uploads/images/news/1698939403_1633156391.png', '直击“三夏”现场（三） 国际交流取长补短 助推农业技术推广落地', '近日，党委宣传部、曲周实验站、资环学院、曲周县和中央电视台共同策划系列报道，聚焦我校师生在河北曲周县服务农业生产，助力乡村振兴的事迹，系列报道从6月11日起连续三天在中央电视台农业农村频道《中国三农报道》栏目播出，本网对相关新闻予以转载，以飨师生。', '中央电视台农业农村频道', 10000, '1698939403', 0, 0, 0, 0),
(122, '/uploads/images/news/1698939495_1477796720.png', '2019品牌农业影响力年度盛典在京举行', '人民网北京1月13日电 (张桂贵)为进一步提高我国农业品牌化水平，实现品牌强农的发展目标，由农业农村部市场与信息化司、乡村产业发展司和农产品质量安全监管司指导，中国优质农产品开发服务协会联合多家单位主办的2019品牌农业影响力年度盛典于1月12日在京举行。\r\n', '人民网', 10000, '1698939495', 0, 0, 0, 0),
(123, '/uploads/images/news/1698939621_1610491288.png', '人工智能如何引领农业的落地应用！', '　　一直以来，我们都是在关心AI是如何影响医疗、服务、工业生产等行业的发展和改变的，却忽视了AI在农业上重要地位和作用。随着科技的不断的发展，人们逐渐意识到人类已经具备了设计和建造智慧型设施农业所需的硬件和软件技术条件，完成工厂化农业生产已经不是梦想，智能农业即将到来。\r\n\r\n\r\n　　在2017年7月8日国务院发布的《新一代人工智能发展规划》中明确指出，到2025年人工智能基础理论实现重大突破，部分技术与应用达到世界领先水平，人工智能产业进入全球价值链高端，新一代人工智能在智能制造、智能医疗、智慧城市、智能农业、国防建设等领域得到广泛应用，人工智能核心产业规模超过4000亿元，带动相关产业规模超过5万亿元的战略目标。而智能农业作为规划的重点项目之一，是如何在AI的引领下实现更落地的应用的。\r\n　　AI可以有效的分析土壤的性质特征，实现最佳的宜栽作物时间，提高经济效益\r\n　　我们都知道，科技对农业的发展有着相当重要的作用，不管是新一代的温室大棚、还是智能农业，都离不开科技的推动。而对于如今的AI指导农耕，也不是什么新鲜、或者创新的话题了。\r\n\r\n　　近期，更具国外媒体报道，来自以色列特拉维夫的创企Prospera在B轮融资中获得了1500万美元的资金，而该公司的主要业务就是利用计算机视觉和人工智能技术帮助农民分析从田地获得的数据。该创企将利用这笔融资进军更多的全球市场，扩大面向客户的团队规模，并将覆盖更多的作物。\r\n　　那么，AI又是如何帮助农民从田地里分析数据的？\r\n　　如果是农村出来的人一定知道，在农作物宜栽之前，我们需要做好多的前期工作，比如分析那块地适合耕作、地的土壤送至情况、哪一块地适合种植哪种农作物等等一系列的前期考量，并且最终的结果也只是凭多年的耕作经验得出的结论，而没有实际的科学数据作为依据，因此往往在收割情况、经济效益上面有很大的差距。\r\n　　然而，AI技术将在这方面大大的提高了农作物的生产效率和经济效益。在土壤分析等农业生产智能分析系统中，应用最广泛的技术就是人工神经网络（简称ANN），它将模拟人脑神经元，实现对人脑系统的简化、抽象和模拟等技术分析土壤性质特征，并将其与宜栽作物品种间建立关联模型。借助非侵入性的探地雷达成像技术探测土壤性质特征和通过分析电磁感应土壤传感器获取的信号的技术获取土壤表层的粘土含量信息等等。从而精准的判断出相应的土壤适合宜栽的农作物，提高农作物的生产效率和经济效益。\r\n　　有效解决传统的农作物维护过程中，只能凭经验操作，比如灌溉用水、除虫、草剂的用药量的情况\r\n　　在传统的农作物维护过程中，我们会时常的隔断时间进行农作物的灌溉、施肥的处理。而在此过程中也会时常遇到灌溉、施肥过度而导致农作物损失的情况，特别是对农作物没有经验的农民。\r\n　　AI技术将可以帮助农民选择合适的水源、合适的肥料对农作物进行灌溉，施肥，保证农作物的用水量、施肥量，大大减轻灌溉问题对农作物产量造成的不良影响。\r\n　　而利用人工智能技术进行智能杂草识别喷雾系统在农业上已经有了多年的发展。图像分析系统通过分析田间图像的颜色模型，根据色差分量、颜色特征实现杂草实时识别，最后提取其相关特征参数，配合超生测距等技术可以精确控制喷头位置及用药量。该技术的应用可以大大提高除草剂的经济性，对保护环境也大有益处。\r\n　　AI在农作物未来发展的前景\r\n　　我们刚刚谈了AI农作物在产前和产中的落地式应用，其实AI在产后也有着重要的作用，比如工程师们设计出了一种可用于搬运农产品的磁机器人手爪，可以搬运胡萝卜、葡萄等各种各样形状的农产品，而且该磁机器人手爪能够快速、准确的工作，并且不会损坏任何一个产品。避免了我们传统手工摘取方法导致的时间问题和意外抓伤、损坏的风险。\r\n　　虽然AI在引领农业的发展中有着重要的作用，但AI应用于农业技术还处于基础阶段。另外，AI属于一种全新的科技应用属于发展初期，并没有完全普及下来。而作为普通的农民，在受教育程度和掌握新技术技能方面还无法达到基本的要求。因此，对于AI在未来农作物的发展中，还需要去不断的技术指导和相关知识的普及。而验证这最好的办法就是时间。', '马骁潇', 10000, '1698939621', 0, 0, 0, 0),
(106, '/uploads/images/news/1698890185_1432109804.png', '山西80后小伙：用科技让农民富起来！', '走向我们的小康生活丨山西80后小伙：用科技让农民富起来！\r\n\r\n　　年轻人种地什么样？不再是下苦力靠天吃饭，而是用上了各种高科技智能化手段。\r\n\r\n　　在我国首批两个“国家农业高新技术产业示范区”之一的山西晋中，产业、人才和科技的平台，让80后小伙种地有了很多秘密武器，也带动了上万户村民增收。\r\n\r\n　　山西农谷巨鑫农业公司技术员 赵杰：我叫赵杰，是山西农谷巨鑫公司的一名技术员。我是从小就生活在农村，每天看着爸妈种地特别辛苦，收入也不高。所以我有个心愿，想要通过先进科技让农民富起来。但大家都知道，农业领域投资大、周期长、回报慢，是个苦差事。直到2016年，太谷建了农高区，也就是我们所说的农谷，让我看到了希望。四五年的时间里，我从一个什么都不懂的小白，到现在也能给别人传授知识。我深刻的明白，想搞好现代农业单靠个人是远远不够的，必须要借东风。很幸运，我遇到了山西农谷这样的平台。\r\n\r\n　　山西省晋中市太谷区墩坊村村民 胡吉明：咱们这几年的苗子质量一直都不错，收入也一直比较稳定，(一年收入)10万多，(生活)也过得比较幸福，一天比一天好。\r\n\r\n　　山西农谷巨鑫农业公司技术员 赵杰：像刚刚我们去过这家一样，我们还有一万多家这样的农户，我们的一站式服务为他们解决了很多后顾之忧。我们还会收购他们自己消化不了的苗，统一卖出，这样大家都能够放开胆子去干。这种合作模式达成了公司与农户之间的一种共赢，每当看着他们收到钱后的这种高兴劲，我们也打内心里面高兴。\r\n\r\n　　这是现在的智能连栋大棚，跟以前种地育苗不一样了。现在全是高科技智能化，大棚里全是秘密武器，比如里面的自动补光、恒温恒湿、雾化、喷淋，这都是一些现代比较高科技的东西，现在的农业再也不是原来那种下苦力、靠天吃饭那种。\r\n\r\n　　山西巨鑫伟业农业科技开发有限公司棚长 北洸乡农民 郑万绒：我是北洸乡的一个农民，今年54岁，没来这儿上班之前就是跟老公在家一起种地，挺辛苦，收入还不高。后来公司租了我们的地，我跟老公一起来这儿上班，一年能收入六七万，日子过得越来越好。\r\n\r\n　　山西农谷巨鑫农业公司技术员 赵杰：产业兴旺了，也让我们乡村越来越好，让附近的农民们在家门口就能上班，都有活可干。另外我们还定期组织农民学习最新的农业资讯与种植技术，转变农民理念，让大家真真正正地富起来。\r\n\r\n　　山西晋中是首批“国家农业高新技术产业示范区”，简称“山西农谷”，以“有机旱作农业”为主题，搭建产业、人才、科技平台，发展现代农业。2019年，“山西农谷”全区农民的人均可支配收入达到20789元。这样的国家农业高新区，目前全国有两个。到2025年，我国将建设约30家“国家农业高新技术产业示范区”。', '22323', 10000, '1698890185', 0, 0, 0, 0),
(107, '/uploads/images/news/1698937134_1607351186.png', '育种的跨越——从蛋鸡到肉鸡', '2021年11月26日，伴随着“沃德188”和“沃德158”白羽肉鸡配套系等公示期结束，加上已经获得证书的沃德168和五个京系列蛋鸡，首农食品集团峪口禽业拥有了蛋鸡、肉鸡八个品种，企业迈出了蛋鸡育种向肉鸡育种的坚实跨越。\r\n\r\n　　这是种业创新“金三角”模式的成功实践，是中国肉鸡产业发展史上具有划时代意义的一件大事。吹响了种业振兴的号角，开启了中国平谷农业中关村建设的步伐，标志着白羽肉鸡品种完全依赖进口的时代即将结束。', '智慧蛋鸡', 10000, '1698937134', 0, 0, 0, 0),
(108, '/uploads/images/news/1698937286_1625097234.png', '央视网连麦快手三农创作者“龙腾虎跃”，“乡村兽医的急诊故事”引近300万网友围观', '龙兽医是哈尔滨市巴彦县一位从业了30年的基层乡村兽医。从清晨到深夜，龙兽医不敢漏过每一个电话，怕耽误接诊，他甚至都不敢出远门离开村子……这份专业与敬业不仅换来了村民们的敬重，也让他在互联网平台上收获了无数粉丝的支持。\r\n9月27日中午12点半，快手联合主流媒体推出的独家栏目《纪事》与央视网合作，现场连麦快手三农创作者“龙腾虎跃（龙兽医）”，以此了解这位幸福乡村带头人精彩的出诊的故事。带动更多人了解这位治愈了无数生灵、治愈了万千网友，被广大老铁称为中国版《万物生灵》主人公的治愈之路。\r\n\r\n', '农博网', 10000, '1698937286', 0, 0, 0, 0),
(109, '/uploads/images/news/1698937484_1515086558.png', '风吹稻浪、米飘香——“广济仓”稻香软米丰收在望', '今年风调雨顺，田里的稻子长势良好，庄稼子粒饱满，丰收在望。\r\n\r\n近日记者走进杭州牧歌田园综合体开发有限公司的优质稻米种植基地，杭州市临平区运河街道，探访2022年第三届国际米食味品鉴大会中国区总决赛优胜奖（浙江省唯一获奖产区）在大运河畔的种植基地稻田里，满目金黄，一望无际的水稻即将等待收割。\r\n', '农博网', 10000, '1698937484', 0, 0, 0, 0),
(110, '/uploads/images/news/1698937588_1592761547.png', '中国工程院院士赵春江：建立生猪生产全过程的信息化集成解决方案是养猪业的未来！', '19日的论坛上，中国工程院院士赵春江分享了《智能养猪发展趋势》主题报告。据赵春江院士介绍，目前智能养猪的技术主要有五大类：\r\n\r\n一是养殖环境监测控制技术。如通过温湿度控制、光照控制等多种设备调控猪舍环境，同时收集数据，分析动物行为对环境舒适度的反应，建立评判综合环境舒适度的参数模型和阈值，分析建立环境参数与饲料转化率、生产性能等相互关系。\r\n\r\n二是生物信息获取与行为监测技术，如智能称重、红外测温、猪脸识别等技术。对生猪生长状态的实时监测，可让饲养者掌握生猪生长情况，及时采取相应的管理措施，提高养殖收益。但当前生物信息获取与行为监测依旧以人工观测为主，还无法做到自动监测，如何利用养殖大数据去分析动物的行为是当前的研究热点。\r\n\r\n三是精准饲喂管理技术。是以精准、高效、个性化定制为主要特征，根据动物营养、生长状态、生长环境、效益目标等多种因素，形成针对不同养殖对象的饲喂配方和饲喂方案。如农信互联的精准营养与精准饲喂管理平台。\r\n\r\n四是疫病防控决策技术。如何提前预警预报，降低、减少养殖经济损失是当前亟待解决的问题，而利用健康巡检机器人、防疫消毒机器人等手段可实现疫病远程诊断，收集的数据还能通过大数据分析及时发现问题，宏观上也可助于疫病防控监管。\r\n\r\n五是遗传育种信息化技术。研制统一计算框架的生猪种质资源大数据云平台，融合人工智能、机器视觉等多种形态，为数据驱动和知识引导相结合的生猪育种研究提供智能服务。\r\n\r\n对于智能养猪的发展展望，赵春江院士认为，围绕环境控制、智能饲喂、疫病防控、行为分析、废弃物处理、智慧育种等核心业务，综合运用物联网、互联网、大数据、云计算、人工智能、区块链等信息技术，实现数据之间互联互通、共享共建，建立智慧生猪养殖的技术体系和产业体系是未来的方向。', '农信互联', 10000, '1698937588', 0, 0, 0, 0),
(111, '/uploads/images/news/1698937809_1606135082.png', ' 乡村振兴看巫溪|土城“小魔芋”释放增收“大魔力”', '到巫溪，必吃烤鱼。\r\n\r\n　　享受美味的过程中你会发现大部分口味的烤鱼中都有一种配菜，吃起来QQ糯糯，爽滑劲道，它就是魔芋，其名字就如同口感一样充满了“魔力”。\r\n\r\n　　因热量低、口感独特，魔芋深受吃货们的青睐。巫溪县土城镇也抓住市场风口，带领老百姓种上了致富果，让魔芋成为了全镇的支柱产业。\r\n\r\n　　当下恰逢魔芋丰收季，华龙网记者走进土城镇，为你探访这个“小魔芋”的“大魔力”。\r\n\r\n　　返乡创业有盼头 种了三年魔芋今迎丰收年 \r\n\r\n　　10月26日的清晨，土城镇黄龙村4社秋雨绵绵，寒风阵阵，村民廖焕松起了个大早，吃过早饭，背上背篓，哼着小曲往魔芋地走去了。\r\n\r\n　　廖焕松家所处位置海拔达到1000米，再过几天魔芋就要开始丰收了。这几天，廖焕松只要一空闲下来就要去魔芋地里转转，看着长势喜人的魔芋苗，廖焕松不仅感叹：种了三年的魔芋，今年总算迎来了一个丰收年。\r\n\r\n　　廖焕松说，三年前他和妻子都在武汉务工，2020年初经过一家人商量，最终决定两口子在家门口发展。“在外面打了几年工，也有一些积蓄，就一直都想发展点产业。”\r\n\r\n　　发展什么呢？养殖业风险大，种植业又需要技术……这些摆在眼前难题一直扰着廖焕松。\r\n\r\n　　看到村支书罗永超带头种植魔芋，廖焕松也想跟着试试。“魔芋祖祖辈辈都在种，我们这个地方也肯长魔芋，这是一个不错的产业，既然村里的干部都在带头种，肯定有发展前途。”廖焕松说。\r\n\r\n　　第一年，廖焕松种了1200斤魔芋种，家里的10余亩田地全部都种上了魔芋。\r\n\r\n　　由于缺乏技术和管护，第一年的收成并不理想。从去年开始，廖焕松就开始四处取经学技术，“魔芋最重要的就是管护，特别是病虫害防治，如果管护不当这一年就白种了。这两年是边种魔芋边学技术。”廖焕松说，魔芋怕晒，他就在魔芋地理套种玉米来给魔芋遮阴，如今魔芋长势如何，他一眼就能看得出来，他也从一个技术小白到了魔芋专家。\r\n\r\n　　今年廖焕松又扩大了种植规模，在村里流转了30亩土地，种植面积达40亩，成了黄龙村的种植大户之一。廖焕松说，土地按照400元每亩流转，农忙时老百姓还可在他的魔芋基地里打零工。“120元1天，最多时候都有10多号人，每年工资都要开好多。”\r\n\r\n　　今年40亩魔芋长势喜人，让廖焕松看到了希望。“大的魔芋有3至4斤重，如果碰到行情好，收入应该还不错，也能弥补一下前两年的损失。”廖焕松说，今年预计每亩能卖3000元左右，总体收入估计10万余元。\r\n\r\n　　“以后担心种了没得人来收，现在是工厂就建在身边，不怕没得销路，这也大大提升了我们的发展信心。”西坪村魔芋种植大户罗朋辉说。\r\n\r\n　　把工厂建在基地 百姓种了不怕没销路 \r\n\r\n　　霜降过后，土城镇高海拔地区的魔芋逐渐进入丰收季节，在西坪村和黄龙村不时可以看到百姓挖魔芋的丰收场景。\r\n\r\n　　高海拔地区的田间地头丰收魔芋忙，位于和平村的魔芋加工厂建设同样是热火朝天，工人们正在加紧安装照明灯和动力设备，再过几天工厂里的设备将进入试机状态，在魔芋大丰收到来时工厂也将同步投产。\r\n\r\n　　今年70岁的冉龙云是魔芋加工厂的负责人，跟魔芋打了半辈子交道的他看到眼前的工厂一天一个变化别提有多兴奋。\r\n\r\n　　“我从90年代开始在巫溪推进魔芋产业，如今在土城镇看到工厂建设投用成就感满满。”冉龙云说，还有半个月土城镇的魔芋将进入大面积丰收，工厂一定要在丰收前完成各项设备的调试，为投产做准备。\r\n\r\n　　冉龙云说，土城镇是巫溪魔芋的主产区，把工厂建在基地里，可以带动当地的经济社会发展。“以往种植魔芋，没有加工厂，魔芋往外运输，物流成本非常高。我们通过将鲜魔芋进行粗加工成精粉，将大大提升魔芋的价值，同时，老百姓也不用愁地里的魔芋没人收了。”\r\n\r\n　　据土城镇镇长廖贤春介绍，土城镇魔芋加工厂1期投资450万元，具备年加工鲜魔芋3000吨，产精粉250吨能力，产值1700万元，增加村集体经济10万元，每年增加税收20万元，提供就业岗位30个。同步实现生产、加工、销售一体化。\r\n\r\n　　让魔芋成为百姓致富的好产业 \r\n\r\n　　土城镇位于巫溪县的北方，西溪河上游，背靠城口亢谷，紧邻中梁水库，仰望红池美景。早前土城镇盛产甜橙，当地人称其为“土城”，意为本地橙子，土城因此得名。\r\n\r\n　　近年来，土城镇立足两大定位—县域北方重要门户、特色边贸宜居小镇；发展种植业、养殖业、旅游业三大产业；突出乡村旅游、城乡建设、生态环保、社会治理四项工作；\r\n\r\n　　据土城镇党委书记冉龙滨介绍，两年来，土城镇大力发展魔芋种植产业，目前在地魔芋面积3000余亩，还招商引资新建魔芋加工厂，今年将正式投产使用，预计年收入1500余万元。\r\n\r\n　　下一步，土城镇将在魔芋产业上积极发力，在不断扩大种植面积外，基础配套也将同步跟进。“例如完善好魔芋基地的基础配套，魔芋管护技术的培训，以及从粗加工探索深加工，真正让魔芋产业成为土城百姓增收致富的好产业。”冉龙滨说。\r\n\r\n　　冉龙滨说，魔芋种植是土城镇因地制宜发展种植产业的一个方面。土城镇党委政府结合镇情实际，以党建为统领，发展种植产业，积极壮大集体经济，倡导村民就近务工。同时利用得天独厚的自然条件，探索发展鲟鱼养殖、高山避暑等项目，让群众增收致富选择面更广，不断推动产业振兴，助力乡村振兴。\r\n\r\n', '农信网', 10000, '1698937809', 0, 0, 0, 0),
(112, '/uploads/images/news/1698937915_1505274853.png', '2023中国—东盟农业机械暨甘蔗机械化博览会将于12月举办', '　近日，记者从广西农业农村厅获悉，2023中国—东盟农业机械暨甘蔗机械化博览会将于12月16-17日在广西南宁国际会展中心举办。\r\n\r\n　　本届博览会以“搭建交流合作平台，推进农业生产全程机械化”为主题，已正式列入中国—东盟博览会框架。博览会将设置展区7个、开展高端论坛与专题活动9项。本届新增“中国农机在东盟”——中国出口东盟农机展区、农机化成果展区两个展区。同时，首次开展农机产品推荐及交流洽谈活动、农机系列宣传推优活动、中国—东盟农机供需对接会、农耕文化和农机文化宣传体验活动、“会展农田”农业机械展演及体验等6项专题活动。\r\n\r\n　　据介绍，自2016年以来，广西成功举办了六届中国—东盟农业机械暨甘蔗机械化博览会，该活动已成为国内规格最高、规模最大的甘蔗机械化专业展会，多年来积极助力农机领域合作提质增效，为中国农机产品“走出去”、东盟国家农机产品“走进来”搭建起了专业的经贸沟通桥梁。近年来，中国农机出口量逐年增加，其中东盟市场份额占整个农机出口总量的20%以上。2020-2022年，仅广西地区涉及对外贸易的农机企业就有16家，累计出口农机具1.95万台（套），出口金额1.19亿元。\r\n\r\n', '阮蓓 ', 10000, '1698937915', 0, 0, 0, 0),
(113, '/uploads/images/news/1698938132_1531642671.png', '从“开盲盒”到精准育种！海南破译水稻种植“密码”→', '日前\r\n\r\n在湖南省长沙市望城区\r\n\r\n一育种基地\r\n\r\n海南波莲科技有限公司举办的\r\n\r\n（以下称“海南波莲科技”）\r\n\r\n遗传智能化育制种技术体系\r\n\r\n杂交水稻新成果观摩会现场\r\n\r\n集中展示应用\r\n\r\n遗传智能化育制种技术体系\r\n\r\n选育的部分水稻智能不育系\r\n\r\n及其新组合\r\n\r\n吸引了来自国内\r\n\r\n育种专家、客商的目光\r\n\r\n在开展水稻遗传智能化育种研究与实践，该公司育种专家经多年研究，终于破译精准育种“密码”，取得遗传智能化育制种技术体系基础及应用研究的重要突破。\r\n\r\n水稻遗传智能育种技术，克服了目前我国水稻育制种技术缺陷，育种效率较传统育种技术提高近20倍，南繁育种从“开盲盒”到精准育种，促进我国种业核心技术的升级换代。', '利声富', 10000, '1698938132', 0, 0, 0, 0),
(114, '/uploads/images/news/1698938267_1566579347.png', '《中国农村科技》封面文章：哭泣的土地', '空气中飘散着浓烟，阴霾漫天；江河湖泊里漂浮着秽物、恶臭难闻……这些都是很直观的环境污染，但人们很少能注意到自己脚下的土地也正遭受着严重的污染。\r\n\r\n　　“黄土地，黑土地，古老的大地把中华养育；五千年，九万里，炎黄的子孙生长在这里。民以食为天，食以地为本，春播种一颗，秋收粮万粒。一辈辈，一代代，地生金来地生银。我们的家园温馨甜蜜，我们的母亲就是大地。”这首颂扬大地母亲的歌，如今还有几人在传唱？\r\n\r\n　　经过岁月的蹉跎，大地母亲已不再风光，土壤在不断遭受伤害，大地母亲在伤心的哭泣！我们的母亲“病了”！\r\n\r\n　　早在2006年，环保部公布的数据就表明，中国是全球土壤污染最严重的国家之一，据不完全调查，中国受污染的耕地约有1.5亿亩，另有污水灌溉耕地3250万亩，固体废弃物堆存占地和毁田200万亩。三者合计1.85亿亩，占中国耕地总量十分之一以上；中国工程院院士罗锡文曾表示：“我国重金属污染土地已超过3亿亩，占了我国耕地的1/6，每年有1200万吨粮食被重金属污染，经济损失达200亿元。”\r\n\r\n　　当前，中国到底有多少土壤被污染了？这个问题还没有权威答案。2006年7月起，环保部和国土部联合开展“全国土壤污染状况调查”。这是中国首次土壤污染普查，但迄今为止，这次普查的结果，却千呼万唤难公开。\r\n\r\n　　无论最终调查数据如何，全国土壤污染状况严重已是不容忽视的现实。\r\n\r\n　　近几个月以来，在土壤环境的治理保护上，国家不断传出消息。\r\n\r\n　　2012年10月31日，国务院总理温家宝主持召开国务院常务会议，专题部署土壤环境保护和综合治理，“开展土壤污染治理与修复”被列为五大主要任务之一。\r\n\r\n　　2012年11月8日，中共十八大报告首提“美丽中国”概念，并提出一系列要求，包括“大力推进生态文明建设”，“加大自然生态系统和环境保护力度”。其中，关于“实施重大生态修复工程，增强生态产品生产能力”的表述引发有心者关注。\r\n\r\n　　2013年1月28日，《国务院办公厅关于印发近期土壤环境保护和综合治理工作安排的通知》，要求“到2015年，全面摸清中国土壤环境状况，建立严格的耕地和集中式饮用水水源地土壤环境保护制度，初步遏制土壤污染上升势头”。\r\n\r\n\r\n　　2013的全国两会上，不少代表的提案都与土壤污染与修复有关，其中，全国政协十二届一次会议第1号提案是由九三学社中央提交的“关于加强绿色农业发展”提案。提案重点关注了我国农业发展存在的资源浪费和破坏、污染日趋显现、农业生产能源利用率低等问题，并针对性提出对策建议。两会上，全国政协副主席、科技部部长万钢在接受记者采访时表示：“下一步要注重大气和土壤污染防治科技创新扶持”。\r\n\r\n　　“为什么我的眼中常含泪水，因为我对这片土地爱得深沉！”本期封面专题，就让我们一起走近土壤，了解大地母亲的现状，了解导致土壤质量恶化的成因，让我们一起鼓与呼，为保护我们的“大地母亲”贡献自己的一份力量吧！', '张文娟', 10000, '1698938267', 0, 0, 0, 0),
(115, '/uploads/images/news/1698938499_1567619726.png', '山东潍坊市社已落实各种化肥42.4万吨', '入秋以来，山东省潍坊市各级供销合作社切实增强责任意识，强化为农服务措施，扎实做好农资供应工作，全力以赴服务“三秋”农业生产。\r\n\r\n\r\n　　据悉，潍坊市供销合作社专门召开会议，对“三秋”农资供应与服务工作进行了安排部署。各级供销合作社组织所属农资企业深入田间地头，开展“三秋”农资商品需求调查，摸清了今秋农作物种植分布和农资市场的需求趋势，早计划、早组织，筹措资金，充实库存，提前完成了储备计划。截至目前，全市各级供销合作社已落实各种化肥42.4 万吨、农药7300 吨、农膜 3500 吨，农资价格保持稳定。\r\n\r\n　　此外，深入推进“放心农资工程”，坚决杜绝国家明令禁止、过期、失效、变质以及其他不合格农资商品和假冒伪劣农资商品通过供销合作社渠道进入市场。利用“96621服务找供销”热线，随时回答农民生产中遇到的问题，提供农业生产及科技知识咨询，进一步叫响供销合作社放心农资品牌。同时，持续推进高毒农药政府储备管理使用，在各县市区建立起了13支专业水平高、反应迅速的高毒农药专业服务队伍，确保提供优质高效的服务。各级供销合作社及所属农资企业把保障农资商品质量、加强质量监管作为推进综合改革的重要内容。同时，推广测土配方、精准施肥，助力农业增产增收。目前，全市土壤检测面积达到128.7万亩，已有20余处智能配肥站生产智能肥，智能配肥面积达到122.8万亩。', '任智超', 10000, '1698938499', 0, 0, 0, 0),
(116, '/uploads/images/news/1698938647_1534587335.png', '山东省林业厅到广饶县调研生态林场建设情况', '　国家林业局政府网7月16日讯近日，山东省林业厅副厅长吴庆刚到广饶县大王生态林场调研生态林场建设情况。东营市林业局局长纪葆东、副局长乔来秋，广饶县县长霰景亮、副县长燕东军陪同调研。\r\n\r\n　　吴庆刚实地察看了大王生态林场织女河水系高标准景观绿化、大王水库基础设施及周围景观园林绿化现场，听取了大王生态林场建设情况汇报，并与有关人员进行了交流，对大王生态林场建设情况给予充分肯定。\r\n\r\n\r\n　　据了解，大王生态林场位于省道新潍高路两侧，规划总面积3.14万亩，造林2.16万亩，总投资11.2亿元。聘请济南、天津等地园林规划设计院进行了高标准规划设计，将红色文化、历史文化、民俗文化融入其中。在建设布局上，坚持以绿为衣、以水为脉、以人为本，分两期建成以旅游、休闲、观光、娱乐为一体的景观轴和总长12.7公里的观光大道，配套建设了17处景点、6座景观桥，3个景门，在四周环线路内侧100米范围内种植高档景观苗木，为改善生态环境，打通织女河、风水故道河、备战河3条水系与淄河南延二期工程连接，以两处废弃窑厂为基础建设600万立方的大王水库，逐步形成“一轴一环、三水飘带、两湖相连”的生态景观。\r\n\r\n　　大王生态林场织女河水系2013年开工建设，总投资6000万元，打通织女河与阳河相连，建设五级节制闸、橡皮坝、泵站，高标准进行护坡、衬砌，部分地段进行拓宽，进行高标准景观绿化，建设湿地，种植水生植物，打造国家4A级滨河湿地旅游风景区。目前工程建设已经全面完成，正在进行养护。\r\n\r\n　　为涵养公园地下水源，采取政府主导，企业化运作的模式，实施了总库容600万方的大王水库建设工程。2013年底投资1.9亿元完成了水库护坡衬砌及景观桥等主体工程，去冬今春投资1.3亿元对水库环湖路基础设施及周围景观园林绿化等配套工程进行建设，现已经完成所有建设任务，目前水库正在进行蓄水。（山东省林业厅）', '山东省林业厅', 10000, '1698938647', 0, 0, 0, 0),
(117, '/uploads/images/news/1698938761_1549027526.png', '80后农民博士带玉米上会', '“你的玉米跟别人的有啥不一样？”\r\n\r\n　　“我的是‘水果玉米’，生的就能吃。”\r\n\r\n　　“80后”全国人大代表马瑞强一到驻地，就被团团围住，这个有中国农业大学[微博]“农业微生物学”博士头衔的农民，已经成了内蒙古代表团的“明星”。马瑞强建议通过采取项目支持、生产补贴、收购补助等措施，加大对农牧业专业合作组织的政策性补贴和支持力度，扶持其不断发展壮大，从而引领带动现代农牧业发展。\r\n\r\n', ' 中华工商时报 ', 10000, '1698938761', 0, 0, 0, 0),
(118, '/uploads/images/news/1698938985_1590346922.png', '【乡村振兴】现代农业助推小农户走向大市场', '　走集中化专业化之路\r\n\r\n　　7月2日，记者从昌吉州农业局了解到，去年，昌吉州农民合作社、农业龙头企业、种植大户等共流转土地253．2万亩，占家庭承包地的56．3％。在农业组织化程度较高的沙湾县，1070多家各类农业合作社流转土地面积达90万亩。\r\n\r\n　　沙湾县土地入股面积最大的合作社——沙湾县双泉农民土地股份合作社理事长何洪涛说：“相比小农户经营，土地规模化、标准化经营每亩地节约成本200元以上，增加了农民收入，同时，合作社带动了农机、植保、运输等服务性产业发展。”\r\n\r\n　　土地集中化生产的优势显而易见，放眼全疆各地州，土地适度规模经营已经是大势所趋。随着土地的集中，农业专业化服务随之而来，“专业的人干专业的事”逐渐成为农业生产的新方式。\r\n\r\n　　前不久，昌吉州42家农机企业、农机合作社和服务机构自愿加盟，组成了农机合作服务联盟。相比规模较小的农机合作社，联盟体系更大、实力更强，服务能力和服务范围都将明显扩大。\r\n\r\n　　牵头组建该联盟的昌吉市农之鑫农机专业合作社负责人马建飞说，成立农机合作服务联盟后，农机可以实现州内跨区域作业，进而转向南北疆跨区域作业，农机装备的利用率将有效提升。同时，产业联盟凭借雄厚的实力，更容易获得农机专业保险。针对目前农机市场作业、收费标准不一的情况，联盟还可以通过制定标准，提高行业自律，推动农机作业高效有序开展。\r\n\r\n　　与现代农业有机衔接\r\n\r\n　　小农户与现代农业有机衔接，必须更加充分地参与到现代产业发展中来。这其中，龙头企业的带动必不可少。\r\n\r\n　　截至2017年底，新疆共有自治区级以上农业产业化重点龙头企业509家，其中国家级32家，此外，还发展了一批农业产业化示范基地、农村创业创新园区、农业产业化园区等。这些企业和园区借助现代化加工技术和市场销售渠道，通过订单化、标准化生产，有效杜绝了小农户的盲目生产，同时把市场需求准确地传达至田间地头，增强了小农户的市场意识。\r\n\r\n　　在阿勒泰地区，因为众多企业的加入，当地的沙棘产业近年来快速发展。新疆康元生物科技股份有限公司在哈巴河县建成2万亩大果沙棘种植示范基地，带动当地农牧民\r\n\r\n　　种植沙棘超过8万亩，随着该公司研发生产的一系列品牌小浆果产品远销内\r\n\r\n　　地市场，当地农户在特色农业种植上趟出了一条新路。\r\n\r\n　　互联网的发展空前地缩短了土地和市场之间的距离，让小农户前所未有地接触到了广阔市场。\r\n\r\n　　在巴楚县，因为电子商务的延伸，原来籍籍无名的蜜瓜插上了腾飞的翅膀。喀什维吉达尼电子商务有限公司发现了这种口味甘甜的优质密瓜后，将其打造成“巴楚留香瓜”品牌远销内地各大城市。\r\n\r\n　　“去年，我们跟村淘、天猫生鲜和聚划算策划了‘抢空沙漠蜜瓜’的活动，48小时卖掉了9万份18万个瓜。我们覆盖的1100户农户，平均增收5062元。”喀什维吉达尼电子商务有限公司负责人刘敬文说。\r\n\r\n　　多业态拓宽增收空间\r\n\r\n　　中国美丽休闲乡村17个、全国休闲农业和乡村旅游示范县11个，评定全国休闲农业和乡村星级示范企业164家……近年来，新疆大力促进一二三产融合发展，培育了一批产业融合示范点。对于原来只从事单一生产的小农户来说，农业资源变为旅游资源，为他们带来了更大的发展空间。\r\n\r\n　　在巴音郭楞蒙古自治州博湖县博斯腾湖乡瓜农尤努斯 · 马木提手中，西瓜变成了元宝形、心形、方形等各种形状。在6月30日举行的博斯腾湖乡第二届西瓜节上，这些形态各异的西瓜引起了不少游客的兴趣。尤努斯 · 马木提说，这些西瓜都是论个卖，借助乡村休闲旅游，身价涨了不少。博斯腾湖乡乡长徐涛说，博斯腾湖乡依托乡村振兴战略和全域旅游战略，积极发展乡村特色观光休闲旅游，推动乡村“美丽经济”发展起来。\r\n\r\n　　今年，吐鲁番市借助城市近郊葡萄园紧邻城区的优势，打造总共3000亩地的五大主题公园，使农业优势产业与旅游业充分融合。该项工程的实施主体——吐鲁番火洲果业股份有限公司副总经理徐辉说，葡萄公园在集中发展模式下，公司会在种植、管理、采购、销售方面下功夫，形成完整的产业链，增加葡萄生产性收入，带动当地农民增收。更为可观的是，依托葡萄公园发展的第三产业，将真正凸显“田园经济”。\r\n\r\n　　产业融合对小农户的带动不言而喻。自治区农业厅农业产业化发展局（农产品加工局）局长努尔买买提 · 吐尼亚孜介绍，今后，新疆将根据区域布局和资源特色，重点在北疆打造以油菜花、薰衣草、彩色稻田等观光作物为主的田园景观，在南疆打造以杏、苹果、红枣、核桃为主的休闲果园，在乌鲁木齐市周边打造以设施农业果蔬为主的休闲采摘园。\r\n\r\n', '新疆经济报', 10000, '1698938985', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `shop_images`
--

CREATE TABLE `shop_images` (
  `id` int(11) NOT NULL COMMENT '图片ID',
  `shop_id` int(11) NOT NULL COMMENT '商品编号',
  `img` text NOT NULL COMMENT '图片路径'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_images`
--

INSERT INTO `shop_images` (`id`, `shop_id`, `img`) VALUES
(87, 35, '/uploads/images/shop/1698891409_1453290589.png'),
(86, 34, '/uploads/images/shop/1698891293_1556911089.png'),
(85, 33, '/uploads/images/shop/1698891199_1484739850.png'),
(84, 33, '/uploads/images/shop/1698891199_1523099525.png'),
(83, 33, '/uploads/images/shop/1698891199_1490284022.png'),
(82, 32, '/uploads/images/shop/1698890882_1605979831.png'),
(81, 32, '/uploads/images/shop/1698890882_1656212265.png'),
(79, 32, '/uploads/images/shop/1698890882_1503011717.png'),
(80, 32, '/uploads/images/shop/1698890882_1663193154.png'),
(106, 41, '/uploads/images/shop/1698892347_1556329881.png'),
(102, 40, '/uploads/images/shop/1698892230_1622410592.png'),
(103, 40, '/uploads/images/shop/1698892230_1582182149.png'),
(104, 40, '/uploads/images/shop/1698892230_1507763055.png'),
(105, 41, '/uploads/images/shop/1698892347_1538366340.png'),
(69, 28, '/uploads/images/shop/1698889816_1573278347.png'),
(70, 28, '/uploads/images/shop/1698889816_1541873276.png'),
(71, 28, '/uploads/images/shop/1698889816_1664487910.png'),
(107, 41, '/uploads/images/shop/1698892347_1638091315.png'),
(68, 27, '/uploads/images/shop/1698889778_1561044188.png'),
(67, 27, '/uploads/images/shop/1698889778_1486555212.png'),
(66, 27, '/uploads/images/shop/1698889758_1520375368.png'),
(88, 35, '/uploads/images/shop/1698891409_1467199507.png'),
(89, 35, '/uploads/images/shop/1698891409_1447913884.png'),
(90, 36, '/uploads/images/shop/1698891727_1451765766.png'),
(91, 36, '/uploads/images/shop/1698891727_1516894479.png'),
(92, 36, '/uploads/images/shop/1698891727_1681880168.png'),
(93, 37, '/uploads/images/shop/1698891946_1655684314.png'),
(94, 37, '/uploads/images/shop/1698891946_1672969130.png'),
(95, 37, '/uploads/images/shop/1698891946_1593675809.png'),
(96, 38, '/uploads/images/shop/1698892030_1583151602.png'),
(97, 38, '/uploads/images/shop/1698892030_1676759351.png'),
(98, 38, '/uploads/images/shop/1698892030_1569092811.png'),
(99, 39, '/uploads/images/shop/1698892147_1542896798.png'),
(100, 39, '/uploads/images/shop/1698892147_1466829453.png'),
(101, 39, '/uploads/images/shop/1698892147_1490866029.png'),
(108, 42, '/uploads/images/shop/1698892479_1487939773.png'),
(109, 42, '/uploads/images/shop/1698892479_1655270495.png'),
(110, 42, '/uploads/images/shop/1698892479_1494797300.png'),
(111, 43, '/uploads/images/shop/1698892581_1677341604.png'),
(112, 43, '/uploads/images/shop/1698892581_1604500181.png'),
(113, 43, '/uploads/images/shop/1698892581_1594936659.png'),
(114, 44, '/uploads/images/shop/1698892701_1671233398.png'),
(115, 44, '/uploads/images/shop/1698892701_1456904649.png'),
(116, 44, '/uploads/images/shop/1698892701_1508477174.png'),
(117, 45, '/uploads/images/shop/1698892797_1500685354.png'),
(118, 45, '/uploads/images/shop/1698892797_1475467607.png'),
(119, 45, '/uploads/images/shop/1698892797_1481258610.png'),
(120, 46, '/uploads/images/shop/1698892917_1585443855.png'),
(121, 46, '/uploads/images/shop/1698892917_1562632405.png'),
(122, 46, '/uploads/images/shop/1698892917_1672035696.png'),
(123, 47, '/uploads/images/shop/1698893007_1621106644.png'),
(124, 47, '/uploads/images/shop/1698893007_1625187674.png'),
(125, 47, '/uploads/images/shop/1698893007_1459381522.png'),
(130, 50, '/uploads/images/shop/1698893243_1667831559.png'),
(127, 49, '/uploads/images/shop/1698893124_1520076966.png'),
(128, 49, '/uploads/images/shop/1698893124_1485842138.png'),
(129, 49, '/uploads/images/shop/1698893124_1656910507.png'),
(131, 50, '/uploads/images/shop/1698893243_1586589916.png'),
(132, 50, '/uploads/images/shop/1698893243_1660471596.png'),
(133, 51, '/uploads/images/shop/1698893424_1659228933.png'),
(134, 51, '/uploads/images/shop/1698893424_1506009407.png'),
(135, 51, '/uploads/images/shop/1698893424_1672080228.png'),
(136, 52, '/uploads/images/shop/1698893544_1675914573.png'),
(137, 52, '/uploads/images/shop/1698893544_1586246341.png'),
(138, 52, '/uploads/images/shop/1698893544_1623760151.png'),
(139, 53, '/uploads/images/shop/1698893747_1479028816.png'),
(140, 53, '/uploads/images/shop/1698893747_1646545374.png'),
(141, 53, '/uploads/images/shop/1698893747_1534709010.png'),
(142, 54, '/uploads/images/shop/1698893825_1501011808.png'),
(143, 54, '/uploads/images/shop/1698893825_1529667239.png'),
(144, 54, '/uploads/images/shop/1698893825_1451536896.png'),
(145, 54, '/uploads/images/shop/1698893825_1619723390.png'),
(146, 55, '/uploads/images/shop/1698894103_1600640519.png'),
(147, 55, '/uploads/images/shop/1698894103_1450029682.png'),
(148, 56, '/uploads/images/shop/1698894526_1637158713.png'),
(149, 56, '/uploads/images/shop/1698894526_1585083443.png'),
(150, 56, '/uploads/images/shop/1698894526_1611923185.png'),
(151, 57, '/uploads/images/shop/1698894611_1416350053.png'),
(152, 57, '/uploads/images/shop/1698894611_1654241024.png'),
(153, 57, '/uploads/images/shop/1698894611_1602721045.png'),
(154, 58, '/uploads/images/shop/1698894773_1527252494.png'),
(155, 58, '/uploads/images/shop/1698894773_1698480498.png'),
(156, 58, '/uploads/images/shop/1698894773_1661530648.png'),
(157, 59, '/uploads/images/shop/1698895034_1645330043.png'),
(158, 59, '/uploads/images/shop/1698895034_1415794756.png'),
(159, 59, '/uploads/images/shop/1698895034_1444476751.png'),
(160, 60, '/uploads/images/shop/1698895135_1656727124.png'),
(161, 60, '/uploads/images/shop/1698895135_1419629015.png'),
(162, 60, '/uploads/images/shop/1698895135_1429633340.png'),
(163, 61, '/uploads/images/shop/1698895501_1411660814.png'),
(164, 61, '/uploads/images/shop/1698895501_1477063624.png'),
(165, 61, '/uploads/images/shop/1698895501_1516878246.png'),
(166, 62, '/uploads/images/shop/1698895880_1697600163.png'),
(167, 62, '/uploads/images/shop/1698895880_1679557073.png'),
(168, 62, '/uploads/images/shop/1698895880_1566882514.png'),
(186, 66, '/uploads/images/shop/1698928420_1424919357.png'),
(187, 68, '/uploads/images/shop/1698928490_1591468744.png'),
(188, 68, '/uploads/images/shop/1698928490_1597295725.png'),
(183, 65, '/uploads/images/shop/1698927889_1462340632.png'),
(182, 64, '/uploads/images/shop/1698925937_1667702061.png'),
(181, 64, '/uploads/images/shop/1698925937_1523553887.png'),
(180, 64, '/uploads/images/shop/1698925937_1518388107.png'),
(189, 68, '/uploads/images/shop/1698928490_1508348322.png'),
(190, 69, '/uploads/images/shop/1698928517_1625187676.png'),
(191, 70, '/uploads/images/shop/1698928646_1573555936.png'),
(192, 71, '/uploads/images/shop/1698928762_1685264877.png'),
(193, 72, '/uploads/images/shop/1698928826_1667299129.png'),
(194, 73, '/uploads/images/shop/1698928997_1497514347.png'),
(195, 74, '/uploads/images/shop/1698929045_1646054165.png'),
(196, 74, '/uploads/images/shop/1698929045_1480121540.png'),
(197, 74, '/uploads/images/shop/1698929045_1443810831.png'),
(198, 75, '/uploads/images/shop/1698929169_1526543585.png'),
(199, 76, '/uploads/images/shop/1698929343_1679068185.png'),
(200, 76, '/uploads/images/shop/1698929343_1681880306.png'),
(201, 76, '/uploads/images/shop/1698929343_1535588284.png'),
(202, 77, '/uploads/images/shop/1698929522_1511002118.png'),
(203, 77, '/uploads/images/shop/1698929522_1448447805.png'),
(204, 77, '/uploads/images/shop/1698929522_1442982236.png'),
(205, 78, '/uploads/images/shop/1698929549_1433699587.png'),
(206, 79, '/uploads/images/shop/1698929609_1588234182.png'),
(207, 80, '/uploads/images/shop/1698929735_1455218090.png'),
(208, 81, '/uploads/images/shop/1698929737_1474471011.png'),
(209, 81, '/uploads/images/shop/1698929737_1483674330.png'),
(210, 81, '/uploads/images/shop/1698929737_1515524514.png'),
(211, 82, '/uploads/images/shop/1698929886_1547894880.png'),
(212, 83, '/uploads/images/shop/1698930107_1538206805.png'),
(213, 83, '/uploads/images/shop/1698930107_1414067623.png'),
(214, 83, '/uploads/images/shop/1698930107_1660776835.png'),
(215, 84, '/uploads/images/shop/1698930354_1630275563.png'),
(216, 84, '/uploads/images/shop/1698930354_1656536814.png'),
(217, 84, '/uploads/images/shop/1698930354_1544571675.png'),
(218, 85, '/uploads/images/shop/1698930714_1410894063.png'),
(219, 85, '/uploads/images/shop/1698930714_1477503751.png'),
(220, 85, '/uploads/images/shop/1698930714_1505695622.png'),
(221, 86, '/uploads/images/shop/1698931087_1653919242.png'),
(222, 86, '/uploads/images/shop/1698931087_1636358804.png'),
(223, 86, '/uploads/images/shop/1698931087_1570330852.png'),
(224, 87, '/uploads/images/shop/1698931192_1524181851.png'),
(225, 87, '/uploads/images/shop/1698931192_1569793165.png'),
(226, 87, '/uploads/images/shop/1698931192_1423773486.png'),
(227, 88, '/uploads/images/shop/1698931290_1437701961.png'),
(228, 88, '/uploads/images/shop/1698931290_1685796215.png'),
(229, 88, '/uploads/images/shop/1698931290_1680013255.png'),
(230, 89, '/uploads/images/shop/1698931385_1461292221.png'),
(231, 89, '/uploads/images/shop/1698931385_1470548486.png'),
(232, 89, '/uploads/images/shop/1698931385_1661941589.png'),
(233, 90, '/uploads/images/shop/1698931403_1506965281.png'),
(234, 90, '/uploads/images/shop/1698931403_1680330718.png'),
(235, 90, '/uploads/images/shop/1698931403_1580001620.png'),
(236, 91, '/uploads/images/shop/1698931527_1424928332.png'),
(237, 91, '/uploads/images/shop/1698931527_1461186460.png'),
(238, 91, '/uploads/images/shop/1698931527_1562203210.png'),
(239, 92, '/uploads/images/shop/1698931563_1554436778.png'),
(240, 92, '/uploads/images/shop/1698931563_1582937274.png'),
(241, 92, '/uploads/images/shop/1698931563_1593489422.png'),
(242, 93, '/uploads/images/shop/1698931622_1543796502.png'),
(243, 93, '/uploads/images/shop/1698931622_1625225250.png'),
(244, 93, '/uploads/images/shop/1698931622_1469014639.png'),
(245, 94, '/uploads/images/shop/1698931739_1495813785.png'),
(246, 94, '/uploads/images/shop/1698931739_1541821884.png'),
(247, 94, '/uploads/images/shop/1698931739_1440999001.png'),
(248, 95, '/uploads/images/shop/1698931824_1653223439.png'),
(249, 95, '/uploads/images/shop/1698931824_1614029711.png'),
(250, 95, '/uploads/images/shop/1698931824_1465470847.png'),
(251, 96, '/uploads/images/shop/1698931900_1632330755.png'),
(252, 96, '/uploads/images/shop/1698931900_1666764120.png'),
(253, 97, '/uploads/images/shop/1698932365_1606096125.png'),
(254, 97, '/uploads/images/shop/1698932365_1486160977.png'),
(255, 97, '/uploads/images/shop/1698932365_1563411378.png'),
(256, 98, '/uploads/images/shop/1698932521_1566302953.png'),
(257, 98, '/uploads/images/shop/1698932521_1572685392.png'),
(258, 98, '/uploads/images/shop/1698932521_1446605758.png'),
(259, 99, '/uploads/images/shop/1698932630_1560123326.png'),
(260, 99, '/uploads/images/shop/1698932630_1462650033.png'),
(261, 99, '/uploads/images/shop/1698932630_1521326188.png'),
(262, 100, '/uploads/images/shop/1698932692_1461839016.png'),
(263, 100, '/uploads/images/shop/1698932692_1431972000.png'),
(264, 100, '/uploads/images/shop/1698932692_1581897717.png'),
(265, 101, '/uploads/images/shop/1698932694_1421172976.png'),
(266, 101, '/uploads/images/shop/1698932694_1450449351.png'),
(267, 101, '/uploads/images/shop/1698932694_1613192850.png'),
(268, 102, '/uploads/images/shop/1698932969_1680411523.png'),
(269, 102, '/uploads/images/shop/1698932969_1523768222.png'),
(270, 102, '/uploads/images/shop/1698932969_1456576189.png'),
(285, 108, '/uploads/images/shop/1698933412_1561031734.png'),
(284, 108, '/uploads/images/shop/1698933412_1521264780.png'),
(273, 104, '/uploads/images/shop/1698932973_1672089659.png'),
(274, 104, '/uploads/images/shop/1698932973_1695547807.png'),
(275, 105, '/uploads/images/shop/1698933123_1454416406.png'),
(276, 105, '/uploads/images/shop/1698933123_1583731607.png'),
(277, 105, '/uploads/images/shop/1698933123_1587275455.png'),
(283, 107, '/uploads/images/shop/1698933161_1554578625.png'),
(282, 107, '/uploads/images/shop/1698933161_1562177624.png'),
(281, 107, '/uploads/images/shop/1698933161_1650606348.png'),
(286, 108, '/uploads/images/shop/1698933412_1431002344.png'),
(287, 109, '/uploads/images/shop/1698933548_1637594910.png'),
(288, 109, '/uploads/images/shop/1698933548_1632816878.png'),
(289, 109, '/uploads/images/shop/1698933548_1436467999.png'),
(290, 110, '/uploads/images/shop/1698933621_1630833434.png'),
(291, 111, '/uploads/images/shop/1698933733_1510527549.png'),
(292, 111, '/uploads/images/shop/1698933733_1614595255.png'),
(293, 111, '/uploads/images/shop/1698933733_1546345176.png'),
(294, 112, '/uploads/images/shop/1698933737_1425977498.png'),
(295, 112, '/uploads/images/shop/1698933737_1465268456.png'),
(296, 112, '/uploads/images/shop/1698933737_1579068544.png'),
(297, 113, '/uploads/images/shop/1698933740_1646225496.png'),
(298, 113, '/uploads/images/shop/1698933740_1470892786.png'),
(299, 113, '/uploads/images/shop/1698933740_1486020290.png'),
(300, 114, '/uploads/images/shop/1698933830_1685384308.png'),
(301, 114, '/uploads/images/shop/1698933830_1633760361.png'),
(302, 114, '/uploads/images/shop/1698933830_1611545138.png'),
(303, 115, '/uploads/images/shop/1698933842_1677961613.png'),
(304, 115, '/uploads/images/shop/1698933842_1477971706.png'),
(305, 115, '/uploads/images/shop/1698933842_1562680470.png'),
(306, 116, '/uploads/images/shop/1698933939_1501976520.png'),
(307, 116, '/uploads/images/shop/1698933939_1459265093.png'),
(308, 116, '/uploads/images/shop/1698933939_1555663329.png'),
(323, 121, '/uploads/images/shop/1698934132_1665470214.png'),
(322, 121, '/uploads/images/shop/1698934132_1490877774.png'),
(321, 121, '/uploads/images/shop/1698934132_1629855296.png'),
(320, 120, '/uploads/images/shop/1698934028_1610170047.png'),
(319, 120, '/uploads/images/shop/1698934028_1655667208.png'),
(318, 120, '/uploads/images/shop/1698934028_1434220072.png'),
(315, 119, '/uploads/images/shop/1698933961_1683445007.png'),
(316, 119, '/uploads/images/shop/1698933961_1610240525.png'),
(317, 119, '/uploads/images/shop/1698933961_1445592150.png'),
(324, 122, '/uploads/images/shop/1698934231_1635841148.png'),
(325, 122, '/uploads/images/shop/1698934231_1687200699.png'),
(326, 123, '/uploads/images/shop/1698934251_1448756978.png'),
(327, 123, '/uploads/images/shop/1698934251_1436803055.png'),
(328, 123, '/uploads/images/shop/1698934251_1523389657.png'),
(329, 124, '/uploads/images/shop/1698934364_1668317852.png'),
(330, 124, '/uploads/images/shop/1698934364_1569036779.png'),
(331, 124, '/uploads/images/shop/1698934364_1581969237.png'),
(332, 125, '/uploads/images/shop/1698934376_1684988127.png'),
(333, 125, '/uploads/images/shop/1698934376_1520700954.png'),
(334, 125, '/uploads/images/shop/1698934376_1468186536.png'),
(335, 126, '/uploads/images/shop/1698934459_1541787862.png'),
(336, 126, '/uploads/images/shop/1698934459_1611448606.png'),
(337, 126, '/uploads/images/shop/1698934459_1621903888.png'),
(338, 127, '/uploads/images/shop/1698934475_1631177894.png'),
(339, 127, '/uploads/images/shop/1698934475_1520277844.png'),
(340, 127, '/uploads/images/shop/1698934475_1590952383.png'),
(341, 128, '/uploads/images/shop/1698934547_1652864292.png'),
(342, 128, '/uploads/images/shop/1698934547_1581378701.png'),
(343, 128, '/uploads/images/shop/1698934547_1466361744.png'),
(344, 129, '/uploads/images/shop/1698934624_1444781197.png'),
(345, 129, '/uploads/images/shop/1698934624_1463637742.png'),
(346, 129, '/uploads/images/shop/1698934624_1515235384.png'),
(347, 130, '/uploads/images/shop/1698934653_1669182038.png'),
(348, 130, '/uploads/images/shop/1698934653_1556677482.png'),
(349, 130, '/uploads/images/shop/1698934653_1538473289.png'),
(350, 131, '/uploads/images/shop/1698934690_1475900241.png'),
(351, 131, '/uploads/images/shop/1698934690_1619215302.png'),
(352, 131, '/uploads/images/shop/1698934690_1583309401.png'),
(353, 132, '/uploads/images/shop/1698934763_1656734519.png'),
(354, 132, '/uploads/images/shop/1698934763_1419771377.png'),
(355, 132, '/uploads/images/shop/1698934763_1583617990.png'),
(356, 133, '/uploads/images/shop/1698934883_1612533220.png'),
(357, 133, '/uploads/images/shop/1698934883_1534382954.png'),
(358, 133, '/uploads/images/shop/1698934883_1519017369.png'),
(359, 134, '/uploads/images/shop/1698934885_1442850613.png'),
(360, 134, '/uploads/images/shop/1698934885_1451472267.png'),
(361, 134, '/uploads/images/shop/1698934885_1525047238.png'),
(362, 135, '/uploads/images/shop/1698934977_1589930088.png'),
(363, 135, '/uploads/images/shop/1698934977_1560362567.png'),
(364, 135, '/uploads/images/shop/1698934977_1435366179.png'),
(365, 136, '/uploads/images/shop/1698935012_1438460458.png'),
(366, 136, '/uploads/images/shop/1698935012_1542510994.png'),
(367, 136, '/uploads/images/shop/1698935012_1696263885.png'),
(368, 137, '/uploads/images/shop/1698935052_1430940754.png'),
(369, 137, '/uploads/images/shop/1698935052_1522587752.png'),
(370, 137, '/uploads/images/shop/1698935052_1426409534.png'),
(371, 138, '/uploads/images/shop/1698935138_1661318954.png'),
(372, 138, '/uploads/images/shop/1698935138_1609694774.png'),
(373, 138, '/uploads/images/shop/1698935138_1582084300.png'),
(374, 139, '/uploads/images/shop/1698935274_1643053131.png'),
(375, 139, '/uploads/images/shop/1698935274_1663452449.png'),
(376, 139, '/uploads/images/shop/1698935274_1549255054.png'),
(377, 140, '/uploads/images/shop/1698935344_1429971058.png'),
(378, 140, '/uploads/images/shop/1698935344_1586201313.png'),
(379, 140, '/uploads/images/shop/1698935344_1549687053.png'),
(380, 141, '/uploads/images/shop/1698935429_1467657811.png'),
(381, 141, '/uploads/images/shop/1698935429_1493707949.png'),
(382, 141, '/uploads/images/shop/1698935429_1416950403.png'),
(383, 142, '/uploads/images/shop/1698935504_1454460849.png'),
(384, 142, '/uploads/images/shop/1698935504_1503008445.png'),
(385, 142, '/uploads/images/shop/1698935504_1448439784.png'),
(386, 143, '/uploads/images/shop/1698935556_1659309357.png'),
(387, 143, '/uploads/images/shop/1698935556_1633391442.png'),
(388, 143, '/uploads/images/shop/1698935556_1649911909.png'),
(389, 144, '/uploads/images/shop/1698935595_1488251129.png'),
(390, 144, '/uploads/images/shop/1698935595_1670522857.png'),
(391, 144, '/uploads/images/shop/1698935595_1555091148.png'),
(392, 145, '/uploads/images/shop/1698935601_1425457479.png'),
(393, 145, '/uploads/images/shop/1698935601_1428675180.png'),
(394, 145, '/uploads/images/shop/1698935601_1507098923.png'),
(395, 146, '/uploads/images/shop/1698935655_1435921623.png'),
(396, 146, '/uploads/images/shop/1698935655_1627723074.png'),
(397, 147, '/uploads/images/shop/1698935726_1483199813.png'),
(398, 147, '/uploads/images/shop/1698935726_1489793898.png'),
(399, 147, '/uploads/images/shop/1698935726_1615398888.png'),
(400, 148, '/uploads/images/shop/1698935794_1515782378.png'),
(401, 148, '/uploads/images/shop/1698935794_1511110097.png'),
(402, 148, '/uploads/images/shop/1698935794_1424584742.png'),
(403, 149, '/uploads/images/shop/1698935854_1565079383.png'),
(404, 149, '/uploads/images/shop/1698935854_1611246819.png'),
(405, 149, '/uploads/images/shop/1698935854_1660922873.png'),
(406, 150, '/uploads/images/shop/1698935898_1607632442.png'),
(407, 150, '/uploads/images/shop/1698935898_1501615703.png'),
(408, 150, '/uploads/images/shop/1698935898_1451780959.png'),
(409, 151, '/uploads/images/shop/1698935954_1552940315.png'),
(410, 151, '/uploads/images/shop/1698935954_1475071860.png'),
(411, 151, '/uploads/images/shop/1698935954_1697816370.png'),
(412, 152, '/uploads/images/shop/1698936006_1483949212.png'),
(413, 152, '/uploads/images/shop/1698936006_1631443535.png'),
(414, 152, '/uploads/images/shop/1698936006_1561174140.png'),
(415, 153, '/uploads/images/shop/1698936132_1583521841.png'),
(416, 153, '/uploads/images/shop/1698936132_1531121707.png'),
(417, 153, '/uploads/images/shop/1698936132_1486576304.png'),
(418, 154, '/uploads/images/shop/1698936194_1546831198.png'),
(419, 154, '/uploads/images/shop/1698936194_1698054631.png'),
(420, 154, '/uploads/images/shop/1698936194_1608461314.png'),
(421, 155, '/uploads/images/shop/1698936251_1619992209.png'),
(422, 155, '/uploads/images/shop/1698936251_1581088796.png'),
(423, 155, '/uploads/images/shop/1698936251_1495083426.png'),
(424, 156, '/uploads/images/shop/1698936528_1580136870.png'),
(425, 156, '/uploads/images/shop/1698936528_1603260312.png'),
(426, 157, '/uploads/images/shop/1698936567_1624215134.png'),
(427, 157, '/uploads/images/shop/1698936567_1453032878.png'),
(428, 157, '/uploads/images/shop/1698936567_1447337969.png'),
(429, 158, '/uploads/images/shop/1698936629_1492315424.png'),
(430, 158, '/uploads/images/shop/1698936629_1471748512.png'),
(431, 158, '/uploads/images/shop/1698936629_1511850904.png'),
(432, 159, '/uploads/images/shop/1698936673_1419392368.png'),
(433, 159, '/uploads/images/shop/1698936673_1580189849.png'),
(434, 159, '/uploads/images/shop/1698936673_1634970307.png'),
(435, 160, '/uploads/images/shop/1698936762_1535723742.png'),
(436, 160, '/uploads/images/shop/1698936762_1572564361.png'),
(437, 160, '/uploads/images/shop/1698936762_1465392454.png'),
(438, 161, '/uploads/images/shop/1698936805_1665692969.png'),
(439, 161, '/uploads/images/shop/1698936805_1572634910.png'),
(440, 161, '/uploads/images/shop/1698936805_1677126874.png'),
(441, 162, '/uploads/images/shop/1698936869_1501034177.png'),
(442, 162, '/uploads/images/shop/1698936869_1431840082.png'),
(443, 162, '/uploads/images/shop/1698936869_1526969841.png'),
(444, 163, '/uploads/images/shop/1698936969_1449850484.png'),
(445, 163, '/uploads/images/shop/1698936969_1685008226.png'),
(446, 163, '/uploads/images/shop/1698936969_1642322798.png'),
(447, 164, '/uploads/images/shop/1698937036_1537583966.png'),
(448, 164, '/uploads/images/shop/1698937036_1459521275.png'),
(449, 164, '/uploads/images/shop/1698937036_1549590899.png'),
(450, 165, '/uploads/images/shop/1698937125_1610207455.png'),
(451, 165, '/uploads/images/shop/1698937125_1678978460.png'),
(452, 165, '/uploads/images/shop/1698937125_1414182324.png'),
(453, 166, '/uploads/images/shop/1698937224_1521918607.png'),
(454, 166, '/uploads/images/shop/1698937224_1602185266.png'),
(455, 166, '/uploads/images/shop/1698937224_1477813819.png'),
(456, 167, '/uploads/images/shop/1698937271_1646351802.png'),
(457, 167, '/uploads/images/shop/1698937271_1653563020.png'),
(458, 167, '/uploads/images/shop/1698937271_1514398859.png'),
(459, 168, '/uploads/images/shop/1698937325_1623889516.png'),
(460, 168, '/uploads/images/shop/1698937325_1570008133.png'),
(461, 168, '/uploads/images/shop/1698937325_1498248568.png'),
(462, 169, '/uploads/images/shop/1698937383_1510546450.png'),
(463, 169, '/uploads/images/shop/1698937383_1614227581.png'),
(464, 169, '/uploads/images/shop/1698937383_1430015277.png'),
(465, 170, '/uploads/images/shop/1698937431_1474366939.png'),
(466, 170, '/uploads/images/shop/1698937431_1418105304.png'),
(467, 170, '/uploads/images/shop/1698937431_1440796850.png'),
(468, 171, '/uploads/images/shop/1698937493_1641900067.png'),
(469, 171, '/uploads/images/shop/1698937493_1470884760.png'),
(470, 171, '/uploads/images/shop/1698937493_1460085557.png'),
(471, 172, '/uploads/images/shop/1698937635_1692916526.png'),
(472, 172, '/uploads/images/shop/1698937635_1622673181.png'),
(473, 172, '/uploads/images/shop/1698937635_1655661459.png'),
(474, 173, '/uploads/images/shop/1698937736_1520746319.png'),
(475, 173, '/uploads/images/shop/1698937736_1443988160.png'),
(476, 173, '/uploads/images/shop/1698937736_1469483118.png'),
(477, 174, '/uploads/images/shop/1698937839_1517167190.png'),
(478, 174, '/uploads/images/shop/1698937839_1621077692.png'),
(479, 174, '/uploads/images/shop/1698937839_1692722780.png'),
(480, 175, '/uploads/images/shop/1698937996_1474190750.png'),
(481, 175, '/uploads/images/shop/1698937996_1668911750.png'),
(482, 175, '/uploads/images/shop/1698937996_1566059074.png'),
(483, 176, '/uploads/images/shop/1698938102_1569082915.png'),
(484, 176, '/uploads/images/shop/1698938102_1643460934.png'),
(485, 176, '/uploads/images/shop/1698938102_1630510678.png'),
(486, 177, '/uploads/images/shop/1698938204_1606091272.png'),
(487, 177, '/uploads/images/shop/1698938204_1451552084.png'),
(488, 177, '/uploads/images/shop/1698938204_1430632432.png'),
(489, 178, '/uploads/images/shop/1698938290_1516100657.png'),
(490, 178, '/uploads/images/shop/1698938290_1556370778.png'),
(491, 178, '/uploads/images/shop/1698938290_1609115116.png'),
(492, 179, '/uploads/images/shop/1698938384_1681712500.png'),
(493, 179, '/uploads/images/shop/1698938384_1614307630.png'),
(494, 179, '/uploads/images/shop/1698938384_1643020376.png'),
(495, 180, '/uploads/images/shop/1698938453_1426383280.png'),
(496, 180, '/uploads/images/shop/1698938453_1693790081.png'),
(497, 180, '/uploads/images/shop/1698938453_1621792213.png'),
(498, 181, '/uploads/images/shop/1698938511_1521099244.png'),
(499, 181, '/uploads/images/shop/1698938511_1462113346.png'),
(500, 181, '/uploads/images/shop/1698938511_1504587424.png'),
(501, 182, '/uploads/images/shop/1698938570_1488675088.png'),
(502, 182, '/uploads/images/shop/1698938570_1545360099.png'),
(503, 182, '/uploads/images/shop/1698938570_1652365178.png'),
(504, 183, '/uploads/images/shop/1698938671_1572627145.png'),
(505, 183, '/uploads/images/shop/1698938671_1673046924.png'),
(506, 183, '/uploads/images/shop/1698938671_1618997792.png'),
(507, 184, '/uploads/images/shop/1698938737_1547273187.png'),
(508, 184, '/uploads/images/shop/1698938737_1636955450.png'),
(509, 184, '/uploads/images/shop/1698938737_1688738956.png'),
(510, 185, '/uploads/images/shop/1698938850_1540009089.png'),
(511, 185, '/uploads/images/shop/1698938850_1543411956.png'),
(512, 185, '/uploads/images/shop/1698938850_1673708266.png'),
(513, 186, '/uploads/images/shop/1698938925_1666929046.png'),
(514, 186, '/uploads/images/shop/1698938925_1614969191.png'),
(515, 186, '/uploads/images/shop/1698938925_1649103660.png'),
(516, 187, '/uploads/images/shop/1698939001_1645392303.png'),
(517, 187, '/uploads/images/shop/1698939001_1482539463.png'),
(518, 187, '/uploads/images/shop/1698939001_1485131285.png'),
(519, 188, '/uploads/images/shop/1698939088_1553876332.png'),
(520, 188, '/uploads/images/shop/1698939088_1536791457.png'),
(521, 188, '/uploads/images/shop/1698939088_1470841017.png'),
(522, 189, '/uploads/images/shop/1698939185_1670358595.png'),
(523, 189, '/uploads/images/shop/1698939185_1481437543.png'),
(524, 189, '/uploads/images/shop/1698939185_1653450029.png'),
(525, 190, '/uploads/images/shop/1698939273_1483271237.png'),
(526, 190, '/uploads/images/shop/1698939273_1502427819.png'),
(527, 190, '/uploads/images/shop/1698939273_1524678724.png'),
(528, 191, '/uploads/images/shop/1698939348_1455722090.png'),
(529, 191, '/uploads/images/shop/1698939348_1493779609.png'),
(530, 191, '/uploads/images/shop/1698939348_1620276563.png');

-- --------------------------------------------------------

--
-- 表的结构 `shop_list`
--

CREATE TABLE `shop_list` (
  `id` int(11) NOT NULL COMMENT '商品唯一编号',
  `shop_type` int(11) NOT NULL COMMENT '商品分类',
  `shop_name` text NOT NULL COMMENT '商品名字',
  `shop_content` text NOT NULL COMMENT '商品描述',
  `shop_price` double NOT NULL COMMENT '商品价格',
  `shop_count` int(11) NOT NULL COMMENT '库存数量',
  `_tid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_list`
--

INSERT INTO `shop_list` (`id`, `shop_type`, `shop_name`, `shop_content`, `shop_price`, `shop_count`, `_tid`) VALUES
(37, 1, '广西武鸣沃柑10斤新鲜水果当季整箱沙糖蜜橘砂糖柑橘桔子橘子5斤', '品牌：蓝君系列：新鲜沃柑 产地：中国大陆省份：广西壮族自治区城市：南宁市', 14.8, 652, 0),
(28, 1, '顺丰福建奶油红心芭乐9斤孕妇水果软心番石榴胭脂红新鲜巴乐整箱5', '品牌：林哇系列：红心芭乐规格：精选大果\r\n', 78.8, 3597, 0),
(35, 2, '48小时内发货!现摘特产紫菜苔当季农家自种新鲜蔬菜洪山红菜苔嫩', '品牌：田亲系列：新鲜蔬菜 省份：四川省\r\n特产品类：武汉洪山菜苔品种：红菜苔\r\n售卖方式：产地直销', 9.2, 462, 0),
(27, 1, '广西融安小金桔鲜果5斤水果脆甜滑皮冰糖金桔应当季橘子整箱包邮', '品牌：农果辛辛系列：脆皮金桔规格：融安金桔\r\n', 29, 5632, 0),
(36, 1, '广西黑皮甘蔗新鲜脆甜水果9斤应当季水果特产现砍整根甜整箱包邮 ', '产地: 中国大陆 省份: 广西壮族自治区 城市: 南宁市\r\n包装方式: 食用农产品 水果种类: 甘蔗', 24.8, 959, 0),
(40, 1, '东北特产鸡心果应季水果新鲜小沙果海棠果现摘现发小苹果整箱包邮 ', '品牌: 鸡心果 系列: 鸡心果 产地: 中国大陆\r\n省份: 辽宁省 城市: 鞍山市', 36.68, 256, 0),
(32, 2, '精品彩椒山东红黄彩椒甜椒五彩灯笼椒水果辣椒菜椒生吃高维C顺丰', '品牌：御钦苑产地：中国大陆省份：山东省 蔬菜种类：圆椒\r\n', 26.9, 565, 0),
(33, 2, '现摘现发新鲜圣女果贝贝阳光青口蜜小番茄3斤/5斤寿光果蔬顺丰', '品牌：御钦苑系列：樱桃小番茄型号：红黄混装', 43.49, 2361, 0),
(34, 2, '沙地青萝卜新鲜批发5/10斤河南特产可生吃水果萝卜蔬菜青头萝卜脆', '品牌：康来诺 品种：青萝卜(沙窝萝卜)\r\n厂址：农户自种现挖现挖 厂家联系方式：农户自种现挖现挖', 3.8, 465, 0),
(38, 1, '海南莲雾新鲜水果5斤当季特大果红宝石连雾果黑金刚现摘整箱包邮3 ', '产地: 中国大陆 省份: 海南省 城市: 三亚市\r\n包装方式: 食用农产品 水果种类: 红宝石', 41.6, 659, 0),
(39, 1, '山东烟台栖霞红富士苹果5新鲜水果脆甜特产当季现摘整箱10斤苹果', '品牌：钰果香园系列：苹果型号：红富士\r\n产地：中国大陆省份：山东省 城市：烟台市\r\n特产品类：栖霞苹果', 16.8, 5965, 0),
(41, 1, '广西正宗皇帝柑大果新鲜水果9斤包邮整箱蜜桔橘子贡柑砂糖桔子10 ', '产地: 中国大陆 省份: 广西壮族自治区 \r\n城市: 南宁市 水果种类: 皇帝柑', 28.9, 659, 0),
(42, 3, '牛肉干正宗内蒙古特产风干手撕牛肉片香辣五香沙嗲牛肉干休闲零食 ', '产地: 马来西亚 包装方式: 餐饮制售\r\n肉类产品: 牛肉干 净含量: 99g', 58, 564, 0),
(43, 3, '湖南香辣酱板鸭正宗特产特辣整只手撕板鸭肉风干烤鸭', '品牌：酷唷系列 食品工艺：卤制 \r\n产地：中国大陆省份：湖南省 城市：长沙市', 18, 6562, 0),
(46, 3, '新鲜金丝蚕蛹鲜活冷冻商用烧烤特级山东特产农家桑蚕顺丰快递', '品牌：秋草原系列：生肉规格：水产蚕蛹\r\n产地：中国大陆省份：山东省城市：临沂市', 31.6, 569, 0),
(47, 3, '腌鱼辣味甜味贵州特产腌肉农家自制腌酸暗庵黎平酸辣鱼禾稻花酸鱼', '品牌: 其他 系列: 腌鱼 规格: 斤 产地: 中国大陆\r\n省份: 贵州省 城市: 凯里市', 93.8, 465, 0),
(50, 3, '东北特产柞蚕蛹鲜活特级新鲜茧蛹大黄蚕蛹黒蝉蛹A级500g顺丰包邮 ', '产地: 中国大陆 省份: 辽宁省 城市: 营口市 \r\n生肉品种: 其它生肉', 67, 596, 0),
(49, 3, '顺丰包邮现杀驴肉正宗新鲜农家散养带皮不带皮驴肉天津火烧生驴肉 ', '产地: 中国大陆 省份: 天津\r\n生肉品种: 其它生肉', 180, 63, 0),
(44, 1, '顺丰包邮云南天山雪莲果新鲜现挖精选特级大果黄红心清甜水果', '品牌：优洒系列：雪莲果型号：特级\r\n产地：中国大陆省份：云南省地市：昆明市', 36.8, 459, 0),
(45, 3, '特大放血现杀【40只母鹌鹑】去内脏活体现杀新鲜白条鹌鹑肉乳鸽烧烤 ', '产地: 中国大陆 省份: 河南省 城市: 焦作市\r\n生肉品种: 其它生肉', 146, 569, 0),
(51, 4, '晒谷耙 八齿耙 收晒谷子实木 谷耙子 刮耙 刮土 平整秧田酒厂用具 ', '收晒谷子实木 谷耙子 挂土', 34, 659, 0),
(52, 4, '拉管神器高压管背带配件拉水管农业用具新型神器卡管板架', '品牌：芷友 货号：LGQ——01', 5.79, 896, 0),
(53, 4, '16PE管滴灌管大棚温室果园滴灌设备20PE管抗晒滴管农业微喷PE管 ', '品牌: 华禹 货号: PE管', 9.5, 5964, 0),
(54, 4, '农用过滤器滴灌净水灌溉水管可拆洗网式过滤器农业节水32一寸 ', '农具类型: 滴灌管件', 52, 596, 0),
(55, 4, '家用g小型侧挂式割草机割灌机修剪草坪农业工具除草机', '货号: rp7POkAM', 3922, 236, 0),
(56, 5, '助瑞补骨脂种子提取物苯丙烯菌酮稻瘟病腐烂病细菌性角斑病农药 ', '产品名称: 助瑞 0.2%补骨脂种子提取物稻瘟病 腐烂病 茶饼病\r\n品牌: 助瑞\r\n生产企业: 沈阳同祥生物农药有限公司\r\n净含量: 20ml 100ml 100g\r\n毒性: 低毒\r\n剂型: 微乳剂\r\n农药成分: 苯丙烯菌酮', 45, 367, 0),
(57, 5, '大速直立奶油生菜苗秧苗种子阳台无土栽培水培室内盆栽蔬菜苗 ', '品牌: 春之晓 包装种类: 简装 是否进口: 否\r\n开花季节: 春季 秋季 冬季 四季开花 植物品种: 生菜\r\n种子类别: 蔬菜种子 观果种子 \r\n播种季节: 春季 秋季 四季 植物生长属性: 一年生\r\n难易程度: 简单', 53, 459, 0),
(58, 5, '枯草芽孢杆菌有机蔬菜土壤改良菌农用防治病害肥种植单一微生物菌 ', '品牌: 沃葆 系列: 菌剂 是否为有机: 是\r\n 肥料类型: 微生物菌剂', 69.9, 659, 0),
(59, 5, '农用岩棉植物无土栽培环保育苗盆温室花卉园艺大棚蔬菜水果种植块 ', '货号: 001 品牌: other/其他', 22, 8965, 0),
(60, 4, '栽苗神器农用种苗器移苗器种植器播种器种菜器蔬菜水果苗种植工具', '\r\n    品牌: other/其他 适用对象: 玉米\r\n    适用行业: 农业\r\n    农机类型: 移栽机\r\n', 141, 63, 0),
(61, 4, '包邮全钢锄头平地除草种菜神器翻地松土农工具农用多功能园艺工具 ', '品牌: 普通手工具\r\n型号: 00898 是否可折叠: 否 货号: 00989\r\n装修及施工内容: 清洁环保 主体材质: 中碳钢\r\n把柄材质: 木质 锄头类型: 扁锄', 32.8, 63, 0),
(62, 2, '2023新大蒜头干蒜白皮山东大蒜金乡助农大蒜种子5斤包邮助农苍山 ', '价格: 0-50元 产地: 中国大陆 省份: 山东省\r\n城市: 枣庄市 包装方式: 食用农产品', 34.8, 568, 0),
(64, 5, '蔬菜种子四季播盆栽阳台庭院生菜黄瓜辣椒西瓜南瓜香菜种籽孑大全', '品牌：沫小蝶包装种类：厂家封装 是否进口：否货号：H1001155012开花季节：春季\r\n植物品种：一点红油豆种子类别：观花种子播种季节：四季\r\n植物生长属性：多年生难易程度：简单\r\n', 0.87, 3664, 0),
(65, 1, '陕西红富士苹果现摘新鲜水果应当季冰糖心10斤脆甜丑萍果整箱批发', '品牌：福瑞达系列：红富士苹果-200074型号：红富士苹果\r\n产地：中国大陆省份：陕西省城市：延安市\r\n配送频次：1周2次水果种类：红富士级别：一级\r\n含量：9斤重量（不含箱）：3斤 5斤 9斤\r\n配料表：红富士苹果储藏方法：低温保鲜\r\n保质期：7食品添加剂：无', 20.4, 50, 0),
(69, 1, '正宗广西小米蕉香蕉10斤新鲜水果整箱当季鲜苹果蕉自然熟粉蕉包邮', '品牌：壹亩地瓜系列：香蕉规格：小米蕉\r\n产地：中国大陆省份：广西壮族自治区城市：南宁市\r\n重量(g)：500g包装方式：散装水果种类：小米蕉\r\n厂名：壹亩地瓜旗舰店\r\n厂址：壹亩地瓜旗舰店厂家联系方式：0531-67885263保质期：7', 9.8, 47, 0),
(70, 1, '江山徐香猕猴桃5斤新鲜水果当季整箱绿心大果弥狝奇异果孕妇礼盒', '价格: 0-50元产地: 中国大陆省份: 浙江省城市: 江山市是否为有机食品: 否同城服务: 同城24小时卖家送货上门包装方式: 食用农产品售卖方式: 单品套餐: 套餐一 套餐二套餐份量: 2人份套餐周期: 2周配送频次: 1周2次特产品类: 江山猕猴桃水果种类: 单箱规格: （家庭装+泡沫）推荐自吃 （礼盒装+泡沫）推荐送礼\r\n', 38.9, 53, 0),
(66, 1, '火参果新鲜灭霸果刺角瓜孕妇老人混合低糖整箱当季水果红心火星果 举报', '产地: 中国大陆省份: 福建省地市: 三明市包装方式: 食用农产品水果种类: 其他净含量: 1颗 2颗 4颗 6颗 8颗 64颗储存条件: 常温单果重量: 200g以上 250g以上 300g以上', 348, 52, 0),
(68, 1, '促销冰冻进口泰国冷冻榴莲肉新鲜水果金枕头无核3公斤6斤袋装', '厂名: 深圳市天良食品有限公司厂址: 深圳市龙岗区布吉街道八约二街细靓工业区三栋二楼厂家联系方式: 13751720548 品牌: 天良食品系列: 榴莲型号: 金枕产地: 泰国包装方式: 包装售卖方式 食品品种: 金枕单果重量: 3kg净含量: 3000g生鲜储存温度: -18℃储存条件: 冷冻榴莲形态: 冻肉', 338, 280, 0),
(71, 1, '攀枝花凯特芒果10斤整箱当季新鲜水果特大果彩虹忙果青皮', '价格: 0-50元产地: 中国大陆省份: 四川省城市: 攀枝花市包装种类: 箱装同城服务: 同城24小时物流送货上门包装方式: 食用农产品售卖方式: 单品套餐份量: 2人份套餐周期: 2周配送频次: 1周1次特产品类: 攀枝花芒果水果种类: 凯特芒 储存温度: 0-8℃', 32.9, 20, 0),
(72, 1, '释迦果5斤新鲜凤梨牛奶大目番荔枝佛头果整箱当季水果10林檎包邮', '品牌: other/其他系列: 释迦果型号: 释迦果产地: 中国大陆省份: 广东省城市: 汕头市包装方式: 食用农产品净含量: 5斤 4斤 3斤 2斤 1斤规格: 【老树特大果】 ', 147, 50, 0),
(73, 1, '云南昭通黑卡苹果黑钻苹果黑色纯甜苹果新鲜水果整箱10斤顺丰包邮', '产地: 中国大陆省份: 云南省城市: 昭通市包装方式: 食用农产品特产品类: 昭通苹果水果种类: 黑卡苹果净含量: 4500g重量（不含箱）: 3斤 5斤 10斤苹果果径: 70mm（含）-75mm(不含) ', 56.9, 25, 0),
(74, 1, '四川黄心猕猴桃新鲜应季水果整箱包邮孕妇金大果当季奇异果猕猴桃', '品牌：果乐婆系列：黄心猕猴桃价格：0-50元\r\n产地：中国大陆省份：四川省城市：成都市\r\n包装种类：箱装是否为有机食品：否包装方式：包装\r\n售卖方式：单品套餐份量：3人份套餐周期：1周\r\n厂址：果乐婆四川仓厂家联系方式：15635960619保质期：7', 50, 5000, 0),
(75, 1, '秘鲁新鲜蓝莓当季水果蓝梅鲜果高山怡颗甜莓整箱孕妇大果顺丰包邮', '品牌：甘福园系列：蓝莓型号：新鲜蓝莓-6\r\n产地：秘鲁是否为有机食品：否同城服务：同城24小时物流送货上门\r\n包装方式：包装售卖方式：单品套餐份量：3人份\r\n储存温度：0-8℃\r\n果径：小果 14mm以下 中果 14-17mm 大果 18-20mm 超大果 20-22mm厂名：甘福园旗舰店厂址：甘福园旗舰店\r\n厂家联系方式：4009039588配料表：新鲜秘鲁蓝莓储藏方法：低温保鲜 保质期：7食品添加剂：无', 44, 56, 0),
(76, 1, '山东羊角蜜甜瓜水果新鲜当季整箱5斤包邮小密瓜香瓜蜜瓜羊角脆', '品牌：御品一园系列：甜瓜型号：脆甜羊角蜜\r\n产地：中国大陆省份：山东省地市：潍坊市\r\n包装方式：食用农产品水果种类：羊角蜜净含量：2斤 3斤 5斤\r\n储存条件：冷藏厂名：临猗县御品一园农作物种植专业合作社\r\n厂址：山西省运城市临猗县北辛乡义堂村厂家联系方式：13353595860配料表：正宗羊角蜜甜瓜\r\n储藏方法：低温储藏保质期：7食品添加剂：无', 16, 2800, 0),
(85, 1, '东北K9小沙果10斤苹果新鲜水果当季整箱包邮脆海棠果孕妇特产包邮', '品牌：甘福园系列：东北热产型号：K9小苹果\r\n价格：0-50元产地：中国大陆省份：吉林省\r\n城市：长春市包装种类：箱装是否为有机食品：否\r\n同城服务：同城24小时物流送货上门包装方式：包装售卖方式：单品\r\n套餐份量：3人份套餐周期：1周配送频次：1周2次\r\n水果种类：沙果热卖时间：1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月净含量：5斤\r\n重量（不含箱）：1斤 2斤 3斤 4斤 5斤 10斤生鲜储存温度：0-8℃苹果果径：40mm以下\r\n口感：脆爽酸甜厂名：甘福园旗舰店厂址：甘福园旗舰店\r\n厂家联系方式：4009039588配料表：东北K9小沙果储藏方法：低温保鲜\r\n保质期：7食品添加剂：无', 22.8, 5000, 0),
(77, 1, '广西黑皮甘蔗新鲜9斤水果包邮应当季特产整箱脆甜孕妇果蔗5清甜杆', '产地: 中国大陆省份: 广西壮族自治区城市: 南宁市包装方式: 食用农产品水果种类: 甘蔗净含量: 100g单果重量: 2斤 5斤 2500g 9斤 4500g', 24, 3000, 0),
(78, 6, '地鳖虫高效益养殖实用技术 正版书籍 新华书店旗舰店文轩官网 科学技术文献出版社', 'ISBN编号：9787502380281书名：地鳖虫高效益养殖实用技术作者：胡庆华,刘玉霞\r\n定价：19.00元书名：地鳖虫高效益养殖实用技术开本：32开\r\n是否是套装：否出版社名称：科学技术文献出版社', 15, 1910, 0),
(79, 6, '图说水蛭养殖关键技术', 'ISBN编号：9787504684851书名：图说水蛭养殖关键技术作者：无\r\n定价：30.00元编者：李才根书名：图说水蛭养殖关键技术\r\n是否是套装：否出版社名称：中国科学技术出版社\r\n', 18, 232, 0),
(80, 6, '养兔书籍 兔子养殖书肉兔养殖技术养兔子书技术大全 兔病诊治原色图谱+图解家庭农场肉兔科学饲养+怎样提高兔养殖效益科学教程手册', '图书名称：	 兔病诊治原色图谱+图解家庭农场肉兔科学饲养+怎样提高兔养殖效益 全3册\r\n作者：	 任克良 尼基·卡兰格洛 吕景智 李洪军 杨继琼\r\n定价：	 119.40\r\nISBN号：	\r\n 9787111561750\r\n\r\n 9787111701323 \r\n\r\n 9787111674269 \r\n\r\n出版社：	 机械工业出版社', 76, 345, 0),
(81, 1, '海南小台农芒果新鲜10斤小台芒应当季热带水果特产整箱批发包邮', '品牌：果品康系列：芒果新鲜型号：小台农芒果\r\n产地：中国大陆省份：海南省城市：海口市\r\n包装方式：散装水果种类：台农芒净含量：9斤 5斤 3斤 10斤\r\n单果规格：【特惠小果】头茬鲜果 美味尝鲜！ 【实惠中果】核薄肉厚 美滋滋！ 【超值大果】个大饱满 爆甜多汁！ 【严选大果】品质升级 十年老树 更大更甜！厂名：果品康旗舰店厂址：果品康旗舰店\r\n厂家联系方式：18888888888保质期：7', 25.8, 3500, 0),
(82, 6, '罗非鱼标准化健康养殖技术', 'ISBN编号：9787554210185书名：罗非鱼标准化健康养殖技术作者：无\r\n定价：18.00元编者：编者:郑兰兰,王海燕书名：罗非鱼标准化健康养殖技术\r\n开本：32开是否是套装：否出版社名称：中原农民出版社', 9, 3524, 0),
(83, 1, '顺丰东北姑娘果5斤装菇娘灯笼特产水果新鲜整箱当季应包邮大果黄', '品牌：福瑞达系列：东北姑娘果规格：东北姑娘果顺丰\r\n价格：0-50元产地：中国大陆省份：黑龙江省\r\n城市：绥化市是否为有机食品：否包装方式：散装\r\n售卖方式：单品套餐份量：3人份套餐周期：1周\r\n配送频次：1周2次特产品类：莫力达瓦菇娘水果种类：黄皮果\r\n单果重量：1斤 3斤 5斤厂名：福瑞达旗舰店厂址：福瑞达旗舰店\r\n厂家联系方式：福瑞达旗舰店配料表：东北姑娘果储藏方法：低温保鲜\r\n保质期：7食品添加剂：无', 22.5, 4500, 0),
(84, 1, '福建漳州甜杨桃5斤水果当季整箱洋桃鲜果新鲜红龙扬桃五角星阳桃', '产地: 其他包装方式: 食用农产品水果种类: 油桃净含量: 1斤 3斤 5斤单果规格: 均码', 19.56, 3900, 0),
(86, 2, '云南特色苦味蔬菜新鲜大苦子苦茄洋苦子傣族菜假南瓜现摘现发包邮', '产地: 中国大陆省份: 云南省城市: 芒市是否为有机食品: 否包装方式: 食用农产品上市时间: 8月 2月 5月 10月 12月 7月 9月 11月 4月 6月 3月 1月售卖方式: 产地直销品种: 野菜净含量: 500g 1000g 2000g生鲜储存温度: 15-18℃储存条件: 常温食用方式: 炒菜食用', 28.8, 432, 0),
(87, 2, '贵州农家新鲜折耳根鱼腥草蔬菜节侧儿根现挖现发炒腊肉凉拌菜食材', '产地: 中国大陆省份: 贵州省城市: 安顺市包装方式: 食用农产品品种: 其他净含量: 500g 1000g 1500g 2500g储存条件: 冷藏', 25.8, 995, 0),
(88, 2, '新鲜根芹专门吃根的芹菜洋芹鲜食菜芹菜味浓根塘蒿菜西餐特色菜', '产地: 中国大陆省份: 山东省城市: 潍坊市包装方式: 食用农产品品种: 其他净含量: 1000g 1500g 2200g生鲜储存温度: 0-8℃储存条件: 冷藏食用方式: 凉拌食用', 45.9, 356, 0),
(89, 1, '陕西红香酥梨10斤新鲜水果当季整箱香梨青应特产酥梨雪梨包邮梨子', '品牌：福瑞达系列：红香酥梨0701价格：0-50元\r\n产地：中国大陆省份：陕西省城市：渭南市\r\n净含量：2.5kg(含）-5kg(不含)是否为有机食品：否包装方式：散装\r\n售卖方式：单品套餐份量：2人份套餐周期：1周\r\n配送频次：1周2次水果种类：红香酥梨热卖时间：1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月\r\n原产地：中国净含量：3斤 5斤 9斤单果规格：【试吃小果，3%人购买】头茬试吃，尝鲜体验！ 【超值中果，5%人购买】超值精选，高性价比！ 【升级大果，8%人购买】品质升级，热卖推荐！ 【初级特大果，10%人购买】商超品质，个个甄选！ 【精选特大果，74%人购买】商超品质，个个甄选！\r\n生鲜储存温度：0-8℃厂名：福瑞达旗舰店厂址：福瑞达旗舰店\r\n厂家联系方式：19961976125配料表：红香酥梨储藏方法：低温保鲜\r\n保质期：7食品添加剂：无', 22.7, 800, 0),
(90, 2, '四川胡萝卜新鲜红萝卜农家自种老式传统生吃水果胡萝卜脆甜蔬菜', '产地: 中国大陆省份: 四川省城市: 成都市包装方式: 食用农产品上市时间: 2023年秋季 2023年冬季售卖方式: 产地直销套餐周期: 6个月配送频次: 1周2次品种: 其他净含量: 1500g 2500g 4000g储存条件: 冷藏食用方式: 炒菜食用', 26.99, 569, 0),
(91, 2, '宁夏螺丝菜新鲜宝塔菜地环甘露草石蚕地牯牛蔬菜现挖现发', '产地: 中国大陆省份: 宁夏回族自治区城市: 银川市包装方式: 食用农产品品种: 其他净含量: 500g 1500g 2500g储存条件: 冷藏', 56.8, 569, 0),
(92, 1, '甘肃天水花牛苹果水果8.5/5/3斤新鲜当季红蛇粉面刮泥大果甜孕妇 ', '品牌：觅鲜达系列：苹果型号：苹果\r\n产地：中国大陆省份：甘肃省城市：天水市\r\n包装方式：包装水果种类：花牛苹果净含量：1500g\r\n重量（不含箱）：3斤 5斤 8.5斤苹果果径：65mm（含）-70mm(不含) 70mm（含）-75mm(不含) 75mm（含）-80mm(不含) 80mm（含）-85mm(不含) 85mm（含）-90mm(不含)厂名：觅鲜达\r\n厂址：觅鲜达保质期：15', 28.26, 4900, 0),
(93, 2, '新鲜人参叶野菜士人参苗菜农庄煲汤火锅特色蔬菜打边炉食材', '产地: 中国大陆省份: 广东省城市: 广州市是否为有机食品: 否包装方式: 食用农产品上市时间: 8月 2月 5月 10月 12月 7月 9月 11月 4月 6月 3月 1月售卖方式: 单品套餐份量: 1人份套餐周期: 1周配送频次: 1周2次品种: 其他净含量: 500g生鲜储存温度: 0-8℃储存条件: 冷藏食用方式: 其他\r\n', 12.9, 469, 0),
(94, 2, '湖北特产新鲜红菜苔农家自种当季新鲜蔬菜洪山菜薹4斤现摘现发', '品牌：蜀湖桥系列：菜苔规格：红菜苔\r\n产地：中国大陆省份：湖北省城市：武汉市\r\n是否为有机食品：否包装方式：散装\r\n生鲜储存温度：0-8℃储存条件：常温食用方式：炒菜食用\r\n厂名：蜀湖桥旗舰店厂址：湖北省咸宁市嘉鱼县厂家联系方式：18671519736\r\n保质期：15', 9.1, 469, 0),
(95, 2, '新鲜现挖甜菜根5斤当季甜菜头红紫菜头疙瘩菜农家自种蔬菜整箱包1', '品牌：果仁伊系列：甜菜根规格：8523\r\n产地：中国大陆省份：江苏省城市：徐州市\r\n包装方式：散装套餐份量：2人份套餐周期：1周\r\n配送频次：1周2次品种：其他净含量：500g 1000g 1500g 2500g\r\n食用方式：即食厂名：果仁伊厂址：江苏\r\n厂家联系方式：15174394547保质期：7', 20.8, 956, 0),
(96, 2, '老黄瓜东北特产农家新鲜蔬菜炖汤凉菜酸黄瓜麻皮包邮', '产地: 中国大陆省份: 吉林省城市: 四平市是否为有机食品: 否包装方式: 食用农产品售卖方式: 产地直销套餐份量: 1人份套餐周期: 12个月品种: 老黄瓜净含量: 2500g 4000g生鲜储存温度: 0-8℃', 25, 632, 0),
(97, 2, '四川成都新鲜莴笋8.5斤带箱应季农家自种蔬菜青笋莴苣时令5斤3斤', '产地: 中国大陆省份: 四川省城市: 成都市包装方式: 食用农产品品种: 莴笋净含量: 1500g 2500g 4250g', 21.8, 356, 0),
(98, 2, '冬笋现挖现发高山黄泥笋嫩笋尖鲜笋野生竹笋临安雷笋春笋新鲜蔬菜', '产地: 中国大陆省份: 福建省地市: 南平市是否为有机食品: 否包装方式: 食用农产品特产品类: 天目冬笋净含量: 1500g 1.5kg 2500g 2.5kg食用方式: 炒菜食用', 165, 5060, 0),
(99, 2, '芦蒿新鲜蔬菜3斤泥蒿去叶藜蒿净菜野菜鲜嫩蓠蒿现摘现发黎蒿', '产地: 中国大陆省份: 江苏省城市: 宿迁市包装方式: 食用农产品上市时间: 2月 10月 12月 11月 4月 3月 1月售卖方式: 产地直销套餐份量: 3人份套餐周期: 1周配送频次: 1周2次特产品类: 南京芦蒿品种: 柳蒿芽净含量: 1500g 1000g 250g 500g 2000g 2500g生鲜储存温度: 0-8℃储存条件: 常温食用方式: 炒菜食用', 69, 5600, 0),
(100, 2, '广西新鲜野生芭蕉花香蕉花价格实惠食用绿色蔬菜当天采摘发货芭蕉', '城市: 南宁市产地: 中国大陆省份: 广西壮族自治区包装方式: 食用农产品上市时间: 8月 2月 5月 10月 12月 7月 9月 11月 4月 6月 3月 1月售卖方式: 单品套餐份量: 4人份套餐周期: 2周配送频次: 1周1次品种: 其他', 21.8, 468, 0),
(101, 2, '广西新鲜野生芭蕉花香蕉花价格实惠食用绿色蔬菜当天采摘发货芭蕉', '城市: 南宁市产地: 中国大陆省份: 广西壮族自治区包装方式: 食用农产品上市时间: 8月 2月 5月 10月 12月 7月 9月 11月 4月 6月 3月 1月售卖方式: 单品套餐份量: 4人份套餐周期: 2周配送频次: 1周1次品种: 其他', 21.8, 468, 0),
(102, 2, '东北特产茄子蔬菜产地新鲜紫长茄子紫立人602 现摘斤', '产地: 中国大陆省份: 辽宁省城市: 鞍山市包装方式: 食用农产品售卖方式: 产地直销套餐份量: 2人份套餐周期: 1周配送频次: 1周2次品种: 其他净含量: 250g 1500g 2500g生鲜储存温度: 8-15℃', 0, 5700, 0),
(108, 3, '丰选 烟熏五花肉后腿肉江西特产农家腊味咸肉非四川湖南烟熏腊肉', '品牌：丰选型号：烟熏腊肉产地：中国大陆\r\n省份：江西省城市：吉安市口味：五花腊肉300g[尝鲜款] ✅五花腊肉500g[热卖❤️偏瘦款] ✅五花腊肉500g[热卖❤️偏肥款] ☆下单立减 买的越多越划算☆ [偏瘦款]五花腊肉500g*3袋【共三斤】 [偏瘦款]五花腊肉500g*5袋【共五斤】 [偏肥款]五花腊肉500g*3袋【共三斤】 [偏肥款]五花腊肉500g*5袋【共五斤】\r\n包装方式：包装净含量：500.00g包装规格：1袋\r\n单件净含量：500g品名：丰选烟熏五花生产许可证编号：SC10436082710601\r\n厂名：遂川赣味食品有限公司厂址：江西省吉安市遂川县工业园区留', 35.9, 2300, 0),
(104, 2, '湖南本地白玉苦瓜新鲜蔬菜当季农家自种现摘绿色生凉瓜长条榨汁', '产地: 中国大陆省份: 湖南省城市: 长沙市包装方式: 食用农产品售卖方式: 产地直销品种: 苦瓜', 35.8, 315, 0),
(105, 2, '新鲜蚕豆 云南新鲜蚕豆农家带壳生蚕豆罗汉豆兰花胡豆青豆荚 蔬菜', '产地: 中国大陆省份: 云南省城市: 楚雄彝族自治州是否为有机食品: 否包装方式: 食用农产品上市时间: 2月 10月 12月 11月 3月 1月售卖方式: 单品配送频次: 1周2次品种: 其他', 9.8, 469, 0),
(107, 2, '东北新鲜小葱10斤辣香蘸酱生吃自种四季蔬菜农家特产水葱顺丰包邮', '产地: 中国大陆省份: 吉林省地市: 吉林市包装方式: 食用农产品蔬菜种类: 香葱(小葱)净含量: 500g 1000g 1500g 2000g 2500g食用方式: 其他', 16.35, 4500, 0),
(109, 3, '山东特产正宗五香把子肉整片卤味熟食开袋即食五花肉下酒下饭250g', '生产许可证编号: SC10437098201890厂名: 泰安汇香食品有限公司厂址: 山东省泰安市新泰市新汶街道翟良路南首路西厂家联系方式: 15315270177配料表: 猪肉，食盐，大豆油，味精，香辛料储藏方法: 常温保质期: 180食品添加剂: 见包装说明产地: 中国大陆省份: 山东省城市: 泰安市口味: 把子肉250g*1袋【试吃不送】 把子肉250g*3袋【买二送一】 把子肉250g*5袋【买三送二】 把子肉250g*8袋【买五送三】包装方式: 包装净含量: 250g储存条件: 常温', 104, 5400, 0),
(110, 4, '新款EFT植保机E616P农业喷药播撒无人飞机载重16公斤极翼赫星飞控', '颜色分类: EFT616P机架 蓝色 EFT616P机架 白色 EFT616P 套装1 EFT616P 套装2 EFT616P 套装3 EFT616P 套装4 EFT616P 套装5农机用途: 喷药\r\n', 3180, 26, 0),
(111, 3, '山东把子肉熟食正宗老济南特产开袋即食方便速食卤肉红烧肉五花肉', '生产许可证编号: SC10437098201890厂名: 泰安汇香食品有限公司厂址: 山东省泰安市新泰市新汶街道翟良路南首路西厂家联系方式: 18129957555配料表: 详情见外包装储藏方法: 常温储存保质期: 180食品添加剂: 详情见外包装品牌: 福林松产地: 中国大陆省份: 山东省城市: 泰安市口味: 五香把子肉250g*1袋【开袋即食 坏单包赔】 五香把子肉250g*2袋【日期新鲜 软糯入味】 五香把子肉250g*3袋【开袋即食 坏单包赔】 五香把子肉250g*4袋【入口即化 肥而不腻】 五香把子肉250g*5袋【入口即化 肥而不腻】 五香把子肉250g*8袋【真空锁鲜 老卤慢炖】是否为有机食品: 否包装方式: 包装套餐份量: 1人份套餐周期: 1周配送频次: 1周2次净含量: 250g储存条件: 常温', 90, 5660, 0),
(112, 4, '农业工具大全农民干活神器干农活农用农村种地农具除草农作物拨草', '颜色分类: 防水【右手带爪】绿色一双 防水【右手带爪】绿色2双 防水【右手带爪】绿色3双 防水【右手带爪】绿色5双 防水【左右手带爪】绿色一双 防水【左右手带爪】绿色2双 防水【左右手带爪】绿色3双 防水【左右手带爪】绿色5双 【不带爪】绿色一双货号: jmm_1lv', 11, 356, 0),
(113, 4, '农业工具大全农民干活神器干农活农用农村种地农具除草农作物拨草', '颜色分类: 防水【右手带爪】绿色一双 防水【右手带爪】绿色2双 防水【右手带爪】绿色3双 防水【右手带爪】绿色5双 防水【左右手带爪】绿色一双 防水【左右手带爪】绿色2双 防水【左右手带爪】绿色3双 防水【左右手带爪】绿色5双 【不带爪】绿色一双货号: jmm_1lv', 11, 356, 0),
(114, 4, '施肥器配件大全多功能背桶背包果树玉米点肥地下施肥神器农用工具', '颜色分类: 防水背包+螺丝扣 30斤 防水背包+红色接头 30斤 加厚 背桶+螺丝扣 加厚 背桶+红色接头卡扣 防水包背包30斤+下肥管30公分 防水包背包30斤+下肥管45公分 防水包背包30斤+下肥管60公分 加厚 背桶+下肥管35公分 加厚 背桶+下肥管60公分 加厚 背桶普通背带+螺丝扣 加厚 背桶普通背带+红色接头卡扣 白色背包+红色接头适用行业: 农业肥料形态: 颗粒农机类型: 施肥器', 22, 469, 0),
(115, 3, '肚包肉内蒙古特产羊肉肠肚包肉旗舰店新鲜内蒙网红同款肉商用10斤', '品牌：渔哥头等舱包装产地：中国大陆省份：其他\r\n口味：肚包肉1斤+羊肉肠2斤【送韭菜花酱+卤肉料包+蒜蓉辣酱】 肚包肉2斤+羊肉肠2斤【送韭菜花酱+卤肉料包+蒜蓉辣酱】 肚包肉3斤+羊肉肠2斤【送韭菜花酱+卤肉料包+蒜蓉辣酱】 肚包肉1斤【送韭菜花酱+卤肉料包+蒜蓉辣酱】 肚包肉2斤【送韭菜花酱+卤肉料包+蒜蓉辣酱】 肚包肉3斤【送韭菜花酱+卤肉料包+蒜蓉辣酱】 肚包肉4斤【送韭菜花酱+卤肉料包+蒜蓉辣酱】 肚包肉10斤【送韭菜花酱+卤肉料包+蒜蓉辣酱】 羊肉肠2斤【送韭菜花酱+卤肉料包+蒜蓉辣酱】 羊肉肠4斤【送韭菜花酱+卤肉料包+蒜蓉辣酱】同城服务：同城24小时物流送货上门包装方式：包装\r\n售卖方式：单品套餐份量：5人份套餐周期：1周\r\n配送频次：1周1次原料产地：中国净含量：500g\r\n生鲜储存温度：-18℃厂名：见包装厂址：见包装\r\n保质期：365', 44, 6540, 0),
(116, 3, '金华火腿咸肉五花肉上海南风肉刀板香风干特色腊味腌笃鲜农家腊肉', '生产日期：2023年08月25日 至 2023年08月25日品牌：腿状元型号：腩风肉\r\n产地：中国大陆省份：浙江省城市：金华市\r\n口味：↓↓↓【去骨系列】↓↓↓ 250g风干五花咸肉（去骨） 500g风干五花咸肉（偏瘦去骨） 500g风干五花咸肉（偏肥去骨） 1000g风干五花咸肉（偏瘦去骨） 1000g风干五花咸肉（偏肥去骨） 1500g风干五花咸肉（偏瘦去骨） 1500g风干五花咸肉（偏肥去骨） ↓↓↓【不去骨系列】↓↓↓ 500g风干五花咸肉（偏肥不去骨） 500g风干五花咸肉（偏瘦不去骨） 1000g风干五花咸肉（偏肥不去骨） 1000g风干五花咸肉（偏瘦不去骨） 1500g风干五花咸肉（偏肥不去骨） 1500g风干五花咸肉（偏瘦不去骨） ↓↓↓【送礼系列 走亲访友不空手】↓↓↓ 250克南风肉【礼品装 适合送人】 【送礼篮1.85kg】5款腊味【走亲访友不空手】 【礼品装南风肉礼篮1.5kg】走亲访友不空手包装方式：包装净含量：500.00g\r\n包装规格：1包单件净含量：500g品名：南风肉\r\n生产许可证编号：SC10433070303580产品标准号：GB2730厂名：金华大拇指火腿食品有限公司\r\n厂址：浙江省金华市婺城区雅畈镇竹园工业区08号厂家联系方式：057982523331配料表：猪肉、食用盐、食品添加剂（亚硝酸钠）\r\n储藏方法：25°C以下冷藏贮存保质期：180食品添加剂：亚硝酸钠', 54, 640, 0),
(120, 3, '农家散养粮食猪肉腊肉腊味五花腊后腿猪脚排骨恩施特产烟熏腊肉', '品牌：食妙缘型号：ZBJ001产地：中国大陆\r\n省份：湖北省城市：恩施土家族苗族自治州口味：甄选前腿肉1斤装 甄选前腿肉3斤装 甄选前腿肉4斤装 甄选前腿肉5斤装 精选五花肉1斤装 精选五花肉3斤装 精选五花肉5斤装 严选后腿肉1斤装 严选后腿肉3斤装 严选后腿肉5斤装 麻辣香肠1斤尝鲜装 麻辣香肠3斤福利装 麻辣香肠5斤超值装 原味香肠1斤装 原味香肠3斤装 原味香肠5斤装 烟熏排骨1斤装 烟熏排骨3斤特惠装 洗净切片速食装 烟熏猪脚（洗净切小块） 福利尝鲜装（偏肥） 前腿差价\r\n包装方式：散装特产品类：恩施烟熏腊肉净含量：1500.00g\r\n包装规格：1袋单件净含量：1500g品名：3斤装\r\n生产许可证编号：SC10442280250381厂名：恩施州依诺食品制作有限公司厂址：湖北省恩施州利川市团堡镇安乐坪村5组56号\r\n厂家联系方式：13277533777', 54, 780, 0),
(119, 4, '农民干活神器人工翻地松土锄草开沟起垄犁地耕地机农用工具大全', '颜色分类: 翻土+锄草 翻土+松土 翻土+开沟 开沟+锄草 开沟+松土 翻土+锄草+开沟 翻土+锄草+松土+开沟 翻土 开沟适用行业: 农业农机类型: 耕地机', 148, 698, 0),
(121, 3, '纯瘦腊肉500g 湖南特产农家自制柴火烟熏土猪里脊腊肉湖南正宗腊', '生产许可证编号: SC10443068110107厂名: 汨罗市广湘记食品有限公司厂址: 湖南省岳阳市汨罗市川山坪镇高家坊村万家组厂家联系方式: 18507388351食品添加剂: 见标签品牌: 农把头型号: 纯瘦肉产地: 中国大陆省份: 湖南省城市: 长沙市口味: 纯瘦肉1斤 纯瘦肉2斤 纯瘦肉3斤 纯瘦肉5斤 纯瘦肉10斤包装方式: 包装特产品类: 湘西腊肉配料表: 猪肉净含量: 500.0g包装规格: 1包单件净含量: 500g品名: 纯瘦肉1斤', 87, 876, 0),
(122, 4, '栽苗神器农用工具大全打孔器种植辣椒苗西瓜种菜打洞地膜打孔神器', '颜色分类: 25mm打孔器 35mm打孔器 42mm打孔器 48mm打孔器 57mm打孔器 65mm打孔器 70mm打孔器 76mm打孔器 80mm打孔器 90mm打孔器 100mm打孔器 110mm打孔器适用行业: 农业农机类型: 移栽机', 49, 956, 0),
(123, 3, '好世多手撕鸭排308g卤味即食鸭锁骨黑鸭麻辣酱板鸭肉网红零食特产', '生产许可证编号: SC10337088200643产品标准号: GB/T 23586厂名: 山东好世多食品科技有限公司厂址: 山东省济宁市兖州区新兖镇经济开发区创业路3号厂家联系方式: 17685901213配料表: 见包装储藏方法: 处于阴凉干燥处保质期: 270食品添加剂: 见包装品牌: 好世多系列: 手撕鸭排口味: 黑鸭味1袋*308g 麻辣味1袋*308g 黑鸭味2袋*308g 麻辣味2袋*308g 黑鸭1袋+麻辣1袋 黑鸭味308g*3包 麻辣味308g*3包 黑鸭2包+麻辣1包 黑鸭1包+麻辣2包 混搭4袋 混搭5袋 混搭6袋 混搭10袋（口味可以备注）产地: 中国大陆省份: 山东省城市: 济宁市是否为有机食品: 否包装方式: 包装肉类产品: 全鸭净含量: 308g', 54, 670, 0),
(124, 3, '热卖中）古法传承五香驴肉熟食真空装火烧酱香卤味即食特产正宗新鲜下酒菜零食开袋既食', '产地: 中国大陆省份: 河北省城市: 廊坊市口味: 酱驴肉半斤（新店促销） 酱驴肉一斤（新店促销） 酱驴肉二斤（新店促销） 酱驴肉三斤（新店促销）包装方式: 餐饮制售净含量: 200g', 56, 540, 0),
(125, 4, '农用种植套装农业实践工具中小学生劳动农具大全铲子锄头除草神器', '材质: 其他/other颜色分类: 农业实践工具套装', 269.33, 496, 0),
(126, 3, '瑞咔内蒙古特产牛板筋即食休闲零食解馋小吃香辣牛肉干嚼劲', '生产许可证编号: SC11835080200242产品标准号: 6918894564055厂名: 新罗区龙池食品厂厂址: 福建省龙岩市新罗区小池镇南山村大排厂家联系方式: 00000000000配料表: 见包装储藏方法: 请置于阴凉干燥处保质期: 21食品添加剂: 见包装品牌: other/其他系列: qU9S6L8R口味: 【香辣味】2盒 【烧烤味】2盒 【香辣味*1】+【烧烤味*1】2盒 【香辣味】3盒 【烧烤味】3盒 【香辣味*2】+【烧烤味*1】3盒 【香辣味*1】+【烧烤味*2】3盒食品工艺: 卤味产地: 中国大陆省份: 其他保质期: 90天是否为有机食品: 否包装方式: 散装肉类产品: 牛肉棒净含量: 100.00g品名: aNf6JV5Z', 56, 670, 0),
(127, 4, '农业工具大全农用手扶拖拉机配套松土农机具耙齿平土耙耕地配件', '品牌: other/其他颜色分类: 宽度一米二 宽度一米六', 464.47, 35, 0),
(128, 3, '青岛老火腿纯腱子肉即食山东特产抖音同款果木熏烤纯肉金华福瑞斋', '生产许可证编号: SC10737028304737厂名: 青岛留香坊食品有限公司厂址: 山东省青岛市平度市东阁街道办事处四十里堡村南178号厂家联系方式: 15610075918食品添加剂: 复配稳定剂、卡拉胶、乳酸链球菌素等（详见包装）品牌: 福瑞斋系列: 果木烤制规格: 450产地: 中国大陆省份: 山东省城市: 青岛市口味: 450克*5根【猪腱子肉】现烤现发 450克*4根【猪腱子肉】现烤现发 450克*3根【猪腱子肉】现烤现发 450克*2根【猪腱子肉】现烤现发 300克*5根【猪腱子肉】现烤现发 300克*4根【猪腱子肉】现烤现发 300克*3根【猪腱子肉】现烤现发 300克*2根【猪腱子肉】现烤现发 450克*1根 300克*1根 450克礼盒装 300克礼盒装是否为有机食品: 否包装方式: 散装特产品类: 金华火腿适用场景: 家用净含量: 450.00g包装规格: 1包储存条件: 冷藏单件净含量: 450g品名: 青岛老火腿大克重', 58, 675, 0),
(129, 3, '熏鸡骨架熟食东北熏酱特产五香手撕肉烧烤卤味油炸新鲜即食下酒菜', '生产许可证编号: SC11123011100044厂名: 哈尔滨信诚食品有限公司厂址: 哈尔滨市呼兰区孟家乡红旗屯厂家联系方式: 13054256267配料表: 鸡骨架、饮用水、食用盐、绵白糖、酿造酱油（含焦糖色）、味精、肉蔻、八角、桂皮、等储藏方法: 冷冻储存保质期: 30食品添加剂: 有品牌: other/其他系列: 熏酱口味: 鸡骨架2个（再送1个共发3个）-保鲜发货 鸡骨架4个（再送3个共发7个）-保鲜发货 鸡骨架1+鸡肝1+熏豆腐卷1-保鲜发货 鸡骨架2个(送1个）+鸡肝1-保鲜发货 鸡骨架1+鸡腿1+鸡肝1-保鲜发货 鸡骨架1个+熏鸡大腿1个-保鲜发货 鸡骨架2个（送1个）+熏豆腐2卷-保鲜发货 鸡骨架2个(送1个）+熏豆腐卷2卷-顺丰空运 鸡骨架2个（送1个）+熏酱鸡肝半斤顺丰空运 鸡骨架1个+鸡腿1个-顺丰空运食品工艺: 烟熏产地: 中国大陆省份: 黑龙江省城市: 哈尔滨市是否为有机食品: 否包装方式: 散装肉类产品: 其他/other净含量: 530g', 45, 879, 0),
(130, 4, '农业工具大全栽苗种菜全自动辣椒移苗插烟移栽器玉米种植机移植树', '品牌: other颜色分类: 选购指导【可以放大查看】 单把三开口【76口径】 单把三开口【76口径】+测距尺 双把三开口【76口径】 双把三开口【76口径】+测距尺 双把三开口【76口径】+脚踏 双把三开口【76径】测距尺/脚踏 单把四开口【76口径】 单把四开口【76口径】+测距尺 双把四开口【76口径】适用对象: 栽菜适用行业: 农业农机类型: 栽苗器', 163.8, 96, 0),
(131, 3, '五香酱梅花鹿腿肉酱香鹿腱子肉吉林特产真空包装熟食卤味开袋可吃', '生产许可证编号: SC10413013300809厂名: 赵县润禾肉制品加工厂厂址: 河北省石家庄市赵县赵州镇固城村村北厂家联系方式: 00000000000配料表: 见包装储藏方法: 常温贮藏【冷藏更佳】保质期: 180食品添加剂: 见包装品牌: other/其他系列: 卤鹿肉规格: 250g500g1000g1500g产地: 中国大陆省份: 吉林省城市: 长春市口味: 冰点价【疯抢中】【酱鹿肉半斤】66%人选择 冰点价【疯抢中】【酱鹿肉一斤】85%人选择 冰点价【疯抢中】【酱鹿肉2斤】90%人选择 冰点价【疯抢中】【酱鹿肉三斤】95%人选择 冰点价【疯抢中】【酱鹿肉4斤送1斤】是否为有机食品: 否包装方式: 包装售卖方式: 单品原产地: 中国净含量: 250g', 65, 870, 0),
(132, 3, '金华火腿风干五花肉腊腌笃鲜上海淡咸肉炖笋南风肉500g刀板香特产', '生产日期：2023年10月15日 至 2023年10月25日品牌：滕香阁型号：风干五花肉\r\n产地：中国大陆省份：浙江省城市：金华市\r\n口味：1000克风干五花咸肉【偏瘦】 500克风干五花咸肉【偏瘦】 250克风干五花咸肉【偏瘦】 1000克五花肉咸肋骨【少肉】 500克风干五花咸肉【偏肥】 250克风干五花咸肉【偏肥】包装方式：包装特产品类：徽州刀板香\r\n净含量：500g包装规格：1包单件净含量：500g\r\n品名：风干五花咸肉生产许可证编号：SC10433070201915产品标准号：GB 2730\r\n厂名：金华市香帝食品有限公司厂址：浙江省金华市婺城区琅琊镇琅琊滕村江西铺自然村厂家联系方式：0579-82750176\r\n配料表：猪肉、食用盐储藏方法：密封、阴凉，通风干燥处保质期：180\r\n食品添加剂：亚硝酸钠\r\n\r\n', 58, 687, 0),
(133, 4, '锄头农家用除草种菜锄草户外全钢加厚挖土开荒挖地长柄挖笋大锄头', '颜色分类: 16型锰钢龙耳加固挖锄', 26, 670, 0),
(134, 4, '      收藏宝贝 陌上耕凯马 常柴 科普柴油机微耕机6到16马力多功能旋 农业 包邮', '品牌: 陌上耕颜色分类: 经典173F(5马力)标配手拉 经典173（5马力）手摇 经典173（5马力）电动 经典178F(6马力)标配手拉 经典178F(6马力)标配手摇 经典178F(6马力)标配电动 经典186/9马力标配手拉启动 经典款186标配手摇启动 经典款186标配电启动无电瓶 经典188/12马力标配手拉 经典款188标配手摇启动 适用对象: 农业果园大棚旱地水田适用行业: 农业农机类型: 微耕机', 2748, 63, 0),
(135, 4, '户外农用老式锄头花园园艺挖土种菜农用锄头园艺工具农业用具定做', '品牌：紫康型号：47642780颜色分类：57.5cm木柄锄头 38cm小锄头 37cm钢板小锄头 56cm钢板小锄头\r\n铲子类型：22320821主体材质：低碳钢把柄材质：木质', 43, 650, 0),
(136, 4, '小红牛链轨式微耕机多功能耕种机械犁地开沟机', '品牌: 帝尧颜色分类: 170汽油机+翻地犁 170汽油机+翻地犁+开沟犁 170汽油机+翻地犁+开沟犁+耕锄 170汽油机+翻地犁+开沟犁+耕锄+施肥 177汽油机+翻地犁 177汽油机+翻地犁+开沟 177汽油机+翻地犁+开沟犁+耕锄 177汽油机+翻地犁+开沟犁+耕锄+施肥 173柴油油机+翻地犁  适用对象: 玉米适用行业: 农业农机类型: 耕地机\r\n', 1960, 63, 0),
(137, 4, '地膜打孔器打洞神器破膜种植开孔戳膜大棚扎眼打眼农用具西瓜草莓', '品牌: other/其他颜色分类: 地膜打孔器：孔径5厘米 地膜打孔器：孔径6.3厘米 地膜打孔器：孔径7.6厘米 地膜打孔器：孔径9厘米 地膜打孔器：孔径10厘米 地膜打孔器：孔径11.4厘米 地膜打孔器：孔径13厘米 地膜打孔器：孔径16厘米 促销款1个打器直径6厘米(不可调高度) 促销款1个打器直径7.5厘米(不可调高度) 促销款1个打器直径8.5厘米(不可调高度) 促销款1个打器直径10厘米(不可调高度)适用对象: 各种蔬菜花卉果苗农作物适用行业: 农业农机类型: 地膜打孔机破膜机', 28, 540, 0),
(138, 4, '油画刀刮刀套装小丙烯水粉颜料工具平头小尖刀美术用品用具调色刀铲刀肌理刀画画材料儿童专业全套绘画油画棒', '品牌：淘I小I颜颜色分类：尖头01【塑料柄】 平头【塑料柄】 迷你尖头【塑料柄】 塑料柄3把【尖头01+迷你尖头+平头】 塑料柄6把【尖头01*2+迷你尖头*2+平头*2】 迷你尖头【原木款】 尖头0【原木款】 尖头1【原木款】 尖头2【原木款】 尖头3【原木款】 尖头4【原木款】 平头【原木款】 原木款3把【尖1+尖4+平头】 原木款3把【迷你尖+尖0+尖1】 原木款7把【迷你尖头+尖头0+尖头1+尖头2+尖头3+尖头4+平头】生产企业：汕头淘小颜科技有限公司', 3.2, 564, 0),
(139, 6, '高效养黄鳝 丁雷/王雪鹏 黄鳝网箱养殖技术 黄鳝病害防治技术 科学饲养鳝鱼 水产养殖书 饲料配制疾病预防诊治 农业水产养殖', 'ISBN编号：9787111434481书名：高效养黄鳝作者：无\r\n定价：16.80元书名：高效养黄鳝是否是套装：否\r\n出版社名称：机械工业出版社', 16.8, 678, 0),
(140, 6, '肉鸽高效养殖技术一本通 何艳丽 肉鸽养殖技术 养鸽子书籍 科学养殖肉鸽病害防治教程 农业养殖技术大全 凤凰新华书店旗舰店正版 ', 'ISBN编号：9787122078551书名：农村书屋系列 肉鸽高效养殖技术一本通作者：何艳丽　\r\n定价：15.00元书名：农村书屋系列 肉鸽高效养殖技术一本通开本：32开\r\n是否是套装：否出版社名称：化学工业出版', 15, 678, 0),
(141, 6, '3册高效鸡鸭鹅养殖技术饲料配方大全技术及用药鸡病快速鉴别诊断图谱防治实用手册畜牧家禽养殖动物医学专业书籍科学生态饲养管理', 'ISBN编号：9787537565516书名：高效养鸡技术+高效养鸭技术+高效养鹅技术作者：无\r\n定价：77.40元书名：高效养鸡技术+高效养鸭技术+高效养鹅技术是否是套装：是\r\n出版社名称：河北科学技术出版社', 77.4, 657, 0),
(142, 6, '红糖养殖用畜牧10斤水产专用猪牛羊兽用农用工业EM菌发酵养殖红糖', '产地: 中国净含量: 500颜色分类: 全能型工业红糖【5斤】 全能型工业红糖【3斤】 全能型工业红糖【50斤】 全能型工业红糖【1斤】 全能型工业红糖【10斤】 全能型工业红糖【20斤】 全能型工业红糖【2斤】饲料类型: 添加剂', 45, 657, 0),
(143, 6, '官网正版 羊病综合防治大全 王自力 养殖致富直通车 经典实用技术图书 农业技能培训教材 机械工业出版社旗舰店', 'ISBN编号：9787111601234书名：羊病综合防治大全作者：无\r\n定价：35.00元正：副书名：羊病综合防治大全是否是套装：否\r\n出版社名称：机械工业出版社', 35, 789, 0),
(144, 5, '揭美10克意大利生菜种子 生菜籽 农业大田种植 阳台园艺盆栽', '品牌: 农研包装种类: 厂家封装颜色分类: 原厂包装10克 888原厂包装25克 888原厂包装400克是否进口: 否开花季节: 春季 冬季植物品种: 其他种子类别: 蔬菜种子播种季节: 四季 其他植物生长属性: 一年生难易程度: 简单\r\n ', 34.3, 654, 0),
(145, 6, '官网正版 鱼病快速诊断与防治技术 王雪鹏 养殖致富直通车 经典实用图书 农业技能培训教材 机械工业出版社旗舰店', 'SBN编号：9787111449683书名：鱼病快速诊断作者：无\r\n定价：19.80元正：副书名：鱼病快速诊断是否是套装：否\r\n出版社名称：机械工业出版社\r\n', 19.6, 678, 0),
(146, 6, '工业用农业用胡蜂养殖专用散装无针头针筒注射器加墨点胶喂食分装', '品牌: 元娟，全圣颜色分类: 1毫升散装无针20支 1毫升散装无针50支 1毫升散装无针100支 2.5毫升散装无针20支 2.5毫升散装无针50支 2.5毫升散装无针100支 5毫升散装无针20支 5毫升散装无针50支 5毫升散装无针100支 10毫升散装无针20支 10毫升散装无针50支 10毫升散装无针100支 20毫升升散装无针20支 20毫升散装无针50支 20毫升散装无针100支 30毫升散装无针20支 30毫升散装无针50支 30毫升散装无针100支 60毫升散装无针20支 60毫升散装无针50支 60毫升散装无针100支 针筒密封帽（找客服下单)货号: 003适用对象: 养蜂，点胶，分装，实验，手工，农机类型: 针筒，实验室用针筒，养蜂', 45, 456, 0),
(147, 6, '高效养蚯蚓 潘红平 蚯蚓养殖技术书籍 饲养管理 养殖场的建造 养蚯蚓的书 病敌虫害防治 地龙 科学饲养教程一本通 机械工业出版社', '品牌：机械工业出版社主题：无ISBN编号：9787111618041\r\n书名：高效养蚯蚓作者：无定价：25.00元\r\n编者：无正：副书名：高效养蚯蚓是否是套装：否\r\n出版社名称：机械工业出版社页数：无包册数：无\r\n出版时间：2022-07', 25, 876, 0),
(148, 6, '养殖取暖保温灯六只暖光养殖专用保温灯小鸡小猪加热畜牧业养殖场', '颜色分类: 白色 浅灰色 深灰色 黑色 粉红色 红色 酒红色 桔色 浅黄色 黄色 军绿色 浅绿色 绿色 天蓝色 深蓝色 蓝色 深紫色 紫罗兰 紫色 巧克力色 深卡其布色 褐色 花色 透明 白色光面25瓦特惠六个装 白色光面25瓦2只装 白色光面25瓦一个 白色光面60瓦特惠六个装 白色光面60瓦2只装 白色光面60瓦一个 白色光面100瓦特惠六个装 白色光面100瓦2只装 白色光面100瓦一个 白色光面150瓦特惠六个装 白色光面150瓦2只装 白色光面150瓦一个 白色光面200瓦特惠六个装 白色光面200瓦2只装 白色光面200瓦一个 白色光面250瓦特惠六个装 白色光面250瓦2只装 白色光面250瓦一个 白色光面275瓦特惠六个装 白色光面275瓦2只装 白色光面275瓦一个 白色麻面100瓦特惠六个装 白色麻面100瓦2只装 白色麻面100瓦一个适用对象: 见描述', 54, 564, 0),
(149, 6, '百日出栏养猪新法 席克奇 等 编著 著作 畜牧/养殖专业科技 新华书店正版图书籍 科学技术文献出版社 月销 1', 'ISBN编号：9787518900404书名：百日出栏养猪新法作者：席克奇等\r\n定价：19.80元书名：百日出栏养猪新法是否是套装：否\r\n出版社名称：科学技术文献出版社\r\n', 19.8, 876, 0),
(150, 6, 'ISBN编号：9787518900404书名：百日出栏养猪新法作者：席克奇等 定价：19.80元书名：百日出栏养猪新法是否是套装：否 出版社名称：科学技术文献出版社', 'ISBN编号：9787109240162书名：金蝉高效养殖新技术问答作者：无\r\n定价：29.00元书名：金蝉高效养殖新技术问答是否是套装：否\r\n出版社名称：中国农业出版社', 29, 567, 0),
(151, 6, '高效池塘养鱼 占家智 养鱼技术正版书籍大全 鱼病防治与池塘管理教程 科学农业养殖大全 池塘建设亲鱼繁育 新华书店旗舰店文轩官网', '品牌：机械工业出版社ISBN编号：9787111510529书名：高效养鱼\r\n作者：无定价：25.00元正：副书名：高效养鱼\r\n是否是套装：否出版社名称：机械工业出版社\r\n', 25, 560, 0),
(152, 6, '鸽病速诊快治 江斌 等 编 专业科技 兽医 畜牧/养殖 正版图书籍福建科学技术出版社', 'ISBN编号：9787533554545书名：鸽病速诊快治作者：江斌\r\n定价：30.00元书名：鸽病速诊快治开本：16开\r\n是否是套装：否出版社名称：福建科学技术出版社\r\n', 30, 678, 0),
(153, 6, '正版包邮 高效养蝎子 周元军 养殖致富直通车 食用价值 生活习性 人工繁殖 经典实用技术图书 农业技能培训教程 机械工业出版社', '品牌：机械工业出版社ISBN编号：9787111446392书名：高效养蝎子 高效养殖致富直通车\r\n作者：周元军定价：19.80元正：副书名：高效养蝎子 高效养殖致富直通车\r\n是否是套装：否出版社名称：机械工业出版社\r\n', 19.8, 456, 0),
(154, 6, '3册 淡水虾实用养殖技术+池塘里的那些事儿+水产动物用药技术问答 正版书籍', 'ISBN编号：9787521000467书名：《稻田养殖龙虾100问》作者：占家智，奚业文，羊茜\r\n定价：45.00元正：副书名：《稻田养殖龙虾100问》是否是套装：否\r\n出版社名称：海洋出版社\r\n', 45, 456, 0),
(155, 6, '当当网 彩色图解小龙虾高效养殖技术大全 汤亚斌 化学工业出版社 正版书籍', 'ISBN编号：9787122383624书名：彩色图解小龙虾高效养殖技术大全作者：无\r\n定价：69.80元正：副书名：彩色图解小龙虾高效养殖技术大全是否是套装：否\r\n出版社名称：化学工业出版社', 69, 546, 0),
(156, 5, '**农业书籍图说玉米生长异常及诊治玉米高效栽培农业种植技术大全病虫害防治书农药知识农作物现代大棚蔬菜作物育种学玉米种植业', 'SBN编号：9787109223509书名：图说玉米生长异常及诊治作者：陈亚东\r\n作者地区：中国大陆定价：28.00元正：副书名：图说玉米生长异常及诊治\r\n开本：32开是否是套装：否出版社名称：中国农业出版社', 28, 567, 0),
(157, 5, '桃标准园生产技术 农业部种植业管理司 等 编者 农业基础科学专业科技 新华书店正版图书籍 中国农业出版社', 'SBN编号：9787109153530书名：桃标准园生产技术作者：无\r\n定价：10.00元书名：桃标准园生产技术开本：32开\r\n是否是套装：否出版社名称：中国农业出版社', 10, 575, 0),
(158, 5, '正版 石榴修剪新技术 柏永耀 石榴修剪技术参考书石榴树基本特点种植业石榴树维持修剪农业基础科学技术石榴种植户初学入门图书籍', 'ISBN编号：9787109191228书名：生态循环农业实用技术系列丛书 湿地农业立体种养实用技术作者：庄应强，沈其林，李晓丹　主编\r\n定价：15.00元书名：生态循环农业实用技术系列丛书 湿地农业立体种养实用技术开本：32开\r\n是否是套装：否出版社名称：中国农业出版社', 15, 657, 0),
(159, 5, 'w草菇周年栽培关键技术金盾出版社种植业正版图书籍', 'SBN编号：9787518605101书名：草菇周年栽培关键技术作者：肖自添\r\n定价：17.00元正：副书名：草菇周年栽培关键技术是否是套装：否\r\n出版社名称：金盾出版社\r\n', 17, 545, 0),
(160, 5, '花椒栽培技术 花椒栽培 专业科技 种植业 农业基础科学 正版图书籍云南科技出版社', 'SBN编号：9787558728617书名：花椒栽培技术作者：无\r\n定价：20.00元编者：《花椒栽培技术》编委会书名：花椒栽培技术\r\n开本：32开是否是套装：否出版社名称：云南科技出版社\r\n', 20, 457, 0),
(161, 5, '种植业 张文,罗斌 主编 9787502562953', 'ISBN编号: 9787502562953书名: 种植业作者: 张文，罗斌定价: 29.00出版社名称: 化学工业出版社', 29, 346, 0),
(162, 5, '一地多种蔬菜高效种植模式 祝海燕 编 种植业 专业科技 中国农业科学技术出版社 9787511646712 图书', 'ISBN编号：9787511646712书名：一地多种蔬菜高效种植模式作者：无\r\n定价：28.00元编者：祝海燕书名：一地多种蔬菜高效种植模式\r\n开本：32开是否是套装：否出版社名称：中国农业科学技术出版社\r\n', 28, 576, 0),
(163, 5, '包邮】现代种植业标准化研究 滕葳,李倩,孔巍,柳琪 编著', '产品名称: 现代种植业标准化研究ISBN编号: 9787122283641书名: 现代种植业标准化研究作者: 滕葳作者地区: 中国大陆定价: 68.00元正：副书名: 现代种植业标准化研究是否是套装: 否出版社名称: 化学工业出版社', 68, 346, 0),
(164, 5, '电子版图书葡萄标准园生产技术 农业部种植业管理司,全国农业技术', '产品名称: 葡萄标准园生产技术ISBN编号: 9787109150331书名: 葡萄标准园生产技术作者: 农业部种植业管理司，全国农业技术推广服务中心，国家作者地区: 中国大陆定价: 12.00元正：副书名: 葡萄标准园生产技术开本: 32开是否是套装: 否出版社名称: 中国农业出版社', 12, 587, 0),
(165, 5, '图说脐橙优质高效栽培技术 脐橙果树栽培种植技术大全业基础科学专业科技 脐橙病虫害防治技术果园生产管理技术书籍', 'SBN编号：9787109258884书名：图说脐橙优质高效栽培技术作者：无\r\n定价：35.00元正：副书名：图说脐橙优质高效栽培技术是否是套装：否\r\n出版社名称：中国农业出版社', 35, 685, 0),
(166, 5, '【正版新书】油料作物高产与减灾实用技术/农业部种植业管理司/', 'ISBN编号: 9787109155381书名: 油料作物高产与减灾实用技作者: 农业部种植业管理司 全国农业技定价: 15.00正：副书名: 油料作物高产与减灾实用技开本: 大32开出版社名称: 中国农业出版社有限公司', 15, 678, 0),
(167, 5, '*种优势蔬菜生产指南 韩世栋 著 专业科技 种植业 农业基础科学', '产品名称: 51种优势蔬菜生产指南ISBN编号: 9787109135222书名: 51种优势蔬菜生产指南作者: 韩世栋作者地区: 中国大陆定价: 20.00元正：副书名: 51种优势蔬菜生产指南开本: 32开是否是套装: 否出版社名称: 中国农业出版社', 20, 365, 0),
(168, 5, '荔枝龙眼病虫害原色图说 林锦何 等 主编 种植业 专业科技 广[%!', '产品名称: 荔枝龙眼病虫害原色图说ISBN编号: 9787535967794书名: 荔枝龙眼病虫害原色图说作者: 无作者地区: 中国大陆定价: 35.00元正：副书名: 荔枝龙眼病虫害原色图说是否是套装: 否出版社名称: 广东科技出版社', 35, 366, 0),
(169, 5, '植物病害防治技术 毕璋友,檀 专业科技 种植业 农业基础科学 正[', '产品名称: 植物病害防治技术ISBN编号: 9787565013027书名: 植物病害防治技术作者: 无作者地区: 中国大陆定价: 35.00元正：副书名: 植物病害防治技术开本: 16开是否是套装: 否出版社名称: 合肥工业大学出版社', 35, 358, 0),
(170, 5, '产品名称: 植物病害防治技术ISBN编号: 9787565013027书名: 植物病害防治技术作者: 无作者地区: 中国大陆定价: 35.00元正：副书名: 植物病害防治技术开本: 16开是否是套装: 否出版社名称: 合肥工业大学出版社', '产品名称: 画说棚室韭菜绿色生产技术ISBN编号: 9787511637864书名: 画说棚室韭菜绿色生产技术作者: 祝海燕定价: 30.00元正：副书名: 画说棚室韭菜绿色生产技术开本: 32开是否是套装: 否出版社名称: 中国农业科学技术出版社', 30, 457, 0),
(171, 5, '现货 花坛与花境设计镜 绿手指园艺丛书 家庭园艺 养花书籍 养花工具书 休闲养花技巧花园打理设计花镜书庭院造景施工全书湖北科技', 'ISBN编号：9787535282439书名：花坛与花镜设计作者：美好家园编著，周洁译\r\n定价：48.00元书名：花坛与花镜设计是否是套装：否\r\n出版社名称：湖北科学技术出版社', 48, 465, 0),
(172, 7, 'DARUICAT新款2023春夏厚底增高透气休闲做旧情侣老爹鞋运动鞋女男', '品牌: DARUICAT闭合方式: 系带尺码: 35 36 37 38 39 40 41 42 43 44图案: 拼色风格: 休闲流行元素: 交叉绑带后跟高: 中跟(3-5cm)颜色分类: 香槟色 白色 紫色 白红做旧 白红色 白蓝粉做旧 白蓝粉 灰金色做旧 灰金色 黑白做旧 黑白色 黑黄做旧 黑黄色 银色做旧 香槟色做旧 泥染奶茶灰金 泥染铁灰色 铁灰色 泥染灰白蓝 灰白蓝 纯黑色 复古粉做旧 new 荧光绿做旧 new 白银色做旧 new 白色做旧 new 白银色 new上市年份季节: 2023年夏季鞋头款式: 圆头适用场景: 休闲跟底款式: 厚底鞋底材质: 橡胶内里材质: 网面适用对象: 青年开口深度: 深口款式: 老爹鞋帮面材质: 混合材质拼接主要材质: 网布', 45, 467, 0),
(173, 7, '毛边立领水洗做旧渐变牛仔外套男款秋季潮牌休闲宽松百搭情侣夹克', '品牌: other/其他尺码: M L XL 2XL领型: 翻领颜色: 蓝色 黑色 蓝色牛仔裤【可搭配一套】 黑色牛仔裤【可搭配一套】 打底纯棉T恤细分风格: 潮基础风格: 青春流行适用季节: 秋季上市年份季节: 2023年秋季袖长: 长袖厚薄: 常规适用场景: 其他休闲衣长: 常规款版型: 标准适用对象: 青少年', 56, 546, 0),
(174, 7, '真皮勃肯鞋女2023秋冬新款森系复古魔术贴休闲软平底丑萌大头单鞋 月销 200+', '品牌：鱼笑缘尺码：35 36 37 38 39 40风格：复古风\r\n流行元素：搭扣后跟高：低跟(1-3cm)颜色分类：驼色【升级版】 杏色【升级版】 灰色【升级版】 驼色 杏色 灰色\r\n货号：YU082502上市年份季节：2023年秋季鞋头款式：圆头\r\n适用场景：休闲跟底款式：平底内里材质：超细纤维\r\n开口深度：浅口款式：单鞋帮面材质：超细纤维\r\n', 45, 453, 0),
(175, 7, '感冒灵颗粒官方旗舰店三九3999成人小儿童流鼻涕鼻塞咳嗽发烧药ql', '品牌：济民批准文号：国药准字Z45020054生产企业：广西济民制药有限公司\r\n规格：10g*9袋/盒类别：中药产品剂型：颗粒\r\n用法：口服使用剂量：一次10克，一日3次药品通用名：感冒灵颗粒\r\n药品名称：感冒灵颗粒有效期：24个月适用人群：成人\r\n药品分类：非处方药疾病：感冒 风热感冒 风寒感冒 解热镇痛症状：发热 头痛 鼻塞 咽痛 流涕\r\n产品名称：10g*9袋 x 1盒 药房直售 正品保障 10g*9袋 x 3盒 药房直售 正品保障 10g*9袋 x 5盒 药房直售 正品保障 10g*9袋 x 3盒 +3盒蒲地蓝消炎片】抗炎消肿 清热解毒 10g*9袋 x 3盒 +3盒咽炎片】清利咽喉 镇咳止痒 10g*9袋 x 3盒 +3盒复方板蓝根颗粒】清热解毒 凉血利咽 10g*9袋 x 3盒 +金嗓子喉片】咽喉肿痛感冒发烧 10g*9袋 x 3盒 +3盒咳特灵胶囊】止咳消炎 感冒发烧 10g*9袋 x 3盒 +3盒抗病毒口服液】风热感冒 清热祛湿 10g*9袋 x 3盒 +3盒布洛芬缓释胶囊】不推荐一起服用 10g*9袋 x 3盒 +3盒连花清瘟胶囊】不推荐一起服用 10g*9袋 x 3盒 +3盒小柴胡颗粒】不推荐一起服用药品包装规格：10g*9袋\r\n', 25, 364, 0),
(176, 7, '999三九抗病毒口服液12支清热祛湿凉血解毒流感感冒药家用', '品牌：999批准文号：国药准字Z33020518生产企业：杭州华润老桐君药业有限公司 杭州老桐君制药有限公司\r\n规格：10ml*6支/盒 10ml*12支/盒 10ml*10支/盒类别：中药产品剂型：口服液\r\n用法：口服使用剂量：一次10ml，一日2～3次 一次10毫升，一日2~3次（早饭前和午、晚饭后各服一次） 口服，一次10ml，一日2～3次(早饭前和午、晚饭后各服一次)。药品通用名：抗病毒口服液\r\n药品名称：抗病毒口服液有效期：24个月适用人群：儿童 成人 不限\r\n药品分类：非处方药疾病：风热感冒 流感症状：风热感冒 流感\r\n产品名称：999抗病毒口服液10ml*10支/盒 x 1盒 10ml*12支 x 1盒 10ml*12支 x 2盒 10ml*12支 x 3盒 10ml*12支 x 5盒 10ml*12支 x 10盒 10ml*6支 x 1盒药品包装规格：10ml*12支 10ml*6支', 9.8, 654, 0),
(177, 7, '飘柔滋润去屑止痒洗发水/露柔顺修护去油洗发膏官网旗舰930ml正品', '品牌: REJOICE/飘柔洗发护发单品: 飘柔精华去屑洗发水功效: 温和清洁、修护 丰盈蓬松 改善毛躁 改善头痒 去头屑 深层滋养产地: 中国香味: 【针对干枯头屑】滋润去屑洗发水930ml 【针对干枯毛躁】润泽柔顺洗发水930ml 滋润去屑洗发水400ml 润泽柔顺洗发水400ml 【针对干枯头屑】滋润去屑洗发水500ml化妆品备案编号/注册证号: 粤G妆网备字2017131515适用发质: 所有发质规格类型: 正常规格是否为特殊用途化妆品: 否', 21, 456, 0),
(178, 7, '304不锈钢筷子勺子套装学生便携两件套金色方形筷家用公筷勺长柄', '产地: 中国大陆包装体积: 24*3.5*6CM品牌: 百仕达毛重: 90G流行元素: 纯色货号: HY-001适用人群: 学生适用场景: 旅行适用空间: 户外颜色分类: 银色方筷+勺子 玫瑰金方筷+勺子 金黄色方筷+勺子 黑色方筷+勺子 银色方筷+勺子+小麦盒 玫瑰金方筷+勺子+小麦盒 金黄色方筷+勺子+小麦盒 黑色方筷+勺子+小麦盒 2双银色方筷 2双玫瑰金色方筷 2双金黄色方筷 2双黑色方筷 2支银勺 2支玫瑰金勺 2支金黄色勺 2支黑勺材质: 金属风格: 中式主图来源: 自主实拍图\r\n ', 4.5, 353, 0),
(179, 7, '特价超大号60*40烤全羊托盘大号木盘实木长方形家用杯盘上菜餐盘', '材质: 木图案: 纯色风格: 日式形状: 长方形产地: 中国大陆流行元素: 复古颜色分类: 茶色60*40cm 黑色60*40cm 暗红色60*40cm 红色60*40cm 黑色45*35cm 茶色45*35cm 茶色50*30cm 黑色50*30cm 暗红色50*30cm 茶色70*50cm 茶色（刻制兰花）45*26.5cm 茶色40*28cm 茶色36*23cm 茶色（刻制兰花）36*23cm 黑色40*28cm 暗红色40*28cm 黑色36*23cm 茶色平把手60*40cm 黑色平把手60*40cm 暗红色平把手60*40cm 茶色平把手40*30cm 黑色平把手40*30cm 茶色镂空樱花斜盘42.5*28cm 红色平把手60*40cm主图来源: 自主实拍图个数: 1个盘类型: 平盘茶餐具工艺: 磨砂尺寸: 14英寸是否手工: 是', 18, 323, 0),
(180, 7, '超轻薄大容量奶茶杯玻璃杯冰咖啡杯冰美式冰拿铁玻璃杯子防爆耐热', '品牌: Mintylife功能: 耐高温材质: 耐热玻璃容量: 601mL(含)-700mL(含)风格: 北欧风格形状: 圆形产地: 中国大陆流行元素: 小清新颜色分类: 650ml全透明大玻璃杯价格区间: 20元-29.9元货号: mt0507主图来源: 自主实拍图个数: 1个适用场景: 商用玻璃杯花色: 无色透明适用人群: 大众是否手工: 是流行趋势词: 手工制作是否带吸管: 否', 16, 234, 0),
(181, 7, '自酿泡酒玻璃瓶青梅酒樱桃酒杨梅酒果酒果汁分装瓶小空瓶子密封罐', '材质: 玻璃风格: 韩式流行元素: 小清新颜色分类: 350ml蒙砂款（1个装） 350ml蒙砂款（2个装）个数: 1个适用场景: 日常送礼适用人群: 大众', 25, 245, 0),
(182, 7, '北欧双层长方形沥水托盘塑料茶盘家用水杯客厅欧式简约杯子沥水盘', '品牌: KM材质: 塑料图案: 纯色风格: 日式形状: 长方形产地: 中国大陆流行元素: 小清新颜色分类: 高档灰 简约白主图来源: 淘宝分销图个数: 1个盘类型: 平盘茶餐具工艺: 磨砂尺寸: 14英寸是否手工: 否', 24, 214, 0),
(183, 7, '现货新款任天堂Switch oled 白色游戏主机ns日港版 7寸屏幕游戏机', '品牌: Nintendo/任天堂任天堂型号: Nintendo Switch OLED内存容量: 64GB颜色分类: 王国之泪OLED 主机限定 王国之泪OLED 主机限定+王国之泪 宝可梦朱紫OLED 主机限定 新款OLED 白色主机 新款OLED 红蓝主机 新款OLED 白色主机+王国之泪 新款OLED 白色主机+塞尔达+王国之泪 新款OLED 白色主机+运动游戏 新款OLED 白色主机+健身环 新款OLED 白色主机+健身环+舞力22 新款OLED 白色主机+健身环+舞力22+运动 马里奥限定续航【32G内存】 堡垒之夜限定续航【32G内存】 怪物限定续航【32G内存】套餐: 单机标配版本类型: 日版 港版 中国大陆上市时间: 2021-10-08', 1898, 234, 0),
(184, 7, '光与夜之恋 周边通贩 马口铁徽章 第四弹', '颜色分类：萧逸 陆沉 齐司礼 夏鸣星 查理苏周边产品：徽章出售状态：预售\r\n游戏名称：光与夜之恋大小：徽章第四弹\r\n', 16, 324, 0),
(185, 7, '三分妄想崩坏星穹铁道cos服饮月君丹枫cosplay服装c服男装丹恒', '品牌: 三分妄想适用年龄: 14周岁以上COS男装分类: 套装颜色分类: 饮月-丹枫服装（成团，只是定金） 饮月-丹枫假发（只是定金） 饮月-丹枫鞋子（只是定金）出售状态: 定做作品来源: 游戏大小: S M L XL 均码', 50, 325, 0),
(186, 7, '三分妄想原神cos服散兵蕈码宝贝cosplay同人衍生服女动漫服装c服', '品牌: 三分妄想适用年龄: 14周岁以上COS男装分类: 套装作品地区: 中国大陆颜色分类: 散兵蕈码宝贝服装出售状态: 预售作品来源: 游戏大小: S M L XLACG作品名: 原神', 483, 342, 0),
(187, 7, '三分妄想文豪野犬cos服太宰治侦探社cosplay男风衣动漫服装c服', '品牌: 三分妄想适用年龄: 14周岁以上COS男装分类: 套装作品地区: 日本颜色分类: 全款（未拍定金拍此项）出售状态: 预售作品来源: 动漫ACG作品名: 文豪野犬', 486, 325, 0),
(188, 7, '正版第五人格拼装工坊盲盒第二弹手办先知约瑟夫网易游戏周边玩具', '品牌: 第五人格型号: 第五人格盲盒材质: PVC用途: 桌面摆件 汽车摆件颜色分类: 第五人格拼装工坊第1弹-随机1个 第五人格拼装工坊第1弹-随机2个 第五人格拼装工坊第1弹-随机3个 第五人格拼装工坊第1弹-整盒6个（不重复） 第五人格拼装工坊第2弹-随机1个 第五人格拼装工坊第2弹-随机2个 第五人格拼装工坊第2弹-随机3个 第五人格拼装工坊第2弹-整盒6个（不重复） 第五人格拼装工坊第1弹-黑·范无咎（隐藏款） 第五人格拼装工坊第1弹-白·谢必安（隐藏款） 第五人格拼装工坊第2弹-约瑟夫（隐藏款） 第五人格拼装工坊第1弹-佣兵 第五人格拼装工坊第1弹-园丁 第五人格拼装工坊第1弹-祭司 第五人格拼装工坊第1弹-杰克 第五人格拼装工坊第1弹-机械师 第五人格拼装工坊第1弹-入殓师 第五人格拼装工坊第2弹-空军 第五人格拼装工坊第2弹-医生 第五人格拼装工坊第2弹-调香师 第五人格拼装工坊第2弹-杂技演员 第五人格拼装工坊第2弹-先知 第五人格拼装工坊第2弹-小丑出售状态: 现货作品来源: 游戏作品地区: 中国大陆款式: 静态ACG作品名: 第五人格', 30, 353, 0),
(189, 7, '第五人格周边手办玩偶棉花娃娃手偶勘探员小说作曲家毛绒公仔礼物', '品牌: other型号: 第五人格适用年龄: 3周岁以上材质: 毛绒适用性别: 男女通用颜色分类: 小女孩 作曲家 小说家 勘探员周边产品: 毛绒公仔出售状态: 现货动漫地区: 中国大陆大小: 20-25cmACG作品名: 第五人格适用年龄（新版）: 3岁及以上', 45, 245, 0),
(190, 7, '牛奶绒床垫褥子软垫家用加厚垫被法兰绒垫子宿舍学生单人铺床毯子', '品牌：絮日功能：抗菌填充物：聚酯纤维\r\n面料：牛奶绒风格：简约现代产地：中国大陆\r\n省份：江苏省地市：南通市颜色分类：花漫 欢乐狗 熊世界 向阳花 艾琳娜 妙妙熊 帕恰狗 月半星辰 爱心满满 欢乐派对 小飞兔 爱慕 寐色 爱心萌龙 律动生活 爱意 彩虹岛 格调 花园兔 可可兔 酷酷龙 陌上花开 萱花 意境 千鸟熊 西雅 商务灰 高贵蓝 钻石蓝 青山绿 苹果绿 秋末黄 红豆沙 桃子粉 优雅紫\r\n床垫类型：床垫适用床尺寸：床垫-90x200cm【A类品质 舒适不掉绒】 床垫-120x200cm【A类品质 舒适不掉绒】 床垫-150x200cm【A类品质 舒适不掉绒】 床垫-180x200cm【A类品质 舒适不掉绒】 床垫-200x220cm【A类品质 舒适不掉绒】 床垫三件套-90x200cm【床垫+枕套x2】 床垫三件套-120x200cm【床垫+枕套x2】 床垫三件套-150x200cm【床垫+枕套x2】 床垫三件套-180x200cm【床垫+枕套x2】 床垫三件套-200x220cm【床垫+枕套x2】产品等级：合格品\r\n是否防水：否是否可折叠：可折叠适用场景：通用\r\n货号：202308300927-002上市年份季节：2023年秋季适用人群：通用\r\n床垫软硬度：软硬适中是否可水洗：是', 54, 345, 0),
(191, 7, '女童毛衣水貂绒秋冬2023新款加绒儿童黄色冬季冬装大童针织打底衫', '品牌: other/其他适用年龄: 2岁 3岁 4岁 5岁 6岁 7岁 8岁 9岁 10岁 11岁针织面料: 其他图案: 动物风格: 休闲领型: 圆领产地: 中国大陆省份: 广东省地市: 广州市适用性别: 女模特实拍: 实拍无模特衣门襟: 套头毛线粗细: 普通毛线是否带帽子: 否颜色分类: 小熊-白色 小熊-粉色 小熊-紫色 草莓美le蒂-白色 草莓美le蒂-粉色 草莓美le蒂-紫色 草莓美le蒂-黄色 狗狗-白色 狗狗-粉色 爱心花边-紫色货号: YuT-2201面料工艺: 起绒参考身高: 160cm 偏小半码 110cm 120cm 130cm 140cm 150cm袖长: 长袖厚薄: 常规材质成分: 粘胶纤维(粘纤)100%', 60, 234, 0);

-- --------------------------------------------------------

--
-- 表的结构 `shop_type`
--

CREATE TABLE `shop_type` (
  `id` int(11) NOT NULL COMMENT '商品分类编号',
  `name` char(20) NOT NULL COMMENT '商品分类名字'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_type`
--

INSERT INTO `shop_type` (`id`, `name`) VALUES
(1, '水果类'),
(2, '蔬菜类'),
(3, '肉食类'),
(4, '农业用具'),
(5, '种植业'),
(6, '养殖业'),
(7, '其他');

-- --------------------------------------------------------

--
-- 表的结构 `_db_users`
--

CREATE TABLE `_db_users` (
  `id` int(11) NOT NULL COMMENT '唯一编号',
  `user_header` text COMMENT '用户头像',
  `user_name` varchar(20) NOT NULL COMMENT '用户名称',
  `user_sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户性别 0 不透露，1男2女',
  `user_age` int(11) NOT NULL COMMENT '用户年龄',
  `user_phone` char(11) NOT NULL COMMENT '用户手机',
  `user_email` varchar(50) NOT NULL COMMENT '用户邮箱',
  `user_permission` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户权限0普通用户1管理员2+其他',
  `user_pwd` char(255) NOT NULL COMMENT '用户密码',
  `user_sign` text NOT NULL COMMENT '用户签名',
  `user_time` int(11) NOT NULL COMMENT '注册时间',
  `user_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态 0 正常 1 异常',
  `status_info` text COMMENT '异常信息',
  `user_money` double NOT NULL DEFAULT '0' COMMENT '用户钱包'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `_db_users`
--

INSERT INTO `_db_users` (`id`, `user_header`, `user_name`, `user_sex`, `user_age`, `user_phone`, `user_email`, `user_permission`, `user_pwd`, `user_sign`, `user_time`, `user_status`, `status_info`, `user_money`) VALUES
(10000, '/uploads/images/headers/1698728828_9121354987.png', '往事如风', 0, 19, '19090909090', 'functionIn@foxmail.com', 1, '63a9f0ea7bb98050796b649e85481845', '这个用户很懒，不设置签名', 1697990997, 0, '', 632.16),
(10009, '/uploads/images/headers/1698917719_4205562724.png', '系统账户', 0, 0, '000', '000', 0, '63a9f0ea7bb98050796b649e85481845', '000', 1698914766, 0, '', 0);

--
-- 转储表的索引
--

--
-- 表的索引 `address_list`
--
ALTER TABLE `address_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `comment_list`
--
ALTER TABLE `comment_list`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `db_bk`
--
ALTER TABLE `db_bk`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `db_bk_list`
--
ALTER TABLE `db_bk_list`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `db_shop`
--
ALTER TABLE `db_shop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_uid` (`shop_uid`);

--
-- 表的索引 `dingdan`
--
ALTER TABLE `dingdan`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `forum_images`
--
ALTER TABLE `forum_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `_id` (`id`);

--
-- 表的索引 `forum_list`
--
ALTER TABLE `forum_list`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `forum_type`
--
ALTER TABLE `forum_type`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `news_images`
--
ALTER TABLE `news_images`
  ADD PRIMARY KEY (`_id`);

--
-- 表的索引 `news_list`
--
ALTER TABLE `news_list`
  ADD PRIMARY KEY (`news_id`);

--
-- 表的索引 `shop_images`
--
ALTER TABLE `shop_images`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `shop_list`
--
ALTER TABLE `shop_list`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `shop_type`
--
ALTER TABLE `shop_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `_db_users`
--
ALTER TABLE `_db_users`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `address_list`
--
ALTER TABLE `address_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `comment_list`
--
ALTER TABLE `comment_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论编号', AUTO_INCREMENT=65;

--
-- 使用表AUTO_INCREMENT `db_bk`
--
ALTER TABLE `db_bk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号', AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `db_bk_list`
--
ALTER TABLE `db_bk_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `db_shop`
--
ALTER TABLE `db_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `dingdan`
--
ALTER TABLE `dingdan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号', AUTO_INCREMENT=62;

--
-- 使用表AUTO_INCREMENT `forum_images`
--
ALTER TABLE `forum_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号', AUTO_INCREMENT=104;

--
-- 使用表AUTO_INCREMENT `forum_list`
--
ALTER TABLE `forum_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '讨论编号', AUTO_INCREMENT=121;

--
-- 使用表AUTO_INCREMENT `forum_type`
--
ALTER TABLE `forum_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类编号', AUTO_INCREMENT=22;

--
-- 使用表AUTO_INCREMENT `news_images`
--
ALTER TABLE `news_images`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号', AUTO_INCREMENT=86;

--
-- 使用表AUTO_INCREMENT `news_list`
--
ALTER TABLE `news_list`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻编号', AUTO_INCREMENT=124;

--
-- 使用表AUTO_INCREMENT `shop_images`
--
ALTER TABLE `shop_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片ID', AUTO_INCREMENT=531;

--
-- 使用表AUTO_INCREMENT `shop_list`
--
ALTER TABLE `shop_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品唯一编号', AUTO_INCREMENT=192;

--
-- 使用表AUTO_INCREMENT `shop_type`
--
ALTER TABLE `shop_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类编号', AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `_db_users`
--
ALTER TABLE `_db_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号', AUTO_INCREMENT=10031;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
