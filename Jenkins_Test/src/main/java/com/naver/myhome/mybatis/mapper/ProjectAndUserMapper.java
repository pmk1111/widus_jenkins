package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.ProjectAndUser;

@Mapper
@Repository
public interface ProjectAndUserMapper {
	public List<ProjectAndUser> getProjectAndUserInfo(int projectId);
}
