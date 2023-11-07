package com.naver.myhome.domain;

import java.util.List;

import lombok.Data;

@Data
public class MyIssue {
    private String subject;
    private int ASSIGNED;
    private String STATUS;
    private String TYPE;
    private String priority;
    private int PROJECT_ID;
    private int id;
    private String create_user_name;
    private String created_at;

}
