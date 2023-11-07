package com.naver.myhome.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Bookmark;

@Mapper
public interface BookmarkMapper {

	int addBookmark(int userId, int issueId);

	int deleteBookmark(int userId, int issueId);

	int checkBookmark(int userId, int issueId);
	
	int countBookmark(int userId);
	
	public List<Bookmark> getSearchList(Map<String, Object> map);

}
