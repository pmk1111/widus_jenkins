package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.MyIssue;
import com.naver.myhome.domain.Mytotalwork;
import com.naver.myhome.mybatis.mapper.MyIssueMapper;

@Service
public class MyIssueServiceImpl implements MyIssueService{
	
	private MyIssueMapper dao;
	
	@Autowired
	public MyIssueServiceImpl (MyIssueMapper dao) {
		this.dao  = dao;
	}

	@Override
	public List<MyIssue> getAllIssuesByProjectId(int id, int sessionId, String search_word) {
		return dao.getAllIssuesByProjectId(id, sessionId, search_word);
	}

	


}
