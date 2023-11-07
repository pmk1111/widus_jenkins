package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.ChatRoom;

@Mapper
@Repository
public interface ChatRoomMapper {
	
	public int getNotReadCnt(int employeeId);
	
	public ChatRoom getChatRoomInfo(int employeeId, int participant);
	
	public ChatRoom getChatRoomInfoById(int selectedRoomNum);
	
	public List<ChatRoom> getChatRoomList(int employeeId);
	
	public int createChatRoom(int employeeId, int participant);
	
	public void updateResentContent(String resultText, int selectedRoomNum, int employeeId);
	
	public void updateReadCnt(int selectedRoomNum);
}
