package ${builderUtil.getSubPackage("model")};

import ${builderUtil.getSubPackage("base")}.MyBaseModel;

/**
 * 首页model层
 * 
 * @author ${baseInfo.author}
 *
 */
public class IndexModel extends MyBaseModel {

  private static final long serialVersionUID = ${builderUtil.serialVersionUID};
  private String echo;

  public IndexModel() {
  }

  public String getEcho() {
    return echo;
  }

  public void setEcho(String echo) {
    this.echo = echo;
  }

}
