<?xml version="1.0" encoding="UTF-8"?>
<!--debug="true" : 打印logback内部状态（默认当logback运行出错时才会打印内部状态 ），配置该属性后打印条件如下（同时满足）： 1、找到配置文件 2、配置文件是一个格式正确的xml文件 也可编程实现打印内部状态，例如： LoggerContext lc = (LoggerContext) LoggerFactory.getILoggerFactory(); StatusPrinter.print(lc); -->
<!-- scan="true" ： 自动扫描该配置文件，若有修改则重新加载该配置文件 -->
<!-- scanPeriod="30 seconds" : 配置自动扫面时间间隔（单位可以是：milliseconds, seconds, minutes or hours，默认为：milliseconds）， 默认为1分钟，scan="true"时该配置才会生效 -->
<configuration debug="false" scan="true" scanPeriod="30 seconds" packagingData="true">

  <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
    <!-- 日志格式 -->
    <encoder>
      <pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} %n\t%msg%n</pattern>
    </encoder>
  </appender>

  <appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
    <!-- 当前活动日志文件名 -->
    <file>./logs/${baseInfo.projectName}.log</file>
    <!-- 文件滚动策略根据%d{patter}中的“patter”而定，此处为每天产生一个文件 -->
    <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
      <!-- 归档文件名“.zip或.gz结尾”,表示归档文件自动压缩 -->
      <FileNamePattern>./logs/${baseInfo.projectName}%d{yyyyMMdd}.log.zip</FileNamePattern>
      <maxHistory>30</maxHistory>
    </rollingPolicy>

    <encoder>
      <pattern>%d{HH:mm:ss.SSS}[%-5level][%thread]%logger{36}%n\t%msg%n</pattern>
    </encoder>
  </appender>

  <!-- 日志级别若没显示定义，则继承最近的父logger（该logger需显示定义level,直到rootLogger）的日志级别 -->
  <!-- logger的appender默认具有累加性（默认日志输出到当前logger的appender和所有祖先logger的appender中），可通过配置 “additivity”属性修改默认行为 -->
  <logger name="${builderUtil.getSubPackage("")}" level="debug" additivity="false">
    <appender-ref ref="STDOUT" />
    <!-- <appender-ref ref="FILE" /> -->
  </logger>

  <!-- 至多只能配置一个root -->
  <root level="info">
    <appender-ref ref="STDOUT" />
  </root>
</configuration>