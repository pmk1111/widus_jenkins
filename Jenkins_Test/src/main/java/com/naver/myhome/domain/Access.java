package com.naver.myhome.domain;

import java.util.Date;

public class Access {
    private String user_id;
    private Date connetdate;
    private String month;
    private int monthcount;
    private String date;
    private int daycount;

    // 게터 및 세터 메서드

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Date getConnetdate() {
        return connetdate;
    }

    public void setConnetdate(Date connetdate) {
        this.connetdate = connetdate;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getMonthcount() {
        return monthcount;
    }

    public void setMonthcount(int monthcount) {
        this.monthcount = monthcount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getDaycount() {
        return daycount;
    }

    public void setDaycount(int daycount) {
        this.daycount = daycount;
    }
}