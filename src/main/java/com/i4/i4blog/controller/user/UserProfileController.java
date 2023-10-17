package com.i4.i4blog.controller.user;

import java.security.Principal;
import java.util.List;

import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.i4.i4blog.repository.model.category.Category;
import com.i4.i4blog.repository.model.user.UserProfile;
import com.i4.i4blog.service.category.CategoryService;
import com.i4.i4blog.service.user.UserProfileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
@Controller
public class UserProfileController {

    private final UserProfileService userProfileService;
    private final CategoryService categoryService;

    /**
     *
     * @param model
     * @param principal
     * @return profileSetting.jsp
     * 프로필 세팅 경로
     * 
     *  -- 추가 --
     * @author 박용세 : 카테고리 리스트 조회
     */
    @GetMapping("/profile-setting")
    @PostAuthorize("isAuthenticated()")
    public String profile(Model model
                        ,Principal principal
    ) {
        String userId = principal.getName();

        UserProfile profile = userProfileService.findByUserId(userId);

        log.info("profile == {}",profile);
        model.addAttribute("profile", profile);
    	List<Category> categoryList = categoryService.findByUserId(profile.getUserId());
    	model.addAttribute("categoryList", categoryList);
        
        return "user/profileSetting";
    }
}
