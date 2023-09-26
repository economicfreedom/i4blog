package com.i4.i4blog.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardWriteFormDto {
	private String boardTitle;
	private String boardContent;
	private String boardCategory;
}
