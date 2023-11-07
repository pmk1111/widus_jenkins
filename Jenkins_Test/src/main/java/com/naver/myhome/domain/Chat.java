package com.naver.myhome.domain;

import lombok.Data;

@Data
public class Chat {
	private int id;
	private int room_num;
	private int msg_from;
	private int msg_to;
	private String content;
	private String created_at;
}
