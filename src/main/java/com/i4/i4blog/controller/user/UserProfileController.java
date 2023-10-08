package com.i4.i4blog.controller.user;

import com.i4.i4blog.repository.model.user.UserProfile;
import com.i4.i4blog.service.user.UserProfileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
@Controller
public class UserProfileController {

    private final UserProfileService userProfileService;

    /**
     *
     * @param model
     * @param principal
     * @return profileSetting.jsp
     * 프로필 세팅 경로
     */
    @GetMapping("/profile-setting")
    public String profile(Model model
                        ,Principal principal
    ) {
        String userId = principal.getName();

        UserProfile profile = userProfileService.findByUserId(userId);

        log.info("profile == {}",profile);
        model.addAttribute("profile", profile);


        return "user/profileSetting";
    }



}
