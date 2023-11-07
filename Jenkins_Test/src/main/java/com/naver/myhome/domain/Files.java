package com.naver.myhome.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Files {
	private int id;
	private int issue_id;
	private String original_name;
	private String save_name;
	private long file_size;
	private int delete_yn;
	private String created_at;
	private String deleted_at;
	
	@Override
	public String toString() {
		return "Files [id=" + id + ", issue_id=" + issue_id + ", original_name=" + original_name + ", save_name="
				+ save_name + ", file_size=" + file_size + ", delete_yn=" + delete_yn + ", created_at=" + created_at
				+ ", deleted_at=" + deleted_at + "]";
	}	
}
