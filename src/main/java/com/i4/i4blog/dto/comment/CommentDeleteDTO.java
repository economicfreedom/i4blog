package com.i4.i4blog.dto.comment;

import java.sql.Timestamp;

import javax.validation.Valid;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@Valid
@JsonNaming(value =PropertyNamingStrategies.SnakeCaseStrategy.class )
public class CommentDeleteDTO {
	private Integer id;
	private Integer userId;
	private Integer boardId;
	private String commentContent;	
	private Timestamp commentDeletedAt;
	private Integer commentState;
	
	
}
