package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Memo;

public interface MemoService {
	
	public List<Memo> getMemoContent(int userId);
	
	public void memoInsert(String memoTxt, int userId);

	public int memoUpdate(String memoTxt, int userId);
	
	public int memoDelete(int userId);
}
