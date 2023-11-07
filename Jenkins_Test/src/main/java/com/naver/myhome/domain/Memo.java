package com.naver.myhome.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Memo {
	private int id;
	private int user_id;
	private String content;
	
	@Override
	public String toString() {
		return "Memo [memo_id=" + id + ", user_id=" + user_id + ", memo_content=" + content + "]";
	}
	
	
}
