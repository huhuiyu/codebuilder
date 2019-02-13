package ${builderUtil.getSubPackage("service")};

import ${builderUtil.getSubPackage("model")}.TestModel;
import ${builderUtil.getSubPackage("utils")}.JsonMessage;

/**
 * 测试用service
 * 
 * @author ${baseInfo.author}
 *
 */
public interface TestService {
  /**
   * 查询TbToken信息
   * 
   * @param model 页面数据
   * @return TbToken信息
   * @throws Exception 处理发生异常
   */
  JsonMessage queryAllToken(TestModel model) throws Exception;
}
