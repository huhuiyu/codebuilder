<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- 测试用 mapper -->
<mapper namespace="${builderUtil.getSubPackage("dao")}.TestDAO">
  <!-- 测试分页查询TbToken信息 -->
  <select id="queryAllToken" resultType="TbToken">
    select token,lastupdate from TbToken
  </select>
  <select id="queryAllToken_COUNT" resultType="int">
    select count(*) from TbToken
  </select>
</mapper>