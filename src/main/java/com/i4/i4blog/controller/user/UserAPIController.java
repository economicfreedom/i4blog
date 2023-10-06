package com.i4.i4blog.controller.user;

import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.i4.i4blog.dto.user.UserJoinFormDto;
import com.i4.i4blog.service.user.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserAPIController {

	private final UserService userService;
	
    @GetMapping("/nick-check")
    public ResponseEntity<?> nickCheck(
            @RequestParam String nickname
    ){

        log.info("nick-check test {}",nickname);
        return null;
    }
    
    /**
     * 회원가입 기능
     *
     * @param userJoinFormDto
     * @return 로그인 페이지
     */
    @PostMapping("/join")
    public boolean joinProc(@Valid @RequestBody UserJoinFormDto userJoinFormDto, BindingResult bindingResult) {
    	System.out.println(userJoinFormDto);
    	System.out.println(bindingResult);
    	if(bindingResult.hasErrors()) {
    		return false;
    	}
        userService.userJoinService(userJoinFormDto);
        return true;
    }
    
}
