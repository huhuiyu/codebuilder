package ${builderUtil.getSubPackage("service")};

import javax.websocket.Session;

/**
 * websocket服务
 * 
 * @author 胡辉煜
 */
public interface WebSocketService {

  /**
   * 全区广播
   * 
   * @param message
   *                广播内容
   * @throws Exception
   *                   处理发生错误
   */
  void broadcast(Object message) throws Exception;

  /**
   * 移除会话
   * 
   * @param session
   *                会话
   */
  void removeSession(Session session);

  /**
   * 添加会话
   * 
   * @param session
   *                会话
   */
  void addSession(Session session);

  /**
   * 给频道发布信息
   * 
   * @param channel
   *                频道
   * @param message
   *                广播信息
   * @throws Exception
   *                   处理发生错误
   */
  void publish(String channel, Object message) throws Exception;

  /**
   * 订阅频道
   * 
   * @param channel
   *                频道
   * @param session
   *                会话
   */
  void subscription(String channel, Session session);

  /**
   * 发送时间戳信息
   * 
   * @param session
   *                会话
   * @throws Exception
   *                   处理发生错误
   */
  void sendTimestamp(Session session) throws Exception;
}
