package com.i4.i4blog.controller.user;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.i4.i4blog.dto.user.ProfileInfoDTO;
import com.i4.i4blog.dto.user.ProfileRequestDTO;
import com.i4.i4blog.dto.user.PwChangeRequestDTO;
import com.i4.i4blog.service.user.UserProfileService;
import com.i4.i4blog.service.user.UserService;
import lombok.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.security.Principal;

@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
@RestController
@Validated
public class UserProfileAPIController {
    private final UserProfileService userProfileService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    CustomMessage customMessage = new CustomMessage();

    /**
     * @param profileRequestDTO
     * @param principal
     * @return 성공시 200
     * 이미지 경로를 서비스로 전달
     */
    @PutMapping("/profile-img-save")
    public ResponseEntity<?> saveImg(@RequestBody ProfileRequestDTO profileRequestDTO, Principal principal) {
        log.info("saveImg ====> start");
        log.info("profileRequestDTO : {}", profileRequestDTO);

        userProfileService.saveImg(profileRequestDTO, principal);

        return ResponseEntity.ok().build();
    }


    /**
     * @param profileRequestDTO
     * @param principal
     * @param bindingResult
     * @return 에러 없으면 200
     * 닉네임 저장
     */

    @PutMapping("/change-nickname")
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
            log.info("메세지 ===> {}", defaultMessage);
            customMessage.setMessage(defaultMessage);
            return ResponseEntity.badRequest().body(customMessage.getMessage());
        }

        String userId = principal.getName();
        Integer id = userService.getId(userId);
        log.info(userId);
        profileRequestDTO.setId(id);
        userProfileService.changeNickname(profileRequestDTO);

        return ResponseEntity.ok().build();
    }

    @PutMapping("/pw-change")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<?> pwChange(
            @RequestBody
            @Valid
            PwChangeRequestDTO pwChangeRequestDTO
            , BindingResult bindingResult
            , Principal principal

    ) {
        if (bindingResult.hasErrors()) {
            String msg = bindingResult.getFieldError().getDefaultMessage();
            customMessage.setMessage(msg);
            return ResponseEntity.badRequest().body(customMessage);

        }
        if (!pwChangeRequestDTO.isSamePw()) {
            customMessage.setMessage("비밀번호가 서로 다릅니다.");
            return ResponseEntity.badRequest().body(customMessage);
        }
        String originalPw = pwChangeRequestDTO.getOriginalPw();
        boolean res = userProfileService.changePw(pwChangeRequestDTO, principal);

        if (!res) {

            return ResponseEntity.badRequest().body("기존 비밀번호를 확인해주세요");

        }


        return ResponseEntity.ok("변경 완료");
    }

    @PutMapping("/title-and-info-change")
    public ResponseEntity<?> titleInfoChange(
            @RequestBody
            @Valid
            ProfileInfoDTO profileInfoDTO
            , Principal principal
            , BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            String defaultMessage = bindingResult.getFieldError().getDefaultMessage();

            log.info("defaultMessage : {}", defaultMessage);
            customMessage.setMessage(defaultMessage);
            return ResponseEntity.badRequest().body(customMessage);
        }
        String userId = principal.getName();

        userProfileService.saveTitleInfo(userId, profileInfoDTO);

        return ResponseEntity.ok().build();
    }

    @PutMapping("/resign")
    public ResponseEntity<?> resign(
            @RequestBody
            String pwd
            , Principal principal) {
        boolean resign = userProfileService.resign(principal, pwd);
        log.info("resign : {}",resign);
        if (!resign){
            customMessage.setMessage("비밀번호가 일치하지 않습니다.");
            return ResponseEntity.badRequest().body(customMessage);
        }
        return ResponseEntity.ok().build();
    }


    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @ToString
    private static class CustomMessage {
        private String message;

    }
}
