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
  <!-- 查询token（且要有效） -->
  <select id="queryToken" parameterType="TbToken" resultType="TbToken">
    select token,lastupdate from TbToken
    where token=${r'#'}{token} and timestampdiff(minute,lastupdate,now())
    &lt;=
    (select configValue from TbConfig where configKey='token.timeout')
  </select>

  <!-- 添加token -->
  <insert id="addToken" parameterType="TbToken">
    insert into TbToken(token,lastupdate) values(${r'#'}{token},now())
  </insert>

  <!-- 更新token时间 -->
  <update id="updateToken" parameterType="TbToken">
    update TbToken set lastupdate=now() where token=${r'#'}{token}
  </update>

  <!-- 删除所有过期token -->
  <delete id="deleteTokens">
    delete from TbToken where timestampdiff(minute,lastupdate,now())
    &gt;
    (select configValue from TbConfig where configKey='token.timeout')
  </delete>

  <!-- 删除所有过期的TokenInfo -->
  <delete id="deleteTokenInfos">
    delete from TbTokenInfo
    where token in
    (
    select token from TbToken
    where timestampdiff(minute,lastupdate,now())
    &gt;
    (
    select configValue from TbConfig
    where configKey='token.timeout'
    )
    )
  </delete>

  <!-- 图片校验码相关 -->
  <insert id="addImageCode" parameterType="TbTokenInfo">
    insert into TbTokenInfo(token,infoKey,info,lastupdate)
    values(${r'#'}{token},'imagecode',${r'#'}{info},now())
  </insert>

  <select id="queryImageCode" parameterType="TbTokenInfo" resultType="TbTokenInfo">
    select token,infoKey,info,lastupdate from TbTokenInfo
    where token=${r'#'}{token} and infoKey='imagecode'
  </select>

  <update id="updateImageCode" parameterType="TbTokenInfo">
    update TbTokenInfo set info=${r'#'}{info},lastupdate=now()
    where token=${r'#'}{token} and infoKey='imagecode'
  </update>

  <delete id="deleteImageCode" parameterType="TbTokenInfo">
    delete from TbTokenInfo where token=${r'#'}{token} and infoKey='imagecode'
  </delete>
  
  <!-- 管理员相关 -->
  <insert id="addAdmin" parameterType="TbTokenInfo">
    insert into TbTokenInfo(token,infoKey,info,lastupdate)
    values(${r'#'}{token},'loginAdmin',${r'#'}{info},now())
  </insert>

  <select id="queryAdmin" parameterType="TbTokenInfo" resultType="TbTokenInfo">
    select token,infoKey,info,lastupdate from TbTokenInfo
    where token=${r'#'}{token} and infoKey='loginAdmin'
  </select>

  <update id="updateAdmin" parameterType="TbTokenInfo">
    update TbTokenInfo set info=${r'#'}{info},lastupdate=now()
    where token=${r'#'}{token} and infoKey='loginAdmin'
  </update>

  <delete id="deleteAdmin" parameterType="TbTokenInfo">
    delete from TbTokenInfo where token=${r'#'}{token} and infoKey='loginAdmin'
  </delete>

  <select id="queryAdminByName" parameterType="TbAdmin" resultType="TbAdmin">
    select aid,username,password,salt,nickname,enable,lastupdate from TbAdmin
    where username=${r'#'}{username}
  </select>

  <select id="queryAdminByToken" parameterType="TbTokenInfo" resultType="TbAdmin">
    select aid,username,password,salt,nickname,enable,lastupdate from TbAdmin
    where aid=(select info from TbTokenInfo where token=${r'#'}{token} and infoKey='loginAdmin')
  </select>
</mapper>