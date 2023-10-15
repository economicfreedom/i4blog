package com.i4.i4blog.controller.email;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.i4.i4blog.dto.email.ForgotEmailAuthDto;
import com.i4.i4blog.dto.user.EmailAuthDto;
import com.i4.i4blog.handler.APIExceptionHandler;
import com.i4.i4blog.handler.exception.MyAPIException;
import com.i4.i4blog.repository.model.user.User;
import com.i4.i4blog.service.user.EmailService;
import com.i4.i4blog.service.user.UserService;

import lombok.RequiredArgsConstructor;


@RestController
@RequiredArgsConstructor
@RequestMapping("/email")
public class EmailAPIController {

	private final EmailService emailService;
	private final UserService userService;
	private final PasswordEncoder passwordEncoder;
	
    /**
     * @param email
     * @param response
     * @return 성공 or 실패
     * @author 박용세
     * 이메일 인증번호 전송 절차.
     * 메일 주소를 받아 인증번호를 생성 후 메일로 전송한다.
     */
    @PostMapping("/auth-send")
    public ResponseEntity<?> emailSend(String email, HttpServletResponse response) {
    	if(email == null) {
    		return ResponseEntity.badRequest().build();
    	}
        try {
			String auth = emailService.sendAuthToEmail(email);
			Cookie cookieEmail = new Cookie("email", email);
			cookieEmail.setMaxAge(5*60);
			cookieEmail.setSecure(true);
			cookieEmail.setPath("/user");
			Cookie cookieAuth = new Cookie("auth", passwordEncoder.encode(auth));
			cookieAuth.setMaxAge(5*60);
			cookieAuth.setSecure(true);
			cookieAuth.setPath("/user");
			response.addCookie(cookieEmail);
			response.addCookie(cookieAuth);
		} catch (Exception e) {
			System.out.println("인증 메일 에러 발생");
			ResponseEntity.badRequest().body("메일 전송 중 에러가 발생했습니다.");
		}
        return ResponseEntity.ok().build();
    }
    
    /**
     * @param emailAuthDto
     * @param request
     * @return 성공 or 실패
     * @author 박용세
     * 이메일 인증번호 확인 절차
     * 입력된 메일주소와 인증번호를 확인한다.
     */
    @PostMapping("/auth-check")
    public ResponseEntity<?> emailAuth(@RequestBody EmailAuthDto emailAuthDto, HttpServletRequest request) {
    	// 인증 번호 확인
    	boolean mailCheck = false;
    	boolean authCheck = false;
    	Cookie[] cookieList = request.getCookies();
    	for (Cookie cookie : cookieList) {
    		// 둘다 확인 완료 시 반복 종료
    		if(mailCheck && authCheck) {
    			break;
    		}
    		// 메일 확인 시작
			if(cookie.getName().equals("email")) {
				if(cookie.getValue().equals(emailAuthDto.getEmail())) {
					mailCheck = true;
					continue;
				} else {
					// 메일 불일치시 즉시 종료
		    		return ResponseEntity.badRequest().body("입력된 이메일이 변경되어 확인이 불가능합니다.");
				}
				// 메일 확인 끝
			} else if(cookie.getName().equals("auth")){
				// 인증번호 확인 시작
				if(passwordEncoder.matches(emailAuthDto.getAuth(), cookie.getValue())) {
					authCheck = true;
					continue;
				} else {
					// 인증번호 불일치시 즉시 종료
		    		return ResponseEntity.badRequest().body("인증번호가 일치하지 않습니다.");
				}
			}
		} // 인증번호 확인 끝
    	
    	return ResponseEntity.ok().build();
    }
    
    /**
     * @param email
     * @author 박용세
     * 아이디 찾기 이메일 전송
     */
    @PostMapping("/forgot-id")
    public ResponseEntity<?> forgotUserId(String email) {
    	User user = userService.findByEmail(email);
    	if(user == null) {
    		ResponseEntity.badRequest().body("해당 이메일로 가입된 아이디가 없습니다.");
    	}
    	try {
			emailService.sendUserIdToEmail(email, user.getUserId());
		} catch (Exception e) {
    		ResponseEntity.badRequest().body("메일 전송 실패");
		}
    	return ResponseEntity.ok().build();
    }
    
    /**
     * @param email
     * @param response
     * @return
     * @author 박용세
     * 비밀번호 찾기를 위한 이메일 인증번호 전송
     */
    @PostMapping("/forgot-auth-send")
    public ResponseEntity<?> forgotEmailSend(ForgotEmailAuthDto forgotEmailAuthDto
    										, HttpServletResponse response) {
        try {
        	User user = userService.findByUserIdAndEmail(forgotEmailAuthDto);
        	if(user == null) {
        		ResponseEntity.badRequest().body("해당하는 아이디가 없습니다.");
        	}
			String auth = emailService.sendAuthToEmail(forgotEmailAuthDto.getEmail());
			Cookie cookieUserId = new Cookie("userId", forgotEmailAuthDto.getUserId());
			cookieUserId.setMaxAge(5*60);
			cookieUserId.setSecure(true);
			cookieUserId.setPath("/user");
			Cookie cookieEmail = new Cookie("email", forgotEmailAuthDto.getEmail());
			cookieEmail.setMaxAge(5*60);
			cookieEmail.setSecure(true);
			cookieEmail.setPath("/user");
			Cookie cookieAuth = new Cookie("auth", passwordEncoder.encode(auth));
			cookieAuth.setMaxAge(5*60);
			cookieAuth.setSecure(true);
			cookieAuth.setPath("/user");
			response.addCookie(cookieEmail);
			response.addCookie(cookieAuth);
		} catch (Exception e) {
			System.out.println("인증 메일 전송 중 에러 발생");
			ResponseEntity.badRequest().body("메일 전송 중 에러가 발생했습니다.");
		}
        return ResponseEntity.ok().build();
    }

    /**
     * @param emailAuthDto
     * @param request
     * @author 박용세
     * 비밀번호찾기 이메일 인증 확인
     */
    @PostMapping("/auth-check")
    public ModelAndView forgotEmailAuth(@RequestBody ForgotEmailAuthDto forgotEmailAuthDto, HttpServletRequest request) {
    	User user = userService.findByUserIdAndEmail(forgotEmailAuthDto);
    	if(user == null) {
    		ResponseEntity.notFound().build();
    	}
    	// 인증 번호 확인
    	boolean idCheck = false;
    	boolean mailCheck = false;
    	boolean authCheck = false;
    	Cookie[] cookieList = request.getCookies();
    	for (Cookie cookie : cookieList) {
    		// 둘다 확인 완료 시 반복 종료
    		if(idCheck && mailCheck && authCheck) {
    			break;
    		}
    		// 메일 확인 시작
    		if(cookie.getName().equals("userId")) {
				if(cookie.getValue().equals(forgotEmailAuthDto.getEmail())) {
					idCheck = true;
					continue;
				} else {
					// 메일 불일치시 즉시 종료
		    		throw new MyAPIException("입력된 아이디가 변경되어 확인이 불가능합니다.");
				}
				// 메일 확인 끝
			} else if(cookie.getName().equals("email")) {
				if(cookie.getValue().equals(forgotEmailAuthDto.getEmail())) {
					mailCheck = true;
					continue;
				} else {
					// 메일 불일치시 즉시 종료
		    		throw new MyAPIException("입력된 이메일이 변경되어 확인이 불가능합니다.");
				}
				// 메일 확인 끝
			} else if(cookie.getName().equals("auth")){
				// 인증번호 확인 시작
				if(passwordEncoder.matches(forgotEmailAuthDto.getAuth(), cookie.getValue())) {
					authCheck = true;
					continue;
				} else {
					// 인증번호 불일치시 즉시 종료
		    		throw new MyAPIException("인증번호가 일치하지 않습니다.");
				}
			}
		} // 인증번호 확인 끝
    	
    	ModelAndView modelAndView = new ModelAndView("/user/forgotPw");
    	modelAndView.addObject("userId", user.getUserId());
    	modelAndView.addObject("password", user.getUserPassword());
    	return modelAndView;
    }
}
