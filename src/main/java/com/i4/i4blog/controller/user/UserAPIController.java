package com.i4.i4blog.controller.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.i4.i4blog.dto.user.EmailAuthDto;
import com.i4.i4blog.dto.user.UserJoinFormDto;
import com.i4.i4blog.service.user.EmailService;
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
    private final EmailService emailService;
    private final PasswordEncoder passwordEncoder;
    
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
     * @param nickname
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
     * @param email
     * @param response
     * @return 성공 or 실패
     * @author 박용세
     * 이메일 인증번호 전송 절차.
     * 메일 주소를 받아 인증번호를 생성 후 메일로 전송한다.
     */
    @PostMapping("/email-send")
    public ResponseEntity<?> emailSend(String email, HttpServletResponse response) {
    	if(email == null) {
    		return ResponseEntity.badRequest().build();
    	}
        try {
			String auth = emailService.sendCodeToEmail(email);
			Cookie cookieEmail = new Cookie("email", email);
			cookieEmail.setMaxAge(5*60);
			cookieEmail.setSecure(true);
			Cookie cookieAuth = new Cookie("auth", passwordEncoder.encode(auth));
			cookieAuth.setMaxAge(5*60);
			cookieAuth.setSecure(true);
			response.addCookie(cookieEmail);
			response.addCookie(cookieAuth);
		} catch (Exception e) {
			System.out.println("인증 메일 에러 발생");
			ResponseEntity.badRequest().build();
		}
        return ResponseEntity.ok().build();
    }
    
    /**
     * @param emailAuthDto
     * @param request
     * @return 성공 or 실패
     * @author 박용세
     * 이메일 인증번호 확인 절차
     * 입력된 메일주소와 인증번호를 확인한다.
     */
    @PostMapping("/email-auth")
    public ResponseEntity<?> emailAuth(@RequestBody EmailAuthDto emailAuthDto, HttpServletRequest request) {
    	// 인증 번호 확인
    	boolean mailCheck = false;
    	boolean authCheck = false;
    	Cookie[] cookieList = request.getCookies();
    	for (Cookie cookie : cookieList) {
    		// 둘다 확인 완료 시 반복 종료
    		if(mailCheck && authCheck) {
    			break;
    		}
    		// 메일 확인 시작
			if(cookie.getName().equals("email")) {
				if(cookie.getValue().equals(emailAuthDto.getEmail())) {
					mailCheck = true;
					continue;
				} else {
					// 메일 불일치시 즉시 종료
					break;
				}
				// 메일 확인 끝
			} else if(cookie.getName().equals("auth")){
				// 인증번호 확인 시작
				if(passwordEncoder.matches(emailAuthDto.getAuth(), cookie.getValue())) {
					authCheck = true;
					continue;
				} else {
					// 인증번호 불일치시 즉시 종료
					break;
				}
			}
		} // 인증번호 확인 끝
    	
    	if(mailCheck && authCheck) {
    		return ResponseEntity.ok().build();
    	} else {
    		return ResponseEntity.badRequest().build();
    	}
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
        userService.userJoinService(userJoinFormDto);
        userProfileService.save();
        return ResponseEntity.ok().build();
    }


}
