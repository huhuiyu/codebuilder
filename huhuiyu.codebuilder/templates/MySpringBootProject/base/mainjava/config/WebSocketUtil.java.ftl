package ${builderUtil.getSubPackage("config")};

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class WebSocketUtil implements ApplicationContextAware {

  private static ApplicationContext applicationContext;

  // 获取applicationContext
  public static ApplicationContext getApplicationContext() {
    return applicationContext;
  }

  public static <T> T getBean(Class<T> clazz) {
    return getApplicationContext().getBean(clazz);
  }

  @Override
  public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
    if (WebSocketUtil.applicationContext == null) {
      WebSocketUtil.applicationContext = applicationContext;
    }
  }

}
