package ${builderUtil.getSubPackage("entity")};

import java.util.Date;

import ${builderUtil.getSubPackage("base")}.BaseEntity;

/**
 * TbToken表
 * 
 * @author ${baseInfo.author}
 *
 */
public class TbToken extends BaseEntity {
  private static final long serialVersionUID = ${builderUtil.serialVersionUID};
  private String token;
  private Integer uid;
  private Date lastupdate;

  public TbToken() {
  }

  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }

  public Integer getUid() {
    return uid;
  }

  public void setUid(Integer uid) {
    this.uid = uid;
  }

  public Date getLastupdate() {
    return lastupdate;
  }

  public void setLastupdate(Date lastupdate) {
    this.lastupdate = lastupdate;
  }

}
