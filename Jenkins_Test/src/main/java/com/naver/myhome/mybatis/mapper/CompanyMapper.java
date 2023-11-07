package com.naver.myhome.mybatis.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.User;

@Mapper
public interface CompanyMapper {

	public Company selectByDomain(String domain);

	public int insert(Company company);

	public User isId(String UserEmail);

	public Company selectByMail(String email);

	public Company selectCompanyByUser(User user);
	
} 

