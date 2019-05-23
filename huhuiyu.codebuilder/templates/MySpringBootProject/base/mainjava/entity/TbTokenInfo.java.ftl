package ${builderUtil.getSubPackage("entity")};

import java.util.Date;
import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.utils.mybase.BaseEntity;

/**
 * TbTokenInfo表
 * 
 * @author ${baseInfo.author}
 *
 */
public class TbTokenInfo extends BaseEntity {

  private static final long serialVersionUID = ${builderUtil.serialVersionUID};
  @ApiParam(hidden = true)
  private String token;
  @ApiParam(hidden = true)
  private String infoKey;
  @ApiParam(hidden = true)
  private String info;
  @ApiParam(hidden = true)
  private Date lastupdate;

  public TbTokenInfo() {
  }

  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }

  public String getInfoKey() {
    return infoKey;
  }

  public void setInfoKey(String infoKey) {
    this.infoKey = infoKey;
  }

  public String getInfo() {
    return info;
  }

  public void setInfo(String info) {
    this.info = info;
  }

  public Date getLastupdate() {
    return lastupdate;
  }

  public void setLastupdate(Date lastupdate) {
    this.lastupdate = lastupdate;
  }

}
