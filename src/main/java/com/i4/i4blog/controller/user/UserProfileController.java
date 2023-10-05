package com.i4.i4blog.controller.user;

import com.i4.i4blog.repository.model.user.UserProfile;
import com.i4.i4blog.service.user.UserProfileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
@Controller
public class UserProfileController {

    private final UserProfileService userProfileService;

    @GetMapping("/profile-setting")
    public String profile(Model model) {
        UserProfile profile = userProfileService.findByUserId(1);
        model.addAttribute("profile", profile);


        return "user/profileSetting";
    }


}
