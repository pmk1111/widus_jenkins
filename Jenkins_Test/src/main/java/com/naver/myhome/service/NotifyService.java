package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Notify;


public interface NotifyService {

	public void createalarm(Notify notify);


	public void updatealarm(Notify notify);

	public int existsNotifyWithName(int userid);


	public List<Notify> getNotificationsForUser(int userId);


	public void updatedNotifications(int userId, int notifyId);


	public void deleteNotifications(int userId);


	public int getUnreadNotificationCount(int userId);


	




	
}
