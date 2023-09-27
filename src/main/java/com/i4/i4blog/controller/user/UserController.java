package com.i4.i4blog.controller.user;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.i4.i4blog.dto.user.UserJoinFormDto;
import com.i4.i4blog.repository.model.category.Category;
import com.i4.i4blog.service.category.CategoryService;
import com.i4.i4blog.service.user.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserController {
    // PYS
    private final UserService userService;

    // 테스트용
    private final CategoryService categoryService;
    
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
    
    @GetMapping("/test")
    public String userTest(Model model) {
    	List<Category> categoryList = categoryService.findByUserId(1);
    	model.addAttribute("categoryList", categoryList);
    	return "category-temp";
    }

}
