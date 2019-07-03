package top.huhuiyu.codebuilder.utils;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import top.huhuiyu.api.dbutils.DbUtils;
import top.huhuiyu.api.dbutils.meta.TableColumnInfo;
import top.huhuiyu.api.dbutils.meta.TableInfo;
import top.huhuiyu.api.fileutil.FileUtil;
import top.huhuiyu.api.utils.StringUtils;

/**
 * 代码生成工具辅助类
 * 
 * @author 胡辉煜
 */
public class CodeBuilderUtil {
  private static final String   TYPES_FILE            = "/types.json";
  private static final Random   RAND                  = new Random();
  private static final String   EXT_SPLIT             = ".";
  private static final String   FTL_POSTFIX           = ".ftl";
  private static final String   DIR_SPLIT_ONE         = "/";
  private static final String   DIR_SPLIT_TWO         = "\\";
  private static final String   DIR_SPLIT_TWO_REPLACE = "[\\\\]";
  private String                packageName;
  private Map<String, TypeInfo> typesMap              = new HashMap<>(20);
  private DbUtils               dbUtils               = new DbUtils();

  public CodeBuilderUtil(String packageName) {
    this.packageName = packageName;
    try {
      // 读取类型映射文件
      InputStream is    = CodeBuilder.class.getResourceAsStream(TYPES_FILE);
      String      types = FileUtil.readTextFile(is);
      is.close();
      List<TypeInfo> list = JSON.parseObject(types, new TypeReference<List<TypeInfo>>() {
      });
      for (TypeInfo typeInfo : list) {
        typesMap.put(typeInfo.getTypeName(), typeInfo);
      }
    }
    catch (Exception ex) {
      throw new RuntimeException(ex);
    }
  }

  /**
   * 获取模板名称对应表模式的输出文件名称
   * 
   * @param name
   *                    模板名称
   * @param tableInfo
   *                    表信息
   * @param noClass
   *                    name不是class模板
   * @param namePostfix
   *                    文件名后置补充
   * @return 模板名称对应表模式的输出文件名称
   */
  public String getTableTemplateName(String name, TableInfo tableInfo, boolean noClass, String namePostfix) {
    // 获取扩展名
    int    index = name.indexOf(EXT_SPLIT);
    String ext   = "";
    if (index > -1) {
      ext = name.substring(index);
    }
    if (noClass) {
      return tableInfo.getName() + namePostfix + ext;
    }
    else {
      return getClassName(tableInfo) + namePostfix + ext;
    }
  }

  /**
   * 获取模板名称对应表模式的输出类文件名称
   * 
   * @param name
   *                    模板名称
   * @param tableInfo
   *                    表信息
   * @param namePostfix
   *                    文件名后置补充
   * @return 模板名称对应表模式的输出文件名称
   */
  public String getTableTemplateName(String name, TableInfo tableInfo, String namePostfix) {
    return getTableTemplateName(name, tableInfo, false, namePostfix);
  }

  /**
   * 获取表对应的类名称
   * 
   * @param tableInfo
   *                  表信息
   * @return 表对应的类名称
   */
  public String getClassName(TableInfo tableInfo) {
    return dbUtils.getEntityName(tableInfo);
  }

  /**
   * 获取列名对应的字段名称
   * 
   * @param columnInfo
   *                   列信息
   * @return 列名对应的字段名称
   */
  public String getColFieldName(TableColumnInfo columnInfo) {
    return dbUtils.getJavaFieldName(columnInfo);
  }

  /**
   * 获取表名对应的字段名称
   * 
   * @param tableInfo
   *                  表信息
   * @return 表名对应的字段名称
   */
  public String getTableFieldName(TableInfo tableInfo) {
    return dbUtils.getEntityFieldName(tableInfo);
  }

  // /**
  // * 获取名称对应的字段名称
  // *
  // * @param name
  // * 对象名
  // * @return 名称对应的字段名称
  // */
  // public String getFieldName(String name) {
  // name = StringUtils.trim(name);
  // if (name.length() <= FIDLE_MIN_LENGTH) {
  // return name.toLowerCase();
  // }
  // else {
  // return name.substring(0, FIDLE_MIN_LENGTH).toLowerCase() + name.substring(FIDLE_MIN_LENGTH);
  // }
  // }

  /**
   * 获取列名对应的getter名称
   * 
   * @param columnInfo
   *                   列信息
   * @return 列名对应的getter名称
   */
  public String getColGetter(TableColumnInfo columnInfo) {
    return dbUtils.getJavaGetter(columnInfo);
  }

  /**
   * 获取列名对应的setter名称
   * 
   * @param columnInfo
   *                   列信息
   * @return 列名对应的setter名称
   */
  public String getColSetter(TableColumnInfo columnInfo) {
    return dbUtils.getJavaSetter(columnInfo);
  }

  /**
   * 获取列的java类型信息
   * 
   * @param columnInfo
   *                   列信息
   * @return 列的java类型信息
   */
  public String getColType(TableColumnInfo columnInfo) {
    if (typesMap.containsKey(columnInfo.getClassName())) {
      return typesMap.get(columnInfo.getClassName()).getMappingName();
    }
    else {
      return columnInfo.getClassName();
    }
  }

  /**
   * 获取表名对应的getter名称
   * 
   * @param tableInfo
   *                  表信息
   * @return 列名对应的getter名称
   */
  public String getTableGetter(TableInfo tableInfo) {
    return dbUtils.getTableGetter(tableInfo);
  }

  /**
   * 获取表名对应的setter名称
   * 
   * @param tableInfo
   *                  表信息
   * @return 表名对应的setter名称
   */
  public String getTableSetter(TableInfo tableInfo) {
    return dbUtils.getTableSetter(tableInfo);
  }

  /**
   * 获取随机的序列化id
   * 
   * @return 随机的序列化id
   */
  public String getSerialVersionUID() {
    return String.format("%sL", RAND.nextLong());
  }

  /**
   * 获取子包的完整名称，添加packageName字段指定的基本包名称
   * 
   * @param subpackage
   *                   子包名称
   * @return 子包的完整名称
   */
  public String getSubPackage(String subpackage) {
    subpackage = StringUtils.trim(subpackage);
    if ("".equals(subpackage)) {
      return packageName;
    }
    return String.format("%s.%s", packageName, subpackage);
  }

  /**
   * 将多个文件路径信息拼接成完整路径信息
   * 
   * @param filenames
   *                  文件路径信息
   * @return 完整路径信息
   */
  public static String joinFilePath(String... filenames) {
    StringBuilder sb = new StringBuilder();
    for (String filename : filenames) {
      if ("".equals(StringUtils.trim(filename))) {
        continue;
      }
      sb.append(filename);
      if (!filename.endsWith(DIR_SPLIT_ONE) && !filename.endsWith(DIR_SPLIT_TWO)) {
        sb.append(DIR_SPLIT_ONE);
      }
    }
    String result = sb.toString();
    if (result.endsWith(DIR_SPLIT_ONE) || result.endsWith(DIR_SPLIT_TWO)) {
      result = result.substring(0, result.length() - 1);
    }
    return result;
  }

  /**
   * 读取目录中的模板文件信息到集合中
   * 
   * @param dir
   *            模板文件目录
   * @return 目录中的模板文件信息
   */
  public static Map<String, TemplatePathInfo> getTemplatePathInfo(String dir) {
    try {
      Map<String, TemplatePathInfo> map     = new HashMap<>(20);
      File                          baseDir = new File(dir);
      getTemplatePathInfo(map, baseDir, baseDir.getAbsolutePath());
      return map;
    }
    catch (Exception ex) {
      throw new RuntimeException(ex);
    }
  }

  private static void getTemplatePathInfo(Map<String, TemplatePathInfo> map, File dir, String baseDir) throws Exception {
    if ((dir == null) || !dir.isDirectory()) {
      return;
    }
    File[] files = dir.listFiles();
    for (File file : files) {
      String filename = file.getName();
      // 只要模板文件
      if (file.isFile() && filename.toLowerCase().endsWith(FTL_POSTFIX)) {
        // 输出文件名
        String name = filename.substring(0, filename.length() - FTL_POSTFIX.length());
        // 路径信息
        TemplatePathInfo templatePathInfo = new TemplatePathInfo();
        templatePathInfo.setName(filename);
        String filepath = file.getParentFile().getAbsolutePath().substring(baseDir.length());
        if (filepath.startsWith(DIR_SPLIT_ONE) || filepath.startsWith(DIR_SPLIT_TWO)) {
          filepath = filepath.substring(1).replaceAll(DIR_SPLIT_TWO_REPLACE, DIR_SPLIT_ONE);
        }
        templatePathInfo.setPath(filepath);
        map.put(name, templatePathInfo);
      }
      else if (file.isDirectory()) {
        getTemplatePathInfo(map, file, baseDir);
      }
    }
  }
}
