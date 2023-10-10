package com.i4.i4blog.dto.comment;
import java.sql.Timestamp;

import javax.validation.Valid;
import javax.validation.constraints.Min;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;



/**
 * 댓글 작성 (Write)
 */
@JsonNaming(value =PropertyNamingStrategies.SnakeCaseStrategy.class )
@Data
public class CommentCreateDTO{
	
	private String id;
	private Integer userId;
	private Integer boardId;
	private String commentContent;	
	private Integer commentPublic;
	
}
	











