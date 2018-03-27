package com.wlh.watch.modules.sys.basic.web;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/b/check")
public class CheckController {
	
	/**
	 * 获取登录和注册的验证码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("code")
	public void getImg(HttpServletRequest request,HttpServletResponse response) throws IOException{
		BufferedImage bi = new BufferedImage(90, 40, BufferedImage.TYPE_INT_RGB); 
		Graphics gp = bi.getGraphics();
		Color color = new Color(255,255,255);
		gp.setColor(color);
		gp.fillRect(0,0,90,40);
		gp.setFont(new Font("Times New Roman", Font.PLAIN, 20));
		char [] ch = "QWERTYUIOPASDFGHJKLZXCVBNM1234567890".toCharArray();
		Random rm = new Random();
		int len = ch.length,index;
		StringBuffer sBuffer = new StringBuffer();
		for (int i=0;i<4;i++) {
			index = rm.nextInt(len);
			gp.setColor(new Color(rm.nextInt(88),rm.nextInt(188),rm.nextInt(255)));
			gp.drawString(ch[index]+"", (i*15)+3, 25);
			
			sBuffer.append(ch[index]);
		}
		request.getSession().setAttribute("checkCode", sBuffer.toString());
		ImageIO.write(bi, "JPG", response.getOutputStream());
	}
}
