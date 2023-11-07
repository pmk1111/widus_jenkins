package com.naver.myhome.domain;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class Schedule {
	private int id ;
	private int user_id;
	private String subject;
	private String background_color;
	private String border_color;
	private String start_date;
	private String end_date;
	private String place;
	private String category;
	private String content;
	
	private String name;
}
