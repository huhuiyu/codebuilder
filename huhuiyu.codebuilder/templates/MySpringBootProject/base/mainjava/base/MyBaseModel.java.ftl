package ${builderUtil.getSubPackage("base")};

import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.utils.mybase.BaseEntity;
import ${builderUtil.getSubPackage("entity")}.TbAdmin;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;

/**
 * model层基类
 * 
 * @author ${baseInfo.author}
 */
public class MyBaseModel extends BaseEntity {
  private static final long serialVersionUID = ${builderUtil.serialVersionUID};
  @ApiParam(hidden = true)
  private String            token;
  @ApiParam(hidden = true)
  private String            imageCode;
  private TbAdmin           loginAdmin;
  
  public MyBaseModel() {
  }

  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }

  /**
   * 获取tokeninfo的委托方法
   * 
   * @return TbTokenInfo信息
   */
  public TbTokenInfo makeTbTokenInfo() {
    TbTokenInfo tokenInfo = new TbTokenInfo();
    tokenInfo.setToken(getToken());
    return tokenInfo;
  }

  public TbAdmin getLoginAdmin() {
    return loginAdmin;
  }

  public void setLoginAdmin(TbAdmin loginAdmin) {
    this.loginAdmin = loginAdmin;
  }

  public String getImageCode() {
    return imageCode;
  }

  public void setImageCode(String imageCode) {
    this.imageCode = imageCode;
  }
}
