package com.i4.i4blog.controller.user;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.i4.i4blog.dto.user.UserJoinFormDto;
import com.i4.i4blog.service.user.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserController {
    /**
     * @author 박용세
     */
    private final UserService userService;

    /**
     * 로그인 페이지 이동
     */
    @GetMapping("/login")
    public String login() {
        return "user/login";
    }

    /**
     * 로그인 성공 후 처리
     * @param principal
     * @return 자신의 블로그 게시글 리스트
     */
    @GetMapping("/success")
    public String loginSuccess(Principal principal) {
       return "redirect:/blog/" + principal.getName() + "/board/list";
    }
    
    /**
     * 회원가입 페이지 이동
     */
    @GetMapping("/join")
    public String join() {
        return "user/join";
    }

    /**
     * 회원가입 기능
     *
     * @param userJoinFormDto
     * @return 로그인 페이지
     */
    @PostMapping("/join")
    public String joinProc(UserJoinFormDto userJoinFormDto) {
        userService.userJoinService(userJoinFormDto);
        return "redirect:/user/login";
    }


}