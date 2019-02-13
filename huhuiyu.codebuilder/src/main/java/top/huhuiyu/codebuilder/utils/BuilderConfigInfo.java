package top.huhuiyu.codebuilder.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import top.huhuiyu.api.beanutil.BaseInfoBean;

/**
 * 代码生成工具配置信息类
 * 
 * @author 胡辉煜
 */
public class BuilderConfigInfo extends BaseInfoBean {
  private static final long  serialVersionUID = 2089466832780219001L;
  /**
   * 项目名称
   */
  private String             projectName;
  /**
   * 作者名称
   */
  private String             author;
  /**
   * 基础包名称
   */
  private String             packageName;
  /**
   * 输出路径
   */
  private String             outputDir;
  /**
   * 是否清除输出目录
   */
  private boolean            clearDir         = false;
  private List<TemplateInfo> templateInfos;

  public BuilderConfigInfo() {
  }

  /**
   * 获取模板信息map映射，key为templatePath
   * 
   * @return 模板信息map
   */
  public Map<String, TemplateInfo> getInfoMap() {
    Map<String, TemplateInfo> map = new HashMap<>(20);
    for (TemplateInfo templateInfo : templateInfos) {
      map.put(templateInfo.getTemplatePath(), templateInfo);
    }
    return map;
  }

  public String getProjectName() {
    return projectName;
  }

  public void setProjectName(String projectName) {
    this.projectName = projectName;
  }

  public String getOutputDir() {
    return outputDir;
  }

  public void setOutputDir(String outputDir) {
    this.outputDir = outputDir;
  }

  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }

  public String getPackageName() {
    return packageName;
  }

  public void setPackageName(String packageName) {
    this.packageName = packageName;
  }

  public List<TemplateInfo> getTemplateInfos() {
    return templateInfos;
  }

  public void setTemplateInfos(List<TemplateInfo> templateInfos) {
    this.templateInfos = templateInfos;
  }

  public boolean isClearDir() {
    return clearDir;
  }

  public void setClearDir(boolean clearDir) {
    this.clearDir = clearDir;
  }

}
