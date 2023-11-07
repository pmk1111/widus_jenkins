package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.ChatRoom;

public interface ChatRoomService {
	
	public int getNotReadCnt(int employeeId);
	
	public ChatRoom getChatRoomInfo(int employeeId, int participant);
	
	public ChatRoom getChatRoomInfoById(int selectedRoomNum);
	
	public List<ChatRoom> getChatRoomList(int employeeId);

	public int createChatRoom(int employeeId, int participant);

	public void updateResentContent(String resultText, int selectedRoomNum, int employeeId);

	public void updateReadCnt(int selectedRoomNum);


}
