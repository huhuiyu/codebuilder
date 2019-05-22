package ${builderUtil.getSubPackage("model")};

import ${builderUtil.getSubPackage("base")}.MyBaseModel;
import ${builderUtil.getSubPackage("entity")}.TbAdmin;

/**
 * 工具控制器的model
 * 
 * @author ${baseInfo.author}
 */
public class UtilModel extends MyBaseModel {
  private static final long serialVersionUID = ${builderUtil.serialVersionUID};
  
  private TbAdmin tbAdmin = new TbAdmin();

  public UtilModel() {
  }

  public TbAdmin getTbAdmin() {
    return tbAdmin;
  }

  public void setTbAdmin(TbAdmin tbAdmin) {
    this.tbAdmin = tbAdmin;
  }
  
}