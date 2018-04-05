package com.wlh.watch.common.email;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

import com.wlh.watch.modules.user.entity.User;


@Component
public class UserMail {
	private static String HOST="smtp.qq.com";
	private static String SMTP="smtp";
	private static String PORT="587";
	private static String MAILTITLE="autumn向您发送验证码";
	private static String USER="494047680@qq.com";
	private static String PASSWORD="wei19940307..";
	public void sendMail(String toEmail,String code){

		
		Properties props=new Properties();
        props.put("mail.transport.protocol", SMTP);
		props.put("mail.smtp.host", HOST);
		props.put("mail.smtp.port",PORT );
		props.put("mail.smtp.auth", "true");
		props.put("mail.user",USER);
		props.put("mail.password", PASSWORD);
		Authenticator authenticator=new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				String userName=props.getProperty("mail.user");
				String password=props.getProperty("mail.password");
				
				return new PasswordAuthentication(userName,password);
			}
		};
		Session session =Session.getInstance(props,authenticator);
		MimeMessage message=new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(props.getProperty("mail.user")));
			
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			
			message.setSubject(MAILTITLE);
			message.setContent("<h1>来自-名表网-用户注册激活邮件,正在进行邮箱激活,激活码为:</h1><h3>"+ code + " </a></3>",
			"text/html;charset=utf-8");
			message.setSentDate(new Date());
			message.saveChanges();
			//Transport transport=session.getTransport();
			Transport.send(message);
			//transport.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
}
