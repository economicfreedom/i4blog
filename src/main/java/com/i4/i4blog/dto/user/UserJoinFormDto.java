package com.i4.i4blog.dto.user;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserJoinFormDto {
	@NotBlank
	@Size(min = 4, max = 20)
	private String userId;
	@NotBlank
	@Size(min = 4, max = 16)
	private String userPassword;
	@NotBlank
	@Size(min = 2, max = 15)
	private String userName;
	@NotBlank
	@Size(min = 2, max = 15)
	private String userNickname;
	@NotBlank
	@Size(min = 13, max = 13)
	private String userPhone;
	@NotBlank
	@Size(min = 4, max = 100)
	private String userEmail;
}
