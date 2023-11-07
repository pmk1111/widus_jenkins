package com.naver.myhome.controller;




import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.naver.myhome.domain.Notify;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.NotifyService;



@Controller
public class NotificationController {


    private NotifyService notifyService; // 알림 데이터를 처리하는 서비스 클래스
    
    private static final Logger logger = LoggerFactory.getLogger(NotificationController.class);

    
	@Autowired
	public NotificationController(NotifyService NotifyService) {
	
		this.notifyService = NotifyService;
		
	}
  
    @GetMapping("/getNotifications")
    @ResponseBody
    public List<Notify> NotifyService(ModelAndView mv, HttpServletRequest request,@AuthenticationPrincipal User user) {
         int userId = user.getId();
		List<Notify> notify = notifyService.getNotificationsForUser(userId);
		
		
     
	
		return notify;
    }
    @GetMapping("/updateNotifications")
    @ResponseBody
    public void updateNotifications(@RequestParam("notificationId") int notificationId,@AuthenticationPrincipal User user) {
        int userId = user.getId();
      
        notifyService.updatedNotifications(userId,notificationId);
    }
    
    @GetMapping("/deleteNotifications")
    @ResponseBody
    public void deleteNotifications(@RequestParam("notificationId") int notificationId,@AuthenticationPrincipal User user) {
     
        notifyService.deleteNotifications(notificationId);
    }
    
    @GetMapping("/getUnreadNotificationCount")
    @ResponseBody
    public int getUnreadNotificationCount(@AuthenticationPrincipal User user) {
        // 여기에서 실제로 아직 읽지 않은 알림의 개수를 조회하고 반환
    	 int userId = user.getId();
        int unreadCount = notifyService.getUnreadNotificationCount(userId);
        return unreadCount;
    }


    
    
}
