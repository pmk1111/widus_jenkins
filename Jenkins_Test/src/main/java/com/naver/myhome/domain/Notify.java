package com.naver.myhome.domain;

import java.sql.Date;

public class Notify {


	  private int ID; 
	    private String NAME; 
	    private String EMAIL; 
	    private String CONTENT; 
	    private Integer MENTIONED_ID;
	    private int POST_ID; 
	    private int COMMENT_ID; 
	    private Date NOTIFY_TIME;
	    private String MENTIONED_BY;
	    private String ASSIGNED_NAME;
	    private String CURRENTTIME;
	    private int ASSIGNED_ID;
	    private int NOTIFY_STATUS;
	    
		public String getCURRENTTIME() {
			return CURRENTTIME;
		}
		public void setCURRENTTIME(String cURRENTTIME) {
			CURRENTTIME = cURRENTTIME;
		}
		public int getID() {
			return ID;
		}
		public void setID(int iD) {
			ID = iD;
		}
		public String getNAME() {
			return NAME;
		}
		public void setNAME(String nAME) {
			NAME = nAME;
		}
		public String getEMAIL() {
			return EMAIL;
		}
		public void setEMAIL(String eMAIL) {
			EMAIL = eMAIL;
		}
		public String getCONTENT() {
			return CONTENT;
		}
		public void setCONTENT(String cONTENT) {
			CONTENT = cONTENT;
		}
		public Integer getMENTIONED_ID() {
			return MENTIONED_ID;
		}
		public void setMENTIONED_ID(Integer mENTIONED_ID) {
			MENTIONED_ID = mENTIONED_ID;
		}
		public int getPOST_ID() {
			return POST_ID;
		}
		public void setPOST_ID(int pOST_ID) {
			POST_ID = pOST_ID;
		}
		public int getCOMMENT_ID() {
			return COMMENT_ID;
		}
		public void setCOMMENT_ID(int cOMMENT_ID) {
			COMMENT_ID = cOMMENT_ID;
		}
		public Date getNOTIFY_TIME() {
			return NOTIFY_TIME;
		}
		public void setNOTIFY_TIME(Date nOTIFY_TIME) {
			NOTIFY_TIME = nOTIFY_TIME;
		}
		public String getMENTIONED_BY() {
			return MENTIONED_BY;
		}
		public void setMENTIONED_BY(String mENTIONED_BY) {
			MENTIONED_BY = mENTIONED_BY;
		}
		public String getASSIGNED_NAME() {
			return ASSIGNED_NAME;
		}
		public void setASSIGNED_NAME(String aSSIGNED_NAME) {
			ASSIGNED_NAME = aSSIGNED_NAME;
		}
		public int getASSIGNED_ID() {
			return ASSIGNED_ID;
		}
		public void setASSIGNED_ID(int aSSIGNED_ID) {
			ASSIGNED_ID = aSSIGNED_ID;
		}
		public int getNOTIFY_STATUS() {
			return NOTIFY_STATUS;
		}
		public void setNOTIFY_STATUS(int nOTIFY_STATUS) {
			NOTIFY_STATUS = nOTIFY_STATUS;
		}
		
	
}
