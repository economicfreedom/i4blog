package com.i4.i4blog.dto.email;

import lombok.Data;

@Data
public class ForgotEmailAuthDto {
	private String userId;
	private String email;
	private String auth;
}
