package com.naver.myhome.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Issue {
   private int id;
   private int project_id;
   private int create_user;
   private String type;
   private String priority;
   private String subject;
   private String content;
   private String status;
   private int reporter;
   private int assigned;
   private String created_at;
   
   private String create_user_name;
   private String assigned_user_name;
   private String project_name;
   private String project_color;
   private String mentioned;
   private String creater_pic;
   
    private int totalcount;
    private int todocount;
    private int progresscount;
    private int resolvedcount;
    private int donecount;
    
    private int sessionId;
    
    private List<MultipartFile> files = new ArrayList<>();    // 첨부파일 List

   @Override
   public String toString() {
      return "Issue [id=" + id + ", project_id=" + project_id + ", create_user=" + create_user + ", type=" + type
            + ", priority=" + priority + ", subject=" + subject + ", content=" + content + ", status=" + status
            + ", reporter=" + reporter + ", assigned=" + assigned + ", created_at=" + created_at + ", totalcount="
            + totalcount + ", todocount=" + todocount + ", progresscount=" + progresscount + ", resolvedcount="
            + resolvedcount + ", donecount=" + donecount + "]";
   }
}