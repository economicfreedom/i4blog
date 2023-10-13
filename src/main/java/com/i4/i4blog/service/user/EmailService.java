package com.i4.i4blog.service.user;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EmailService {

    private final JavaMailSender emailSender;

    /**
     * @param email
     * @return authCode
     * @throws Exception
     * @author 박용세
     * 메일 주소를 받아 인증번호를 생성 후 인증번호와 함께 메일을 보낸다.
     */
	public String sendAuthToEmail(String toEmail) throws Exception {
        String authCode = this.createCode();
        MimeMessage emailForm = authEmailForm(toEmail, authCode);
        sendEmail(emailForm);
        return authCode;
	}
	
	/**
	 * @return authCode
	 * @throws Exception
	 * @author 박용세
	 * 인증 번호 생성
	 */
    private String createCode() throws Exception {
        int lenth = 6;
        try {
            Random random = SecureRandom.getInstanceStrong();
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < lenth; i++) {
                builder.append(random.nextInt(10));
            }
            return builder.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new Exception();
        }
    }
    
    /**
     * @param emailForm
     * @param auth
     * @author 박용세
     * 메일을 실제로 전송하는 기능
     */
    public void sendEmail(MimeMessage emailForm) {
        try {
            emailSender.send(emailForm);
        } catch (Exception e) {
            System.out.println("메일 send 실패 - " + e);
        }
    }

    /**
     * @param toEmail
     * @param auth
     * @return
     * @author 박용세
     * 메일로 전송할 제목 및 내용 작성
     */
    private MimeMessage authEmailForm(String toEmail, String auth) {
        String title = "i4-blog 회원가입을 위한 인증 메일입니다";
        
    	String text = "";
    	text += "<h2>i4-blog 회원가입 이메일 인증</h2><br>";
        text += "<h3>요청하신 인증 번호입니다.</h3><br>";
        text += "<h1>" + auth + "</h1>";
        MimeMessage message = emailSender.createMimeMessage();
        try {
			message.setFrom(new InternetAddress("i4blog@blog.com", "i4blog"));
			message.addRecipients(MimeMessage.RecipientType.TO, toEmail);
			message.setSubject(title);
			message.setText(text, "utf-8", "html");
		} catch (Exception e) {
			System.out.println("인증 message 생성 실패 : " + e.getMessage());
		}
        return message;
    }
    
    /**
     * @param email
     * @return authCode
     * @throws Exception
     * @author 박용세
     * 메일 주소와 아이디를 받아 id 정보와 함께 메일을 전송한다.
     */
    public void sendUserIdToEmail(String toEmail, String userId) throws Exception {
    	MimeMessage emailForm = userIdEmailForm(toEmail, userId);
    	sendEmail(emailForm);
    }
    
    /**
     * @param toEmail
     * @param auth
     * @return
     * @author 박용세
     * 메일로 전송할 제목 및 내용 작성
     */
    private MimeMessage userIdEmailForm(String toEmail, String userId) {
    	String title = "i4-blog 아이디 찾기 메일입니다";
    	
    	String text = "";
    	text += "<h2>i4-blog 아이디 찾기</h2><br>";
    	text += "<h3>i4-blog에 가입되어 있는 아이디는 </h3>";
    	text += "<h1>" + userId + "</h1>";
    	text += "<h3> 입니다</h3>";
    	MimeMessage message = emailSender.createMimeMessage();
    	try {
    		message.setFrom(new InternetAddress("i4blog@blog.com", "i4blog"));
    		message.addRecipients(MimeMessage.RecipientType.TO, toEmail);
    		message.setSubject(title);
    		message.setText(text, "utf-8", "html");
    	} catch (Exception e) {
    		System.out.println("인증 message 생성 실패 : " + e.getMessage());
    	}
    	return message;
    }
    
}
