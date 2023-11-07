package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.MyIssue;
import com.naver.myhome.domain.Mytotalwork;

@Mapper
public interface MyIssueMapper {

	List<MyIssue> getAllIssuesByProjectId(int id, int sessionId, String search_word);

}
