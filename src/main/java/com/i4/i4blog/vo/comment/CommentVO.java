package com.i4.i4blog.vo.comment;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

/*
 * 김민환 
 * 댓글 Model(Vo) 처리
 * 비밀 댓글 유무 처리, 조회수,게시글 작성자 등등 모델링  
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommentVO {
	private Integer id;						//댓글 번호
	private Integer boardId;				//게시글 번호
	private Integer userId;					//댓글 대상 번호
	private String commentContent;			//댓글 내용
	private Timestamp commentCreated;		//댓글 작성일
	private	Timestamp commentUpdated;		//댓글 수정일
	private String commentPublic;			//댓글 공개 여부 
	private String commentState;			//댓글 상태 여부 
}
