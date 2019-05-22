package ${builderUtil.getSubPackage("service.impl")};

import java.util.Date;
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
import ${builderUtil.getSubPackage("entity")}.TbToken;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;
import ${builderUtil.getSubPackage("model")}.UtilModel;
import ${builderUtil.getSubPackage("service")}.UtilService;

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
    utilsDAO.deleteAdmin(tokenInfo);
    tokenInfo.setInfo(check.getAid() + "");
    utilsDAO.addAdmin(tokenInfo);
    return JsonMessage.getSuccess("登录成功");
  }

  @Override
  public JsonMessage adminLogout(UtilModel model) throws Exception {
    TbTokenInfo tokenInfo = model.makeTbTokenInfo();
    utilsDAO.deleteAdmin(tokenInfo);
    return JsonMessage.getSuccess("登出成功");
  }

  @Override
  public JsonMessage getAdminLoginInfo(UtilModel model) throws Exception {
    TbTokenInfo tokenInfo = model.makeTbTokenInfo();
    TbAdmin     user      = utilsDAO.queryAdminByToken(tokenInfo);
    if (user != null) {
      user.setAid(null);
      user.setEnable(null);
      user.setPassword(null);
      user.setSalt(null);
    }
    return JsonMessage.getSuccess("").putData("loginInfo", user);
  }

  @Override
  public String makeImageCode(UtilModel model) throws Exception {
    // 产生图片校验码
    String code = ImageCode.makeCode();
    // 获取token信息
    TbTokenInfo tokenInfo = model.makeTbTokenInfo();
    // 判断图片校验码是否存在
    TbTokenInfo sinfo = utilsDAO.queryImageCode(tokenInfo);
    if (sinfo == null) {
      // 不存在就将图片code写入
      tokenInfo.setInfo(code);
      utilsDAO.addImageCode(tokenInfo);
    }
    else {
      // 存在就更新图片code
      sinfo.setInfo(code);
      utilsDAO.updateImageCode(sinfo);
    }
    return code;
  }

  @Override
  public boolean checkImageCode(TbTokenInfo tokenInfo) throws Exception {
    // code不存在就返回false
    if (StringUtils.isEmpty(tokenInfo.getInfo())) {
      return false;
    }
    // 获取数据库中code
    TbTokenInfo sinfo = utilsDAO.queryImageCode(tokenInfo);
    if (sinfo == null) {
      // 不存在就返回false
      return false;
    }
    // 删除数据库中的code（只能使用一次）
    utilsDAO.deleteImageCode(sinfo);
    // 返回数据库中code和传入的code比对结果
    return sinfo.getInfo().equalsIgnoreCase(tokenInfo.getInfo());
  }

  private TbToken newToken() throws Exception {
    TbToken token = new TbToken();
    token.setToken(UUID.randomUUID().toString());
    utilsDAO.addToken(token);
    return token;
  }

  @Override
  public TbToken checkToken(TbToken token) throws Exception {
    // 没有传入就返回新的
    if (token == null || StringUtils.isEmpty(token.getToken())) {
      return newToken();
    }
    // 数据库校验
    TbToken stoken = utilsDAO.queryToken(token);
    // 校验不通过就返回新的
    if (stoken == null) {
      return newToken();
    }
    // 通过就更新时间
    utilsDAO.updateToken(stoken);
    return stoken;
  }

  @Override
  public int deleteTokens() throws Exception {
    // 先删除tokeninfo
    utilsDAO.deleteTokenInfos();
    // 再删除token
    return utilsDAO.deleteTokens();
  }

  @Override
  public Date queryNow() throws Exception {
    return utilsDAO.queryTime();
  }

}