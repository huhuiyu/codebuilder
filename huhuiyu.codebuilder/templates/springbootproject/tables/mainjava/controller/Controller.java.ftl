package ${builderUtil.getSubPackage("controller")};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ${builderUtil.getSubPackage("model")}.${builderUtil.getClassName(tableInfo)}Model;
import ${builderUtil.getSubPackage("service")}.${builderUtil.getClassName(tableInfo)}Service;
import ${builderUtil.getSubPackage("utils")}.JsonMessage;

/**
 * ${builderUtil.getClassName(tableInfo)}的控制器
 * 
 * @author ${baseInfo.author}
 *
 */
@RestController
@RequestMapping("/${builderUtil.getClassName(tableInfo)}")
public class ${builderUtil.getClassName(tableInfo)}Controller {

  @Autowired
  private ${builderUtil.getClassName(tableInfo)}Service ${builderUtil.getTableFieldName(tableInfo)}Service;

  @RequestMapping("/queryAll")
  public JsonMessage queryAll(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    return ${builderUtil.getTableFieldName(tableInfo)}Service.queryAll(model);
  }

  @RequestMapping("/add")
  public JsonMessage add(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    return ${builderUtil.getTableFieldName(tableInfo)}Service.add(model);
  }

  @RequestMapping("/update")
  public JsonMessage update(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    return ${builderUtil.getTableFieldName(tableInfo)}Service.update(model);
  }

  @RequestMapping("/delete")
  public JsonMessage delete(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    return ${builderUtil.getTableFieldName(tableInfo)}Service.delete(model);
  }

  @RequestMapping("/queryByKey")
  public JsonMessage queryByKey(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    return ${builderUtil.getTableFieldName(tableInfo)}Service.queryByKey(model);
  }

}
