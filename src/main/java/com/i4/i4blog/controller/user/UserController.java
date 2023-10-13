package com.i4.i4blog.controller.user;

import java.security.Principal;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.i4.i4blog.repository.model.category.Category;
import com.i4.i4blog.service.category.CategoryService;

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
    // 테스트
    private final CategoryService categoryService;

    /**
     * 로그인 페이지 이동
     */
    // 추가 - 최규하
    // 내용 - 회원가입이 안 된 사용자만 접근 가능하게 추가
    @PreAuthorize("isAnonymous()")
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
    // 추가 - 최규하
    // 내용 - 회원가입이 안 된 사용자만 접근 가능하게 추가
    @PreAuthorize("isAnonymous()")
    @GetMapping("/join")
    public String join() {
        return "user/join";
    }

    // 카테고리 테스트중
    @GetMapping("/category-setting")
    public String categorySetting(Model model) {
    	List<Category> categoryList = categoryService.findByUserId("aaaa");
    	model.addAttribute(categoryList);
    	return "user/categorySetting";
    }
}