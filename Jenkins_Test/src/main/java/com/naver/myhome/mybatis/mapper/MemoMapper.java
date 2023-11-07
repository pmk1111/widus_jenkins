package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Memo;

@Mapper
public interface MemoMapper {
	
	public List<Memo> getMemoContent(int userId);
	
	public void memoInsert(String memoTxt, int userId);
	
	public int memoUpdate(String memoTxt, int userId);
	
	public int memoDelete(int userId);
}
