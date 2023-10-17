package com.i4.i4blog.handler;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.i4.i4blog.handler.exception.MyAPIException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestControllerAdvice
public class APIExceptionHandler extends RuntimeException {

	/**
	 * @param e
	 * @return
	 * 비동기 통신에서 에러 메시지 반환
	 */
    @ExceptionHandler(value = MyAPIException.class)
    public ResponseEntity<?> globalAPIExceptionHandler(RuntimeException e){

        String message = e.getMessage();

        return ResponseEntity.badRequest().body(message);
    }

}