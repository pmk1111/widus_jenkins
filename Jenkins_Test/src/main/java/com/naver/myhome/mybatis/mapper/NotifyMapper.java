package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.naver.myhome.domain.Notify;


@Mapper
public interface NotifyMapper {

	

	public int existsNotifyWithName(int userid);
	
	public void createalarm(Notify notify);

	public void updatealarm(Notify notify);

	public List<Notify> listalarm(int userId);

	public void updatedNotifications(int userId, int notifyId);

	public void deleteNotifications(int notifyId);

	public int getUnreadNotificationCount(int userId);

}
