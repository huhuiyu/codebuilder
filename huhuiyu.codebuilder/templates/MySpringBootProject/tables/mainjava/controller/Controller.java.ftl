package ${builderUtil.getSubPackage("controller")};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import top.huhuiyu.api.utils.mybase.JsonMessage;
import ${builderUtil.getSubPackage("model")}.${builderUtil.getClassName(tableInfo)}Model;
import ${builderUtil.getSubPackage("service")}.${builderUtil.getClassName(tableInfo)}Service;

/**
 * ${builderUtil.getClassName(tableInfo)}的控制器
 * 
 * @author ${baseInfo.author}
 */
 @Api(tags = { "${builderUtil.getClassName(tableInfo)}" })
@RestController
@RequestMapping("/${builderUtil.getClassName(tableInfo)}")
public class ${builderUtil.getClassName(tableInfo)}Controller {

  @Autowired
  private ${builderUtil.getClassName(tableInfo)}Service ${builderUtil.getTableFieldName(tableInfo)}Service;

  @ApiOperation(value = "查询全部")
  @ApiImplicitParams({ @ApiImplicitParam(name = "page.pageNumber", value = "分页页码"), @ApiImplicitParam(name = "page.pageSize", value = "分页大小") })
  @PostMapping("/queryAll")
  public JsonMessage queryAll(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    return ${builderUtil.getTableFieldName(tableInfo)}Service.queryAll(model);
  }

  @ApiOperation(value = "添加")
  @PostMapping("/add")
  public JsonMessage add(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    return ${builderUtil.getTableFieldName(tableInfo)}Service.add(model);
  }

  @ApiOperation(value = "修改")
  @PostMapping("/update")
  public JsonMessage update(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    return ${builderUtil.getTableFieldName(tableInfo)}Service.update(model);
  }

  @ApiOperation(value = "删除")
  @PostMapping("/delete")
  public JsonMessage delete(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    return ${builderUtil.getTableFieldName(tableInfo)}Service.delete(model);
  }

  @ApiOperation(value = "主键查询")
  @PostMapping("/queryByKey")
  public JsonMessage queryByKey(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    return ${builderUtil.getTableFieldName(tableInfo)}Service.queryByKey(model);
  }

}
