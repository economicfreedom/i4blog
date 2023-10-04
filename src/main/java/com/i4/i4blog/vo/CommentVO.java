package com.i4.i4blog.vo;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;

/*
 * 김민환 
 * 댓글 Model(Vo) 처리
 * 비밀 댓글 유무 처리, 조회수,게시글 작성자 등등 모델링  
 */
@Data
public class CommentVO {
	private Integer board_id;				//게시글 번호
	private Integer user_id;				//댓글 대상 번호
	private String comment_content;			//댓글 내용
	private Timestamp comment_createdat;	//댓글 작성일
	private Integer comment_writer;			//댓글 작성자
	private	Timestamp comment_updateat;		//댓글 수정일
	private String comment_public;			//댓글 삭제 여부 
	private Integer board_writer;			//게시글 작성자
}
