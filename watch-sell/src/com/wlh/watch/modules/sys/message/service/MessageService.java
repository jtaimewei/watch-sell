package com.wlh.watch.modules.sys.message.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.modules.sys.message.dao.MessageDao;
import com.wlh.watch.modules.sys.message.entity.Message;

@Service
public class MessageService {
	
	@Resource
	private MessageDao messageDao;

	public void addMessage(Message message) {
		messageDao.addMessage(message);
	}

}
