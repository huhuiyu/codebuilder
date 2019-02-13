package top.huhuiyu.codebuilder.ui;

import java.awt.event.ActionListener;
import top.huhuiyu.api.frame.FrameUtil;

/**
 * MySpringBoot项目生成工具
 * 
 * @author 胡辉煜
 */
public class MySpringBootProjectFrame extends BaseSpringBootProjectFrame implements ActionListener {

  private static final long   serialVersionUID = -8951698808764167634L;
  private static final String TEMPLATE_CONFIG  = "templates/MySpringBootProject/config.json";

  public MySpringBootProjectFrame() {
    super(TEMPLATE_CONFIG);
  }

  public static void main(String[] args) {
    FrameUtil.setDefaultLookAndFeelDecorated();
    FrameUtil.showSwingFrame(MySpringBootProjectFrame.class);
  }
}
