package com.i4.i4blog.dto.email;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ForgotEmailAuthDto {
	private String userId;
	private String email;
	private String auth;
}
