package top.huhuiyu.codebuilder.utils;

import top.huhuiyu.api.beanutil.BaseInfoBean;
import top.huhuiyu.api.utils.StringUtils;

/**
 * 模板信息
 * 
 * @author 胡辉煜
 */
public class TemplateInfo extends BaseInfoBean {

  private static final long serialVersionUID = -8079563680002142344L;

  /**
   * 模板路径信息
   */
  private String templatePath;

  /**
   * 输出路径，可以省略，默认在输出项目根目录
   */
  private String  outpath;
  /**
   * 如果不是输出到package中的文件可以省略,输出到项目基本包需要给""
   */
  private String  subpackage;
  /**
   * 是否是通过表格输出模板信息
   */
  private boolean tablesMode  = false;
  /**
   * 名称是否不需要使用class模式
   */
  private boolean notClass    = false;
  /**
   * 名称后缀（tablesMode才需要）
   */
  private String  namePostfix = "";

  public TemplateInfo() {
  }

  public String getTemplatePath() {
    return templatePath;
  }

  public void setTemplatePath(String templatePath) {
    this.templatePath = templatePath;
  }

  public String getSubpackage() {
    return subpackage;
  }

  public void setSubpackage(String subpackage) {
    this.subpackage = subpackage;
  }

  public String getOutpath() {
    return StringUtils.trim(outpath);
  }

  public void setOutpath(String outpath) {
    this.outpath = outpath;
  }

  public boolean isTablesMode() {
    return tablesMode;
  }

  public void setTablesMode(boolean tablesMode) {
    this.tablesMode = tablesMode;
  }

  public boolean isNotClass() {
    return notClass;
  }

  public void setNotClass(boolean notClass) {
    this.notClass = notClass;
  }

  public String getNamePostfix() {
    return namePostfix;
  }

  public void setNamePostfix(String namePostfix) {
    this.namePostfix = namePostfix;
  }
}
