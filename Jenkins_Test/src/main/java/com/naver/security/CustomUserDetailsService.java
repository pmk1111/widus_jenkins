package com.naver.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.naver.myhome.domain.User;
import com.naver.myhome.mybatis.mapper.CompanyMapper;
import com.naver.myhome.mybatis.mapper.UserMapper;

/*
1. UserDetailsService 인터페이스는 DB에서 유저 정보를 불러오는 loadUserByUsername()가 존재합니다.
   이를 구현하는 클래스는 DB에서 유저의 정보를 가져와서 UserDetails 타입으로 리턴해 주는 작업을 합니다.
     
2. UserDetails는 인터페이스로 Security에서 사용자의 정보를 담는 인터페이스입니다.
 
3. UserDetails 인터페이스를 구현한 클래스는 실제로 사용자의 정보와 사용자가 가진 권한의 정보를 처리해서 반환하게 됩니다.
       예) UserDetails user = new User(username, users.getPassword(), roles);
 */

public class CustomUserDetailsService implements UserDetailsService {
   private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);

   @Autowired
   private UserMapper dao;
   

   //1. 구현할 메서드를 추가합니다.
   
   //2. 구현할 메서드를 오버라이딩 한 후 매개변수 username에 해당하는 로우를 데이터 베이스를 통해 구한 후 Member에 저장합니다. 
   
   @Override
   public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
      logger.info("useremail은 로그인시 입력한 값 : " + username);
    User user = dao.isEmail(username);
      if (user == null) {
         logger.info("username" + username + " not found");
         throw new UsernameNotFoundException("username " + username + " not found");
      }
      
      // GrantedAuthority : 인증 개체에 부여된 권한을 나타내기 위한 인터페이스로 이를 구현한 구현체는 생성자에 권한을 문자열로 넣어주면 됩니다.
      // SimpleGrantedAuthority : GrantedAuthority의 구현체 입니다.
      // Collection<? extends GrantedAuthority> authorities
      /*Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();

      roles.add(new SimpleGrantedAuthority(users.getAuth()));

      UserDetails user = new User(username, users.getPassword(), roles);*/
      
      return user;
   }
  
  
}