package com.i4.i4blog.dto.comment;
import java.sql.Timestamp;

import org.springframework.stereotype.Repository;
import lombok.Data;



/**
 * 댓글 작성 (Write)
 */
@Data
public class CommentCreatetDto{
	private String user_id;
	private String comment_content;
	private String board_id;
	private Timestamp created_at;
	
	public CommentCreatetDto(String user_id,String comment_content,String board_id,Timestamp created_at ) {
		this.user_id = user_id;
		this.comment_content = comment_content;
		this.board_id = board_id;
		this.created_at = created_at;
		
	}

}





