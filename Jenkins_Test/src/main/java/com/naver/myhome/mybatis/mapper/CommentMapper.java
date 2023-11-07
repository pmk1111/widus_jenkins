package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Comment;

@Mapper
public interface CommentMapper {

	public List<Comment> getCommentList(int issue_id);
	
	public int commentAdd(Comment comment);
	
	public int commentUpdate(Comment comment);

	public int commentDelete(int commentId);
}
