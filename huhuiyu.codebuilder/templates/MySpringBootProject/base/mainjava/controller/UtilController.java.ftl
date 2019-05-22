package ${builderUtil.getSubPackage("controller")};

import java.io.OutputStream;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
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

  @ApiOperation(value = "图片验证码")
  @ApiImplicitParams({ @ApiImplicitParam(name = "token", value = "认证令牌") })
  @GetMapping("/validate.jpg")
  public void imageCode(UtilModel model, HttpServletResponse response) throws Exception {
    // 自定义应答类型为图片
    response.setContentType("image/jpeg");
    // 获取图片校验码
    String code = utilService.makeImageCode(model);
    // 将图片通过response输出
    OutputStream os = response.getOutputStream();
    ImageIO.write(ImageCode.makeImage(code), "jpeg", os);
    os.close();
  }

  @ApiOperation(value = "管理员登陆")
  @ApiImplicitParams({ @ApiImplicitParam(name = "token", value = "认证令牌"), @ApiImplicitParam(name = "tbAdmin.username", value = "用户名", required = true), @ApiImplicitParam(name = "tbAdmin.password", value = "密码", required = true) })
  @PostMapping("/adminLogin")
  public JsonMessage adminLogin(UtilModel model) throws Exception {
    return utilService.adminLogin(model);
  }

  @ApiOperation(value = "管理员登出")
  @ApiImplicitParams({ @ApiImplicitParam(name = "token", value = "认证令牌") })
  @PostMapping("/adminLogout")
  public JsonMessage adminLogout(UtilModel model) throws Exception {
    return utilService.adminLogout(model);
  }

  @ApiOperation(value = "获取管理员信息")
  @ApiImplicitParams({ @ApiImplicitParam(name = "token", value = "认证令牌") })
  @PostMapping("/getAdminLoginInfo")
  public JsonMessage getAdminLoginInfo(UtilModel model) throws Exception {
    return utilService.getAdminLoginInfo(model);
  }

}