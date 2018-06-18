drop database if exists blog;
create database blog default character set utf8;

use blog;

create table if not exists admin_log(
  id int(11) not null auto_increment,
  username varchar(50) not null ,
  password varchar(32) not null ,
  primary key (id),
  unique key (username)
)engine=MyISAM default charset utf8 auto_increment=1;

create table if not exists admin_login_log(
  id int(11) not null auto_increment comment '日志Id',
  admin_id int(11) not null comment '管理员Id',
  ip varchar(30) default null comment '登录Ip',
  date timestamp null default null comment '登录时间',
  primary key (id)
)engine=MyISAM default charset utf8 auto_increment=2;

create table if not exists article(
  id int(11) not null auto_increment,
  title varchar(50) not null comment '标题',
  keywords varchar(150) not null comment '关键字',
  describle varchar(500) not null comment '描述',
  photo varchar(500) default null comment '图片地址',
  content text not null comment '内容',
  click int(9) not null default '0' comment '点击量',
  time timestamp not null default current_timestamp on update current_timestamp comment '发布时间',
  catalog_id int(9) not null,
  primary key (id)
)engine=MyISAM default charset utf8 auto_increment=1;

create table if not exists catalog(
  id int(9) not null auto_increment,
  name varchar(30) not null comment '栏目名称',
  describle text not null comment '栏目描述',
  keywords varchar(150) not null comment '栏目关键字',
  type tinyint(1) not null default '0' comment '栏目类型 0:列表;1:留言',
  primary key (id)
)engine=MyISAM default charset utf8 auto_increment=1;

create table if not exists comment(
  id int(9) not null auto_increment comment '评论Id',
  article_id int(11) not null comment '文章Id',
  content text not null comment '评论类容',
  date timestamp not null default current_timestamp on update current_timestamp comment '评论日期',
  name varchar(11) not null comment '评论人姓名',
  email varchar(30) not null comment '评论人邮箱',
  primary key (id)
)engine=MyISAM default charset utf8 auto_increment=1;

insert admin_log values (1,"jack",123456);
insert admin_log values (null,"mike",123);