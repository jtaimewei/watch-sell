package com.wlh.watch.modules.sys.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wlh.watch.common.utils.DateUtils;
import com.wlh.watch.modules.back.online.entity.OnlineSession;
import com.wlh.watch.modules.sys.message.entity.Message;
import com.wlh.watch.modules.sys.message.service.MessageService;

@Component
public class MyWebSocketHandler implements WebSocketHandler{

	@Resource
	private MessageService messageService;
	
	//当MyWebSocketHandler类被加载时就会创建该Map，随类而生
	 public static final Map<String, WebSocketSession> userSocketSessionMap;
	 
	 private static Map<String,OnlineSession> sessions = new HashMap<String, OnlineSession>(); 
	
	 static {
		 System.out.println("当MyWebSocketHandler类被加载时就会创建该Map，随类而生");
	        userSocketSessionMap = new HashMap<String, WebSocketSession>();
	    }
	@Override
	public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus arg1)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("----------MyWebSocketHandler-----------");
		System.out.println("WebSocket:"+webSocketSession.getAttributes().get("uid")+"close connection关闭连接");
        Iterator<Map.Entry<String,WebSocketSession>> iterator = userSocketSessionMap.entrySet().iterator();
        while(iterator.hasNext()){
            Map.Entry<String,WebSocketSession> entry = iterator.next();
            if(entry.getValue().getAttributes().get("uid")==webSocketSession.getAttributes().get("uid")){
                userSocketSessionMap.remove(webSocketSession.getAttributes().get("uid"));
                System.out.println("WebSocket in staticMap:" + webSocketSession.getAttributes().get("uid") + "removed掉线了掉线了");
                sessions.remove(webSocketSession.getAttributes().get("uid"));
            }
        }
	}
	
	//握手实现连接后
	@Override
	public void afterConnectionEstablished(WebSocketSession webSocketSession)
			throws Exception {
		
		String uid=(String)webSocketSession.getAttributes().get("uid");
		if (userSocketSessionMap.get(uid) == null) {
			System.out.println("握手实现连接后,用户加入"+uid+"webSocketSession"+webSocketSession);
            userSocketSessionMap.put(uid, webSocketSession);
            
            sessions.put(uid, new OnlineSession(webSocketSession.getRemoteAddress().getHostString(),uid,DateUtils.getDateTime()));
        }
	}
	
	//发送信息前的处理
	@Override
	public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage)
			throws Exception {
		// TODO Auto-generated method stub
		if(webSocketMessage.getPayloadLength()==0) return;
		Message message=new Gson().fromJson(webSocketMessage.getPayload().toString(), Message.class);
		message.setMessageDate(DateUtils.getDateTime());
		System.out.println("+++++++++++++"+message);
		//发送Socket信息
		System.out.println("这是Gson=========="+new GsonBuilder().setDateFormat("MM-dd HH:mm").create().toJson(message));
		sendMessageToUser(message,message.getToWho(), new TextMessage(new GsonBuilder().setDateFormat("MM-dd HH:mm").create().toJson(message)));
	}

	@Override
	public void handleTransportError(WebSocketSession arg0, Throwable arg1)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		return false;
	}
	
	//发送信息的实现
    public void sendMessageToUser(Message message1,String uid, TextMessage message)
            throws IOException {
    	System.out.println("发送给：--"+uid);
    	System.out.println("发送的消息是："+message.getPayload());
        WebSocketSession session = userSocketSessionMap.get(uid);
        if (session != null && session.isOpen()) {
        	System.out.println("已经发送！！！！！");
            session.sendMessage(message);
        }else{
        	//将信息保存至数据库
        	System.out.println("用户不在线发送到数据库存储");
        	message1.setId(UUID.randomUUID().toString().replaceAll("-", ""));
        	messageService.addMessage(message1);
        }
    }

	public static Map<String, OnlineSession> getSessions() {
		return sessions;
	}

	public static void setSessions(Map<String, OnlineSession> sessions) {
		MyWebSocketHandler.sessions = sessions;
	}

}
