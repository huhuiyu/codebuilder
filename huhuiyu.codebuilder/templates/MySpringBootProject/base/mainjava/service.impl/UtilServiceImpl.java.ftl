package ${builderUtil.getSubPackage("service.impl")};

import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.huhuiyu.api.fileutil.Md5;
import top.huhuiyu.api.utils.ImageCode;
import top.huhuiyu.api.utils.StringUtils;
import top.huhuiyu.api.utils.mybase.JsonMessage;
import ${builderUtil.getSubPackage("dao")}.UtilsDAO;
import ${builderUtil.getSubPackage("entity")}.TbAdmin;
import ${builderUtil.getSubPackage("entity")}.TbConfig;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;
import ${builderUtil.getSubPackage("model")}.UtilModel;
import ${builderUtil.getSubPackage("service")}.UtilService;
import ${builderUtil.getSubPackage("utils")}.IpUtils;

/**
 * 工具服务层实现
 * 
 * @author ${baseInfo.author}
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UtilServiceImpl implements UtilService {
  @Autowired
  private UtilsDAO utilsDAO;

  @Override
  public int deleteTokens() throws Exception {
    return utilsDAO.deleteTokenInfos();
  }

  @Override
  public TbTokenInfo checkToken(TbTokenInfo token) throws Exception {
    // 没有传入就返回新的
    if (token == null || StringUtils.isEmpty(token.getToken())) {
      return newToken();
    }
    token.setInfoKey(TOKEN);
    token.setInfo(IpUtils.getIpAddress());
    // 数据库校验
    TbTokenInfo stoken = utilsDAO.queryTokenInfo(token);
    // 校验不通过就返回新的
    if (stoken == null) {
      return newToken();
    }
    stoken.setInfo(IpUtils.getIpAddress());
    // 通过就更新时间
    utilsDAO.updateTokenInfo(stoken);
    return stoken;
  }

  /**
   * 产生新的token信息
   * 
   * @return 新的token信息
   * @throws Exception
   *                   处理发生异常
   */
  private TbTokenInfo newToken() throws Exception {
    TbTokenInfo token = new TbTokenInfo();
    token.setToken(UUID.randomUUID().toString());
    token.setInfoKey(TOKEN);
    token.setInfo(IpUtils.getIpAddress());
    utilsDAO.addTokenInfo(token);
    return token;
  }

  @Override
  public String makeImageCode(String token) throws Exception {
    TbConfig tbConfig = new TbConfig();
    tbConfig.setConfigKey(CONFIG_IMAGE_CODE_AMOUNT);
    int amount = Integer.parseInt(utilsDAO.queryConfig(tbConfig).getConfigValue());
    tbConfig = new TbConfig();
    tbConfig.setConfigKey(CONFIG_IMAGE_CODE_LENGTH);
    int length = Integer.parseInt(utilsDAO.queryConfig(tbConfig).getConfigValue());
    // 产生图片校验码
    ImageCode.setLength(length);
    ImageCode.setAmount(amount);
    String      code      = ImageCode.makeCode();
    TbTokenInfo tokenInfo = new TbTokenInfo();
    tokenInfo.setToken(token);
    // 获取token信息
    tokenInfo.setInfoKey(IMAGE_CODE);
    // 判断图片校验码是否存在
    TbTokenInfo sinfo = utilsDAO.queryTokenInfo(tokenInfo);
    if (sinfo == null) {
      // 不存在就将图片code写入
      tokenInfo.setInfo(code);
      utilsDAO.addTokenInfo(tokenInfo);
    }
    else {
      // 存在就更新图片code
      sinfo.setInfo(code);
      utilsDAO.updateTokenInfo(sinfo);
    }
    return code;
  }

  @Override
  public boolean checkImageCode(TbTokenInfo tokenInfo) throws Exception {
    // code不存在就返回false
    if (StringUtils.isEmpty(tokenInfo.getInfo())) {
      return false;
    }
    tokenInfo.setInfoKey(IMAGE_CODE);
    // 获取数据库中code
    TbTokenInfo sinfo = utilsDAO.queryTokenInfo(tokenInfo);
    if (sinfo == null) {
      // 不存在就返回false
      return false;
    }
    // 删除数据库中的code（只能使用一次）
    utilsDAO.deleteTokenInfo(sinfo);
    // 返回数据库中code和传入的code比对结果
    return sinfo.getInfo().equalsIgnoreCase(tokenInfo.getInfo());
  }

  @Override
  public JsonMessage adminLogin(UtilModel model) throws Exception {
    TbAdmin user = model.getTbAdmin();
    if (StringUtils.isEmpty(user.getUsername())) {
      return JsonMessage.getFail("用户名必须填写");
    }
    if (StringUtils.isEmpty(user.getPassword())) {
      return JsonMessage.getFail("密码必须填写");
    }
    TbAdmin check = utilsDAO.queryAdminByName(user);
    if (check == null) {
      return JsonMessage.getFail("用户不存在");
    }
    if (!Md5.checkSaltMd5(user.getPassword(), check.getSalt(), check.getPassword())) {
      return JsonMessage.getFail("密码错误，登陆失败");
    }
    // 处理tokeninfo
    TbTokenInfo tokenInfo = model.makeTbTokenInfo();
    tokenInfo.setInfoKey(LOGIN_ADMIN);
    utilsDAO.deleteTokenInfo(tokenInfo);
    tokenInfo.setInfo(check.getAid() + "");
    utilsDAO.addTokenInfo(tokenInfo);
    // 处理敏感信息
    check.setAid(null);
    check.setEnable(null);
    check.setPassword(null);
    check.setSalt(null);
    return JsonMessage.getSuccess("登录成功").putData("admin", check);
  }

  @Override
  public JsonMessage getAdminLoginInfo(UtilModel model) throws Exception {
    TbTokenInfo tokenInfo = model.makeTbTokenInfo();
    tokenInfo.setInfoKey(LOGIN_ADMIN);
    TbAdmin user = utilsDAO.queryAdminByToken(tokenInfo);
    if (user != null) {
      user.setAid(null);
      user.setEnable(null);
      user.setPassword(null);
      user.setSalt(null);
    }
    return JsonMessage.getSuccess("").putData("loginInfo", user);
  }

  @Override
  public JsonMessage adminLogout(UtilModel model) throws Exception {
    TbTokenInfo tokenInfo = model.makeTbTokenInfo();
    tokenInfo.setInfoKey(LOGIN_ADMIN);
    utilsDAO.deleteTokenInfo(tokenInfo);
    return JsonMessage.getSuccess("登出成功");
  }
}