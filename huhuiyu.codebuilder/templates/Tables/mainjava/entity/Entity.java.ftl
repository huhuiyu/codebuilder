package ${builderUtil.getSubPackage("entity")};

import ${builderUtil.getSubPackage("base")}.BaseEntity;

/**
 * ${tableInfo.name}表
 * 
 * @author ${baseInfo.author}
 *
 */
public class ${builderUtil.getClassName(tableInfo)} extends BaseEntity {

  private static final long serialVersionUID = ${builderUtil.serialVersionUID};
  
<#list tableInfo.columnInfos as column>
  private ${builderUtil.getColType(column)} ${builderUtil.getColFieldName(column)};
</#list>

  public ${builderUtil.getClassName(tableInfo)}() {
  }
  
<#list tableInfo.columnInfos as column>
  public ${builderUtil.getColType(column)} ${builderUtil.getColGetter(column)}(){
    return ${builderUtil.getColFieldName(column)};
  }

  public void ${builderUtil.getColSetter(column)}(${builderUtil.getColType(column)} ${builderUtil.getColFieldName(column)}){
    this.${builderUtil.getColFieldName(column)}=${builderUtil.getColFieldName(column)};
  }

</#list>
  @Override
  public String toString() {
    return String.format("<#list tableInfo.columnInfos as column><#if column_has_next>${builderUtil.getColFieldName(column)}:%s,</#if><#if !column_has_next>${builderUtil.getColFieldName(column)}:%s</#if></#list>"<#list tableInfo.columnInfos as column>,${builderUtil.getColFieldName(column)}</#list>);
  }
}
