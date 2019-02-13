package ${builderUtil.getSubPackage("service.impl")};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import ${builderUtil.getSubPackage("dao")}.TestDAO;
import ${builderUtil.getSubPackage("entity")}.TbToken;
import ${builderUtil.getSubPackage("model")}.TestModel;
import ${builderUtil.getSubPackage("service")}.TestService;
import ${builderUtil.getSubPackage("utils")}.JsonMessage;
import ${builderUtil.getSubPackage("utils")}.PageBean;

/**
 * 测试用service实现
 * 
 * @author ${baseInfo.author}
 *
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class TestServiceImpl implements TestService {
  @Autowired
  private TestDAO testDAO;

  @Override
  public JsonMessage queryAllToken(TestModel model) throws Exception {
    PageBean page = model.getPage();
    PageHelper.startPage(page.getPageNumber(), page.getPageSize());
    Page<TbToken> list = (Page<TbToken>) testDAO.queryAllToken();
    page.setPageInfo(list);
    JsonMessage message = JsonMessage.getSuccess("");
    message.putData("list", list);
    message.putData("page", page);
    return message;
  }

}
