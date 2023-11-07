package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Team;

@Mapper
@Repository
public interface TeamMapper {

	public void addTeam(int projectId, int employeeId);
	
	public int teamCount(int projectId);

	public List<Team> getTeam(int projectId, int sessionId);

	public List<Team> inviteTeam(int projectId);

    public List<Integer> findId(List<String> userNames);

	public void insertTeam(int empId, int projectId, int sessionId);

	public Integer getAuth(int sessionId, int projectId);

	public void exitTeam(int projectId, int employeeId);

	public void grantAdmin(int empId, int projectId, int sessionId);

	public void revokeAdmin(int empId, int projectId, int sessionId);

}
