<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${builderUtil.getSubPackage("dao")}.${builderUtil.getClassName(tableInfo)}DAO">
    
  <select id="queryAll" resultType="${builderUtil.getClassName(tableInfo)}">
    select <#list tableInfo.columnInfos as col>${col.name}<#if col_has_next>,</#if></#list> from ${tableInfo.name}
  </select>
  
  <select id="queryAll_COUNT" resultType="int">
    select count(*) from ${tableInfo.name}
  </select>
  
  <select id="queryByKey" parameterType="${builderUtil.getClassName(tableInfo)}" resultType="${builderUtil.getClassName(tableInfo)}">
    select <#list tableInfo.columnInfos as col>${col.name}<#if col_has_next>,</#if></#list> from ${tableInfo.name} 
<#if tableInfo.getPrimaryKeys()?size &gt; 0>
    where <#list tableInfo.getPrimaryKeys() as col><#if col_index &gt; 0> and </#if>${col.name}=${r'#'}{${col.name}}</#list>
<#else>
    没有主键列，请自己补全判断条件！！！
</#if>
  </select>
  
  <insert id="add" parameterType="${builderUtil.getClassName(tableInfo)}">
    insert into ${tableInfo.name}(<#list tableInfo.getNotPrimaryKeys() as col>${col.name}<#if col_has_next>,</#if></#list>)
    values(<#list tableInfo.getNotPrimaryKeys() as col>${r'#'}{${col.name}}<#if col_has_next>,</#if></#list>)
  </insert>
  
  <update id="update" parameterType="${builderUtil.getClassName(tableInfo)}">
    update ${tableInfo.name} set <#list tableInfo.getNotPrimaryKeys() as col>${col.name}=${r'#'}{${col.name}}<#if col_has_next>,</#if></#list>
<#if tableInfo.getPrimaryKeys()?size &gt; 0>
    where <#list tableInfo.getPrimaryKeys() as col><#if col_index &gt; 0> and </#if>${col.name}=${r'#'}{${col.name}}</#list>
<#else>
    没有主键列，请自己补全判断条件！！！
</#if>
  </update>
  
  <delete id="delete" parameterType="${builderUtil.getClassName(tableInfo)}" >
    delete from ${tableInfo.name}
<#if tableInfo.getPrimaryKeys()?size &gt; 0>
    where <#list tableInfo.getPrimaryKeys() as col><#if col_index &gt; 0> and </#if>${col.name}=${r'#'}{${col.name}}</#list>
<#else>
    没有主键列，请自己补全判断条件！！！
</#if>
  </delete>
  
</mapper>
