package ${builderUtil.getSubPackage("test")};

import java.util.Scanner;
import top.huhuiyu.api.fileutil.Md5;

/**
 * 临时测试类
 * 
 * @author ${baseInfo.author}
 */
public class Temp {
  public static void one() throws Exception {
    Scanner scanner = new Scanner(Temp.class.getResourceAsStream("/temp.txt"));
    while (scanner.hasNextLine()) {
      System.out.println(scanner.nextLine());
    }
    scanner.close();
  }

  public static void two() throws Exception {
    String salt = "JX1XRO";
    String pwd  = "admin-pwd";
    System.out.println(String.format("%s,%s,%s,%s", salt, pwd, Md5.md5(pwd), Md5.saltMd5(Md5.md5(pwd), salt)));
  }

  public static void main(String[] args) throws Exception {
    Temp.one();
    Temp.two();
  }
}
