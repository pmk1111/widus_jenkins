package com.naver.myhome.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.domain.Comment;
import com.naver.myhome.service.CommentService;
import com.naver.myhome.service.UserService;

@RequestMapping(value="comment")
@Controller
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	private UserService userService;
	private CommentService commentService;
	
	@Autowired
	public CommentController(UserService userService, CommentService commentService) {
		this.userService = userService;
		this.commentService = commentService;
	}
	
	@PostMapping("/commentList")
	@ResponseBody
	public List<Comment> getCommentList(int issue_id,
	        @RequestHeader(value = "referer", required = false) String beforeURL) {
	    
	    List<Comment> commentlist = commentService.getCommentList(issue_id);
	    System.out.println(commentlist);
	    return commentlist;
	}
	
	@PostMapping("/commentAdd")
	@ResponseBody
	public int commentAdd(Comment comment, HttpSession session, HttpServletRequest request, Principal principal) {
		
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		
		comment.setUser_id(userId);
		int result = commentService.commentAdd(comment);
		return result;
	}
	
	@PostMapping("/commentUpdate")
	@ResponseBody
	public int commentUpdate(Comment comment) {
		return commentService.commentUpdate(comment);
	}
	
	@PostMapping("/commentDelete")
	@ResponseBody
	public int commentDelete(Integer commentId) {
		return commentService.commentDelete(commentId);
				
	}
	
}
