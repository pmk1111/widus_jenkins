package com.naver.myhome.domain;

import lombok.Data;

@Data
public class RecentStatus {
	
	private String GUIDE;
	private int ROW_ID;
	
	private String MASTER;
	private String SELECTED_USER;
	private String CHANGED_USER;
	
	private String UPDATE_DATA;
	private String ISSUE_SUBJECT;
	private String ISSUE_TYPE;
	
	private String COLOR;
	
	private String CURRENTTIME;
    
	public String getMASTER() {
        if (MASTER == null || MASTER.isEmpty()) {
            return "(알 수 없음)";
        }
        return MASTER;
    }
	
    public String getSELECTED_USER() {
        if (SELECTED_USER == null || SELECTED_USER.isEmpty()) {
            return "(알 수 없음)";
        }
        return SELECTED_USER;
    }
    
    public String getCHANGED_USER() {
        if (CHANGED_USER == null || CHANGED_USER.isEmpty()) {
            return "(알 수 없음)";
        }
        return CHANGED_USER;
    }
}