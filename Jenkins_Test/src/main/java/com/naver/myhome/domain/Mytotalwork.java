package com.naver.myhome.domain;

import java.util.List;

import lombok.Data;

@Data
public class Mytotalwork {
    private int ID; // 프로젝트 pk
    private String TITLE; // 프로젝트 title
    
    private String COLOR;
 
	private String SUBJECT;
	
	private String CREATED_AT;

	private int ASSIGNED;
    private String STATUS;
    private int project_id; // 프로젝트 id
    private int user_id; // 유저 id
    private List<MyIssue> issues; // 이슈 목록

}
