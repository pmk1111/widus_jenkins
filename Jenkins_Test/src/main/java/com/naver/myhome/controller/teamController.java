package com.naver.myhome.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.domain.Team;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.ProjectService;
import com.naver.myhome.service.TeamService;

@Controller
@RequestMapping(value = "/team")
public class teamController {
	
	// JJ's Controller
	private ProjectService projectService;
	private TeamService teamService;
	
	private static final Logger logger = LoggerFactory.getLogger(teamController.class);
	
	@Autowired
	public teamController(TeamService teamService, ProjectService projectService) {
		this.teamService = teamService;
		this.projectService = projectService;
	}
	
	@ResponseBody
	@PostMapping(value = "/team-list") 
	public Map<String, List<Team>> teamList(@RequestParam(name = "projectId", required = true) int projectId,
											@AuthenticationPrincipal User customUser ) {
		
		int sessionId = customUser.getId();
		
		logger.info("팀리스트" + sessionId);
		
		List<Team> team = teamService.getTeam(projectId, sessionId);
	  
		logger.info("팀 가져오는지 " + team); 
		
		Map<String, List<Team>> data = new HashMap<>();
		data.put("team", team);
	  
		return data;
	  
	}
	 
	@ResponseBody
	@PostMapping(value = "/invite-team")
	public Map<String, List<Team>> inviteTeam(@RequestParam(name = "projectId", required = true) int projectId){
		
		List<Team> invitedUser = teamService.inviteTeam(projectId);
		
		Map<String, List<Team>> data = new HashMap<>();
		data.put("invitedUser", invitedUser);
		
		return data;
	}
	
	@ResponseBody
	@PostMapping(value="/insert-team")
	public void insertTeam(@RequestParam(name="empIds[]") List<Integer> empIds,
		            	   @RequestParam(name="projectId") int projectId,
		            	   @AuthenticationPrincipal User customUser) {
		
		logger.info("empIds = " + empIds.size());
		
		int sessionId = customUser.getId();
		
	    for (int empId : empIds) {
	    	logger.info("empid = " + empId);
	        teamService.insertTeam(empId, projectId, sessionId);
	    }

	}
	
	@ResponseBody
	@DeleteMapping("/exit")
	public void exitTeam(@RequestParam(name = "projectId") int projectId,
						 @AuthenticationPrincipal User customUser) {
		
		int sessionId = customUser.getId();

		int employeeId = projectService.getEmpId(sessionId);
		
		teamService.exitTeam(projectId, employeeId);
		
		if(teamService.teamCount(projectId) == 0) {
			projectService.deleteProject(projectId);
		}
		
	}
	
	@ResponseBody
	@DeleteMapping("/fire-team")
	public void fireTeam(@RequestParam(name = "projectId") int projectId, 
				         @RequestParam(name = "empId") int empId) {
		
		logger.info("fireemp : " + empId); 
		
		teamService.exitTeam(projectId, empId);
		
	}
	
	@ResponseBody
	@PostMapping(value="/grant-admin")
	public void grantAdmin(@RequestParam(name = "projectId") int projectId, 
	         			   @RequestParam(name = "empId") int empId,
	         			   @AuthenticationPrincipal User customUser) {
		
		int sessionId = customUser.getId();
		
	    teamService.grantAdmin(empId, projectId, sessionId);
	}
	
	@ResponseBody
	@PostMapping(value="/revoke-admin")
	public void revokeAdmin(@RequestParam(name = "projectId") int projectId, 
	         			   @RequestParam(name = "empId") int empId,
	         			   @AuthenticationPrincipal User customUser) {
		
		int sessionId = customUser.getId();
		
	    teamService.revokeAdmin(empId, projectId, sessionId);
	}
	
	// JJ's Controller End

}
