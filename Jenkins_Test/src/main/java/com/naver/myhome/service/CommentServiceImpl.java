package com.naver.myhome.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Comment;
import com.naver.myhome.mybatis.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService{
	
	private CommentMapper mapper;
	
	public CommentServiceImpl(CommentMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<Comment> getCommentList(int issue_id) {
		return mapper.getCommentList(issue_id);
	}
	
	@Override
	public int commentAdd(Comment comment) {
		return mapper.commentAdd(comment);
	}
	
	@Override
	public int commentUpdate(Comment comment) {
		return mapper.commentUpdate(comment);
	}

	@Override
	public int commentDelete(int commentId) {
		return mapper.commentDelete(commentId);
	}



}
