package com.naver.myhome.domain;

import lombok.Data;

@Data
public class Bookmark {
	private int id;
	private int user_id;
	private int issue_id;
	private String regDate;
	private String type;
	private String subject;
	private String title;
	private String name;
	private String priority;
	private String currentTime;
	
	
}
