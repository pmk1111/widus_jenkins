package com.naver.myhome.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.MyIssue;
import com.naver.myhome.domain.Mytotalwork;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.MyIssueService;
import com.naver.myhome.service.MytotalworkService;

@Controller
@RequestMapping(value = "/total")
public class MytotalworkController {

	
	private static final Logger logger = LoggerFactory.getLogger(MytotalworkController.class);

	private MytotalworkService myTotalWorkService;
	private MyIssueService myIssuseService;
	
	@Autowired
	public MytotalworkController(MytotalworkService myTotalWorkService, MyIssueService myIssuseService) {
	
		this.myTotalWorkService = myTotalWorkService;
		this.myIssuseService = myIssuseService;
	}
	
	
	@GetMapping(value = "/mywork")
	public ModelAndView myTotalWorks(ModelAndView mv, HttpServletRequest request, Principal principal,
			@RequestParam(value="search_word" , defaultValue="", required=false) String search_word,
			@AuthenticationPrincipal User customUser
	   ) {
		
		int sessionId = customUser.getId();
		
		List<Mytotalwork> projectList = myTotalWorkService.getSearchList(sessionId, search_word);
		
	    for (Mytotalwork project : projectList) {
	        List<MyIssue> issueList = myIssuseService.getAllIssuesByProjectId(project.getID(), sessionId, search_word);
	        project.setIssues(issueList);
	    }
		
	    logger.info("프로젝트리스트 : " + projectList);
		
		mv.addObject("myTotalWorks" ,projectList);
		mv.addObject("search_word",search_word);
	   
		mv.setViewName("total/mywork");
		
		return mv;
		
	}

	/*
	 * @ResponseBody
	 * @GetMapping("/mywork") public List<Mytotalwork>
	 * searchMyTotalWork(@RequestParam String searchtitle) { return
	 * myTotalWorkService.searchMyTotalWork(searchtitle); }
	 */
}
