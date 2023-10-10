package com.i4.i4blog.vo.comment;

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
	private Integer id;						//게시글 아이디
	private Integer boardId;				//게시글 번호
	private Integer userId;					//댓글 대상 번호
	private String commentcontent;			//댓글 내용
	private Timestamp commentCreated;		//댓글 작성일
	private Integer commentWriter;			//댓글 작성자
	private	Timestamp commentUpdated;		//댓글 수정일
	private String comment_Public;			//댓글 삭제 여부 
	private Integer board_Writer;			//게시글 작성자
}
