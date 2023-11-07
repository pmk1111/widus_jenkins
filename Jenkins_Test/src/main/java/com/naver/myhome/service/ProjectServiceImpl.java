package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Project;
import com.naver.myhome.domain.RecentStatus;
import com.naver.myhome.mybatis.mapper.ProjectMapper;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	private ProjectMapper mapper;
	
	@Autowired
	public ProjectServiceImpl(ProjectMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public int insertProject(Project project) {
		return mapper.Insert(project);
	}
	
	@Override
	public List<Project> getAllProjectList(int employeeId) {
		return mapper.getAllProjectList(employeeId);
	}
	
	@Override
	public List<Project> getFavoritProjectList(int employeeId) {
		return mapper.getFavoritProjectList(employeeId);
	}

	@Override
	public List<Project> getPartProjectList(int employeeId) {
		return mapper.getPartProjectList(employeeId);
	}
	
	@Override
	public Project getDetail(int id) {
		return mapper.getDetail(id);
	}
	
	@Override
	public int updateColor(int id, String color) {
		return mapper.updateColor(id, color);
	}

	@Override
	public Integer checkFavorite(int projectId, int employeeId) {
		return mapper.checkFavorite(projectId, employeeId);
	}

	@Override
	public void addFavorite(int projectId, int employeeId) {
		mapper.addFavorite(projectId, employeeId);
	}

	@Override
	public void removeFavorite(int projectId, int employeeId) {
		mapper.removeFavorite(projectId, employeeId);
	}

	@Override
	public Integer getDoneCount(int projectId) {
		return mapper.getDoneCount(projectId);
	}

	@Override
	public Integer getUpdateCount(int projectId) {
		return mapper.getUpdateCount(projectId);
	}

	@Override
	public Integer getCreateCount(int projectId) {
		return mapper.getCreateCount(projectId);
	}

	@Override
	public Integer getCriticalCount(int projectId) {
		return mapper.getCriticalCount(projectId);
	}

	@Override
	public Integer todoCount(int projectId) {
		return mapper.todoCount(projectId);
	}

	@Override
	public Integer progressCount(int projectId) {
		return mapper.progressCount(projectId);
	}

	@Override
	public Integer allDoneCount(int projectId) {
		return mapper.allDoneCount(projectId);
	}

	@Override
	public Integer resolveCount(int projectId) {
		return mapper.resolveCount(projectId);
	}
	
	@Override
	public Integer allCriticalCount(int projectId) {
		return mapper.allCriticalCount(projectId);
	}

	@Override
	public Integer highCount(int projectId) {
		return mapper.highCount(projectId);
	}

	@Override
	public Integer middleCount(int projectId) {
		return mapper.middleCount(projectId);
	}

	@Override
	public Integer lowCount(int projectId) {
		return mapper.lowCount(projectId);
	}

	@Override
	public void deleteProject(int projectId) {
		mapper.deleteProject(projectId);
	}

	@Override
	public int getEmpId(int sessionId) {
		return mapper.getEmpId(sessionId);
	}

	@Override
	public void modifyProject(String color, String title, String subtitle, int projectId, int sessionId) {
		mapper.modifyProject(color, title, subtitle, projectId, sessionId);
	}

	@Override
	public List<RecentStatus> getRecentStatus(int projectId) {
		return mapper.getRecentStatus(projectId);
	}

}
