package com.naver.myhome.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class User implements UserDetails {
	private int id;
	private String email;
	private String password;
	private String pic;

	private MultipartFile uploadfile; 	// 프로필사진 업로드 지니
	private String picOriginal;  		//프로필 오리지널 지니
	private String name;
	private String phone;
	private int companyInvited;			//int형식으로 변경하였음 주영 수정사항

	private String companyStatus;
	private String security;
	private Date created_at;
	private int authNum;

	private String companyName;			//회사명변경을위해 필요한 생성자 지니
	private String department;
	private String position;

	
	
	 @Override
     public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
        list.add(new SimpleGrantedAuthority(security));
        return list;
     }
  
  //계정의 아이디를 리턴합니다.
  @Override
  public String getUsername() {
     // TODO Auto-generated method stub
     return email;
  }
  
  //계정이 만료되지 않았는지를 리턴합니다. (true:만료되지 않음)
   @Override
    public boolean isAccountNonExpired() {
       return true;
    }
    
   
   //계정이 잠겨있지 않은지 리턴합니다. (true:잠겨있지 않음)
    @Override
    public boolean isAccountNonLocked() {
       return true;
    }
    
    
    //계정의 패스워드가 만료되지 않았는지 리턴합니다.(true:만료되지 않음)
    @Override
    public boolean isCredentialsNonExpired() {
       return true;
    }
    
    //계정이 사용가능한지를 리턴합니다.(true:사용가능)
    @Override
    public boolean isEnabled() {
       return true;
    }
  
}