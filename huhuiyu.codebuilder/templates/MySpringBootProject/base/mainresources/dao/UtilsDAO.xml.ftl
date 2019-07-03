<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- 工具类 mapper -->
<mapper namespace="${builderUtil.getSubPackage("dao")}.UtilsDAO">
  <!-- 查询数据库当前时间 -->
  <select id="queryTime" resultType="java.util.Date">
    select now()
  </select>

  <!-- 查询数据库当前时间戳 -->
  <select id="queryTimestamp" resultType="java.lang.Long">
    select unix_timestamp()
  </select>

  <!-- 查询token信息 -->
  <select id="queryTokenInfo" parameterType="TbTokenInfo" resultType="TbTokenInfo">
    select token,info_key 'infoKey',info,lastupdate from tb_token_info
    where token=${r'#'}{token} and info_key=${r'#'}{infoKey}
  </select>

  <!-- 添加token信息 -->
  <insert id="addTokenInfo" parameterType="TbTokenInfo">
    insert into tb_token_info(token,info_key,info) values(${r'#'}{token},${r'#'}{infoKey},${r'#'}{info})
  </insert>

  <!-- 更新token信息 -->
  <update id="updateTokenInfo" parameterType="TbTokenInfo">
    update tb_token_info set info=${r'#'}{info},lastupdate=now() where token=${r'#'}{token} and info_key=${r'#'}{infoKey}
  </update>

  <!-- 删除token信息 -->
  <update id="deleteTokenInfo" parameterType="TbTokenInfo">
    delete from tb_token_info where token=${r'#'}{token} and info_key=${r'#'}{infoKey}
  </update>

  <!-- 删除所有过期的TokenInfo -->
  <delete id="deleteTokenInfos">
    delete from tb_token_info
    where timestampdiff(minute,lastupdate,now()) &gt; ( select config_value from tb_config where config_key='token_timeout' )
  </delete>

  <!-- 查询系统配置信息 -->
  <select id="queryConfig" parameterType="TbConfig" resultType="TbConfig">
    select cid,config_key 'configKey',config_value 'configValue',lastupdate from tb_config
    where config_key=${r'#'}{configKey}
  </select>

  <!-- 管理员登陆 -->
  <select id="queryAdminByName" parameterType="TbAdmin" resultType="TbAdmin">
    select aid,username,password,salt,nickname,enable,lastupdate from tb_admin
    where username=${r'#'}{username}
  </select>

  <!-- 查询token对应的管理员信息 -->
  <select id="queryAdminByToken" parameterType="TbTokenInfo" resultType="TbAdmin">
    select aid,username,password,salt,nickname,enable,lastupdate from tb_admin
    where aid=(select info from tb_token_info where token=${r'#'}{token} and info_Key=${r'#'}{infoKey})
  </select>
</mapper>