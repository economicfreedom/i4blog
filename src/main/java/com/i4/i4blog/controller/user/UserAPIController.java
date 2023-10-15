package com.i4.i4blog.controller.user;

import javax.validation.ConstraintViolationException;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.i4.i4blog.dto.user.ForgotPwChangeDto;
import com.i4.i4blog.dto.user.UserJoinFormDto;
import com.i4.i4blog.repository.model.user.User;
import com.i4.i4blog.service.user.UserProfileService;
import com.i4.i4blog.service.user.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
@Validated
public class UserAPIController {

    private final UserService userService;
    private final UserProfileService userProfileService;
    /**
     * @param nickname
     * @return ResponseEntity
     * @author 최규하
     * 존재 하는 닉네임이면 IllegalAccessException 터트림
     * NicknameValidHandler 클래스에 alreadyNickname 참고
     */
    @GetMapping("/nick-check")
    public ResponseEntity<?> nickCheck(
            @RequestParam
            @Pattern(regexp = "^[ㄱ-ㅣ가-힣a-zA-Z0-9]{2,12}$"
                    , message = "최소 2글자에서 최대 12글자"
                    + " 한글과 영어 그리고 숫자만 입력 가능합니다.")
            @NotBlank(message = "닉네임을 입력해주세요.")
            String nickname
    ) {

        log.info("nick-check test {}", nickname);
        Integer res = userService.findUserNickname(nickname);
        log.info("res ==> {}", res);
        if (res != null) {
            try {
                throw new IllegalAccessException("이미 존재하는 닉네임입니다.");
            } catch (IllegalAccessException e) {
                throw new RuntimeException(e);
            }
        }

        return ResponseEntity.ok().build();
    }
    
    /**
     * @param userId
     * @return ResponseEntity
     * @author 박용세
     * 존재 하는 아이디면 IllegalAccessException 터트림
     * NicknameValidHandler 클래스에 alreadyNickname 참고
     */
    @GetMapping("/user-id-check")
    public ResponseEntity<?> userIdCheck(
            @RequestParam
            @Pattern(regexp = "^[a-zA-Z0-9]{4,20}$"
                    , message = "최소 4글자에서 최대 20글자"
                    + " 영어와 숫자만 입력 가능합니다.")
            @NotBlank(message = "아이디를 입력해주세요.")
            String userId
    ) {
        Integer res = userService.findByUserIdCheck(userId);
        if (res != null) {
            try {
                throw new IllegalAccessException("이미 존재하는 아이디입니다.");
            } catch (IllegalAccessException e) {
                throw new RuntimeException(e);
            }
        }
        return ResponseEntity.ok().build();
    }

    /**
     * @param userId
     * @return
     * @author 박용세
     * 이메일 중복 체크
     */
    @GetMapping("/email-check")
    public ResponseEntity<?> emailCheck(
            @RequestParam
            @Pattern(regexp = "^[a-z0-9]+@[a-z]+\\.[a-z]{2,3}$"
                    , message = "올바르지 못한 이메일 주소입니다.")
            @NotBlank(message = "이메일을 입력해주세요")
            String userEmail
    ) {
        User user = userService.findByEmail(userEmail);
        if (user != null) {
            try {
                throw new IllegalAccessException("이미 존재하는 이메일입니다.");
            } catch (IllegalAccessException e) {
                throw new RuntimeException(e);
            }
        }
        return ResponseEntity.ok().build();
    }
    
    /**
     * @param userJoinFormDto
     * @param bindingResult
     * @return ResponseEntity
     * @author 박용세
     * 회원가입 기능
     */
    // 추가 - 최규하
    // 내용 - 회원가입이 안 된 사용자만 접근 가능하게 추가
    // Profile테이블 Save기능 추가
    @PreAuthorize("isAnonymous()")
    @PostMapping("/join")
    public ResponseEntity<?> joinProc(@Valid @RequestBody UserJoinFormDto userJoinFormDto, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            throw new ConstraintViolationException("회원가입 실패", null);
        }
        int result = userService.userJoinService(userJoinFormDto);
        if(result != 1) {
        	ResponseEntity.badRequest().body("회원가입이 정상적으로 입력되지 않았습니다.");
        }
        userProfileService.save();
        return ResponseEntity.ok().build();
    }

    @PreAuthorize("isAnonymous()")
    @PutMapping("/pw-change")
    public ResponseEntity<?> pwChange(@Valid @RequestBody ForgotPwChangeDto forgotPwChangeDto){
    	User user = userService.findByIdAndPassword(forgotPwChangeDto);
    	if(user == null) {
    		ResponseEntity.badRequest().build();
    	}
    	userService.updatePassword(user.getId(), forgotPwChangeDto.getNewUserPassword());
        return ResponseEntity.ok().build();
    }
}
