package com.naver.myhome.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.Access;
import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.AdminService;
import com.naver.myhome.task.SendMail;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    //지니
    private AdminService adminService;
    private SendMail sendMail;

    @Autowired
    public AdminController(AdminService adminService, SendMail sendMail) {
        this.adminService = adminService;
        this.sendMail = sendMail;
    }

 
    @ModelAttribute("companyId")
    public int companyId(Principal principal) {
        String email = principal.getName();
        int companyId = adminService.companyId(email);
        return companyId;
    }
    
    @ResponseBody
    @GetMapping(value = "/companyinfo")
    public ModelAndView companyInfo(ModelAndView mv, Principal principal,Company company) throws Exception {
        String email=principal.getName();
        Company companyinfo = adminService.companyinfo(email);
        mv.addObject("companyinfo",companyinfo);
        mv.setViewName("admin/company-info");
        return mv;
    }

    @ResponseBody
    @PostMapping(value = "/updateName")
    public HashMap < String, String > updateName(ModelAndView mv, @RequestParam("companyId") int companyId,
                                                                  @RequestParam(value = "companyName", defaultValue = "", required = false) String companyName, 
                                                                  @RequestParam(value = "companyDomain", defaultValue = "", required = false) String companyDomain) {
      
        HashMap < String, String > map = new HashMap < String, String > ();
        if (companyDomain.equals("")) {
            // 회사명 업데이트
            int updateName = adminService.updateName(companyId, companyName);
            System.out.print(updateName);
            if (updateName > 0) {
                // 업데이트 성공
                String afterName = adminService.companyName(companyId);;
                map.put("afterName", afterName);

                map.put("message", "회사명이 성공적으로 업데이트되었습니다.");
            } else {
                // 업데이트 실패
                map.put("error", "회사명 업데이트 중 오류가 발생했습니다.");
            }
        } else {
            int updateDomain = adminService.updateDomain(companyId, companyDomain);
            if (updateDomain > 0) {
                // 업데이트 성공
                String afterDomain = adminService.companyName(companyId);;
                map.put("afterName", afterDomain);

                map.put("message", "전용 url이 성공적으로 업데이트되었습니다.");
            } else {
                // 업데이트 실패
                map.put("error", "전용 url 업데이트 중 오류가 발생했습니다.");
            }
        }
        return map;
    }
   
    @ResponseBody
    @PostMapping(value = "/updateAddress")
    public HashMap<String, String> updateAddress(ModelAndView mv,
    												@RequestParam("companyId") int companyId,
    												@RequestParam("companyZipcode") String companyZipcode,
    												@RequestParam("companyAddress") String companyAddress,
    												@RequestParam("companyDetailAddress") String companyDetailAddress) {
        HashMap<String, String> map = new HashMap<String, String>();

        int updateZipcode = adminService.updateZipcode(companyId, companyZipcode);
        int updateAddress = adminService.updateAddress(companyId, companyAddress);
        int updateDetailAddress = adminService.updateDetailAddress(companyId, companyDetailAddress);

        if (updateZipcode > 0 || updateAddress > 0 || updateDetailAddress > 0) {
            // 업데이트 성공
        	String afterZipcode = adminService.companyZipcode(companyId);
        	String afterAddress = adminService.companyAddress(companyId);
        	String afterDetailAdress = adminService.companyDetailAddress(companyId);
        	
        	map.put("afterZipcode", afterZipcode);
        	map.put("afterAddress", afterAddress);
        	map.put("afterDetailAdress", afterDetailAdress);
            map.put("updateResult", "success");
        } else {
            // 업데이트 실패
        	map.put("error", "전용 url 업데이트 중 오류가 발생했습니다.");
        }

        return map;
    }
   

    @GetMapping(value = "/list")
    public ModelAndView employeeList(ModelAndView mv,@ModelAttribute("companyId") int companyId) {
    
        
        // 회사의 직원 목록을 가져와서 모델에 추가
        List < Employee > employee = adminService.findEmployee(companyId);
        int countEmp = adminService.countEmp(companyId);
        mv.addObject("employee", employee);
        mv.addObject("countEmp", countEmp);

        // 중지된 유저 숫자
        int countStop = adminService.countStop(companyId);
        mv.addObject("countStop", countStop);

        // 대기중인 유저 숫자
        int countUser = adminService.countUser(companyId);

        mv.addObject("countUser", countUser);
        mv.setViewName("admin/employee-list");

        return mv;
    }

    //가입대기
    @ResponseBody
    @GetMapping(value = "/wait-reg")
    public List < User > regWait(@ModelAttribute("companyId") int companyId) {
    
        
        // 해당 컴퍼니 초대링크를 가진 유저 배열
        List < User > user = adminService.waitUser(companyId);
        
        return user;
    }

    // 가입 승인
    @ResponseBody
    @PostMapping(value = "/approve")
    public Map < String, Integer > approve(@RequestParam("userId") int userId,
    		@ModelAttribute("companyId") int companyId) {

        adminService.approveUser(userId, companyId);
        adminService.addEmployee(userId, companyId);

        // 승인 후 최신 카운트 값 가져오기
        int countUser = adminService.countUser(companyId);
        int countEmp = adminService.countEmp(companyId);

        // 결과 맵 생성 및 값 설정
        Map < String, Integer > result = new HashMap < > ();
        result.put("countUser", countUser);
        result.put("countEmp", countEmp);

        return result;

    }

    // 가입 거절
    @ResponseBody
    @PostMapping(value = "/reject")
    public Map < String, Integer > reject(@RequestParam("userId") int userId,
    		@ModelAttribute("companyId") int companyId) {
        adminService.rejectUser(userId, companyId);

        int countUser = adminService.countUser(companyId);

        Map < String, Integer > result = new HashMap < > ();
        result.put("countUser", countUser);

        return result;
    }


    //직원리스트
    @ResponseBody
    @GetMapping(value = "/employee-list")
    public List < Employee > getEmployee(@ModelAttribute("companyId") int companyId) {

        // 해당 컴퍼니 초대링크를 가진 유저 배열
        List < Employee > emp = adminService.findEmployee(companyId);

        return emp;
    }

    // 이용 중지
    @ResponseBody
    @PostMapping(value = "/emp-stop")
    public Map < String, Integer > employeeStop(@RequestParam("empId") int empId,
    		@ModelAttribute("companyId") int companyId) {

        adminService.stopEmployeeStatus(empId);

        // 승인 후 최신 카운트 값 가져오기
        int countStop = adminService.countStop(companyId);
        int countEmp = adminService.countEmp(companyId);

        // 결과 맵 생성 및 값 설정
        Map < String, Integer > result = new HashMap < > ();
        result.put("countStop", countStop);
        result.put("countEmp", countEmp);

        return result;

    }

    //관리자 지정
    @ResponseBody
    @PostMapping(value = "/update-auth")
    public void empAuth(@RequestParam("empId") int employeeId) {
        adminService.updateAuth(employeeId);
        adminService.updateSecurity(employeeId);
    }

    // 이용중지리스트
    @ResponseBody
    @GetMapping(value = "/stop-list")
    public List < Employee > getStopEmp(@ModelAttribute("companyId") int companyId) {

        // 해당 컴퍼니 초대링크를 가진 유저 배열
        List < Employee > stopEmp = adminService.getStopList(companyId);

        return stopEmp;
    }

    // 중지 > 정상 상태변경
    @ResponseBody
    @PostMapping(value = "/back-emp")
    public Map < String, Integer > backEmp(@RequestParam("empId") int empId,
    		@ModelAttribute("companyId") int companyId) {

        adminService.backEmp(empId);

        // 승인 후 최신 카운트 값 가져오기
        int countStop = adminService.countStop(companyId);
        int countEmp = adminService.countEmp(companyId);

        // 결과 맵 생성 및 값 설정
        Map < String, Integer > result = new HashMap < > ();
        result.put("countStop", countStop);
        result.put("countEmp", countEmp);

        return result;

    }

    //정상리스트 가져오기
    @ResponseBody
    @PostMapping(value = "/user-uselist")
    public List < Employee > userUseList(@ModelAttribute("companyId") int companyId) {


        // 회사의 직원 목록을 가져와서 모델에 추가
        List < Employee > employee = adminService.findEmployee(companyId);


        return employee;

    }
    
 
    //직원 정보 상세보기
    @ResponseBody
    @GetMapping(value = "/employee-info")
    public Employee infoDetail(ModelAndView mv,@RequestParam("empId") int empId) {
  	 
  	 
  	  return adminService.employeeInfo(empId);
  	
 }
  
  //  //직원정보 업데이트

    @Transactional
    @PostMapping(value = "/employee-update")
    public ModelAndView employeeUpdate(@RequestParam(name ="id", required=true) int empId,ModelAndView mv,@AuthenticationPrincipal User user, Employee employee)    { 
    	System.out.println(empId);
    	String admin = user.getSecurity();
    	System.out.println(admin);
 	     	
    		if (admin.equals("ROLE_ADMIN")) {
		  
    			adminService.updateEmpInfo(employee);
    			adminService.updateUserInfo(employee);
    			mv.setViewName("redirect:/admin/list");

    		}else {
    			mv.addObject("message", " 권한이 없습니다.");
    			mv.setViewName("mainboard/my-dashboard");
    		}
       return mv;
       
  }
    
    @GetMapping(value = "/invite")
    public ModelAndView invite(ModelAndView mv, Principal principal, Company company ) {
    	String email=principal.getName();
    	
    	Company companyinfo = adminService.companyinfo(email);
    	System.out.println("인바이트 컨트롤러="+companyinfo);
        mv.addObject("companyinfo",companyinfo);
        mv.setViewName("admin/invite-employee");
        return mv;
    }

    @ResponseBody
    @PostMapping(value = "/sendMail")
    public void sendMail(@RequestParam(name="invite_box1[]") String[] invite_box1, @ModelAttribute("companyId") int companyId) {
        
    	
    	String companyName = adminService.companyName(companyId);
        String companyDomain = adminService.companyDomain(companyId);

        for (String box: invite_box1) {
            if (!box.equals(""))
                sendMail.sendInviteEmail(box, companyName, companyDomain);
        }
       

    }
    
    @GetMapping(value="/admin-dashboard")
    public String adminDashboard() {
       return "admin/AdminDashboard";
    }
    //지니 끝



    /* 혜원 */
    @GetMapping(value = "/project-access-stats")
    public String projectAccessStats(ModelAndView mv, HttpServletRequest request) {

        List < Access > Access = adminService.getAccesslist();

        mv.addObject("Access", Access);

        return "project/project-access-stats";
    }


}