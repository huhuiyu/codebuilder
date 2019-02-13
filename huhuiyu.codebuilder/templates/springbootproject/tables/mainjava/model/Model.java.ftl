package ${builderUtil.getSubPackage("model")};

import ${builderUtil.getSubPackage("base")}.BasePageModel;
import ${builderUtil.getSubPackage("entity")}.${builderUtil.getClassName(tableInfo)};

/**
 * ${builderUtil.getClassName(tableInfo)}的Model
 * 
 * @author ${baseInfo.author}
 *
 */
public class ${builderUtil.getClassName(tableInfo)}Model extends BasePageModel {

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
  
}
