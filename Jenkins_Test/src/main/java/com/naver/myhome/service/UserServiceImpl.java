package com.naver.myhome.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.MentionUser;
import com.naver.myhome.domain.User;
import com.naver.myhome.mybatis.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	private UserMapper dao;
	private PasswordEncoder passwordEncoder;


	@Autowired
	public UserServiceImpl(UserMapper dao,PasswordEncoder passwordEncoder ) {
		this.dao = dao;
		this.passwordEncoder = passwordEncoder;
	}
	//지니

	@Override
	public int isId(String email) {
		User ruser = dao.isId(email);
		return (ruser == null) ? -1 : 1;
	}


	@Override
	public User userInfo(String email) {
		return dao.isId(email);
	}

	@Override
	public int checkPwd(String usedPwd, String email) {
		User dbUser = dao.isId(email);
		int result = -1; 
		if(dbUser != null) {
			if(passwordEncoder.matches(usedPwd, dbUser.getPassword())) {
				result = 1;
			} else
				result = 0;
		}
		return result;
	}



	@Override
	public void updatePwd(String email, String newPwd) {
		dao.updatePwd(email, newPwd);

	}

	@Override
	public int update(User user) {
		return dao.update(user);
	}

	@Override
	public void delete(String email) {
		dao.delete(email);
	}

	@Override
	public int backInvited(int id) {
		return dao.backInvited(id);
	}
	//지니 끝

	//주영   

	@Override
	public int insert(User user) {

		return dao.insert(user);
	}


	@Override
	public int selectByMail(String eMail) {
		return dao.selectByMail(eMail);
	}

	@Override
	public int getUserId(String eMail) {
		// TODO Auto-generated method stub
		return dao.getUserId(eMail);
	}



	@Override
	public User getEmplyeeInfoById(User user) {
		return dao.getEmplyeeInfoById(user);
	}


	@Override
	public int updateUserInfo(User user) {
		return dao.updateUserInfo(user);
	}

	//주영 끝

	//혜원



	@Override
	public List<MentionUser> mentionUser(Map<String, Object> parameters) {
		// TODO Auto-generated method stub
		return dao.mentionUser(parameters);
	}

	@Override
	public String getCreateUser(int userId) {
		// TODO Auto-generated method stub
		return dao.getCreateUser(userId);
	}

	@Override
	public String getAssignUser(int assignedValue) {
		// TODO Auto-generated method stub
		return dao.getAssignedUser(assignedValue);
	}

	//mk
	@Override
	public String getEmail(int userId) {
		return dao.getEmail(userId);
	}
}
