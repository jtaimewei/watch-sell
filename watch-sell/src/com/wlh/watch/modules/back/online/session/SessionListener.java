package com.wlh.watch.modules.back.online.session;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.wlh.watch.modules.back.online.entity.OnlineSession;

public class SessionListener implements HttpSessionListener,HttpSessionAttributeListener {
	/**  
     * 定义监听的session属性名.  
     */    
    public final static String LISTENER_NAME = "_aaaalogin";    
        
    /**  
     * 定义存储客户登录session的集合.  
     */    
    private static List<OnlineSession> sessions = new ArrayList<OnlineSession>();    
    
    /**  
     * 加入session时的监听方法.  
     *   
     * @param HttpSessionBindingEvent  
     *            session事件  
     */
    public SessionListener() {
    	System.out.println("--------------------###########################");
    }
	@Override
	public void attributeAdded(HttpSessionBindingEvent sbe) {
		// TODO Auto-generated method stub
		
		if (LISTENER_NAME.equals(sbe.getName())) {
			System.out.println("session的东西"+sbe.getName());
			System.out.println("session的LISTENER_NAME"+LISTENER_NAME);
			System.out.println("对象的集合："+sbe.getValue());
            sessions.add((OnlineSession) sbe.getValue());    
        }  
	}
	 /**  
     * session失效时的监听方法.  
     *   
     * @param HttpSessionBindingEvent  
     *            session事件  
     */
	@Override
	public void attributeRemoved(HttpSessionBindingEvent sbe) {
		// TODO Auto-generated method stub
		if (LISTENER_NAME.equals(sbe.getName())) {
			System.out.println("注销的对象是什么呢："+sbe.getValue());
            sessions.remove(sbe.getValue());    
        }
	}
	
	 /**  
     * session覆盖时的监听方法.  
     *   
     * @param HttpSessionBindingEvent  
     *            session事件  
     */ 
	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub

	}
	
	/**  
     * 返回客户登录session的集合.  
     *   
     * @return  
     */    
    public static List<OnlineSession> getSessions() {    
        return sessions;    
    }
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
	     System.out.println("新建一个session");
		
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("销毁一个session");  
	}

}
