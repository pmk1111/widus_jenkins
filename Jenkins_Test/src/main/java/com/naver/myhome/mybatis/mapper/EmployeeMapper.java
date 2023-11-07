package com.naver.myhome.mybatis.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

@Mapper
public interface EmployeeMapper {
	// 주영 START
	public Employee getEmplyeeInfoById(User user);
	public int insert(Employee employee);
	// 주영 END
	
	//mk for chat
	public int getEmployeeId(int userId);
	
	public List<Employee> getEmployeeListForChat(int userId);
	
} 

