package ${builderUtil.getSubPackage("controller")};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import top.huhuiyu.api.utils.mybase.INoToken;
import top.huhuiyu.api.utils.mybase.JsonMessage;
import ${builderUtil.getSubPackage("model")}.IndexModel;
import ${builderUtil.getSubPackage("service")}.IndexService;

/**
 * 首页
 * 
 * @author ${baseInfo.author}
 */
@Api(tags = { "首页" })
@RestController
public class IndexController  implements INoToken {
  @Autowired
  private IndexService indexService;

  @ApiOperation(value = "首页")
  @ApiImplicitParams(@ApiImplicitParam(name = "echo", value = "回声参数"))
  @PostMapping("")
  public JsonMessage index(IndexModel model) throws Exception {
    return indexService.index(model);
  }
}
