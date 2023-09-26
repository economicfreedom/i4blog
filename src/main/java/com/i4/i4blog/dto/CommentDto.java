package com.i4.i4blog.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDto {
	private int id;						//댓글 번호
	private int comment_writer;			//작성자
	private int board_id;				//게시글 번호
	private int user_id;				//댓글 대상 회원 번호
	private String comment_content;		//댓글 내용
	private Timestamp comment_created;	//댓글 작성
	private Timestamp comment_updated;	//댓글 수정
	
}
