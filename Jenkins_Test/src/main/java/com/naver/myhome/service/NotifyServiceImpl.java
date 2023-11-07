package com.naver.myhome.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Notify;
import com.naver.myhome.mybatis.mapper.NotifyMapper;


@Service
public class NotifyServiceImpl implements NotifyService{
	
	private NotifyMapper dao;
	
	
	@Autowired
	public NotifyServiceImpl(NotifyMapper dao) {
		this.dao = dao;

	}
	
	@Override
	public void createalarm(Notify notify) {
		dao.createalarm(notify);
		
	}

	@Override
	public int existsNotifyWithName(int userid) {
		// TODO Auto-generated method stub
		
		return dao.existsNotifyWithName(userid);
	}

	@Override
	public void updatealarm(Notify notify) {
		// TODO Auto-generated method stub
		dao.updatealarm(notify);
	}

	@Override
	public List<Notify> getNotificationsForUser(int userId) {
		return dao.listalarm(userId);
	}

	@Override
	public void updatedNotifications(int userId,int notifyId) {
		// TODO Auto-generated method stub
		 dao.updatedNotifications(userId,notifyId);
	}

	@Override
	public void deleteNotifications(int notificationId) {
		// TODO Auto-generated method stub
		dao.deleteNotifications(notificationId);
	}

	@Override
	public int getUnreadNotificationCount(int userId) {
		// TODO Auto-generated method stub
		return dao.getUnreadNotificationCount(userId);
	}

	





}
