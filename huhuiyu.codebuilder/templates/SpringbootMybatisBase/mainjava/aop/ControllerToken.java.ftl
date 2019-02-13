package ${builderUtil.getSubPackage("aop")};

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ${builderUtil.getSubPackage("base")}.BaseModel;
import ${builderUtil.getSubPackage("entity")}.TbToken;
import ${builderUtil.getSubPackage("service")}.UtilService;
import ${builderUtil.getSubPackage("utils")}.JsonMessage;

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

  private TbToken processToken(ProceedingJoinPoint pjp) throws Exception {
    Object[] args = pjp.getArgs();
    for (Object arg : args) {
      // 只有传入参数带Model才能处理token信息
      if (arg instanceof BaseModel) {
        BaseModel model = (BaseModel) arg;
        TbToken token = model.makeTbToken();
        // 校验并更新token信息
        token = utilService.checkToken(token);
        model.setToken(token.getToken());
        return token;
      }
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

