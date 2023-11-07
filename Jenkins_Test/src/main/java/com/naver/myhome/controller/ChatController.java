package com.naver.myhome.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.domain.Chat;
import com.naver.myhome.domain.ChatRoom;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.ChatRoomService;
import com.naver.myhome.service.ChatService;
import com.naver.myhome.service.EmployeeService;
import com.naver.myhome.service.UserService;

@Controller
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	private UserService userService;
	private EmployeeService employeeService;
	private ChatService chatService;
	private ChatRoomService chatRoomService;

	@Autowired
	public ChatController(EmployeeService employeeService, UserService userService,
			ChatRoomService chatRoomService, ChatService chatService) {
		this.employeeService = employeeService;
		this.userService = userService;
		this.chatService = chatService;
		this.chatRoomService = chatRoomService;
	}


	@RequestMapping(value = "/chatView", method = RequestMethod.GET)
	public String login_ok(Model m, Principal principal,HttpServletRequest request) {
		int end = request.getRequestURL().lastIndexOf("/");
		String url = request.getRequestURL().substring(7, end);

		m.addAttribute("url",url);
		m.addAttribute("name", principal.getName());
		return "chat/chat";
	}
	
	@GetMapping("get-not-read-cnt")
	@ResponseBody
	public int getNotReadCnt(Principal principal){
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		
		int employeeId = employeeService.getEmployeeId(userId);		
		int notReadCnt = chatRoomService.getNotReadCnt(employeeId);
		
		return notReadCnt;
	}

	@GetMapping("/get-chat-employee-list")
	@ResponseBody
	public List<Employee> getChatList(Principal principal){
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		
		List<Employee> employeeList = employeeService.getEmployeeListForChat(userId);

		return employeeList;
	} 
	
	@GetMapping("/get-chat-room-list")
	@ResponseBody
	public List<ChatRoom> getChatRoomList(Principal principal){
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		
		int employeeId = employeeService.getEmployeeId(userId);
		
		List<ChatRoom> chatRoomList = chatRoomService.getChatRoomList(employeeId);

		return chatRoomList;
	}
	
	@PostMapping("/create-room")
	@ResponseBody
	public boolean createRoom(@RequestParam int participant, Principal principal) {
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		int employeeId = employeeService.getEmployeeId(userId);
		
		ChatRoom chatRoom = chatRoomService.getChatRoomInfo(employeeId, participant);
		
		int getResult=0;
		if(chatRoom == null) {
			getResult = chatRoomService.createChatRoom(employeeId, participant);
		}
		
		boolean result = false;
		if(getResult == 1) {
			result = true;
		} else if(getResult == 0) {
			result = false;
		}
		
		return result;
	}
	
	@GetMapping("/get-room-num")
	@ResponseBody
	public int getRoomNum(@RequestParam int participant, Principal principal) {
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
				
		int employeeId = employeeService.getEmployeeId(userId);
		
		ChatRoom chatRoom = chatRoomService.getChatRoomInfo(employeeId, participant);
		int selectedRoomNum = chatRoom.getId();
		return selectedRoomNum;
	}
	
	@GetMapping("/get-room-info")
	@ResponseBody
	public ChatRoom getRoomInfo(@RequestParam int selectedRoomNum) {
		ChatRoom chatRoom = chatRoomService.getChatRoomInfoById(selectedRoomNum);
		
		return chatRoom;
	}
	
	@PostMapping("/update-read-cnt")
	@ResponseBody
	public boolean updateReadCnt(@RequestParam int selectedRoomNum, Principal principal) {
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
				
		int employeeId = employeeService.getEmployeeId(userId);
		
		ChatRoom chatRoom = chatRoomService.getChatRoomInfoById(selectedRoomNum);
		int notRead = chatRoom.getNot_read();
		int resentSender = chatRoom.getResent_sender();
		
		boolean result = false;
		if(notRead == 1 && resentSender != employeeId) {
			chatRoomService.updateReadCnt(selectedRoomNum);
			result = true;
		} else if(notRead == 0) {
			result = false;
		}
		return result;
	}
	
	@GetMapping("/get-chat-list")
	@ResponseBody
	public List<Chat> getChatList(@RequestParam int msgTo, Principal principal){
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
				
		int employeeId = employeeService.getEmployeeId(userId);
		
		ChatRoom chatRoom = chatRoomService.getChatRoomInfo(employeeId, msgTo);
		int selectedRoomNum = chatRoom.getId();
		
		int resentSender = chatRoom.getResent_sender();
		int notRead = chatRoom.getNot_read();
		
		if(resentSender != employeeId && notRead == 1) {
			chatRoomService.updateReadCnt(selectedRoomNum);
		}
		
		List<Chat> chatList = chatService.getChatList(selectedRoomNum);
		
		return chatList;
		
	}
	
	@GetMapping("/get-chat-list-by-id")
	@ResponseBody
	public List<Chat> getChatList(@RequestParam int selectedRoomNum){

		List<Chat> chatList = chatService.getChatList(selectedRoomNum);
		
		return chatList;
		
	}
	
	@PostMapping("/insert-chat")
	@ResponseBody
	public boolean insertChat(Principal principal, @RequestParam String resultText, @RequestParam int msgTo) {
		
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		 
		int employeeId = employeeService.getEmployeeId(userId);		
		ChatRoom chatRoom = chatRoomService.getChatRoomInfo(employeeId, msgTo);
		int selectedRoomNum = chatRoom.getId();		

		int sqlResult = chatService.insertChat(resultText, selectedRoomNum, employeeId, msgTo);
		
		boolean result = false;
		if(sqlResult == 1) {
			result = true;
			chatRoomService.updateResentContent(resultText, selectedRoomNum, employeeId);
		} else {
			result = false;
		}
		
		return result;
	}
}
