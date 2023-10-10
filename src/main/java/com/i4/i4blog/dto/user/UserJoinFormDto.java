package com.i4.i4blog.dto.user;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class UserJoinFormDto {
	@NotBlank
	@Size(min = 4, max = 20)
	@Pattern(regexp = "[0-9|a-z|A-Z]")
	private String userId;
	
	@NotBlank
	@Size(min = 4, max = 16)
	private String userPassword;
	
	@NotBlank
	@Size(min = 2, max = 15)
	@Pattern(regexp = "[가-힣|a-z|A-Z]")
	private String userName;
	
	@NotBlank
	@Size(min = 2, max = 15)
	@Pattern(regexp = "[가-힣|a-z|A-Z|0-9]")
	private String userNickname;
	
	@NotBlank
	@Size(min = 13, max = 13)
	@Pattern(regexp = "^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})+$")
	private String userPhone;
	
	@NotBlank
	@Size(min = 4, max = 100)
	@Pattern(regexp = "^[a-zA-Z0-9]+@[0-9a-zA-Z]+\\.[a-z]+$")
	private String userEmail;
}
