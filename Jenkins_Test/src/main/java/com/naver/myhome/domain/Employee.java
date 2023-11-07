package com.naver.myhome.domain;

import lombok.Data;

@Data
public class Employee {
	private int id;
	private int company_id;
	private int user_id;
	private String department;
	private String position;
	private String auth="N";
	private int status;
	private String company_invited;
	private String name;
	private String email;
	private String pic;
	private String phone;
	private String company_name;
	
//	mk for chat
	private String user_name;
	private String user_pic;
	private String user_email;
	
}
