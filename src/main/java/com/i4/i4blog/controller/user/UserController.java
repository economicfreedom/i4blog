package com.i4.i4blog.controller.user;

import com.i4.i4blog.dto.user.UserJoinFormDto;
import com.i4.i4blog.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserController {
    // PYS
    private final UserService userService;

    /**
     * 로그인 페이지로 이동
     */
    @GetMapping("/login")
    public String login() {
        return "user/login";
    }

    /**
     * 로그인 페이지 이동
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
