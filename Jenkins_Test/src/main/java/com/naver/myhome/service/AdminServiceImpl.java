package com.naver.myhome.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Access;
import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;
import com.naver.myhome.mybatis.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	private AdminMapper dao;
	
	@Autowired
	public AdminServiceImpl(AdminMapper dao) {
		this.dao = dao;
	}

	//구성원 관리
	@Override
	public Company companyinfo(String email) {
		
		return dao.companyinfo(email);
	}
	
	@Override
	public String companyName(int companyId) {
		// TODO Auto-generated method stub
		return dao.companyName(companyId);
	}

	@Override
	public String companyDomain(int companyId) {
		// TODO Auto-generated method stub
		return dao.companyDomain(companyId);
	}

	@Override
	public String companyZipcode(int companyId) {
		return dao.companyZipcode(companyId);
	}
	
	@Override
	public String companyAddress(int companyId) {
		return dao.companyAddress(companyId);
	}

	@Override
	public String companyDetailAddress(int companyId) {
		return dao.companyDetailAddress(companyId);
	}
	
	@Override
	public Employee employeeInfo(int empId) {
		return dao.employeeInfo(empId);
	}

	@Override
	public void updateEmpInfo(Employee employee) {
		 dao.updateEmpInfo(employee);
	}
	
	@Override
	public void updateUserInfo(Employee employee) {
		 dao.updateUserInfo(employee);
	}
	
	//회사정보 수정
	@Override
	public int updateName(int companyId,String companyName) {
		return dao.updateName(companyId, companyName);
	}

	@Override
	public int updateDomain(int companyId, String companyDomain) {
		return dao.updateDomain(companyId, companyDomain);
	}
	
	@Override
	public int updateZipcode(int companyId, String companyZipcode) {
		return dao.updateZipcode(companyId,companyZipcode);
	}
	
	@Override
	public int updateAddress(int companyId, String companyAddress) {
		return dao.updateAddress(companyId,companyAddress);
	}
	
	@Override
	public int updateDetailAddress(int companyId, String companyDetailAddress) {
		return dao.updateDetailAddress(companyId,companyDetailAddress);
	}

	@Override
	public List<User> waitUser(int companyId) {
		return dao.waitUser(companyId);
	}

	@Override
	public void approveUser(int userId, int companyId) {
		dao.approveUser(userId, companyId);
	}
	
	@Override
	public void addEmployee(int userId, int companyId) {
		dao.addEmployee(userId, companyId);
	}

	@Override
	public void rejectUser(int userId, int companyId) {
		dao.rejectUser(userId, companyId);
	}

	@Override
	public List<Employee> findEmployee(int companyId){
		return dao.findEmployee(companyId);
	}
	
	@Override
	public int stopEmployeeStatus(int employeeId) {
		return dao.stopEmpStatus(employeeId);
	}

	@Override
	public void updateAuth(int employeeId) {
		dao.updateAuth(employeeId);
	}

	@Override 
	 public void updateSecurity(int employeeId) {
	 dao.updateSecurity(employeeId); 
	 }
	
	@Override
	public int countUser(int companyId) {
		return dao.countUser(companyId);
	}
	
	@Override
	public int countStop(int companyId) {
		return dao.countStop(companyId);
	}

	@Override
	public int countEmp(int companyId) {
		return dao.countEmp(companyId);
	}

	@Override
	public List<Employee> getStopList(int companyId) {
		return dao.getStopList(companyId);
	}

	@Override
	public void backEmp(int empId) {
		dao.backEmp(empId);
	}
	
	@Override
	public int companyId(String email) {
		return dao.companyId(email);
	}
	// 혜원
	@Override
	public List<Access> getAccesslist() {
		// TODO Auto-generated method stub
		return dao.getAccesslist();
	}

	@Override
	public List<Access> getDayCount() {
		// TODO Auto-generated method stub
		return dao.getDayCount();
	}

	@Override
	public List<Access> getMonthCount() {
		// TODO Auto-generated method stub
		return dao.getMonthCount();
	}


	
}
