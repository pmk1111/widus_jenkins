package com.naver.myhome.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Documents  {
	private int userId;
	private String keyword;
	private String name;
	private int issueId;
	private String subject;
	private String originalName;
	private String saveName;
	private long fileSize;
	private Date createdAt;
}



