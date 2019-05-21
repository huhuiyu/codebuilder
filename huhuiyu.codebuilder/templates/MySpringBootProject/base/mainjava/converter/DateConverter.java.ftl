package ${builderUtil.getSubPackage("converter")};

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.regex.Pattern;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import top.huhuiyu.api.utils.StringUtils;

/**
 * 日期数据转换器
 * 
 * @author ${baseInfo.author}
 *
 */
@Component
public class DateConverter implements Converter<String, Date> {
  /**
   * 日期补充时间
   */
  private static final String            ZERO_TIME = " 00:00:00";
  /**
   * 日期格式
   */
  private static final DateTimeFormatter SDF       = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
  /**
   * 短日期正则
   */
  private static final Pattern           PSHORT    = Pattern.compile("^\\d{4}[-]\\d{2}[-]\\d{2}$");
  /**
   * 长日期正则
   */
  private static final Pattern           PLONG     = Pattern.compile("^\\d{4}[-]\\d{2}[-]\\d{2} \\d{2}:\\d{2}:\\d{2}$");

  @Override
  public Date convert(String source) {
    if (StringUtils.isEmpty(source)) {
      return null;
    }
    source = StringUtils.trim(source);
    try {
      if (PLONG.matcher(source).matches()) {
        // 长日期格式
        return Date.from(LocalDateTime.parse(source, SDF).atZone(ZoneId.systemDefault()).toInstant());
      }
      else if (PSHORT.matcher(source).matches()) {
        // 短日期格式
        return Date.from(LocalDateTime.parse(source + ZERO_TIME, SDF).atZone(ZoneId.systemDefault()).toInstant());
      }
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }
    return null;
  }
}
