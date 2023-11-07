package com.naver.myhome.service;

import java.util.List;
import java.util.Map;

import com.naver.myhome.domain.MentionUser;
import com.naver.myhome.domain.User;

public interface UserService {
	

	// 주영
	public int insert(User user);

	public int getUserId(String eMail);

	public int selectByMail(String eMail);

	public User getEmplyeeInfoById(User user);

	public int updateUserInfo(User user);

	// 지니
	   
	public User userInfo(String email);

	public int isId(String email);

	public void updatePwd(String email, String newPwd);



	public int checkPwd(String usedPwd, String email);

	public int update(User user);

	public void delete(String email);
	
	public int backInvited(int id);
	//지니 끝
	
	//혜원

	public List<MentionUser> mentionUser(Map<String, Object> parameters);
	public String getAssignUser(int assignedValue);
	public String getCreateUser(int userId);
   //혜원끝

	//mk
	public String getEmail(int userId);


}
