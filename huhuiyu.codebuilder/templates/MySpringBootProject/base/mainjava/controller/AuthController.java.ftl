package ${builderUtil.getSubPackage("controller")};


import top.huhuiyu.mybatisplus.model.UtilModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import top.huhuiyu.api.utils.mybase.JsonMessage;
import ${builderUtil.getSubPackage("aop")}.INeedAdmin;
import ${builderUtil.getSubPackage("base")}.MyBaseModel;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;
import ${builderUtil.getSubPackage("service")}.UtilService;

/**
 * 首页
 * 
 * @author ${baseInfo.author}
 */
@Api(value = "授权测试控制器", tags = { "登陆授权测试" })
@RestController
@RequestMapping("/auth")
public class AuthController implements INeedAdmin {
  @Autowired
  private UtilService utilService;

  @ApiOperation(value = "管理员登陆测试")
  @PostMapping("/testAdminLogin")
  public JsonMessage testAdminLogin(MyBaseModel model) throws Exception {
    return JsonMessage.getSuccess("").putData("loginInfo", model.getLoginAdmin());
  }

  @ApiOperation(value = "图片校验码测试")
  @ApiImplicitParams({ @ApiImplicitParam(name = "imageCode", value = "图片校验码", paramType = "query", required = true) })
  @PostMapping("/testImageCode")
  public JsonMessage testImageCode(UtilModel model) throws Exception {
    TbTokenInfo tbTokenInfo = model.makeTbTokenInfo();
    tbTokenInfo.setInfo(model.getImageCode());
    boolean result = utilService.checkImageCode(tbTokenInfo);
    return result ? JsonMessage.getSuccess("校验码正确") : JsonMessage.getFail("校验码错误");
  }

}