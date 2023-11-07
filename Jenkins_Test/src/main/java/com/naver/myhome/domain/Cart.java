package com.naver.myhome.domain;

import javax.websocket.Session;

import lombok.Data;

@Data
public class Cart {
	private Session session;
	private String roomNum;
}
