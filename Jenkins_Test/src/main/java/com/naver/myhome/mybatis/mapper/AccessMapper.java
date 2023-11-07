package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Access;

@Mapper
public interface AccessMapper {

	

	List<Access> getAccesslist();


	

}
