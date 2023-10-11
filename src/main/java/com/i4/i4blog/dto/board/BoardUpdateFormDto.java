package com.i4.i4blog.dto.board;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class BoardUpdateFormDto {
	private Integer id;
	private Integer userId;
	private String boardTitle;
	private String boardContent;
	private String boardCategory;
	private Integer boardPublic;
	private String thumbnail; // 업로드 썸네일
	private String originalImg; // 업로드 오리진 썸네일
	private String oldThumbnail; // 기존 썸네일
	private String oldImgOriginal; // 기존 오리진 썸네일
}
