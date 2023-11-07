package com.naver.myhome.domain;

import lombok.Data;

@Data
public class ChatRoom {
	private int id;
	private int create_by;
	private int participant;
	private String resent_content;
	private int resent_sender;
	private int not_read;
	private String created_at;
	private String updated_at;
	
	private String participant_name;
	private String participant_pic;
	private int other_participant_id;
}
