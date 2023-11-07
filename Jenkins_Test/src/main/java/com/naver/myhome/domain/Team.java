package com.naver.myhome.domain;

import lombok.Data;

@Data
public class Team {
	private int ID;
	private int USER_ID;
	private int EMPLOYEE_ID;
	private int PROJECT_ID;
	private int AUTH;
	private int EMP_STATUS;
	private String NAME;
	private String EMAIL;
	private String PIC;
	private String PHONE;
	private String DEPARTMENT;
	private String POSITION;
	
	private int MY_ID;
	private int MY_AUTH;
	
	
}
