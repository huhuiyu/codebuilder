package ${builderUtil.getSubPackage("aop")};

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import top.huhuiyu.api.utils.mybase.INoToken;
import top.huhuiyu.api.utils.mybase.JsonMessage;
import ${builderUtil.getSubPackage("base")}.MyBaseModel;
import ${builderUtil.getSubPackage("entity")}.TbToken;
import ${builderUtil.getSubPackage("service")}.UtilService;

/**
 * 控制器token切面
 * 
 * @author ${baseInfo.author}
 *
 */
@Aspect
@Component
public class ControllerToken extends BaseControllerAop {

  private static final Logger log = LoggerFactory.getLogger(ControllerToken.class);

  @Autowired
  private UtilService utilService;

  private MyBaseModel getMyBaseModel(ProceedingJoinPoint pjp) throws Exception {
    MyBaseModel model = null;
    Object[] args = pjp.getArgs();
    for (Object arg : args) {
      if (arg instanceof MyBaseModel) {
        model = (MyBaseModel) arg;
        break;
      }
    }
    return model;
  }

  private TbToken processToken(ProceedingJoinPoint pjp) throws Exception {
    if ((pjp.getTarget() instanceof INoToken)) {
      return null;
    }
    MyBaseModel model = getMyBaseModel(pjp);
    if (model != null) {
      TbToken token = model.makeTbToken();
      // 校验并更新token信息
      token = utilService.checkToken(token);
      model.setToken(token.getToken());
      return token;
    }
    return null;
  }

  @Around("controller()")
  public Object around(ProceedingJoinPoint pjp) throws Throwable {
    log.debug("控制器切面token处理");
    TbToken token = processToken(pjp);
    log.debug(String.format("token信息：%s", token));
    Object result = pjp.proceed();
    // 如果应答为JsonMessage且token存在就应答回去
    if (token != null && result instanceof JsonMessage) {
      JsonMessage message = (JsonMessage) result;
      message.setToken(token.getToken());
    }
    return result;
  }

}

