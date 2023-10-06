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
    @ExceptionHandler({IllegalAccessException.class})
    public ResponseEntity<?> alreadyNickname(IllegalAccessException e){

        String message = e.getMessage();

        return ResponseEntity.badRequest().body(message);
    }

}