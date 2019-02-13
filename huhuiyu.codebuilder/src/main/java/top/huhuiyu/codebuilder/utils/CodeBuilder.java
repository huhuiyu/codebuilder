package top.huhuiyu.codebuilder.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alibaba.fastjson.JSON;
import top.huhuiyu.api.dbutils.datasource.DataSourceInfo;
import top.huhuiyu.api.dbutils.meta.MetaUtilsBean;
import top.huhuiyu.api.dbutils.meta.TableInfo;
import top.huhuiyu.api.fileutil.FileUtil;
import top.huhuiyu.api.freemarker.FreemarkerUtilBean;

/**
 * 代码生成工具
 * 
 * @author 胡辉煜
 */
public class CodeBuilder {

  private void init() {
    try {
      // 初始化配置文件
      String config = FileUtil.readTextFile(configFile);
      builderConfigInfo = JSON.parseObject(config, BuilderConfigInfo.class);
      if (baseConfigInfo != null) {
        builderConfigInfo.setAuthor(baseConfigInfo.getAuthor());
        builderConfigInfo.setOutputDir(baseConfigInfo.getOutputDir());
        builderConfigInfo.setPackageName(baseConfigInfo.getPackageName());
        builderConfigInfo.setProjectName(baseConfigInfo.getProjectName());
      }
      templateRootDir = new File(configFile).getParentFile().getAbsoluteFile();
      outputDir = new File(builderConfigInfo.getOutputDir()).getAbsolutePath();
      log.debug(String.format("配置文件信息：%n%s", builderConfigInfo));
      log.debug(String.format("模板目录：%n%s", templateRootDir));
      log.debug(String.format("输出文件根目录：%n%s", outputDir));
      // 初始化工具
      builderUtil = new CodeBuilderUtil(builderConfigInfo.getPackageName());
      // 初始化ftl文件映射
      ftlMap = CodeBuilderUtil.getTemplatePathInfo(templateRootDir.getAbsolutePath());
      // 初始化模板数据
      dataMap = new HashMap<>(20);
      dataMap.put("baseInfo", builderConfigInfo);
      dataMap.put("builderUtil", builderUtil);
      dataMap.put("dataSourceInfo", dataSourceInfo);
      // 初始化模板工具
      freemarkerUtilBean = new FreemarkerUtilBean();
      freemarkerUtilBean.setDirectoryForTemplateLoading(templateRootDir);
    }
    catch (Exception ex) {
      throw new RuntimeException(ex);
    }
  }

  public List<File> build() {
    try {
      // 清理输出目录
      if (builderConfigInfo.isClearDir()) {
        FileUtil.deleteDirNoError(new File(outputDir));
      }
      // 输出模板
      List<File>                files   = new ArrayList<>();
      Map<String, TemplateInfo> infoMap = builderConfigInfo.getInfoMap();
      for (String name : ftlMap.keySet()) {
        TemplatePathInfo templatePathInfo = ftlMap.get(name);
        TemplateInfo     templateInfo     = infoMap.get(templatePathInfo.getPath());
        if (templateInfo.isTablesMode()) {
          buildTable(templateInfo, templatePathInfo, files, name);
        }
        else {
          buildFile(templateInfo, templatePathInfo, files, name);
        }
      }
      return files;
    }
    catch (Exception ex) {
      throw new RuntimeException(ex);
    }
  }

  private void buildFile(TemplateInfo templateInfo, TemplatePathInfo templatePathInfo, List<File> files, String name) throws Exception {
    // 输出位置
    File outfile;
    if (templateInfo.getSubpackage() == null) {
      // 不用输出包的情况
      outfile = new File(CodeBuilderUtil.joinFilePath(outputDir, builderConfigInfo.getProjectName(), templateInfo.getOutpath(), name));
    }
    else {
      outfile = new File(CodeBuilderUtil.joinFilePath(outputDir, builderConfigInfo.getProjectName(), templateInfo.getOutpath(), FileUtil.parsePackage(builderUtil.getSubPackage(templateInfo.getSubpackage())), name));
    }
    log.debug(String.format("模板信息：%n%s%n%s%n%s", templatePathInfo, templateInfo, outfile));
    FileUtil.makeFileDir(outfile.getAbsolutePath());
    freemarkerUtilBean.process(CodeBuilderUtil.joinFilePath(templatePathInfo.getPath(), templatePathInfo.getName()), dataMap, outfile.getAbsolutePath());
    files.add(outfile);
  }

  private void buildTable(TemplateInfo templateInfo, TemplatePathInfo templatePathInfo, List<File> files, String name) throws Exception {
    initTables();
    for (TableInfo tableInfo : tables) {
      // 输出位置
      File   outfile;
      String filename = builderUtil.getTableTemplateName(name, tableInfo, templateInfo.isNotClass(), templateInfo.getNamePostfix());
      if (templateInfo.getSubpackage() == null) {
        // 不用输出包的情况
        outfile = new File(CodeBuilderUtil.joinFilePath(outputDir, builderConfigInfo.getProjectName(), templateInfo.getOutpath(), filename));
      }
      else {
        outfile = new File(CodeBuilderUtil.joinFilePath(outputDir, builderConfigInfo.getProjectName(), templateInfo.getOutpath(), FileUtil.parsePackage(builderUtil.getSubPackage(templateInfo.getSubpackage())), filename));
      }
      log.debug(String.format("buildTable信息：%s:%s", name, builderUtil.getTableTemplateName(name, tableInfo, templateInfo.isNotClass(), templateInfo.getNamePostfix())));
      dataMap.put("tableInfo", tableInfo);
      FileUtil.makeFileDir(outfile.getAbsolutePath());
      freemarkerUtilBean.process(CodeBuilderUtil.joinFilePath(templatePathInfo.getPath(), templatePathInfo.getName()), dataMap, outfile.getAbsolutePath());
      files.add(outfile);
    }
  }

  private void initTables() throws Exception {
    if (tables == null) {
      MetaUtilsBean metaUtilsBean = new MetaUtilsBean(dataSourceInfo, schema);
      tables = metaUtilsBean.processMetaInfo();
    }
  }

  private static final Logger log = LoggerFactory.getLogger(CodeBuilder.class);

  private CodeBuilderUtil               builderUtil;
  private FreemarkerUtilBean            freemarkerUtilBean;
  private Map<String, Object>           dataMap;
  private File                          templateRootDir;
  private BuilderConfigInfo             builderConfigInfo;
  private BuilderConfigInfo             baseConfigInfo;
  private String                        outputDir;
  private Map<String, TemplatePathInfo> ftlMap;
  private List<TableInfo>               tables;
  private String                        schema;

  private DataSourceInfo dataSourceInfo;
  private String         configFile;

  public CodeBuilder(DataSourceInfo dataSourceInfo, String configFile, String schema, BuilderConfigInfo baseConfigInfo) {
    this.dataSourceInfo = dataSourceInfo;
    this.configFile = configFile;
    this.schema = schema;
    this.baseConfigInfo = baseConfigInfo;
    init();
  }

  public static CodeBuilder getInstance(DataSourceInfo dataSourceInfo, String configFile) {
    return new CodeBuilder(dataSourceInfo, configFile, null, null);
  }

  public static CodeBuilder getInstance(DataSourceInfo dataSourceInfo, String configFile, BuilderConfigInfo baseConfigInfo) {
    return new CodeBuilder(dataSourceInfo, configFile, null, baseConfigInfo);
  }

  public static CodeBuilder getInstance(DataSourceInfo dataSourceInfo, String configFile, String schema, BuilderConfigInfo baseConfigInfo) {
    return new CodeBuilder(dataSourceInfo, configFile, schema, baseConfigInfo);
  }

}
