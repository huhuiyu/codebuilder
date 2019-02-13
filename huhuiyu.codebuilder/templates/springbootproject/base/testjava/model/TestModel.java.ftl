package ${builderUtil.getSubPackage("model")};

import ${builderUtil.getSubPackage("base")}.BasePageModel;

/**
 * 测试用model
 * 
 * @author ${baseInfo.author}
 *
 */
public class TestModel extends BasePageModel {
  private static final long serialVersionUID = ${builderUtil.serialVersionUID};

  private String imageCode;

  public TestModel() {
  }

  public String getImageCode() {
    return imageCode;
  }

  public void setImageCode(String imageCode) {
    this.imageCode = imageCode;
  }
}
