package com.naver.myhome.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Company {
	private int id;
	private int userId;
	private String name;
	private String domain;
	private String RegistrationNo;		//추가되었음
	private Date created_at;
	private String zipcode;
	private String address;
	private String detail_address;
}
