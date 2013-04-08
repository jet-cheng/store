--码表
drop table if exists `code_table`;
create table `code_table`(
	`id` integer not null auto_increment,
	`tp` varchar(32) not null,
	`cd` varchar(32) not null,
	`desc` varchar(100) not null,
	`parent` integer,
	primary key(`id`),
	foreign key(`parent`) references `code_table`(`id`)
);
insert into `code_table`(`tp`,`cd`,`desc`,`parent`) values ('001','001-001','系统管理员',null);

--系统设置表
drop table if exists `sys_conf`;
create table `sys_conf`(
	`conf_code` varchar(32) not null,
	`conf_desc` varchar(100) not null,
	`integer_val` integer,
	`double_val` double(30,10),
	`string_val` varchar(100),
	`date_val` date,
	`time_val` timestamp,
	primary key(`conf_code`)
);
insert into `sys_conf` value ('DEFAULT_CMDT_SOCRE_COEF','默认商品积分系数',null,1.5,null,null,null);

--用户等级表
drop table if exists `user_level`;
create table `user_level`(
	`id` integer not null auto_increment,
	`prom_std` double(17,2) not null,
	`prc_pref` double(17,2) not null,
	primary key(`id`)
);

--用户表
drop table if exists `user`;
create table `user`(
	`id` integer not null auto_increment,
	`username` varchar(32) not null,
	`password` varchar(32) not null,
	`email` varchar(100) not null,
	`score` double(17,2) not null,
	primary key(`id`),
	unique key(`username`)
);

--管理员表
drop table if exists `admin`;
create table `admin`(
	`id` integer not null auto_increment,
	`login_id` varchar(32) not null,
	`name` varchar(32) not null,
	`password` varchar(32) not null,
	`role` varchar(200),
	primary key(`id`)
);
insert into `admin` values (1,'admin','admin','c3284d0f94606de1fd2af172aba15bf3','');

--商品类别
drop table if exists `cmdt_type`;
create table `cmdt_type`(
	`id` integer not null auto_increment,
	`name` varchar(32) not null,
	primary key(`id`)
);

--商品表
drop table if exists `commodity`;
create table `commodity`(
	`id` integer not null auto_increment,
	`cmdt_name` varchar(32) not null,
	`cmdt_desc` longtext not null,
	`cost_prc` double(17,2) not null,
	`rtl_prc` double(17,2) not null,
	`vld_f` varchar(1) not null,
	`cmdt_type` integer not null,
	primary key(`id`),
	foreign key(`cmdt_type`) references `cmdt_type`(`id`)
);

--订单表
drop table if exists `order`;
create table `order`(
	`id` integer not null auto_increment,
	`user_id` integer not null,
	`status` varchar(32) not null,
	primary key(`id`)
);

--购物车表
drop table if exists `cart`;
create table `cart`(
	`id` integer not null auto_increment,
	`order_id` integer not null,
	`commodity_id` integer not null,
	`buy_nbr` integer not null,
	`rtl_prc` decimal(16,2) not null,
	`bargn_prc` decimal(16,2) not null,
	primary key(`id`),
	foreign key(`order_id`) references `order`(`id`),
	foreign key(`commodity_id`) references `commodity`(`id`)
);

--评论
drop table if exists `comment`;
create table `comment`(
	`id` integer not null auto_increment,
	`user_id` integer not null,
	`comment` varchar(200),
	primary key(`id`),
	foreign key(`user_id`) references `user`(`id`)
);

--商品页面Q&A
drop table if exists `question`;
create table `question`(
	`id` integer not null auto_increment,
	`commodity_id` integer not null,
	`user_id` integer not null,
	`question` varchar(200) not null,
	`answer` varchar(200),
	`admin_id` integer,
	primary key(`id`),
	foreign key(`user_id`) references `user`(`id`),
	foreign key(`commodity_id`) references `commodity`(`id`),
	foreign key(`admin_id`) references `admin`(`id`)
);