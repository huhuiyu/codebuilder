package ${builderUtil.getSubPackage("model")};

import ${builderUtil.getSubPackage("base")}.MyBasePageModel;
import ${builderUtil.getSubPackage("entity")}.${builderUtil.getClassName(tableInfo)};

/**
 * ${builderUtil.getClassName(tableInfo)}的Model
 * 
 * @author ${baseInfo.author}
 *
 */
public class ${builderUtil.getClassName(tableInfo)}Model extends MyBasePageModel {

  private static final long serialVersionUID = ${builderUtil.serialVersionUID};

  private ${builderUtil.getClassName(tableInfo)} ${builderUtil.getTableFieldName(tableInfo)}=new ${builderUtil.getClassName(tableInfo)}();
  
  public ${builderUtil.getClassName(tableInfo)}Model() {
  }

  public ${builderUtil.getClassName(tableInfo)} ${builderUtil.getTableGetter(tableInfo)}() {
    return ${builderUtil.getTableFieldName(tableInfo)};
  }

  public void ${builderUtil.getTableSetter(tableInfo)}(${builderUtil.getClassName(tableInfo)} ${builderUtil.getTableFieldName(tableInfo)}) {
    this.${builderUtil.getTableFieldName(tableInfo)} = ${builderUtil.getTableFieldName(tableInfo)};
  }
  
  /*
   * 所有参数模板
   <#list tableInfo.columnInfos as column>
   * @ApiImplicitParam(name = "${builderUtil.getTableFieldName(tableInfo)}.${builderUtil.getColFieldName(column)}", value = "描述：${builderUtil.getColFieldName(column)}", paramType = "query")
   </#list>
   */

}
