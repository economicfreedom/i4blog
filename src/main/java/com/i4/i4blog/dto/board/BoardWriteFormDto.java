package com.i4.i4blog.dto.board;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class BoardWriteFormDto {
	
	private Integer userId;
	
//	@NotEmpty(message = "제목을 입력해주세요.")
	private String boardTitle;
//	@NotEmpty(message = "내용을 입력해주세요.")
	private String boardContent;
	private String boardCategory;
	private Integer boardPublic;
	private String thumbnail;
}
