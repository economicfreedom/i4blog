package com.i4.i4blog.handler;

import com.i4.i4blog.service.user.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.security.Principal;

@ControllerAdvice
@RequiredArgsConstructor
public class ModelHandler {

    private final UserService userService;

    @ModelAttribute("getNickname")
    public String getNickname(Principal principal){
        if (principal != null){
            return userService.getUserNicknameByUserId(principal.getName());
        }
        return null;

    }

}
