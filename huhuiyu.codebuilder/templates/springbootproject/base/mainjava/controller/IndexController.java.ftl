package ${builderUtil.getSubPackage("controller")};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ${builderUtil.getSubPackage("model")}.IndexModel;
import ${builderUtil.getSubPackage("service")}.IndexService;
import ${builderUtil.getSubPackage("utils")}.JsonMessage;

/**
 * 首页
 * 
 * @author ${baseInfo.author}
 *
 */
@RestController
public class IndexController {
  @Autowired
  private IndexService indexService;

  @RequestMapping("")
  public JsonMessage index(IndexModel model) throws Exception {
    // {"echo":"abc-123"}
    return indexService.index(model);
  }
}
