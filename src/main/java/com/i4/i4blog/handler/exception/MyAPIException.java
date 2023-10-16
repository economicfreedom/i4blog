package com.i4.i4blog.handler.exception;

/**
 * RestController에서 에러 발생시 오류 메시지 전달
 */

public class MyAPIException extends RuntimeException{
	public MyAPIException(String msg) {
		super(msg);
	}

}
