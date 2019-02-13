package ${builderUtil.getSubPackage("base")};

import ${builderUtil.getSubPackage("entity")}.TbToken;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;

/**
 * model层基类
 * 
 * @author ${baseInfo.author}
 *
 */
public abstract class BaseModel extends BaseEntity {
  private static final long serialVersionUID = ${builderUtil.serialVersionUID};
  private String token;

  public BaseModel() {
  }

  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }

  /**
   * 获取token的委托方法
   * 
   * @return TbToken信息
   */
  public TbToken makeTbToken() {
    TbToken tbToken = new TbToken();
    tbToken.setToken(token);
    return tbToken;
  }

  /**
   * 获取tokeninfo的委托方法
   * 
   * @return TbTokenInfo信息
   */
  public TbTokenInfo makeTbTokenInfo() {
    TbTokenInfo tokenInfo = new TbTokenInfo();
    tokenInfo.setToken(token);
    return tokenInfo;
  }

}
