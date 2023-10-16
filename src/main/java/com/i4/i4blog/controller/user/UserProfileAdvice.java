package com.i4.i4blog.controller.user;

import com.i4.i4blog.service.user.UserProfileService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.security.Principal;

@ControllerAdvice
@RequiredArgsConstructor
public class UserProfileAdvice {
    private final UserProfileService userProfileService;

    @ModelAttribute("imgProfilePath")
    public String imgProfilePath(Principal principal) {
        if (principal != null) {
            return userProfileService.getImgPathByUserId(principal);

        }
        return null;


    }

}
