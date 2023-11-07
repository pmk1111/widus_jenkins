package com.naver.myhome.task;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

@Component
public class SendMail {
   private static final Logger logger = LoggerFactory.getLogger(SendMail.class);

   @Value("${my.sendfile}")
   private String sendfile;
   private JavaMailSenderImpl mailSender;

   @Autowired
   public SendMail(JavaMailSenderImpl mailSender) {
      this.mailSender = mailSender;
   }

   // 초대메일 발송 - 지니
      public void sendInviteEmail(String to, String companyName, String companyDomain ) {
         MimeMessagePreparator mp = new MimeMessagePreparator() {

            public void prepare(MimeMessage mimeMessage) throws Exception {
               MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
               helper.setFrom("hyejin_0818@naver.com"); // 보내는 사람의 이메일 주소
               helper.setTo(to);
               helper.setSubject(companyName+"에서 초대했습니다.");

               String content = "";
               content += " <img src='cid:Logo'><span class=\'demo menu-text fw-bolder ms-2\' style=\'font-size: 25px;\'></span>";
               content += " <h2 style=\"margin:15px 0 0 0;padding:0;font-weight:bold;font-size:26px;text-align:left;font-family:'MalgunGothic',"
                     +  " '맑은 고딕','Malgun Gothic','돋움',Dotum,'굴림',Gulim,Arial,sans-serif;\">회사를 위한 업무공간<br>"
                     +  " <h2>widUs와 함께하세요!</h2>";
               content += " <br>";
               content += " <h3>'"+companyName+"'님이 초대합니다.</h3>";
               content += " <br>";
               content +=   companyDomain + "으로 회사에 참여하세요.";
               content += " <br>";
               content += " <div text:bold>궁금한 점이 있으신가요?</div>";
               content += " <p>회사'"+companyName+"'에 문의하세요.";
               content += " <br><br>";
               content += " <P>아래 버튼을 눌러 함께할 수 있습니다.</p><br>";
               content += " <div style=\"width: 350px; height: 25px;\"> "
                     +  " <a href='http://localhost:9400/myhome/user/join' "
                     +  " style=\"display: block; margin: 0; padding: 20px 0; color: #ffffff; font-weight: bold; "
                     +  " font-size: 17px; border-radius: 8px; text-decoration: none; font-family: 'Malgun Gothic',"
                     +  " '맑은 고딕', Arial, sans-serif; white-space: nowrap; background: #5f5ab9; text-align: center;\"\n"
                     +  " target=\"_blank\" rel=\"noreferrer noopener\">참여하기</a>"
                     +  " </div>";
               helper.setText(content, true);
               
               FileSystemResource file = new FileSystemResource(new File(sendfile));
               helper.addInline("Logo", file);
               
               helper.addAttachment("", file);
            
            }
        
         };
         mailSender.send(mp);
         logger.info("메일 전송했습니다.");
      }
}
