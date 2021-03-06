package ${builderUtil.getSubPackage("service")};

import ${builderUtil.getSubPackage("model")}.IndexModel;
import ${builderUtil.getSubPackage("utils")}.JsonMessage;

/**
 * 首页服务
 * 
 * @author ${baseInfo.author}
 *
 */
public interface IndexService {

  /**
   * 首页
   * 
   * @param model 页面数据
   * @return 应答结果
   * @throws Exception 处理发生异常
   */
  JsonMessage index(IndexModel model) throws Exception;
}
