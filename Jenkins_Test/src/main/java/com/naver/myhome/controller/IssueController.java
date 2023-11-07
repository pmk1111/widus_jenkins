package com.naver.myhome.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.Files;
import com.naver.myhome.domain.Issue;
import com.naver.myhome.domain.Notify;
import com.naver.myhome.domain.ProjectAndUser;
import com.naver.myhome.domain.User;

import com.naver.myhome.service.BookmarkService;
import com.naver.myhome.service.FileService;
import com.naver.myhome.service.IssueService;
import com.naver.myhome.service.ProjectAndUserService;
import com.naver.myhome.service.UserService;
import com.naver.myhome.service.NotifyService;

@Controller
@RequestMapping(value = "/issue")
public class IssueController {

	private static final Logger logger = LoggerFactory.getLogger(IssueController.class);

	private UserService userService;
	private IssueService issueService;
	private FileService fileService;
	private ProjectAndUserService projectAndUserService;
	private NotifyService notifyService;
	private BookmarkService bookmarkService;

	@Value("${file.upload.path}")
	private String saveFolder;

	@Autowired
	public IssueController(NotifyService notifyService,IssueService issueService, 
			FileService fileService, ProjectAndUserService projectAndUserService, 
			UserService userService, BookmarkService bookmarkService) {
		this.issueService = issueService;
		this.fileService = fileService;
		this.projectAndUserService = projectAndUserService;
		this.notifyService = notifyService;
		this.userService = userService;
		this.bookmarkService = bookmarkService;

	}

	@GetMapping(value = "/issue-list")
	public ModelAndView issuelist(ModelAndView mv, HttpServletRequest request, 
			Principal principal, HttpSession session) {
		int projectId = (int) session.getAttribute("projectId");
		int listcount = issueService.getListCount(projectId);
		List<Issue> issuelist = issueService.getIssueList(projectId);

		mv.setViewName("issue/issue-list");
		mv.addObject("listcount", listcount);
		mv.addObject("issuelist" ,issuelist);
		return mv;
	}


	@ResponseBody
	@GetMapping("/getFilteredIssue")
	public List<Issue> getFilteredIssueList(HttpSession session,
			@RequestParam(name = "issueStatus", required = false) String issueStatus,
			@RequestParam(name = "issuePriority", required = false) String issuePriority) {

		int projectId = (int) session.getAttribute("projectId");
		List<Issue> filteredIssues = issueService.getFilteredIssueList(issueStatus, issuePriority, projectId);
		return filteredIssues;
	}

	@ResponseBody
	@GetMapping("/getSearchedIssue")
	public List<Issue> getSearchedIssue(@RequestParam String searchText, HttpSession session) {
		int projectId = (int) session.getAttribute("projectId");
		return issueService.searchIssues(searchText, projectId);
	}

	@ResponseBody
	@GetMapping("/getProjectAndTeamInfo")
	public List<ProjectAndUser> getProjectAndTeamInfo(HttpSession session){
		int projectId = (int) session.getAttribute("projectId");
		return projectAndUserService.getProjectAndUserInfo(projectId);
	}


	@PostMapping("createIssue")
	public String createIssue(Issue issue, Notify notify, HttpServletRequest request, 
			HttpSession session, Principal principal,
			@RequestParam(value="mention_user_id",defaultValue="0",required=false) int mentioned_id,
			@RequestParam(value = "assigned") int assignedValue,
			String notionchoice,MultipartFile[] uploadfiles) throws Exception {

		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		int projectId = (int) session.getAttribute("projectId");

		List<Files> fileList = new ArrayList<>();
		int issueId = issueService.getIssueId();

		issue.setId(issueId);
		issue.setProject_id(projectId);
		issue.setCreate_user(userId);
		issue.setMentioned(notionchoice.replace("@", ""));

		issueService.createIssue(issue);

		String create_user = userService.getCreateUser(userId);
		String assign_user = userService.getAssignUser(assignedValue);

		if (mentioned_id > 0) {
			Notify mentionNotify = new Notify();
			mentionNotify.setNAME(notionchoice.replace("@", ""));
			mentionNotify.setMENTIONED_BY(create_user);
			mentionNotify.setPOST_ID(issueId);
			mentionNotify.setMENTIONED_ID(mentioned_id);
			mentionNotify.setCONTENT("언급 하였습니다.");
			mentionNotify.setNOTIFY_STATUS(0);

			notifyService.createalarm(mentionNotify);
		}

		if (assignedValue > 0) {
			Notify assignNotify = new Notify();
			assignNotify.setNAME(assign_user);
			assignNotify.setMENTIONED_BY(create_user);
			assignNotify.setPOST_ID(issueId);
			assignNotify.setMENTIONED_ID(assignedValue);
			assignNotify.setCONTENT("담당자로 설정하였습니다.");
			assignNotify.setNOTIFY_STATUS(0);

			notifyService.createalarm(assignNotify);
		}

		for (MultipartFile file : uploadfiles) {
			Files files = new Files();
			if (file.getSize() > 0) {
				files.setFile_size(file.getSize());

				files.setIssue_id(issueId);
				files.setOriginal_name(file.getOriginalFilename());

				String saveName = fileDBName(file.getOriginalFilename(), saveFolder);
				files.setSave_name(saveName);

				file.transferTo(new File(saveFolder + saveName));
				fileList.add(files);
			}
		}
		if (!fileList.isEmpty()) {
			fileService.uploadFile(fileList);
		}

		return "redirect:issue-list";
	}


	private String fileDBName(String fileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		int date = c.get(Calendar.DATE);

		String homdir = saveFolder + "/" + year + "-" + month + "-" + date;

		File path1 = new File(homdir);
		if(!(path1.exists())) {
			path1.mkdir();
		}

		Random r = new Random();
		int random = r.nextInt(10000000);

		int index = fileName.lastIndexOf(".");

		String fileExtension = fileName.substring(index+1);
		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		String fileDBName = File.separator + year + "-" + month + "-" 
							+ date + File.separator + refileName;

		return fileDBName;
	}

	@ResponseBody
	@GetMapping("/down")
	public byte[] BoardFileDown(String saveName,
			HttpServletRequest request,
			String originalName,
			HttpServletResponse response) throws Exception{

		String sFilePath = saveFolder + saveName;
		File file = new File(sFilePath);

		byte[] bytes = FileCopyUtils.copyToByteArray(file);
		String sEncoding = new String(originalName.getBytes("utf-8"), "ISO-8859-1");

		response.setHeader("Content-Disposition", "attachment;filename=" + sEncoding);
		response.setContentLength(bytes.length);
		return bytes;
	}

	@GetMapping("/issue-detail")
	public ModelAndView issueDetail(int num, ModelAndView mv, HttpServletRequest request, @AuthenticationPrincipal User user,
			@RequestHeader(value = "referer", required = false) String beforeURL) {

		Issue issue = issueService.getIssueDetail(num);
		List<Files> filelist = fileService.getFileList(num);

		int bookmarkCk = bookmarkService.checkBookmark(user.getId(), num);

		if (issue == null) {
			mv.setViewName("issue/no-issue-content");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("showAlert", true);
		} else {
			int issueCreater = issue.getCreate_user();
			int issueAssigner = issue.getAssigned();

			String createrEmail = userService.getEmail(issueCreater);
			String assignerEmail = userService.getEmail(issueAssigner);

			mv.setViewName("issue/issue-detail");
			mv.addObject("issuedata", issue);
			mv.addObject("filelist", filelist);
			mv.addObject("bookmarkCk", bookmarkCk);
			mv.addObject("createrEmail", createrEmail);
			mv.addObject("assignerEmail", assignerEmail);
			mv.addObject("showAlert", false);
		}

		return mv;
	}

	@PostMapping("/statusUpdate")
	@ResponseBody
	public Map<String, Object> statusUpdate(@RequestParam int issueId, 
			@RequestParam String status, 
			@RequestParam String selectedUserId,
			@AuthenticationPrincipal User customUser) {

		int sessionId = customUser.getId();

		Map<String, Object> response = new HashMap<>();
		try {
			issueService.updateStatus(issueId, status, selectedUserId, sessionId);
			response.put("status", "success");
		} catch (Exception e) {
			response.put("status", "error");
			response.put("message", e.getMessage());
		}
		return response;
	}


	@PostMapping("/issue-update")
	public String issueUpdate(Issue issue, @RequestParam("num") int num, 
			@RequestParam("check") String check,
			HttpServletRequest request, RedirectAttributes rattr,
			MultipartFile[] uploadfiles,
			@AuthenticationPrincipal User customUser,
			Notify notify,@RequestParam(value="user_id",defaultValue="0",required=false) int mentioned_id,
			@RequestParam(value = "assigned") int assignedValue,String notionchoice) throws Exception{

		int sessionId = customUser.getId();

		String url = "";
		issue.setId(num);
		issue.setSessionId(sessionId);
		issue.setMentioned(notionchoice.replace("@", ""));
		int result = issueService.issueUpdate(issue);

		String create_user = userService.getCreateUser(sessionId);
		String assign_user = userService.getAssignUser(assignedValue);

		if (mentioned_id > 0) {
			Notify mentionNotify = new Notify();
			mentionNotify.setNAME(notionchoice.replace("@", ""));
			mentionNotify.setMENTIONED_BY(create_user);
			mentionNotify.setPOST_ID(num);
			mentionNotify.setMENTIONED_ID(mentioned_id);
			mentionNotify.setCONTENT("언급 하였습니다.");
			mentionNotify.setNOTIFY_STATUS(0);

			notifyService.createalarm(mentionNotify);
		}

		if (assignedValue > 0) {
			Notify assignNotify = new Notify();
			assignNotify.setNAME(assign_user);
			assignNotify.setMENTIONED_BY(create_user);
			assignNotify.setPOST_ID(num);
			assignNotify.setMENTIONED_ID(assignedValue);
			assignNotify.setCONTENT("담당자로 설정하였습니다.");
			assignNotify.setNOTIFY_STATUS(0);

			notifyService.createalarm(assignNotify);
		}

		if(result==0) {
			logger.info("게시판 수정 실패");
		} else {
			if(check.equals("true")) {
				fileService.updateDeleteYn(num);
				List<Files> fileList = new ArrayList<>();

				for(MultipartFile file : uploadfiles) {
					Files files = new Files();
					if(file.getSize()>0) {
						files.setFile_size(file.getSize());
						files.setIssue_id(num);
						files.setOriginal_name(file.getOriginalFilename());

						String saveName = fileDBName(file.getOriginalFilename(), saveFolder);
						files.setSave_name(saveName);

						file.transferTo(new File(saveFolder + saveName));
						fileList.add(files);
					}
				}
				if(!fileList.isEmpty()) {
					fileService.uploadFile(fileList);
				}
			}
			url = "redirect:issue-detail";
			rattr.addAttribute("num", issue.getId());
		}
		return url;
	}

	@PostMapping("/issue-delete")
	@ResponseBody
	public int deleteIssue(@RequestParam int issueId) {
		try {
			issueService.issueDelete(issueId);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}


}
