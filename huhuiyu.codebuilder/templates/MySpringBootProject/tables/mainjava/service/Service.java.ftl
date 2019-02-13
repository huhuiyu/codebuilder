package ${builderUtil.getSubPackage("service")};

import top.huhuiyu.api.utils.mybase.JsonMessage;
import ${builderUtil.getSubPackage("model")}.${builderUtil.getClassName(tableInfo)}Model;

/**
 * ${builderUtil.getClassName(tableInfo)}的Service
 * 
 * @author ${baseInfo.author}
 *
 */
public interface ${builderUtil.getClassName(tableInfo)}Service {

  /**
   * 修改${builderUtil.getClassName(tableInfo)}信息
   * 
   * @param model 页面提交数据
   * @return 修改${builderUtil.getClassName(tableInfo)}信息的结果
   * @throws Exception 处理发生错误
   */
  JsonMessage update(${builderUtil.getClassName(tableInfo)}Model model) throws Exception;

  /**
   * 删除${builderUtil.getClassName(tableInfo)}信息
   * 
   * @param model 页面提交数据
   * @return 删除${builderUtil.getClassName(tableInfo)}信息的结果
   * @throws Exception 处理发生错误
   */
  JsonMessage delete(${builderUtil.getClassName(tableInfo)}Model model) throws Exception;

  /**
   * 添加${builderUtil.getClassName(tableInfo)}信息
   * 
   * @param model 页面提交数据
   * @return 添加${builderUtil.getClassName(tableInfo)}信息的结果
   * @throws Exception 处理发生错误
   */
  JsonMessage add(${builderUtil.getClassName(tableInfo)}Model model) throws Exception;

  /**
   * 按照主键查询${builderUtil.getClassName(tableInfo)}信息
   * 
   * @param model 页面提交数据
   * @return 主键查询${builderUtil.getClassName(tableInfo)}信息的结果
   * @throws Exception 处理发生错误
   */
  JsonMessage queryByKey(${builderUtil.getClassName(tableInfo)}Model model) throws Exception;

  /**
   * 分页查询${builderUtil.getClassName(tableInfo)}信息
   * 
   * @param model 页面提交数据
   * @return 分页查询${builderUtil.getClassName(tableInfo)}信息的结果
   * @throws Exception 处理发生错误
   */
  JsonMessage queryAll(${builderUtil.getClassName(tableInfo)}Model model) throws Exception;

}
