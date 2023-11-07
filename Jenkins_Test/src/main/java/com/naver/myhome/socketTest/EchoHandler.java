package com.naver.myhome.socketTest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
@ServerEndpoint(value = "/echo.do")
public class EchoHandler{
	private static final Map<String, List<Session>> rooms = new HashMap<>();
	//접속한 사용자의 세션 id(value)와 방 번호(key)를 저장
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
	@OnOpen
	public void onOpen(Session session) {
		String queryString = session.getQueryString();
		// 웹소켓에 접속하면, 해당 방 번호에 대한 주소값을 쿼리스트링에 포함해 보낸다.
		String roomNum = queryString.substring(queryString.indexOf("=") + 1);
		//해당 쿼리스트링의 마지막에 포함된 방 번호를 추출한다.
		
		for (Map.Entry<String, List<Session>> entry : rooms.entrySet()) {
			entry.getValue().remove(session);
		} // 이전에 참여했던 방이 있다면 현재 세션에서 제거(새로운 방에 들어왔으니 사용자 세션 값을 통해 이전 접속 이력 제거)

		if (!rooms.containsKey(roomNum)) {
			rooms.put(roomNum, new ArrayList<>());
		} // 새로운 방의 번호를 해시 맵에 넣어준다.

		rooms.get(roomNum).add(session);
		//방번호 키에 접속한 사용자의 세션 id를 넣는다
	}

	@OnMessage
	public void onMessage(String getMessage, Session session) {
		int index = getMessage.lastIndexOf(",");
		String input = getMessage.substring(0, index);
		String sender = getMessage.substring(index + 1);

		String queryString = session.getQueryString();
		String roomNum = queryString.substring(queryString.indexOf("=") + 1);
		// 메시지를 보낼 때 메시지를 보내는 주소를 쿼리스트링으로 받아와, 맨 뒤의 방 번호를 추출한다.

		int selectedRoomNum = Integer.parseInt(roomNum);
		
		List<Session> roomSessions = rooms.get(roomNum);
		//추출한 방 번호를 이용해 해당 채팅방에 접속한 사용자의 세션 id를 가져온다.
		//여기서 같은 방에 접속한 나와 상대방의 세션 아이디가 저장된다.
		if (roomSessions != null) {
			for (Session s : roomSessions) {
				if (!session.getId().equals(s.getId())) {
					//내 세션 아이디가 아닐 경우, 즉 다른 사용자일 경우 메시지를 전송
					try {
						s.getBasicRemote().sendText(sender + ">" + input);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	@OnError
	public void onError(Throwable e, Session session) {
		logger.info("error발생.");
	}

	@OnClose
	public void onClose(Session session) {

		String queryString = session.getQueryString();
		String roomNum = queryString.substring(queryString.indexOf("=") + 1);

		if (rooms.containsKey(roomNum)) {
			rooms.get(roomNum).remove(session);
			if (rooms.get(roomNum).isEmpty()) {
				rooms.remove(roomNum);
			}
		}
	}
}
