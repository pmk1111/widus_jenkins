package com.naver.myhome.service;

import java.util.List;
import java.util.Map;

import com.naver.myhome.domain.Schedule;

public interface ScheduleService {
	
	public List<Schedule> getScheduleList(int userId);

	public void insertSchedule(Schedule schedule);
	
	public Schedule getScheduleInfo(int scheduleId);
	
	public int updateSchedule(Schedule schedule);

	public int deleteSchedule(int scheduleId);

	public List<Schedule> getSelectedScheduleList(String pickedDate, int userId);

}
