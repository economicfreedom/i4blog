package com.i4.i4blog.controller.user;

import com.i4.i4blog.service.user.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.ConstraintViolationException;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;


@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
@Validated
public class UserAPIController {

    private final UserService userService;
    
    /**
      @param nickname
      @return ResponseEntity
      존재 하는 닉네임이면 IllegalAccessException 터트림
      NicknameValidHandler 클래스에 alreadyNickname 참고
     */
    
    @GetMapping("/nick-check")
    public ResponseEntity<?> nickCheck(
            @RequestParam
            @Pattern(regexp = "^[ㄱ-ㅣ가-힣a-zA-Z0-9]{2,12}$"
                    , message = "최소 2글자에서 최대 12글자"
                    +" 한글과 영어 그리고 숫자만 입력 가능합니다.")
            @NotBlank(message = "닉네임을 입력해주세요.")
            String nickname
    ) {

        log.info("nick-check test {}", nickname);
        Integer res = userService.findUserNickname(nickname);
        log.info("res ==> {}",res);
        if (res != null){
            try {
                throw new IllegalAccessException("이미 존재하는 닉네임입니다.");
            } catch (IllegalAccessException e) {
                throw new RuntimeException(e);
            }
        }

        return ResponseEntity.ok().build();
    }
}
