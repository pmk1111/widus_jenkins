package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Schedule;
import com.naver.myhome.mybatis.mapper.ScheduleMapper;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	private ScheduleMapper mapper;
	
	@Autowired
	public ScheduleServiceImpl(ScheduleMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<Schedule> getScheduleList(int userId) {
		return mapper.getScheduleList(userId);
	}

	@Override
	public void insertSchedule(Schedule schedule) {
		mapper.insertSchedule(schedule);
		
	}

	@Override
	public Schedule getScheduleInfo(int scheduleId) {
		return mapper.getScheduleInfo(scheduleId);
	}
	
	@Override
	public int updateSchedule(Schedule schedule) {
		return mapper.updateSchedule(schedule);
	}

	@Override
	public int deleteSchedule(int scheduleId) {
		return mapper.deleteSchedule(scheduleId);
	}

	@Override
	public List<Schedule> getSelectedScheduleList(String pickedDate, int userId) {
		return mapper.getSelectedScheduleList(pickedDate, userId);
	}
	
}
