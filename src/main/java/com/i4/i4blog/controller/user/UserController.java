package com.i4.i4blog.controller.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserController {
	// PYS
	
	/**
	 * 로그인 페이지로 이동
	 */
	@GetMapping("/sign-in")
	public String signin() {
		return "user/signIn";
	}

	@GetMapping("/my-detail")
	public String userInfo(){
		return "user/userDetail";
	}
}
