package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.MyIssue;
import com.naver.myhome.domain.Mytotalwork;

public interface MyIssueService {

	public List<MyIssue> getAllIssuesByProjectId(int id, int sessionId, String search_word);

}
