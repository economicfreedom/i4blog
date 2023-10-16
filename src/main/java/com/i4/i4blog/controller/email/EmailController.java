package com.i4.i4blog.controller.email;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.i4.i4blog.dto.email.ForgotEmailAuthDto;
import com.i4.i4blog.handler.exception.MyAPIException;
import com.i4.i4blog.repository.model.user.User;
import com.i4.i4blog.service.user.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/email")
@Slf4j
public class EmailController {

	private final UserService userService;
	private final PasswordEncoder passwordEncoder;
    /**
     * @param emailAuthDto
     * @param request
     * @author 박용세
     * 비밀번호찾기 이메일 인증 확인
     */
    @PostMapping("/forgot-auth-check")
    public ModelAndView forgotEmailAuth(@RequestBody ForgotEmailAuthDto forgotEmailAuthDto, HttpServletRequest request) {
    	log.info("forgot-auth-check");
    	log.info("dto - {}", forgotEmailAuthDto);
    	User user = userService.findByUserIdAndEmail(forgotEmailAuthDto);
    	log.info("user - {}", user);
    	if(user == null) {
    		throw new MyAPIException("아이디 또는 이메일 입력 오류");
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
