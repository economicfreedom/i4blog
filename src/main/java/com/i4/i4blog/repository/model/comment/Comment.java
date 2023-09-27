package com.i4.i4blog.repository.model.comment;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Comment {
	private Integer id;
	private String userId;
	private String boardId;
	private String commentwriter;
	private String commentcontent;
	private Timestamp commentcreated;
	private Timestamp commentupdate;
	private String commentpublic;
	private String commentstate;
	
}
