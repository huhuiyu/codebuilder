use information_schema;
drop database if exists ${baseInfo.projectName};
create database ${baseInfo.projectName} default charset utf8 collate utf8_general_ci;
use ${baseInfo.projectName};

/* 系统配置表 */
create table TbConfig
(
  configKey varchar(50) primary key comment '配置键值，主键',
  configValue varchar(2000) comment '配置值',
  lastupdate timestamp comment '最后更新时间'
);

/* token追踪表 */
create table TbToken
(
  token varchar(50) primary key comment '令牌值，自然主键',
  lastupdate timestamp comment '令牌环最后更新时间'
);

/* token附加信息表 */
create table TbTokenInfo
(
  token varchar(50) comment '令牌',
  infoKey varchar(50) comment '令牌信息key值',
  info varchar(2000) comment '令牌信息值',
  lastupdate timestamp comment '令牌信息最后更新时间',
  constraint pkTbTokenInfo primary key(token,infoKey)
);

/* 系统配置数据 */
/* token过期时间配置，值是分钟数 */
insert into TbConfig(configKey,configValue,lastupdate) values('token.timeout','10',now());

/* 查询 */
select configKey,configValue,lastupdate from TbConfig;
select token,lastupdate from TbToken;
select token,infoKey,info,lastupdate from TbTokenInfo;