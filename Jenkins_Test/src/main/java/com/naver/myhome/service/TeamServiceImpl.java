package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Team;
import com.naver.myhome.mybatis.mapper.TeamMapper;

@Service
public class TeamServiceImpl implements TeamService {
	
	private TeamMapper mapper;
	
	@Autowired
	public TeamServiceImpl(TeamMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public void addTeam(int projectId, int employeeId) {
		mapper.addTeam(projectId, employeeId);
	}
	
	@Override
	public int teamCount(int projectId){
		return mapper.teamCount(projectId);
	}

	@Override
	public List<Team> getTeam(int projectId, int sessionId) {
		return mapper.getTeam(projectId, sessionId);
	}

	@Override
	public List<Team> inviteTeam(int projectId) {
		return mapper.inviteTeam(projectId);
	}

	@Override
	public void insertTeam(int empId, int projectId, int sessionId) {
		mapper.insertTeam(empId, projectId, sessionId);
	}

	@Override
	public Integer getAuth(int sessionId, int projectId) {
		return mapper.getAuth(sessionId, projectId);
	}

	@Override
	public void exitTeam(int projectId, int employeeId) {
			mapper.exitTeam(projectId, employeeId);
	}

	@Override
	public void grantAdmin(int empId, int projectId, int sessionId) {
		mapper.grantAdmin(empId, projectId, sessionId);
	}

	@Override
	public void revokeAdmin(int empId, int projectId, int sessionId) {
		mapper.revokeAdmin(empId, projectId, sessionId);
	}
	
}
