package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Team;

public interface TeamService {

	public void addTeam(int projectId, int employeeId);
	
	public int teamCount(int projectId);

	public List<Team> getTeam(int projectId, int sessionId);

	public List<Team> inviteTeam(int projectId);

	public void insertTeam(int empId, int projectId, int sessionId);

	public Integer getAuth(int sessionId, int projectId);

	public void exitTeam(int projectId, int employeeId);

	public void grantAdmin(int empId, int projectId, int sessionId);

	public void revokeAdmin(int empId, int projectId, int sessionId);

}
