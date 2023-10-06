package com.i4.i4blog.controller.user;

import com.i4.i4blog.dto.ProfileRequestDTO;
import com.i4.i4blog.service.user.UserProfileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
@RestController
public class UserProfileAPIController {
    private final UserProfileService userProfileService;

    @PostMapping("/saveProfile")
    public ResponseEntity<?> saveProfile(
            @RequestBody
            ProfileRequestDTO profileRequestDTO
            , Principal principal
    ) {

        profileRequestDTO.setId(1);
        userProfileService.saveNickname(profileRequestDTO);

        return ResponseEntity.ok().build();
    }
}
