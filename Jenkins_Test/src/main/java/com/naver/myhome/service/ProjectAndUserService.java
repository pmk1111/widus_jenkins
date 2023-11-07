package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.ProjectAndUser;

public interface ProjectAndUserService {
	public List<ProjectAndUser> getProjectAndUserInfo(int projectId);
}
