package com.naver.myhome.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Comment {
	private int id;
	private int issue_id;
	private String created_at;
	private int user_id;
	private String content;
	
	private String comment_user_name;
	private String comment_user_email;
	private String comment_user_pic;
	
	@Override
	public String toString() {
		return "Comment [id=" + id + ", issue_id=" + issue_id + ", created_at=" + created_at + ", user_id=" + user_id
				+ ", content=" + content + "]";
	}
	
	
	
}
