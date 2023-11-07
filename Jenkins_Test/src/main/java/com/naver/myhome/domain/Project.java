package com.naver.myhome.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Project {
	private int ID;
    private String TITLE;
    private String SUBTITLE;
    private String COLOR;
    private int employeeId;
    private int COMPANYID;
    private int AUTH;
    private int MY_AUTH;
    private Date CREATE_AT;
    private Date UPDATE_AT;
    private String CURRENTTIME;
    private int TEAMCOUNT;
    
}