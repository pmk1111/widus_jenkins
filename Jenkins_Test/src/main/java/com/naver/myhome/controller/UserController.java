package com.naver.myhome.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.MentionUser;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.EmployeeService;
import com.naver.myhome.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
   private static final Logger logger = LoggerFactory.getLogger(UserController.class);


   
   private PasswordEncoder passwordEncoder;
   private EmployeeService employeeService;
   private UserService userService;
   //지니
   @Value("${my.savefolder}")
   private String savefolder;
   @Autowired
   public UserController(UserService userservice,EmployeeService employeeService, PasswordEncoder passwordEncoder) {
      this.userService = userservice;
      this.employeeService = employeeService;
      this.passwordEncoder= passwordEncoder;
   }
   
 //지니
   @GetMapping(value = "/profile")
   public ModelAndView userUpdate(Principal principal, ModelAndView mv, User user) {
      String email = principal.getName();
      System.out.println("----------------------------------------------------"+email);


      user= userService.userInfo(email);
      System.out.println("----------------------------------------------------"+user);
      mv.addObject("userinfo",user);
      mv.setViewName("user/profile");

      return mv;
   } 


   @PostMapping(value = "/update-process")
   public String userUpdate(User user, Model model, HttpServletRequest request,Principal principal,String check,
	         RedirectAttributes rattr, @AuthenticationPrincipal User user2) throws IllegalStateException, IOException{
   
   //파일업로드
         MultipartFile uploadfile = user.getUploadfile();  

         if(check !=null && !check.equals("")) {
            System.out.println("기존파일");
            user.setPicOriginal(check);
         } else {
            if(uploadfile !=null && !uploadfile.isEmpty()) {
               System.out.println("파일 변경");
               String fileName = uploadfile.getOriginalFilename();
               user.setPicOriginal(fileName);

               String fileDBname = fileDBname(fileName, savefolder);
               System.out.println("파일DB이름은 " + fileDBname );

               uploadfile.transferTo(new File(savefolder + fileDBname));
               System.out.println("transferTo path =" + savefolder + fileDBname );

               user.setPic(fileDBname);

            }
            else { 
               System.out.println("초기화");
               user.setPic(""); //파일 초기화
               user.setPicOriginal(""); //오리지널 초기화
            }
         }


      int result = userService.update(user);
      user2.setPic(user.getPic());
   
   System.out.println(result);
   if (result > 0) {
      rattr.addFlashAttribute("result", "success");
      return "redirect:/user/profile";
   } else {
      model.addAttribute("url", request.getRequestURL());
      model.addAttribute("message", " 업데이트 되지 않았습니다.");
      return "error/error";
   }


}



   private String fileDBname(String fileName, String savefolder) {//DB저장소 폴더 날짜 생성
      Calendar c = Calendar.getInstance();
      int year = c.get(Calendar.YEAR);
      int month = c.get(Calendar.MONTH);
      int date = c.get(Calendar.DATE);

      //폴더 생성
      String homedir = savefolder + "/" + year + "-" + month + "-" + date;
      System.out.println(homedir);
      File path1 = new File(homedir);
      if(!(path1.exists())) {
         path1.mkdir();   //새로운 폴더 생성
      }

      //난수 구하기
      Random r = new Random();
      int random = r.nextInt(1000000000);

      //확장자 구하기 시작 */
      int index = fileName.lastIndexOf(".");
      System.out.println("index = " + index);

      String fileExtension = fileName.substring(index + 1);
      System.out.println("fileExtension = " + fileExtension);
      //확장자 구하기 끝 */

      //새로운 파일명
      String refileName = "bbs" + year + month + date + random + "." + fileExtension;
      System.out.println("refileName = " + refileName);      


      //오라클 디비에 저장될 파일명
      String fileDBname = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
      System.out.println("fileDBName = " + fileDBname);
      return fileDBname;
   }


   @GetMapping(value = "/change-pwd" )
   public String changePwd(Principal principal, Model model) {
      if (principal != null) {
         String email = principal.getName();
         System.out.println("체인지페이지========================"+email);
         model.addAttribute("email", email);
         return "user/change-pwd";
      } else {
         return "redirect:/user/login"; 
      }
   }

   //비밀번호 변경
   @PostMapping(value = "/check-pwd")
   @ResponseBody
   public int checkPwd(Principal principal,
         @RequestParam("usedPwd") String usedPwd) throws Exception {
      String email = principal.getName();
      System.out.println(email);
   
      int result = userService.checkPwd(usedPwd, email);

      
      return result;
   }



   @PostMapping(value="/update-pwd" )
   public String updatePwd(@RequestParam("userEmail") String email,  @RequestParam("newPwd") String newPwd,
          HttpSession session){
      String encPassword = passwordEncoder.encode(newPwd);
      userService.updatePwd(email,encPassword);
      session.invalidate();
      

      return "redirect:/user/login";
   }


         
    @GetMapping(value= "/delete")
    public String userDelete(User user, HttpSession session,Principal principal) {
   
    String email = principal.getName();           
    userService.delete(email);
    
    session.invalidate();
    
    
    return "redirect:../../myhome/";
    }
  
    //가입대기 회원 로그인시 보여지는 페이지
    @GetMapping(value = "/wait-approve")
    public String waitApprove() {
    	
    	return "user/wait-approve";
    }
    
   
    //이용중지 회원 로그인시 보여지는 페이지
    @GetMapping(value = "/stop-employee")
    public String stopEmployee() {
    	         
    	return "user/stop-employee";
    
    }
   
    @ResponseBody
    @PostMapping(value = "/cancel-join")
    public int cancelJoin(@AuthenticationPrincipal User user  ) {
    	
    	int id = user.getId();
    	System.out.println("컨트롤러 캔슬조인========"+id);
    	int cancelJoin = userService.backInvited(id); 
    	System.out.println(cancelJoin);
    	
       
    	return cancelJoin;
    }
      
   //지니 끝
    
    //혜원
    @PostMapping("/issue-mention")
    @ResponseBody
    public List<MentionUser> mentionUsers (@RequestBody String requestData,HttpSession session,@AuthenticationPrincipal User user) {
		int userId = user.getId();
        String name = extractName(requestData);
        int projectId = (int) session.getAttribute("projectId");
        System.out.println("project id:"+projectId);
        System.out.println("name:"+name);


     
        
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("projectId", projectId);
        parameters.put("name", name);
		parameters.put("userId", userId);

        return userService.mentionUser(parameters);



    }

    private String extractName(String requestData) {
        // 정규 표현식을 사용하여 "@"로 시작하고 이름 부분을 추출
        Pattern mentionPattern = Pattern.compile("@[\\p{L}]+");
        System.out.println("requestData: " + requestData);
        Matcher matcher = mentionPattern.matcher(requestData);

        StringBuilder names = new StringBuilder();

        while (matcher.find()) {
            String mention = matcher.group();
            // 특수문자를 제거하여 이름만 추출
            String name = mention.replaceAll("[^\\p{L}]+", "");
            names.append(name).append(" ");
        }
        System.out.println("names: " + names.toString());
        return names.toString().trim();

    }
    //혜원끝

   
   //주영
   @GetMapping("/join")
   public String join() {
   return "user/join";
   }
   
   @GetMapping("/joinProcess")
   public String joinProcess(User user) {
   return "user/joinProcess";
   }

   @GetMapping("/confirm")
   public String confirm() {
   return "user/confirm";
   }
   
   @PostMapping("/create-company-id")
   public String createCompanyId() {
      return "user/create-company-id";
   }
   
   // 이메일 확인
   @ResponseBody
   @PostMapping("/check-email")
   public int checkEmail (String email) {
      
     int checkEmail = userService.selectByMail(email);
     if(checkEmail == 0) {
       return 0;
     } 
       return 1;
   }
   
   // 회원가입
   @ResponseBody
   @PostMapping("/save-user")
   public int saveUser(User user) {
      
     int checkEmail = userService.insert(user);
     
     if(checkEmail == 0) {
       return 0;
     } 
       return 1;
   }
   
   // 이메일 발송
    @Async
    @ResponseBody
    @PostMapping("/send-mail-auth-code")
    public Integer sendMailAuthCode(String email, HttpSession session) throws Exception {

        // 난수(인증번호) 생성
        Random random = new Random();
        int verificationCode = 100000 + random.nextInt(900000); // 6자리 난수 생성

        // 이메일로 인증번호 전송
        String senderEmail = "wndudajt@naver.com"; //  이메일 주소
        String senderPassword = "rlawndud1234@"; //  이메일 비밀번호

        String subject = "이메일 인증 번호";
        String body = "인증 번호는 다음과 같습니다: " + verificationCode;
        System.out.println(email);
         
        try {
           Properties props = new Properties();
           props.put("mail.smtp.host", "smtp.naver.com");
           props.put("mail.smtp.port", "465");
           props.put("mail.smtp.auth", "true");
           props.put("mail.smtp.ssl.enable", "true");
           props.put("mail.smtp.ssl.trust", "smtp.naver.com");
           props.put("mail.smtp.ssl.protocols", "TLSv1.2");

            Session mailSession = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail, senderPassword);
                }
            });

            Message message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
            
            session.setAttribute("verificationCode", verificationCode);
            
            return 0;
                  
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return 1;
    }  
    
    // 회원가입 성공
    @PostMapping("/check-auth-code")
    @ResponseBody
    public String joinSuccess(User user,HttpSession session) {
       
       int userAuthCode = user.getAuthNum();
       int sessionAuthCode = (int)session.getAttribute("verificationCode");
       String resultCd = "";
       
       System.out.println("1 ==> "+userAuthCode);
       System.out.println("2 ==> "+sessionAuthCode);
       
       
       
       if(sessionAuthCode == userAuthCode || userAuthCode == 0) {
          System.out.println(user.toString());
          String encPassword = passwordEncoder.encode(user.getPassword());
          user.setPassword(encPassword);
          userService.insert(user);
          
          resultCd = "0";
       }else {
          resultCd = "1";
       }
       
        return resultCd;
    }
    
    // 로그인 페이지
    @GetMapping("/login")
    public String login(Model mv, HttpSession session) {
    	mv.addAttribute("loginfail", session.getAttribute("loginfail"));//세션에 저장된 값을 한 번만 실행될 수 있도록 mv에 저장합니다
        session.removeAttribute("loginfail");
   	return "user/login";
   }

    
   
    @GetMapping("/loginSuccess")
    public String loginSuccess(@AuthenticationPrincipal User user, RedirectAttributes redirectAttrs) {
       System.out.println(user.toString());
     
       
       Employee emp = employeeService.getEmplyeeInfoById(user);
       
       if(emp == null) {               //emp 테이블에 정보가 없다면
          return "user/confirm";
       }else if(emp.getStatus() ==1){
    	   return "user/stop-employee";
       }else if(user.getCompanyStatus()=="0") {
    	   return "user/wait-approve";
       }
       
       else //emp 테이블에 정보가 있다면      
       
          return "redirect:/mainboard/my-dashboard";
       }
    

    @GetMapping("/login-fail")
    public String loginFail() {
       return "user/login"; // 로그인 페이지 반환
    }

}