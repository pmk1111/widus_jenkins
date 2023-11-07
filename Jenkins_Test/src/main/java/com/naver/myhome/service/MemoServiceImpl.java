package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Memo;
import com.naver.myhome.mybatis.mapper.MemoMapper;

@Service
public class MemoServiceImpl implements MemoService{

	private MemoMapper mapper;
	
	@Autowired
	public MemoServiceImpl(MemoMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<Memo> getMemoContent(int userId) {
		return mapper.getMemoContent(userId);
	}
	
	@Override
	public void memoInsert(String memoTxt, int userId) {
		mapper.memoInsert(memoTxt, userId);
		
	}

	@Override
	public int memoUpdate(String memoTxt, int userId) {
		return mapper.memoUpdate(memoTxt, userId);
	}

	@Override
	public int memoDelete(int userId) {
		return mapper.memoDelete(userId);
	}

	
}
