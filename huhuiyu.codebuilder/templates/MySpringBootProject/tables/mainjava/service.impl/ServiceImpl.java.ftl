package ${builderUtil.getSubPackage("service.impl")};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import top.huhuiyu.api.utils.mybase.JsonMessage;
import top.huhuiyu.api.utils.mybase.PageBean;
import ${builderUtil.getSubPackage("dao")}.${builderUtil.getClassName(tableInfo)}DAO;
import ${builderUtil.getSubPackage("entity")}.${builderUtil.getClassName(tableInfo)};
import ${builderUtil.getSubPackage("model")}.${builderUtil.getClassName(tableInfo)}Model;
import ${builderUtil.getSubPackage("service")}.${builderUtil.getClassName(tableInfo)}Service;

/**
 * ${builderUtil.getClassName(tableInfo)}的实现层
 * 
 * @author ${baseInfo.author}
 *
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ${builderUtil.getClassName(tableInfo)}ServiceImpl implements ${builderUtil.getClassName(tableInfo)}Service {
  @Autowired
  private ${builderUtil.getClassName(tableInfo)}DAO ${builderUtil.getTableFieldName(tableInfo)}DAO;

  @Override
  public JsonMessage queryAll(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    PageBean page = model.getPage();
    PageHelper.startPage(page.getPageNumber(), page.getPageSize());
    Page<${builderUtil.getClassName(tableInfo)}> list = (Page<${builderUtil.getClassName(tableInfo)}>) ${builderUtil.getTableFieldName(tableInfo)}DAO.queryAll();
    model.setPageInfo(list);
    JsonMessage message = JsonMessage.getSuccess("");
    message.putData("page", page);
    message.putData("list", list);
    return message;
  }

  @Override
  public JsonMessage queryByKey(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    JsonMessage message = JsonMessage.getSuccess("");
    message.putData("${builderUtil.getTableFieldName(tableInfo)}", ${builderUtil.getTableFieldName(tableInfo)}DAO.queryByKey(model.${builderUtil.getTableGetter(tableInfo)}()));
    return message;
  }

  @Override
  public JsonMessage add(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    int result = ${builderUtil.getTableFieldName(tableInfo)}DAO.add(model.${builderUtil.getTableGetter(tableInfo)}());
    return result == 1 ? JsonMessage.getSuccess("添加数据成功") : JsonMessage.getFail("添加数据失败");
  }

  @Override
  public JsonMessage delete(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    int result = ${builderUtil.getTableFieldName(tableInfo)}DAO.delete(model.${builderUtil.getTableGetter(tableInfo)}());
    return result == 1 ? JsonMessage.getSuccess("删除数据成功") : JsonMessage.getFail("删除数据失败");
  }

  @Override
  public JsonMessage update(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    int result = ${builderUtil.getTableFieldName(tableInfo)}DAO.update(model.${builderUtil.getTableGetter(tableInfo)}());
    return result == 1 ? JsonMessage.getSuccess("修改数据成功") : JsonMessage.getFail("修改数据失败");
  }
}
