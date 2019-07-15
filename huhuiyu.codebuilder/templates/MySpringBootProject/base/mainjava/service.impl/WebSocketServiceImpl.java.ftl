package ${builderUtil.getSubPackage("service.impl")};

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import javax.websocket.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.huhuiyu.api.utils.JsonUtil;
import ${builderUtil.getSubPackage("dao")}.UtilsDAO;
import ${builderUtil.getSubPackage("service")}.WebSocketService;

@Service
@Transactional(rollbackFor = Exception.class)
public class WebSocketServiceImpl implements WebSocketService {

  private static final Logger log = LoggerFactory.getLogger(WebSocketServiceImpl.class);
  @Autowired
  private UtilsDAO            utilsDAO;

  private Set<Session>              sessions  = new HashSet<>();
  private Map<String, Set<Session>> publishes = new HashMap<String, Set<Session>>();

  @Override
  public void addSession(Session session) {
    sessions.add(session);
  }

  @Override
  public void removeSession(Session session) {
    sessions.remove(session);
  }

  @Override
  public void broadcast(Object message) throws Exception {
    String json = JsonUtil.stringify(message);
    for (Session session : sessions) {
      session.getBasicRemote().sendText(json);
    }
  }

  @Override
  public void subscription(String channel, Session session) {
    if (!publishes.containsKey(channel)) {
      publishes.put(channel, new HashSet<Session>());
    }
    publishes.get(channel).add(session);
    log.debug("publishes:" + publishes.toString());
  }

  @Override
  public void publish(String channel, Object message) throws Exception {
    String       json = JsonUtil.stringify(message);
    Set<Session> set  = publishes.get(channel);
    log.debug(String.format("set:%s", set));
    if (set == null) {
      return;
    }
    for (Session session : set) {
      session.getBasicRemote().sendText(json);
    }
  }

  @Override
  public void sendTimestamp(Session session) throws Exception {
    session.getBasicRemote().sendText("" + utilsDAO.queryTimestamp());
  }

}
