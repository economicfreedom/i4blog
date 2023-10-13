package com.i4.i4blog.dto.board;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ImgDeleteDto {
	private Integer id;
	private String oldThumbnail;
	private String oldImgOriginal;
}
