package com.wlh.watch.modules.back.online.entity;

import java.util.Date;

public class OnlineSession {
	  /**  
     * 客户计算机的ip.  
     */    
    private String ip = null;    
    /**  
     * 客户登录名.  
     */    
    private String loginId = null;    
    /**  
     * 客户登录系统时间.  
     */    
    private Date onlineTime = null;    
        
    
    public OnlineSession(String ip, String loginId, Date onlineTime) {
  		super();
  		this.ip = ip;
  		this.loginId = loginId;
  		this.onlineTime = onlineTime;
  	}  
        
       
    public String getIp() {    
        return ip;    
    }    
  
	   
    public void setIp(String ip) {    
        this.ip = ip;    
    }    
       
    public String getLoginId() {    
        return loginId;    
    }    
      
    public void setLoginId(String loginId) {    
        this.loginId = loginId;    
    }


	public Date getOnlineTime() {
		return onlineTime;
	}


	public void setOnlineTime(Date onlineTime) {
		this.onlineTime = onlineTime;
	}


	@Override
	public String toString() {
		return "OnlineSession [ip=" + ip + ", loginId=" + loginId + ", onlineTime=" + onlineTime + "]";
	}    
      
   

	
    
}
