package com.i4.i4blog.handler;


import com.i4.i4blog.controller.user.UserAPIController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.Set;

@RestControllerAdvice(basePackageClasses = {UserAPIController.class})
@Slf4j
public class NicknameValidHandler {

    /**
     *
     * @param e
     * @return 에러 메세지
     * @author 최규하
     * 닉네임 형식에 맞지 않게 입력시 에러메세지 출력
     *
     */

    @ExceptionHandler({ConstraintViolationException.class})
    public ResponseEntity<?> nickNameValidException(
            ConstraintViolationException e
    ) {
        Set<ConstraintViolation<?>> constraintViolations = e.getConstraintViolations();
        String message = constraintViolations
                .isEmpty() ?
                e.getMessage() : constraintViolations
                                .iterator()
                                .next()
                                .getMessage();


        log.info("동작함 : {}", message);
        return ResponseEntity.badRequest().body(message);

    }

    /**
     *
     * @param e
     * @return 에러 메세지
     *
     * 이미 존재하는 닉네임을 보낼시 에러 메시지 출력
     */
    @ExceptionHandler({IllegalAccessException.class})
    public ResponseEntity<?> alreadyNickname(IllegalAccessException e){

        String message = e.getMessage();

        return ResponseEntity.badRequest().body(message);
    }

}