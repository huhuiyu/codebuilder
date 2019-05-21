package ${builderUtil.getSubPackage("controller")};

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import top.huhuiyu.api.utils.mybase.JsonMessage;
import ${builderUtil.getSubPackage("aop")}.INeedAdmin;
import ${builderUtil.getSubPackage("base")}.MyBaseModel;

/**
 * 首页
 * 
 * @author ${baseInfo.author}
 */
@Api(value = "授权测试控制器", tags = { "登陆授权测试" })
@RestController
@RequestMapping("/auth")
public class IndexController  implements INeedAdmin {

  @ApiOperation(value = "管理员登陆测试")
  @ApiImplicitParams({ @ApiImplicitParam(name = "token", value = "认证令牌") })
  @PostMapping("/test")
  public JsonMessage test(MyBaseModel model) throws Exception {
    return JsonMessage.getSuccess("").putData("loginInfo", model.getLoginAdmin());
  }

}
