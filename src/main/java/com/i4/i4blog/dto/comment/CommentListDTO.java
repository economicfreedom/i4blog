package com.i4.i4blog.dto.comment;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value =PropertyNamingStrategies.SnakeCaseStrategy.class )
public class CommentListDTO {
	private String commentcontent;
	
}
