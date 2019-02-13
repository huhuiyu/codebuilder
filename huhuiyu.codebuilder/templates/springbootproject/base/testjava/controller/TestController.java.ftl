package ${builderUtil.getSubPackage("controller")};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;
import ${builderUtil.getSubPackage("model")}.TestModel;
import ${builderUtil.getSubPackage("service")}.TestService;
import ${builderUtil.getSubPackage("service")}.UtilService;
import ${builderUtil.getSubPackage("utils")}.JsonMessage;

/**
 * 测试用controller
 * 
 * @author ${baseInfo.author}
 *
 */
@RestController
@RequestMapping("/test")
public class TestController {

  @Autowired
  private TestService testService;
  @Autowired
  private UtilService utilService;

  @RequestMapping("/queryAllToken")
  public JsonMessage queryAllToken(TestModel model) throws Exception {
    return testService.queryAllToken(model);
  }

  @RequestMapping("/checkImageCode")
  public JsonMessage checkImageCode(TestModel model) throws Exception {
    TbTokenInfo tokenInfo = model.makeTbTokenInfo();
    tokenInfo.setInfo(model.getImageCode());
    boolean result = utilService.checkImageCode(tokenInfo);
    return result ? JsonMessage.getSuccess("图片校验码正确") : JsonMessage.getFail("图片校验码错误");
  }

}
