package com.naver.myhome.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Schedule;

@Mapper
@Repository
public interface ScheduleMapper {
	
	public List<Schedule> getScheduleList(int userId);
	
	public void insertSchedule(Schedule schedule);
	
	public Schedule getScheduleInfo(int scheduleId);
	
	public int updateSchedule(Schedule schedule);
	
	public int deleteSchedule(int scheduleId);
	
	public List<Schedule> getSelectedScheduleList(String pickedDate, int userId);
}
