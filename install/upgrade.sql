-- --------------------------------------------------------

--
-- Database: `opencart`
--

-- --------------------------------------------------------

SET sql_mode = '';
--
-- Table structure for table `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(10, 'Parralax-1', 1),
(15, 'Slideshow', 1),
(14, 'banners', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=190 ;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(179, 14, 'index.php?route=product/category&amp;path=34', 'catalog/banner-3.jpg', 3),
(189, 15, '', 'catalog/slide-3.jpg', 3),
(180, 10, '', 'catalog/parallax-1.jpg', 0),
(188, 15, '', 'catalog/slide-2.jpg', 2),
(187, 15, '', 'catalog/slide-1.jpg', 1),
(178, 14, 'index.php?route=product/category&amp;path=25', 'catalog/banner-2.jpg', 2),
(177, 14, 'index.php?route=product/category&amp;path=33', 'catalog/banner-1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

DROP TABLE IF EXISTS `oc_banner_image_description`;
CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`, `description`) VALUES
(99, 1, 9, 'slide-1', ''),
(100, 1, 9, 'slide-2', ''),
(101, 1, 9, 'slide-3', ''),
(99, 2, 9, 'slide-1', ''),
(100, 2, 9, 'slide-2', ''),
(101, 2, 9, 'slide-3', ''),
(99, 3, 9, 'slide-1', ''),
(100, 3, 9, 'slide-2', ''),
(101, 3, 9, 'slide-3', ''),
(180, 3, 10, 'parallax-1', '&lt;h4&gt;A great source for  &lt;/h4&gt;\r\n&lt;h2&gt;luxury&lt;/h2&gt;\r\n&lt;h1&gt;watches&lt;/h1&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor.&lt;/p&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;amp;product_id=43&quot;&gt;Shop now!&lt;/a&gt;'),
(180, 2, 10, 'parallax-1', '&lt;h4&gt;A great source for  &lt;/h4&gt;\r\n&lt;h2&gt;luxury&lt;/h2&gt;\r\n&lt;h1&gt;watches&lt;/h1&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor.&lt;/p&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;amp;product_id=43&quot;&gt;Shop now!&lt;/a&gt;'),
(179, 2, 14, 'banner-3', '&lt;h4&gt;Cooks'' Tools&lt;/h4&gt;\r\n&lt;h1&gt;save 45%&lt;/h1&gt;\r\n&lt;p&gt;Praesent justo dolor, lobortis quis&lt;/p&gt;'),
(179, 1, 14, 'banner-3', '&lt;h4&gt;Cooks'' Tools&lt;/h4&gt;\r\n&lt;h1&gt;save 45%&lt;/h1&gt;\r\n&lt;p&gt;Praesent justo dolor, lobortis quis&lt;/p&gt;'),
(178, 3, 14, 'banner-2', '&lt;h4&gt;Dinnerware&lt;/h4&gt;\r\n&lt;h1&gt;save 20%&lt;/h1&gt;\r\n&lt;p&gt;Praesent justo dolor, lobortis quis&lt;/p&gt;'),
(180, 1, 10, 'parallax-1', '&lt;h4&gt;A great source for  &lt;/h4&gt;\r\n&lt;h2&gt;luxury&lt;/h2&gt;\r\n&lt;h1&gt;watches&lt;/h1&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor.&lt;/p&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;amp;product_id=43&quot;&gt;Shop now!&lt;/a&gt;'),
(189, 3, 15, 'slide-3', '&lt;div class=&quot;camera-cnt&quot;&gt;\r\n&lt;h1&gt;Ideal cooking tools  &lt;span&gt;\r\nfor your kitchen\r\n&lt;span&gt;get up to&lt;/span&gt; &lt;em&gt; 25% off &lt;/em&gt; &lt;/span&gt;\r\n&lt;/h1&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;product_id=33&quot;&gt;Shop now&lt;/a&gt;\r\n&lt;/div&gt;'),
(189, 2, 15, 'slide-3', '&lt;div class=&quot;camera-cnt&quot;&gt;\r\n&lt;h1&gt;Ideal cooking tools  &lt;span&gt;\r\nfor your kitchen\r\n&lt;span&gt;get up to&lt;/span&gt; &lt;em&gt; 25% off &lt;/em&gt; &lt;/span&gt;\r\n&lt;/h1&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;product_id=33&quot;&gt;Shop now&lt;/a&gt;\r\n&lt;/div&gt;'),
(189, 1, 15, 'slide-3', '&lt;div class=&quot;camera-cnt&quot;&gt;\r\n&lt;h1&gt;Ideal cooking tools  &lt;span&gt;\r\nfor your kitchen\r\n&lt;span&gt;get up to&lt;/span&gt; &lt;em&gt; 25% off &lt;/em&gt; &lt;/span&gt;\r\n&lt;/h1&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;product_id=33&quot;&gt;Shop now&lt;/a&gt;\r\n&lt;/div&gt;'),
(178, 2, 14, 'banner-2', '&lt;h4&gt;Dinnerware&lt;/h4&gt;\r\n&lt;h1&gt;save 20%&lt;/h1&gt;\r\n&lt;p&gt;Praesent justo dolor, lobortis quis&lt;/p&gt;'),
(178, 1, 14, 'banner-2', '&lt;h4&gt;Dinnerware&lt;/h4&gt;\r\n&lt;h1&gt;save 20%&lt;/h1&gt;\r\n&lt;p&gt;Praesent justo dolor, lobortis quis&lt;/p&gt;'),
(177, 3, 14, 'banner-1', '&lt;h4&gt;Cookware Sets&lt;/h4&gt;\r\n&lt;h1&gt;save 50%&lt;/h1&gt;\r\n&lt;p&gt;Praesent justo dolor, lobortis quis&lt;/p&gt;'),
(188, 3, 15, 'slide-2', '&lt;div class=&quot;camera-cnt&quot;&gt;\r\n&lt;h1&gt;A great selection &lt;span&gt;\r\nof kitchen gadgets\r\n&lt;span&gt;get up to&lt;/span&gt; &lt;em&gt; 25% off &lt;/em&gt; &lt;/span&gt;\r\n&lt;/h1&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;product_id=42&quot;&gt;Shop now&lt;/a&gt;\r\n&lt;/div&gt;'),
(177, 2, 14, 'banner-1', '&lt;h4&gt;Cookware Sets&lt;/h4&gt;\r\n&lt;h1&gt;save 50%&lt;/h1&gt;\r\n&lt;p&gt;Praesent justo dolor, lobortis quis&lt;/p&gt;'),
(177, 1, 14, 'banner-1', '&lt;h4&gt;Cookware Sets&lt;/h4&gt;\r\n&lt;h1&gt;save 50%&lt;/h1&gt;\r\n&lt;p&gt;Praesent justo dolor, lobortis quis&lt;/p&gt;'),
(188, 2, 15, 'slide-2', '&lt;div class=&quot;camera-cnt&quot;&gt;\r\n&lt;h1&gt;A great selection &lt;span&gt;\r\nof kitchen gadgets\r\n&lt;span&gt;get up to&lt;/span&gt; &lt;em&gt; 25% off &lt;/em&gt; &lt;/span&gt;\r\n&lt;/h1&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;product_id=42&quot;&gt;Shop now&lt;/a&gt;\r\n&lt;/div&gt;'),
(188, 1, 15, 'slide-2', '&lt;div class=&quot;camera-cnt&quot;&gt;\r\n&lt;h1&gt;A great selection &lt;span&gt;\r\nof kitchen gadgets\r\n&lt;span&gt;get up to&lt;/span&gt; &lt;em&gt; 25% off &lt;/em&gt; &lt;/span&gt;\r\n&lt;/h1&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;product_id=42&quot;&gt;Shop now&lt;/a&gt;\r\n&lt;/div&gt;'),
(187, 3, 15, 'slide-1', '&lt;div class=&quot;camera-cnt&quot;&gt;\r\n&lt;h1&gt;clearance sale  &lt;span&gt;\r\ncookware sets \r\n&lt;span&gt;get up to&lt;/span&gt; &lt;em&gt; 25% off &lt;/em&gt; &lt;/span&gt;\r\n&lt;/h1&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;product_id=28&quot;&gt;Shop now&lt;/a&gt;\r\n&lt;/div&gt;'),
(187, 2, 15, 'slide-1', '&lt;div class=&quot;camera-cnt&quot;&gt;\r\n&lt;h1&gt;clearance sale  &lt;span&gt;\r\ncookware sets \r\n&lt;span&gt;get up to&lt;/span&gt; &lt;em&gt; 25% off &lt;/em&gt; &lt;/span&gt;\r\n&lt;/h1&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;product_id=28&quot;&gt;Shop now&lt;/a&gt;\r\n&lt;/div&gt;'),
(179, 3, 14, 'banner-3', '&lt;h4&gt;Cooks'' Tools&lt;/h4&gt;\r\n&lt;h1&gt;save 45%&lt;/h1&gt;\r\n&lt;p&gt;Praesent justo dolor, lobortis quis&lt;/p&gt;'),
(187, 1, 15, 'slide-1', '&lt;div class=&quot;camera-cnt&quot;&gt;\r\n&lt;h1&gt;clearance sale  &lt;span&gt;\r\ncookware sets \r\n&lt;span&gt;get up to&lt;/span&gt; &lt;em&gt; 25% off &lt;/em&gt; &lt;/span&gt;\r\n&lt;/h1&gt;\r\n&lt;a href=&quot;index.php?route=product/product&amp;product_id=28&quot;&gt;Shop now&lt;/a&gt;\r\n&lt;/div&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=460 ;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(432, 'module', 'tm_fbbox'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured'),
(433, 'module', 'bestseller'),
(434, 'module', 'latest'),
(435, 'module', 'special'),
(436, 'module', 'affiliate'),
(437, 'module', 'information'),
(438, 'module', 'tm_slideshow'),
(440, 'module', 'olark'),
(455, 'module', 'tm_instagram'),
(457, 'module', 'tm_category_menu'),
(458, 'module', 'tm_module_tab'),
(459, 'module', 'tm_newsletter_popup');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

DROP TABLE IF EXISTS `oc_layout_module`;
CREATE TABLE IF NOT EXISTS `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=748 ;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(716, 4, 'account', 'column_left', 1),
(721, 8, 'special.67', 'column_left', 2),
(726, 12, 'tm_fbbox.42', 'footer_top', 1),
(729, 7, 'latest.69', 'column_left', 2),
(728, 7, 'account', 'column_left', 1),
(733, 3, 'featured.28', 'column_left', 1),
(746, 6, 'featured.28', 'column_left', 2),
(741, 10, 'olark.50', 'footer_top', 1),
(701, 9, 'latest.69', 'column_left', 2),
(704, 13, 'olark.50', 'footer_top', 1),
(711, 5, 'featured.28', 'column_left', 2),
(720, 8, 'account', 'column_left', 1),
(745, 6, 'olark.50', 'footer_top', 1),
(693, 1, 'tm_module_tab.71', 'content_top', 4),
(732, 3, 'bestseller.43', 'column_left', 2),
(731, 3, 'account', 'column_left', 1),
(714, 11, 'tm_fbbox.42', 'footer_top', 1),
(710, 5, 'olark.50', 'footer_top', 1),
(707, 2, 'olark.50', 'footer_top', 1),
(700, 9, 'olark.50', 'footer_top', 1),
(692, 1, 'tm_category_menu.72', 'content_top', 1),
(691, 1, 'tm_fbbox.42', 'footer_top', 1),
(744, 6, 'account', 'column_left', 1),
(727, 7, 'olark.50', 'footer_top', 1),
(719, 8, 'olark.50', 'footer_top', 1),
(715, 4, 'bestseller.43', 'column_left', 2),
(709, 5, 'account', 'column_left', 1),
(703, 13, 'bestseller.43', 'column_left', 1),
(699, 9, 'account', 'column_left', 1),
(690, 1, 'tm_instagram.70', 'content_top', 5),
(689, 1, 'banner.33', 'content_top', 3),
(694, 1, 'tm_slideshow.46', 'content_top', 2),
(695, 1, 'olark.50', 'footer_top', 1),
(696, 1, 'tm_newsletter_popup.74', 'content_top', 0),
(713, 11, 'olark.50', 'footer_top', 1),
(702, 9, 'tm_fbbox.42', 'footer_top', 1),
(705, 13, 'latest.69', 'column_left', 2),
(706, 13, 'tm_fbbox.42', 'footer_top', 1),
(708, 2, 'tm_fbbox.42', 'footer_top', 1),
(712, 5, 'tm_fbbox.42', 'footer_top', 1),
(717, 4, 'olark.50', 'footer_top', 1),
(718, 4, 'tm_fbbox.42', 'footer_top', 1),
(722, 8, 'tm_fbbox.42', 'footer_top', 1),
(725, 12, 'olark.50', 'footer_top', 1),
(730, 7, 'tm_fbbox.42', 'footer_top', 1),
(734, 3, 'olark.50', 'footer_top', 1),
(735, 3, 'tm_fbbox.42', 'footer_top', 1),
(742, 10, 'affiliate', 'column_left', 1),
(740, 10, 'bestseller.43', 'column_left', 2),
(743, 10, 'tm_fbbox.42', 'footer_top', 1),
(747, 6, 'tm_fbbox.42', 'footer_top', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=204 ;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(203, 6, 0, 'account/%'),
(202, 10, 0, 'affiliate/%'),
(200, 3, 0, 'product/category'),
(188, 1, 0, 'common/home'),
(192, 2, 0, 'product/product'),
(194, 11, 0, 'information/information'),
(199, 7, 0, 'checkout/%'),
(196, 8, 0, 'information/contact'),
(190, 9, 0, 'information/sitemap'),
(195, 4, 0, ''),
(193, 5, 0, 'product/manufacturer'),
(198, 12, 0, 'product/compare'),
(191, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
CREATE TABLE IF NOT EXISTS `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(33, 'banners', 'banner', 'a:5:{s:4:"name";s:7:"banners";s:9:"banner_id";s:2:"14";s:5:"width";s:3:"370";s:6:"height";s:3:"303";s:6:"status";s:1:"1";}'),
(28, 'Featured  Aside', 'featured', 'a:6:{s:4:"name";s:15:"Featured  Aside";s:7:"product";a:8:{i:0;s:2:"43";i:1;s:2:"40";i:2;s:2:"30";i:3;s:2:"42";i:4;s:2:"33";i:5;s:2:"46";i:6;s:2:"32";i:7;s:2:"28";}s:5:"limit";s:1:"1";s:5:"width";s:3:"210";s:6:"height";s:3:"195";s:6:"status";s:1:"1";}'),
(51, 'Featured Home', 'featured', 'a:6:{s:4:"name";s:13:"Featured Home";s:7:"product";a:5:{i:0;s:2:"35";i:1;s:2:"33";i:2;s:2:"28";i:3;s:2:"47";i:4;s:2:"30";}s:5:"limit";s:1:"4";s:5:"width";s:3:"210";s:6:"height";s:3:"195";s:6:"status";s:1:"1";}'),
(46, 'Tm Slideshow', 'tm_slideshow', 'a:5:{s:4:"name";s:12:"Tm Slideshow";s:9:"banner_id";s:2:"15";s:5:"width";s:3:"868";s:6:"height";s:3:"473";s:6:"status";s:1:"1";}'),
(50, 'Olark Chat', 'olark', 'a:4:{s:4:"name";s:10:"Olark Chat";s:13:"olark_version";s:5:"2.0.0";s:13:"olark_site_id";s:16:"7830-582-10-3714";s:6:"status";s:1:"1";}'),
(42, 'Facebook', 'tm_fbbox', 'a:10:{s:4:"name";s:8:"Facebook";s:8:"page_url";s:40:"https://www.facebook.com/TemplateMonster";s:6:"app_id";s:15:"734741803247761";s:13:"show_facepile";s:4:"true";s:2:"bg";s:5:"false";s:10:"show_posts";s:4:"true";s:5:"width";s:3:"310";s:6:"height";s:3:"199";s:8:"language";s:5:"en_US";s:6:"status";s:1:"1";}'),
(43, 'Bestsellers Aside', 'bestseller', 'a:5:{s:4:"name";s:17:"Bestsellers Aside";s:5:"limit";s:1:"1";s:5:"width";s:3:"210";s:6:"height";s:3:"195";s:6:"status";s:1:"1";}'),
(48, 'Specials Home', 'special', 'a:5:{s:4:"name";s:13:"Specials Home";s:5:"limit";s:1:"4";s:5:"width";s:3:"210";s:6:"height";s:3:"195";s:6:"status";s:1:"1";}'),
(70, 'instagram', 'tm_instagram', 'a:8:{s:4:"name";s:9:"instagram";s:3:"get";s:6:"tagged";s:8:"tag_name";s:11:"testkitchen";s:8:"clientid";s:32:"0e40054741ff45c3a2396276e0c70174";s:7:"user_id";s:0:"";s:11:"accesstoken";s:0:"";s:5:"limit";s:1:"3";s:6:"status";s:1:"1";}'),
(71, 'module-tabs', 'tm_module_tab', 'a:10:{s:4:"name";s:11:"module-tabs";s:7:"special";s:1:"1";s:10:"bestseller";s:1:"1";s:6:"latest";s:1:"0";s:8:"featured";s:1:"0";s:7:"product";a:2:{i:0;s:2:"35";i:1;s:2:"33";}s:5:"limit";s:1:"8";s:5:"width";s:3:"210";s:6:"height";s:3:"195";s:6:"status";s:1:"1";}'),
(72, 'category-menu', 'tm_category_menu', 'a:2:{s:4:"name";s:13:"category-menu";s:6:"status";s:1:"1";}'),
(66, 'BestSellers Home', 'bestseller', 'a:5:{s:4:"name";s:16:"BestSellers Home";s:5:"limit";s:1:"4";s:5:"width";s:3:"210";s:6:"height";s:3:"195";s:6:"status";s:1:"1";}'),
(67, 'Specials Aside', 'special', 'a:5:{s:4:"name";s:14:"Specials Aside";s:5:"limit";s:1:"1";s:5:"width";s:3:"210";s:6:"height";s:3:"195";s:6:"status";s:1:"1";}'),
(68, 'Latest Home', 'latest', 'a:5:{s:4:"name";s:11:"Latest Home";s:5:"limit";s:1:"4";s:5:"width";s:3:"210";s:6:"height";s:3:"195";s:6:"status";s:1:"1";}'),
(69, 'Latest Aside', 'latest', 'a:5:{s:4:"name";s:12:"Latest Aside";s:5:"limit";s:1:"1";s:5:"width";s:3:"210";s:6:"height";s:3:"195";s:6:"status";s:1:"1";}'),
(74, 'Newsletter_popup', 'tm_newsletter_popup', 'a:7:{s:4:"name";s:16:"Newsletter_popup";s:19:"newsletter_popup_bg";s:0:"";s:25:"newsletter_popup_bg_width";s:3:"473";s:26:"newsletter_popup_bg_height";s:3:"327";s:23:"newsletter_popup_cookie";s:1:"1";s:31:"tm_newsletter_popup_description";a:3:{i:1;a:2:{s:5:"title";s:10:"NEWSLETTER";s:11:"description";s:146:"Sign up for our exclusive email list and be \r\nthe first to know about new products, special \r\noffers, store events and other discount information.";}i:2;a:2:{s:5:"title";s:10:"NEWSLETTER";s:11:"description";s:146:"Sign up for our exclusive email list and be \r\nthe first to know about new products, special \r\noffers, store events and other discount information.";}i:3;a:2:{s:5:"title";s:10:"NEWSLETTER";s:11:"description";s:146:"Sign up for our exclusive email list and be \r\nthe first to know about new products, special \r\noffers, store events and other discount information.";}}s:6:"status";s:1:"1";}');

