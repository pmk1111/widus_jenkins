package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Issue;

public interface IssueService {
	
	public int getIssueId();
	
	public int getListCount(int projectId);
	
	public List<Issue> getStatusCount(int employeeId, int userId);
	
	public List<Issue> getMyWork(String status, int userId);

	public List<Issue> getIssueList(int projectId);
	
	public List<Issue> getFilteredIssueList(String issueStatus, String issuePriority, int projectId);
	
	public List<Issue> searchIssues(String searchText, int projectId);
	
	public void createIssue(Issue issue);

	public Issue getIssueDetail(int num);
	
	public int updateStatus(int issueId, String status, String selectedUserId, int sessionId);
	
	public int issueUpdate(Issue issue);

	public int issueDelete(int issueId);


}
