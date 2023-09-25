package com.i4.i4blog.dto;

import lombok.Data;

@Data
public class UserJoinFormDto {
	private String userId;
	private String userPassword;
	private String userName;
	private String userNickname;
	private String userPhone;
	private String userEmail;
}
