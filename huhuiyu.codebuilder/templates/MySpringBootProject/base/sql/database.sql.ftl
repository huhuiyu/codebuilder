use information_schema;
drop database if exists ${baseInfo.projectName};
create database ${baseInfo.projectName} default charset utf8mb4 collate utf8mb4_general_ci;
use ${baseInfo.projectName};

create table TbConfig
(
  configKey varchar(50) primary key comment '配置键值，主键',
  configValue varchar(2000) comment '配置值',
  lastupdate timestamp comment '最后更新时间'
)comment '系统配置表';

create table TbToken
(
  token varchar(50) primary key comment '令牌值，自然主键',
  lastupdate timestamp comment '令牌环最后更新时间'
)comment 'token追踪表';

create table TbTokenInfo
(
  token varchar(50) comment '令牌',
  infoKey varchar(50) comment '令牌信息key值',
  info varchar(2000) comment '令牌信息值',
  lastupdate timestamp comment '令牌信息最后更新时间',
  constraint pkTbTokenInfo primary key(token,infoKey)
)comment 'token附加信息表';

create table TbAdmin
(
  aid integer auto_increment primary key not null comment '主键',
  username varchar(20) unique not null comment '登录用户名',
  password varchar(50) not null comment '登录密码',
  salt varchar(20) not null comment '密码盐',
  nickname varchar(50) not null comment '昵称',
  enable enum('y','n') default 'y' not null comment '是否启用',
  lastupdate timestamp on update now() default now() not null comment '最后更新时间'
)comment '管理员信息表';

/* 系统配置数据 */
/* token过期时间配置，值是分钟数 */
insert into TbConfig(configKey,configValue,lastupdate) values('token.timeout','14400',now());

/* 默认管理员数据 */
insert into TbAdmin(username,password,salt,nickname) values('admin','d48dc3be25a60dafc4db503fbc36d397','JX1XRO','内置管理员');
