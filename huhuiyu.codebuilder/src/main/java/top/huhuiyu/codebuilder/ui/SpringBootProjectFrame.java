package top.huhuiyu.codebuilder.ui;

import java.awt.event.ActionListener;
import top.huhuiyu.api.frame.FrameUtil;

/**
 * SpringBoot项目生成工具
 * 
 * @author 胡辉煜
 */
public class SpringBootProjectFrame extends BaseSpringBootProjectFrame implements ActionListener {

  private static final long   serialVersionUID = 5157084151258715628L;
  private static final String TEMPLATE_CONFIG  = "templates/springbootproject/config.json";

  public SpringBootProjectFrame() {
    super(TEMPLATE_CONFIG);
  }

  public static void main(String[] args) {
    FrameUtil.setDefaultLookAndFeelDecorated();
    FrameUtil.showSwingFrame(SpringBootProjectFrame.class);
  }
}
