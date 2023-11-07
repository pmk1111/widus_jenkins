package com.naver.myhome.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.Schedule;
import com.naver.myhome.service.ScheduleService;
import com.naver.myhome.service.UserService;

@Controller
@RequestMapping(value = "/calendar")
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);

	UserService userService;
	ScheduleService scheduleService;


	@Autowired
	public CalendarController(UserService userService, ScheduleService scheduleService) {
		this.userService = userService;
		this.scheduleService = scheduleService;
	}

	@GetMapping("/calendar-list")
	public ModelAndView getScheduleList(ModelAndView mv, Principal principal) {
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		
		List<Schedule> calendarList = scheduleService.getScheduleList(userId);

		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();

		HashMap<String, Object> hash = new HashMap<>();

		if (calendarList != null && !calendarList.isEmpty()) {
			for (int i = 0; i < calendarList.size(); i++) {
				hash.put("id", calendarList.get(i).getId());
				hash.put("title", calendarList.get(i).getSubject());
				hash.put("backgroundColor", calendarList.get(i).getBackground_color());
				hash.put("borderColor", calendarList.get(i).getBorder_color());
				hash.put("start", calendarList.get(i).getStart_date());
				hash.put("end", calendarList.get(i).getEnd_date());
				hash.put("category", calendarList.get(i).getCategory());
				hash.put("place", calendarList.get(i).getPlace());
				hash.put("content", calendarList.get(i).getContent());

				jsonObj = new JSONObject(hash);
				jsonArr.add(jsonObj);
			}
		}

		mv.setViewName("calendar/calendar-list");
		mv.addObject("calendarList", jsonArr);

		return mv;
	}

	@PostMapping("/create-schedule")
	public String saveSchedule(
			@RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate, 
			@RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate, 
			String color, Principal principal, Schedule schedule) {
		
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String startDateStr = startDate.format(formatter);
		String endDateStr = endDate.format(formatter);
		
		logger.info("시작일 = " + startDateStr );
		schedule.setUser_id(userId);
		schedule.setStart_date(startDateStr);
		schedule.setEnd_date(endDateStr);
		schedule.setBackground_color(color);
		schedule.setBorder_color(color);

		scheduleService.insertSchedule(schedule);

		return "redirect:calendar-list";
	}

	@GetMapping("/get-schedule-info")
	@ResponseBody
	public Schedule getScheduleInfo(@RequestParam("scheduleId") int scheduleId) {
		return scheduleService.getScheduleInfo(scheduleId);
	}

	@PostMapping("/update-schedule")
	public String updateSchedule(@RequestParam("scheduleId") int scheduleId,
			@RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate, 
			@RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate, 
			Schedule schedule, String color) {
		String url = "";

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String startDateStr = startDate.format(formatter);
		String endDateStr = endDate.format(formatter);

		schedule.setId(scheduleId);
		schedule.setStart_date(startDateStr);
		schedule.setEnd_date(endDateStr);
		schedule.setBackground_color(color);
		schedule.setBorder_color(color);

		int result = scheduleService.updateSchedule(schedule);

		if(result==0) {
			logger.info("일정 수정 실패");
		} else {
			logger.info("일정 수정 성공");
			url = "redirect:calendar-list";
		}

		return url;
	}

	@PostMapping("/delete-schedule")
	@ResponseBody
	public boolean deleteSchedule(@RequestParam("scheduleId") int scheduleId) {
		int sqlResult = scheduleService.deleteSchedule(scheduleId);

		if(sqlResult == 1) {
			return true;
		}
		return false;
	}


}