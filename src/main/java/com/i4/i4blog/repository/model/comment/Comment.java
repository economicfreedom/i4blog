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
	//엔티티 
	private Integer id;
	private Integer userId;
	private Integer boardId;
	private String commentContent;
	private Timestamp commentCreatedAt;
	private Timestamp commentUpdateAt;
	private Timestamp commentDeletedAt;
	private Integer commentPublic;
	private Integer commentState;
	
	
	
}
