package ${builderUtil.getSubPackage("dao")};

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import ${builderUtil.getSubPackage("entity")}.${builderUtil.getClassName(tableInfo)};

/**
 * ${tableInfo.name}表的dao
 * 
 * @author ${baseInfo.author}
 *
 */
@Mapper
public interface ${builderUtil.getClassName(tableInfo)}DAO {
  /**
   * 查询全部${tableInfo.name}
   *
   * @return ${tableInfo.name}的信息
   * @throws Exception 处理发生异常
   */
  List<${builderUtil.getClassName(tableInfo)}> queryAll() throws Exception;
  
  /**
   * 按照主键查询${tableInfo.name}
   *
   * @param ${builderUtil.getTableFieldName(tableInfo)}主键信息
   * @return 主键查询${tableInfo.name}的结果
   * @throws Exception 处理发生异常
   */
  ${builderUtil.getClassName(tableInfo)} queryByKey(${builderUtil.getClassName(tableInfo)} ${builderUtil.getTableFieldName(tableInfo)}) throws Exception;
  
  /**
   * 添加${tableInfo.name}信息
   *
   * @param ${builderUtil.getTableFieldName(tableInfo)}信息
   * @return 添加${builderUtil.getTableFieldName(tableInfo)}信息的结果
   * @throws Exception 处理发生异常
   */
  int add(${builderUtil.getClassName(tableInfo)} ${builderUtil.getTableFieldName(tableInfo)}) throws Exception;
  
  /**
   * 修改${tableInfo.name}信息
   *
   * @param ${builderUtil.getTableFieldName(tableInfo)}信息
   * @return 修改${builderUtil.getTableFieldName(tableInfo)}信息的结果
   * @throws Exception 处理发生异常
   */
  int update(${builderUtil.getClassName(tableInfo)} ${builderUtil.getTableFieldName(tableInfo)}) throws Exception;
  
  /**
   * 删除${tableInfo.name}信息
   *
   * @param ${builderUtil.getTableFieldName(tableInfo)}信息
   * @return 删除${builderUtil.getTableFieldName(tableInfo)}信息的结果
   * @throws Exception 处理发生异常
   */
  int delete(${builderUtil.getClassName(tableInfo)} ${builderUtil.getTableFieldName(tableInfo)}) throws Exception;

}
