package com.naver.myhome.service;

import java.util.List;
import java.util.Map;

import com.naver.myhome.domain.Access;
import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

public interface AdminService {
	
	public Company companyinfo(String email);

	String companyName(int companyId);
	
	String companyDomain(int companyId);
	
	public String companyZipcode(int companyId);
	
	public String companyAddress(int companyId);

	public String companyDetailAddress(int companyId);

	public int updateName(int companyId, String companyName);

	public int updateDomain(int companyId, String companyDomain);
	
	public int updateZipcode(int companyId, String companyZipcode);

	public int updateAddress(int companyId, String companyAddress);
	
	public int updateDetailAddress(int companyId, String companyDetailAddress);

	public List<User> waitUser(int companyId);

	public void approveUser(int userId, int companyId);
	
	public void addEmployee(int userId, int companyId);

	public void rejectUser(int userId, int companyId);
	
	public List<Employee> findEmployee(int companyId);
	
	public int stopEmployeeStatus(int employeeId);

	public void updateAuth(int employeeId);
	
	public void updateSecurity(int employeeId);

	public int countUser( int companyId);
	
	public int countStop (int companyId);
	
	public int countEmp (int companyId);

	public List<Employee> getStopList(int companyId);

	public void backEmp(int empId);
	
	public int companyId(String email);
	
	public void updateEmpInfo(Employee employee);

	public void updateUserInfo(Employee employee);
	
	public Employee employeeInfo(int empId);
	
	// 혜원 
	public List<Access> getAccesslist();
	
	public List<Access> getDayCount();

	public List<Access> getMonthCount();

	

}
