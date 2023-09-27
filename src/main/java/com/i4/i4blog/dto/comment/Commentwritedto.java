package com.i4.i4blog.dto.comment;

import java.sql.Timestamp;

import lombok.Data;

@Data
/**
 * 댓글 쓰기 (Write)
 */
public class Commentwritedto {
	private int boardId;
	private int commentId;
	private String commentWriter;
	private String commentContent;
	private Timestamp commentCrated;
			
}
