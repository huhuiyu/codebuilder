package ${builderUtil.getSubPackage("entity")};

import java.util.Date;
import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.utils.mybase.BaseEntity;

/**
 * TbConfig表
 * 
 * @author ${baseInfo.author}
 *
 */
public class TbConfig extends BaseEntity {

  private static final long serialVersionUID = ${builderUtil.serialVersionUID};
  @ApiParam(hidden = true)
  private String configKey;
  @ApiParam(hidden = true)
  private String configValue;
  @ApiParam(hidden = true)
  private Date lastupdate;

  public TbConfig() {
  }

  public String getConfigKey() {
    return configKey;
  }

  public void setConfigKey(String configKey) {
    this.configKey = configKey;
  }

  public String getConfigValue() {
    return configValue;
  }

  public void setConfigValue(String configValue) {
    this.configValue = configValue;
  }

  public Date getLastupdate() {
    return lastupdate;
  }

  public void setLastupdate(Date lastupdate) {
    this.lastupdate = lastupdate;
  }

}
