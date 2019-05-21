package ${builderUtil.getSubPackage("dao")};

import java.util.Date;
import org.apache.ibatis.annotations.Mapper;
import ${builderUtil.getSubPackage("entity")}.TbAdmin;
import ${builderUtil.getSubPackage("entity")}.TbToken;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;

/**
 * 工具类dao
 * 
 * @author ${baseInfo.author}
 */
@Mapper
public interface UtilsDAO {
  /**
   * 查询数据库当前时间
   * 
   * @return 数据库当前时间
   * @throws Exception
   *                   处理发生异常
   */
  Date queryTime() throws Exception;

  /**
   * 查询token
   * 
   * @param token
   *              token信息
   * @return token信息
   * @throws Exception
   *                   处理发生异常
   */
  TbToken queryToken(TbToken token) throws Exception;

  /**
   * 添加token
   * 
   * @param token
   *              token信息
   * @return 添加token的结果
   * @throws Exception
   *                   处理发生异常
   */
  int addToken(TbToken token) throws Exception;

  /**
   * 更新token
   * 
   * @param token
   *              token信息
   * @return 更新token的结果
   * @throws Exception
   *                   处理发生异常
   */
  int updateToken(TbToken token) throws Exception;

  /**
   * 删除所有过期token
   * 
   * @return 删除所有过期token的结果
   * @throws Exception
   *                   处理发生异常
   */
  int deleteTokens() throws Exception;

  /**
   * 删除所有过期的TokenInfo
   * 
   * @return 删除所有过期TokenInfo的结果
   * @throws Exception
   *                   处理发生异常
   */
  int deleteTokenInfos() throws Exception;

  /**
   * 添加图片校验码
   * 
   * @param tokenInfo
   *                  带图片校验码的tokenInfo信息
   * @return 添加图片校验码的结果
   * @throws Exception
   *                   处理发生异常
   */
  int addImageCode(TbTokenInfo tokenInfo) throws Exception;

  /**
   * 查询图片校验码
   * 
   * @param tokenInfo
   *                  带图片校验码的tokenInfo信息
   * @return 查询图片校验码的结果
   * @throws Exception
   *                   处理发生异常
   */
  TbTokenInfo queryImageCode(TbTokenInfo tokenInfo) throws Exception;

  /**
   * 更新图片校验码
   * 
   * @param tokenInfo
   *                  带图片校验码的tokenInfo信息
   * @return 更新图片校验码的结果
   * @throws Exception
   *                   处理发生异常
   */
  int updateImageCode(TbTokenInfo tokenInfo) throws Exception;

  /**
   * 删除图片校验码
   * 
   * @param tokenInfo
   *                  带图片校验码的tokenInfo信息
   * @return 删除图片校验码的结果
   * @throws Exception
   *                   处理发生异常
   */
  int deleteImageCode(TbTokenInfo tokenInfo) throws Exception;

  /**
   * 添加管理员登陆
   * 
   * @param tokenInfo
   *                  带管理员登陆的tokenInfo信息
   * @return 添加管理员登陆的结果
   * @throws Exception
   *                   处理发生异常
   */
  int addAdmin(TbTokenInfo tokenInfo) throws Exception;

  /**
   * 查询管理员登陆
   * 
   * @param tokenInfo
   *                  带管理员登陆的tokenInfo信息
   * @return 查询管理员登陆的结果
   * @throws Exception
   *                   处理发生异常
   */
  TbTokenInfo queryAdmin(TbTokenInfo tokenInfo) throws Exception;

  /**
   * 更新管理员登陆
   * 
   * @param tokenInfo
   *                  带管理员登陆的tokenInfo信息
   * @return 更新管理员登陆的结果
   * @throws Exception
   *                   处理发生异常
   */
  int updateAdmin(TbTokenInfo tokenInfo) throws Exception;

  /**
   * 删除管理员登陆
   * 
   * @param tokenInfo
   *                  带管理员登陆的tokenInfo信息
   * @return 删除管理员登陆的结果
   * @throws Exception
   *                   处理发生异常
   */
  int deleteAdmin(TbTokenInfo tokenInfo) throws Exception;

  /**
   * 按照名称查询管理员信息
   * 
   * @param tbAdmin
   *                管理员名称
   * @return 查询管理员信息结果
   * @throws Exception
   *                   处理发生异常
   */
  TbAdmin queryAdminByName(TbAdmin tbAdmin) throws Exception;

  /**
   * 查询token中的管理员登陆信息
   * 
   * @param tokenInfo
   *                  tokenInfo信息
   * @return 查询token中的管理员登陆信息的结果
   * @throws Exception
   *                   处理发生异常
   */
  TbAdmin queryAdminByToken(TbTokenInfo tokenInfo) throws Exception;

}