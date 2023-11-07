package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Chat;
import com.naver.myhome.mybatis.mapper.ChatMapper;

@Service
public class ChatServiceImpl implements ChatService{
	
	private ChatMapper mapper;
	
	@Autowired
	public ChatServiceImpl(ChatMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<Chat> getChatList(int selectedRoomNum) {
		return mapper.getChatList(selectedRoomNum);
	}

	@Override
	public int insertChat(String resultText, int selectedRoomNum, int employeeId, int msgTo) {
		return mapper.insertChat(resultText, selectedRoomNum, employeeId, msgTo);
	}
}
