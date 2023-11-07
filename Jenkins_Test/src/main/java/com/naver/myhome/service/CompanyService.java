package com.naver.myhome.service;

import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.User;

public interface CompanyService {
	public Company selectCompanyByUser(User user);
	public Company selectByDomain(String domain);
	public int insert(Company company);
	/*
	 * public Company selectByEmail(String email); public int insertCompany(Company
	 * company);
	 */
}
