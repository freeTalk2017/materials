CREATE TABLE IF NOT EXISTS t_User(
	user_id                            varchar(36)          NOT NULL DEFAULT ''                    COMMENT '用户ID',
	name                               varchar(12)          NOT NULL DEFAULT ''                    COMMENT '用户名',
	password                           varchar(16)          NOT NULL DEFAULT ''                    COMMENT '密码',
	phone                              varchar(11)          NOT NULL DEFAULT ''                    COMMENT '手机号',
	role                               tinyint(1) unsigned  NOT NULL DEFAULT 0                     COMMENT '角色',
	register_time                      datetime             NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '注册时间戳',
	PRIMARY KEY (user_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表:';
CREATE TABLE IF NOT EXISTS t_Login(
	user_id                             varchar(36)          NOT NULL DEFAULT ''                    COMMENT '用户ID',
	login_time                          datetime          	 NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '登录时间戳',
	login_IP                            varchar(15)          NOT NULL DEFAULT ''                    COMMENT '登陆IP',
	PRIMARY KEY (user_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登陆记录表:';
CREATE TABLE IF NOT EXISTS t_Commodity(
	cmd_id                              varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品ID',
	cmd_name                            varchar(60)          NOT NULL DEFAULT ''                    COMMENT '商品名称',
	type_ID                             varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品类型ID',
	brand_ID                            varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品品牌ID',
	info                                varchar(50)          NOT NULL DEFAULT ''                    COMMENT '商品简要介绍',
	feature                             varchar(20)          NOT NULL DEFAULT ''                    COMMENT '商品特点',
	size                                varchar(20)          NOT NULL DEFAULT ''                    COMMENT '商品尺寸',
	detail                              varchar(255)         NOT NULL DEFAULT ''                    COMMENT '商品详细介绍',
	PRIMARY KEY (cmd_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表:';
CREATE TABLE IF NOT EXISTS t_CmdURL(
	cmd_id                              varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品ID',
	photo_id                            tinyint(2) unsigned  NOT NULL DEFAULT 0                     COMMENT '图片ID',
	photo_url                           varchar(255)         NOT NULL DEFAULT ''                    COMMENT '图片URL',
	photo_type                          varchar(2)           NOT NULL DEFAULT ''                    COMMENT '图片类型',
	PRIMARY KEY (cmd_id,photo_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片路径表:';
CREATE TABLE IF NOT EXISTS t_Brand(
	brand_id                            varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品品牌ID',
	brand_name                          varchar(20)          NOT NULL DEFAULT ''                    COMMENT '商品品牌名称',
	cmd_id                              varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品ID',
	PRIMARY KEY (brand_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品品牌表:';
CREATE TABLE IF NOT EXISTS t_CmdParam(
	cmd_id                              varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品ID',
	cmd_key                             varchar(20)          NOT NULL DEFAULT ''                    COMMENT '标识',
	cmd_value                           varchar(20)          NOT NULL DEFAULT ''                    COMMENT '值',
	PRIMARY KEY (cmd_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格表:';
CREATE TABLE IF NOT EXISTS t_CmdType(
	type_id                             varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品类型ID',
	type_name                           varchar(20)          NOT NULL DEFAULT ''                    COMMENT '商品类型',
	brand_id                            varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品品牌ID',
	PRIMARY KEY (type_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型表:';
CREATE TABLE IF NOT EXISTS t_Order(
	order_id                            varchar(36)          NOT NULL DEFAULT ''                    COMMENT '订单ID',
	user_id                             varchar(36)          NOT NULL DEFAULT ''                    COMMENT '用户ID',
	contact_id                          varchar(36)          NOT NULL DEFAULT ''                    COMMENT '联系方式ID',
	create_tsp                          datetime             NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '下单时间戳',
	order_status                        varchar(2)           NOT NULL DEFAULT ''                    COMMENT '订单状态',
	distribution                        varchar(20)          NOT NULL DEFAULT ''                    COMMENT '配送方式',
	bill_type                           varchar(20)          NOT NULL DEFAULT ''                    COMMENT '发票类型',
	bill_header                         varchar(30)          NOT NULL DEFAULT ''                    COMMENT '发票抬头',
	bill_detail                         varchar(30)          NOT NULL DEFAULT ''                    COMMENT '发票明细',
	pay_type                            tinyint(1) unsigned  NOT NULL DEFAULT 0                     COMMENT '支付方式',
	pay_status                          tinyint(1) unsigned  NOT NULL DEFAULT 0                     COMMENT '支付状态',
	PRIMARY KEY (order_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表:';
CREATE TABLE IF NOT EXISTS t_OrderInfo(
	order_id                            varchar(36)          NOT NULL DEFAULT ''                    COMMENT '订单ID',
	cmd_id                              varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品ID',
	o_key                                varchar(20)          NOT NULL DEFAULT ''                   COMMENT '标识',
	o_value                              varchar(20)          NOT NULL DEFAULT ''                   COMMENT '值',
	PRIMARY KEY (order_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表:';
CREATE TABLE IF NOT EXISTS t_Contact(
	contact_id                         varchar(36)          NOT NULL DEFAULT ''                   COMMENT '联系方式ID',
	order_id                           varchar(36)          NOT NULL DEFAULT ''                   COMMENT '订单ID',
	contact_address                    varchar(255)         NOT NULL DEFAULT ''                   COMMENT '收货详细地址',
	phone                              varchar(11)          NOT NULL DEFAULT ''                    COMMENT '收货人电话',
	name                               varchar(12)          NOT NULL DEFAULT ''                    COMMENT '收货人姓名',
	province                           varchar(20)          NOT NULL DEFAULT ''                    COMMENT '省',
	city                               varchar(20)          NOT NULL DEFAULT ''                    COMMENT '市',
	district                           varchar(20)          NOT NULL DEFAULT ''                    COMMENT '区',
	street                             varchar(20)          NOT NULL DEFAULT ''                    COMMENT '街道',
	detail                             varchar(60)          NOT NULL DEFAULT ''                    COMMENT '详细地址',
	postcode                           varchar(6)           NOT NULL DEFAULT ''                    COMMENT '邮编',
	top                                tinyint(1) unsigned  NOT NULL DEFAULT 0                     COMMENT '常用地址',
	PRIMARY KEY (contact_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货地址表:';
CREATE TABLE IF NOT EXISTS t_Cart(
	cart_id                             varchar(36)          NOT NULL DEFAULT ''                    COMMENT '购物车ID',
	cmd_id                              varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品ID',
	user_id                             varchar(36)          NOT NULL DEFAULT ''                    COMMENT '用户ID',
	PRIMARY KEY (record_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表:';
CREATE TABLE IF NOT EXISTS t_CartInfo(
	record_id                            varchar(36)          NOT NULL DEFAULT ''                    COMMENT '记录ID',
	c_key                                varchar(20)          NOT NULL DEFAULT ''                   COMMENT '标识',
	c_value                              varchar(20)          NOT NULL DEFAULT ''                   COMMENT '值',
	PRIMARY KEY (record_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车详情表:';
CREATE TABLE IF NOT EXISTS t_CartRecord(
	cart_id                             varchar(36)          NOT NULL DEFAULT ''                    COMMENT '购物车ID',
	record_id                           varchar(36)          NOT NULL DEFAULT ''                    COMMENT '记录ID',
	cmd_id                              varchar(36)          NOT NULL DEFAULT ''                    COMMENT '商品ID',
	quantity                            int              	 NOT NULL DEFAULT 0                     COMMENT '数量',
	PRIMARY KEY (cart_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车附属表:';