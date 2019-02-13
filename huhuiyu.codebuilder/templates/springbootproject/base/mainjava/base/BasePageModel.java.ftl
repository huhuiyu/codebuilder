package ${builderUtil.getSubPackage("base")};

import ${builderUtil.getSubPackage("utils")}.PageBean;

/**
 * 带分页信息的model基类
 * 
 * @author ${baseInfo.author}
 *
 */
public class BasePageModel extends BaseModel {
  private static final long serialVersionUID = ${builderUtil.serialVersionUID};
  private PageBean page = new PageBean();

  public BasePageModel() {
  }

  public PageBean getPage() {
    return page;
  }

  public void setPage(PageBean page) {
    this.page = page;
  }

}
