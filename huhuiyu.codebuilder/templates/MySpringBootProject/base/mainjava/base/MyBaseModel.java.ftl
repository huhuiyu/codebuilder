package ${builderUtil.getSubPackage("base")};

import top.huhuiyu.api.utils.mybase.BaseModel;
import ${builderUtil.getSubPackage("entity")}.TbToken;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;

/**
 * model层基类
 * 
 * @author ${baseInfo.author}
 *
 */
public class MyBaseModel extends BaseModel {
  private static final long serialVersionUID = ${builderUtil.serialVersionUID};
  
  public MyBaseModel() {
  }

  /**
   * 获取token的委托方法
   * 
   * @return TbToken信息
   */
  public TbToken makeTbToken() {
    TbToken tbToken = new TbToken();
    tbToken.setToken(getToken());
    return tbToken;
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

}
