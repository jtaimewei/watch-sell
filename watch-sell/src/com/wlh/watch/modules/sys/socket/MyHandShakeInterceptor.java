package com.wlh.watch.modules.sys.socket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import com.wlh.watch.modules.user.entity.User;

@Component
public class MyHandShakeInterceptor implements HandshakeInterceptor{

	@Override
	public void afterHandshake(ServerHttpRequest arg0, ServerHttpResponse arg1,
			WebSocketHandler arg2, Exception arg3) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean beforeHandshake(ServerHttpRequest serverHttpRequest,
			ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler,
			Map<String, Object> map) throws Exception {
		
		System.out.println("Websocket:用户[ID:" + ((ServletServerHttpRequest) serverHttpRequest).getServletRequest().getSession(false).getAttribute("suser") + "]已经建立连接");
		if(serverHttpRequest instanceof ServletServerHttpRequest){
			 ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) serverHttpRequest;
	            HttpSession session = servletRequest.getServletRequest().getSession(false);
	            // 标记用户
	            User user = (User) session.getAttribute("suser");
	            if(user!=null){
	                map.put("uid", user.getEmail());//为服务器创建WebSocketSession做准备
	                System.out.println("用户登录名为："+user.getEmail()+" 被加入");
	            }else{
	                System.out.println("user为空");
	                return false;
	            }
		}
		
		return true;
	}

}
