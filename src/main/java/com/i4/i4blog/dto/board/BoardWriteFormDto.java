package com.i4.i4blog.dto.board;

import lombok.Data;

@Data
public class BoardWriteFormDto {
	private Integer userId;
	private String boardTitle;
	private String boardContent;
	private String boardCategory;
	private Integer boardPublic;
}
