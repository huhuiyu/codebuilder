package ${builderUtil.getSubPackage("dao")};

import java.util.Date;
import org.apache.ibatis.annotations.Mapper;
import ${builderUtil.getSubPackage("entity")}.TbAdmin;
import ${builderUtil.getSubPackage("entity")}.TbConfig;
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
   * 查询数据库当前时间戳
   * 
   * @return 数据库当前时间戳
   * @throws Exception
   *                   处理发生异常
   */
  Long queryTimestamp() throws Exception;

  /**
   * 通过token和info_key查询信息
   * 
   * @param tbTokenInfo
   *                    查询参数信息
   * @return TbTokenInfo信息
   * @throws Exception
   *                   处理发生异常
   */
  TbTokenInfo queryTokenInfo(TbTokenInfo tbTokenInfo) throws Exception;

  /**
   * 添加TbTokenInfo信息
   * 
   * @param tbTokenInfo
   *                    添加参数信息
   * @return 添加TbTokenInfo信息结果
   * @throws Exception
   *                   处理发生异常
   */
  int addTokenInfo(TbTokenInfo tbTokenInfo) throws Exception;

  /**
   * 修改TbTokenInfo信息
   * 
   * @param tbTokenInfo
   *                    修改参数信息
   * @return 修改TbTokenInfo信息结果
   * @throws Exception
   *                   处理发生异常
   */
  int updateTokenInfo(TbTokenInfo tbTokenInfo) throws Exception;

  /**
   * 删除TbTokenInfo信息
   * 
   * @param tbTokenInfo
   *                    删除参数信息
   * @return 删除TbTokenInfo信息结果
   * @throws Exception
   *                   处理发生异常
   */
  int deleteTokenInfo(TbTokenInfo tbTokenInfo) throws Exception;

  /**
   * 删除过期的TbTokenInfo信息
   * 
   * @return 删除过期TbTokenInfo信息结果
   * @throws Exception
   *                   处理发生异常
   */
  int deleteTokenInfos() throws Exception;

  /**
   * 查询系统配置信息
   * 
   * @param tbConfig
   *                 查询条件参数
   * @return 系统配置信息
   * @throws Exception
   *                   处理发生异常
   */
  TbConfig queryConfig(TbConfig tbConfig) throws Exception;

  /**
   * 按照姓名查询管理员信息
   * 
   * @param tbAdmin
   *                登陆姓名信息
   * @return 管理员信息
   * @throws Exception
   *                   处理发生异常
   */
  TbAdmin queryAdminByName(TbAdmin tbAdmin) throws Exception;

  /**
   * 按照token查询管理员信息
   * 
   * @param tbTokenInfo
   *                    token信息
   * @return 管理员信息
   * @throws Exception
   *                   处理发生异常
   */
  TbAdmin queryAdminByToken(TbTokenInfo tbTokenInfo) throws Exception;

}