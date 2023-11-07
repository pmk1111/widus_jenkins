package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Comment;

public interface CommentService {
	public List<Comment> getCommentList(int issue_id);

	public int commentAdd(Comment comment);
	
	public int commentUpdate(Comment comment);	
	
	public int commentDelete(int commentId);
}
