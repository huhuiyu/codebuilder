package ${builderUtil.getSubPackage("service")};

import top.huhuiyu.api.utils.mybase.JsonMessage;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;
import ${builderUtil.getSubPackage("model")}.UtilModel;

/**
 * 工具类服务
 * 
 * @author ${baseInfo.author}
 */
public interface UtilService {

 /**
   * token存放的key
   */
  String TOKEN                    = "ip";
  /**
   * 图片校验码存放的key
   */
  String IMAGE_CODE               = "imageCode";
  /**
   * 管理员登陆存放的key
   */
  String LOGIN_ADMIN              = "admin";
  /**
   * 图片校验码干扰线数量配置key
   */
  String CONFIG_IMAGE_CODE_AMOUNT = "image_code_amount";
  /**
   * 图片校验码长度配置key
   */
  String CONFIG_IMAGE_CODE_LENGTH = "image_code_length";

  /**
   * 删除所有过期token
   * 
   * @return 删除所有过期token的结果
   * @throws Exception
   *                   处理发生异常
   */
  int deleteTokens() throws Exception;

  /**
   * 检测token信息，存在就更新时间戳，否则就创建新的
   * 
   * @param token
   *              token信息
   * @return token信息
   * @throws Exception
   *                   处理发生异常
   */
  TbTokenInfo checkToken(TbTokenInfo token) throws Exception;

  /**
   * 创建图片校验码
   * 
   * @param token
   *              token值
   * @return 图片校验码
   * @throws Exception
   *                   处理发生异常
   */
  String makeImageCode(String token) throws Exception;

  /**
   * 检测图片校验码是否正确
   * 
   * @param tokenInfo
   *                  校验参数信息
   * @return 图片校验码是否正确
   * @throws Exception
   *                   处理发生异常
   */
  boolean checkImageCode(TbTokenInfo tokenInfo) throws Exception;

  /**
   * 管理用户登陆
   * 
   * @param model
   *              请求参数
   * @return 用户登陆结果
   * @throws Exception
   *                   处理发生异常
   */
  JsonMessage adminLogin(UtilModel model) throws Exception;

  /**
   * 查询token中的管理员信息
   * 
   * @param model
   *              请求参数
   * @return token中的管理员信息
   * @throws Exception
   *                   处理发生异常
   */
  JsonMessage getAdminLoginInfo(UtilModel model) throws Exception;

  /**
   * 管理用户登出
   * 
   * @param model
   *              请求参数
   * @return 用户登出结果
   * @throws Exception
   *                   处理发生异常
   */
  JsonMessage adminLogout(UtilModel model) throws Exception;
}