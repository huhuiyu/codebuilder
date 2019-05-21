server:
  port: 20000
spring:
  servlet:
    multipart:
      max-file-size: 10MB
      max-request-size: 10MB
  http:
    encoding:
      force: true
      charset: UTF-8
  datasource:
    driver-class-name: ${dataSourceInfo.driver}
    url: ${dataSourceInfo.url}
    username: ${dataSourceInfo.username}
    password: ${dataSourceInfo.password}
mybatis:
  config-location: classpath:mybatis-config.xml