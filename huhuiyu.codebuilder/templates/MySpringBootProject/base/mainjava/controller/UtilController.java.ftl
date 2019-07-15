package ${builderUtil.getSubPackage("controller")};

import org.springframework.util.Base64Utils;
import javax.imageio.ImageIO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import top.huhuiyu.api.utils.ImageCode;
import top.huhuiyu.api.utils.mybase.JsonMessage;
import ${builderUtil.getSubPackage("model")}.UtilModel;
import ${builderUtil.getSubPackage("service")}.UtilService;

/**
 * 工具类控制器
 * 
 * @author ${baseInfo.author}
 */
 @Api(tags = { "工具" })
@RestController
@RequestMapping("/util")
public class UtilController {

  @Autowired
  private UtilService utilService;
  
  @ApiOperation(value = "获取token信息")
  @PostMapping("/getToken")
  public JsonMessage getToken(UtilModel model) throws Exception {
    return JsonMessage.getSuccess("");
  }

  @ApiOperation(value = "图片验证码")
  @GetMapping("/imageCode")
  public JsonMessage imageCode(UtilModel model) throws Exception {
    String                code = utilService.makeImageCode(model.getToken());
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    ImageIO.write(ImageCode.makeImage(code), "jpeg", baos);
    byte[] bytes  = baos.toByteArray();
    String base64 = Base64Utils.encodeToString(bytes).trim();
    return JsonMessage.getSuccess(String.format("data:image/jpg;base64,%s", base64));
  }

  @ApiOperation(value = "管理员登陆")
  @ApiImplicitParams({ @ApiImplicitParam(name = "tbAdmin.username", value = "用户名", paramType = "query", required = true), @ApiImplicitParam(name = "tbAdmin.password", value = "密码", paramType = "query", required = true) })
  @PostMapping("/adminLogin")
  public JsonMessage adminLogin(UtilModel model) throws Exception {
    return utilService.adminLogin(model);
  }

  @ApiOperation(value = "管理员登出")
  @PostMapping("/adminLogout")
  public JsonMessage adminLogout(UtilModel model) throws Exception {
    return utilService.adminLogout(model);
  }

  @ApiOperation(value = "获取管理员信息")
  @PostMapping("/getAdminLoginInfo")
  public JsonMessage getAdminLoginInfo(UtilModel model) throws Exception {
    return utilService.getAdminLoginInfo(model);
  }

}