package ${builderUtil.getSubPackage("service")};

import java.util.Date;
import ${builderUtil.getSubPackage("entity")}.TbToken;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;
import ${builderUtil.getSubPackage("model")}.UtilModel;

/**
 * 工具类服务
 * 
 * @author ${baseInfo.author}
 *
 */
public interface UtilService {

  /**
   * -生成图片校验码
   * 
   * @param model 页面数据
   * @return 图片校验码
   * @throws Exception 处理发生异常
   */
  String makeImageCode(UtilModel model) throws Exception;

  /**
   * 校验图片校验码是否正确，服务器端的图片校验码只能使用一次
   * 
   * @param tokenInfo 带图片校验码信息的TbTokenInfo
   * @return 图片校验码是否正确
   * @throws Exception 处理发生异常
   */
  boolean checkImageCode(TbTokenInfo tokenInfo) throws Exception;

  /**
   * 检查token是否存在，不存在就返回新的
   * 
   * @param token token信息
   * @return token是否存在
   * @throws Exception 处理发生异常
   */
  TbToken checkToken(TbToken token) throws Exception;

  /**
   * 删除所有过期token
   * 
   * @return 删除所有过期token的结果
   * @throws Exception 处理发生异常
   */
  int deleteTokens() throws Exception;
  
  /**
   * 查询数据库当前时间
   * 
   * @return 数据库当前时间
   * @throws Exception
   *                   处理发生异常
   */
  Date queryNow() throws Exception;
}
