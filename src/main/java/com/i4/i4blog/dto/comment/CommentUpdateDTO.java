package com.i4.i4blog.dto.comment;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value =PropertyNamingStrategies.SnakeCaseStrategy.class )
public class CommentUpdateDTO {
	
	private Integer Id;
	private Integer boardId;
	private String commentContent;
	private Timestamp commentUpdateAt;
	private Integer commentPublic;
}
