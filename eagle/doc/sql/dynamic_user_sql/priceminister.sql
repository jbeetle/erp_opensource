CREATE TABLE IF NOT EXISTS `priceminister_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseid` varchar(255) NOT NULL COMMENT 'order_no',
  `order_status` varchar(100) DEFAULT NULL COMMENT 'new / current',
  `purchasedate` varchar(100) DEFAULT NULL,
  `shippingtype` varchar(100) DEFAULT NULL COMMENT 'Y/N',
  `isfullrsl` varchar(10) DEFAULT NULL,
  `purchasebuyerlogin` varchar(255) DEFAULT NULL,
  `purchasebuyeremail` varchar(500) DEFAULT NULL,
  `deliveryaddress_civility` varchar(255) DEFAULT NULL,
  `deliveryaddress_lastname` varchar(255) DEFAULT NULL,
  `deliveryaddress_firstname` varchar(255) DEFAULT NULL,
  `deliveryaddress_address1` varchar(500) DEFAULT NULL,
  `deliveryaddress_address2` varchar(500) DEFAULT NULL,
  `deliveryaddress_zipcode` varchar(100) DEFAULT NULL,
  `deliveryaddress_city` varchar(255) DEFAULT NULL,
  `deliveryaddress_country` varchar(255) DEFAULT NULL,
  `deliveryaddress_countryalpha2` varchar(255) DEFAULT NULL,
  `deliveryaddress_phonenumber1` varchar(100) DEFAULT NULL,
  `deliveryaddress_phonenumber2` varchar(100) DEFAULT NULL,
  `seller_id` varchar(100) DEFAULT NULL,
  `seller_login` varchar(255) DEFAULT NULL COMMENT '卖家店铺',
  `create` datetime DEFAULT NULL,
  `update` datetime DEFAULT NULL,
  `addi_info` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchaseid` (`purchaseid`,`seller_login`),
  KEY `sellerid` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `priceminister_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseid` varchar(255) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `advertid` varchar(255) NOT NULL,
  `advertprice_amount` decimal(10,2) DEFAULT NULL,
  `advertprice_currency` varchar(10) DEFAULT NULL,
  `itemid` varchar(100) NOT NULL,
  `headline` text,
  `itemstatus` varchar(100) DEFAULT NULL,
  `itemstatus_of_get_item_infos` varchar(100) DEFAULT NULL COMMENT 'GetItemsInfos接口的item status',
  `itemstatus_of_get_biling_information` varchar(100) DEFAULT NULL COMMENT 'GetBilingInformation接口的item status',
  `ispreorder` varchar(10) DEFAULT NULL,
  `isnego` varchar(10) DEFAULT NULL,
  `negotiationcomment` text,
  `price_amount` decimal(10,2) DEFAULT NULL,
  `price_currency` varchar(10) DEFAULT NULL,
  `isrsl` varchar(10) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  `ean` varchar(100) DEFAULT NULL,
  `paymentstatus` varchar(100) DEFAULT NULL,
  `sellerscore` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_no` (`purchaseid`),
  KEY `sku` (`sku`),
  KEY `item_id` (`itemid`),
  KEY `ean` (`ean`),
  KEY `advert_id` (`advertid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `priceminister_product_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` varchar(30) DEFAULT NULL COMMENT 'PM内部prid id,订单获取不到的',
  `seller_id` varchar(255) NOT NULL COMMENT 'prod对应的卖家账号',
  `alias` varchar(255) DEFAULT NULL,
  `headline` text COMMENT '产品名',
  `caption` varchar(255) DEFAULT NULL COMMENT 'brand?',
  `topic` varchar(255) DEFAULT NULL,
  `offercounts` text COMMENT 'json',
  `bestprices` text COMMENT 'json',
  `url` text COMMENT '商品url',
  `image` text COMMENT '商品img',
  `barcode` varchar(100) DEFAULT NULL COMMENT 'EAN',
  `partnumber` varchar(255) DEFAULT NULL COMMENT '卖家sku',
  `reviews` text,
  `breadcrumbselements` text COMMENT 'json,搜索信息',
  PRIMARY KEY (`id`),
  KEY `seller_id & ean` (`seller_id`,`barcode`),
  KEY `seller_id & sku` (`seller_id`,`partnumber`),
  KEY `seller_id & product_id` (`seller_id`,`productid`),
  KEY `productid` (`productid`),
  KEY `barcode` (`barcode`),
  KEY `sku` (`partnumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

