package com.i4.i4blog.controller.user;

import com.i4.i4blog.dto.ProfileRequestDTO;
import com.i4.i4blog.service.user.UserProfileService;
import com.i4.i4blog.service.user.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;

@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
@RestController
public class UserProfileAPIController {
    private final UserProfileService userProfileService;
    private final UserService userService;

    @PutMapping("/profile-img-save")
    public ResponseEntity<?> saveImg(@RequestBody ProfileRequestDTO profileRequestDTO,Principal principal){
        log.info("saveImg ====> start");
        log.info("profileRequestDTO ====> {}",profileRequestDTO);
        userProfileService.saveImg(profileRequestDTO,principal);

        return null;
    }

    @PutMapping("/saveProfile")
    public ResponseEntity<?> saveNickname(
            @RequestBody
            @Valid
            ProfileRequestDTO profileRequestDTO
            , Principal principal
            , BindingResult bindingResult

    ) {

        if (bindingResult.hasErrors()) {
            String defaultMessage = bindingResult
                                    .getFieldError()
                                    .getDefaultMessage();
            log.info("메세지 ===> {}" ,defaultMessage);
            return ResponseEntity.badRequest().body(defaultMessage);
        }

        String userId = principal.getName();
        Integer id = userService.getId(userId);

        profileRequestDTO.setId(id);
        userProfileService.saveNickname(profileRequestDTO);

        return ResponseEntity.ok().build();
    }

}
