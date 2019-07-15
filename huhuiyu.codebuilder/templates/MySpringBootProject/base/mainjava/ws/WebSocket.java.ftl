package ${builderUtil.getSubPackage("ws")};

import java.io.IOException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import ${builderUtil.getSubPackage("config")}.WebSocketUtil;
import ${builderUtil.getSubPackage("service")}.WebSocketService;

@ServerEndpoint(value = "/ws")
@Component
public class WebSocket {

  private static final Logger log              = LoggerFactory.getLogger(WebSocket.class);
  private WebSocketService    webSocketService = WebSocketUtil.getBean(WebSocketService.class);

  /**
   * 连接建立成功调用的方法
   */
  @OnOpen
  public void onOpen(Session session) {
    webSocketService.addSession(session);
    log.debug("onOpen：" + session.getId());
  }

  /**
   * 连接关闭调用的方法
   */
  @OnClose
  public void onClose(Session session) {
    webSocketService.removeSession(session);
    log.debug("onClose" + session.getId());
  }

  /**
   * 收到客户端消息后调用的方法
   */
  @OnMessage
  public void onMessage(String message, Session session) throws IOException {
    webSocketService.addSession(session);
    log.debug("onMessage：" + message);
  }

  /**
   * 发生错误时调用
   */
  @OnError
  public void onError(Session session, Throwable error) {
    log.error("onError:", error);
  }
}
