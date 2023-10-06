package com.i4.i4blog.controller.user;

import com.i4.i4blog.repository.model.user.UserProfile;
import com.i4.i4blog.service.user.UserProfileService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
@Controller
public class UserProfileController {

    private final UserProfileService userProfileService;

    @GetMapping("/profile-setting")
    public String profile(Model model
                        ,Principal principal
    ) {
        String userId = principal.getName();

        UserProfile profile = userProfileService.findByUserId(userId);
        log.info("썸네일 경로 {}",profile.getImgThumbnail());
        model.addAttribute("profile", profile);


        return "user/profileSetting";
    }


    @GetMapping("/test-prin")
    public String test2(Principal principal){
        return "test";
    }
}
