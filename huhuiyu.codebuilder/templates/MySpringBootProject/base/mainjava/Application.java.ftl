package ${builderUtil.getSubPackage("")};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import com.google.common.base.Predicates;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * SpringBoot启动类
 * 
 * @author ${baseInfo.author}
 *
 */
@SpringBootApplication
@EnableScheduling
@EnableSwagger2
@ComponentScan(basePackages = { "${builderUtil.getSubPackage("")}" })
public class Application {
  
  @Bean
  public Docket createRestApi() {
    return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo()).select().apis(RequestHandlerSelectors.any()).paths(Predicates.not(PathSelectors.regex("/error.*"))).build();
  }

  private ApiInfo apiInfo() {
    return new ApiInfoBuilder().title("项目标题").description("项目描述").version("1.0").build();
  }

  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }

}
