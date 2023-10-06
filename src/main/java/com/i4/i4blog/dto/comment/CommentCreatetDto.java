package com.i4.i4blog.dto.comment;
import java.sql.Timestamp;

import javax.validation.Valid;


import org.springframework.stereotype.Repository;



import lombok.Data;



/**
 * 댓글 작성 (Write)
 */
@Valid
@Data
public class CommentCreatetDto{
	private String user_Id;
	private String commentContent;	
	private String board_Id;
	private Timestamp created_At;
	
	
}
	











