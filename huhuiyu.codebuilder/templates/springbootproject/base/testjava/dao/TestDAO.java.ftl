package ${builderUtil.getSubPackage("dao")};

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ${builderUtil.getSubPackage("entity")}.TbToken;

/**
 * 测试用dao
 * 
 * @author ${baseInfo.author}
 *
 */
@Mapper
public interface TestDAO {
  /**
   * 查询TbToken信息
   * 
   * @return TbToken信息
   * @throws Exception 处理发生异常
   */
  List<TbToken> queryAllToken() throws Exception;
}
