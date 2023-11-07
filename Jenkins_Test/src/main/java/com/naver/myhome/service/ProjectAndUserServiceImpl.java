package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.ProjectAndUser;
import com.naver.myhome.mybatis.mapper.ProjectAndUserMapper;

@Service
public class ProjectAndUserServiceImpl implements ProjectAndUserService{

	private ProjectAndUserMapper mapper;
	
	@Autowired
	public ProjectAndUserServiceImpl(ProjectAndUserMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<ProjectAndUser> getProjectAndUserInfo(int projectId) {
		return mapper.getProjectAndUserInfo(projectId);
	}
	
}
