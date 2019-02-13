package top.huhuiyu.codebuilder.utils;

import top.huhuiyu.api.beanutil.BaseInfoBean;

/**
 * 类型映射信息
 * 
 * @author 胡辉煜
 */
public class TypeInfo extends BaseInfoBean {

  private static final long serialVersionUID = -6231830719173122941L;

  private String typeName;
  private String mappingName;

  public TypeInfo() {
  }

  public TypeInfo(String typeName, String mappingName) {
    this.typeName = typeName;
    this.mappingName = mappingName;
  }

  public String getTypeName() {
    return typeName;
  }

  public void setTypeName(String typeName) {
    this.typeName = typeName;
  }

  public String getMappingName() {
    return mappingName;
  }

  public void setMappingName(String mappingName) {
    this.mappingName = mappingName;
  }

}
