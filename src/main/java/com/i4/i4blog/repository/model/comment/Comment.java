package com.i4.i4blog.repository.model.comment;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	
	private Integer id;
	private String userId;
	private String boardId;
	private String commentWriter;
	private String commentContent;
	private Timestamp commentCreated;
	private Timestamp commentUpdate;
	private String commentPublic;
	private String commentState;
	
	
	
}
