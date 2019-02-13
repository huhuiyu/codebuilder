package top.huhuiyu.codebuilder.utils;

import top.huhuiyu.api.beanutil.BaseInfoBean;

/**
 * 模板路径信息
 * 
 * @author 胡辉煜
 */
public class TemplatePathInfo extends BaseInfoBean {
  private static final long serialVersionUID = 7345245918544334068L;
  private String            path;
  private String            name;

  public TemplatePathInfo() {
  }

  public String getPath() {
    return path;
  }

  public void setPath(String path) {
    this.path = path;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}
