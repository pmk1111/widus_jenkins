package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Chat;

public interface ChatService {
	
	public List<Chat> getChatList(int selectedRoomNum);

	public int insertChat(String resultText, int selectedRoomNum, int employeeId, int msgTo);

}
