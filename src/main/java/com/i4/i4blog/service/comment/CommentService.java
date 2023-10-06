package com.i4.i4blog.service.comment;

import java.util.List;

import org.springframework.stereotype.Service;

import com.i4.i4blog.dto.comment.CommentCreatetDto;
import com.i4.i4blog.repository.interfaces.comment.CommentRepository;
import com.i4.i4blog.repository.model.comment.Comment;
import com.i4.i4blog.vo.comment.CommentVO;
import com.mysql.cj.protocol.a.NativeConstants.IntegerDataType;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



/*
 * 로그인 여부 확인 을위한 세션 추가예졍 ,페이징 처리를 위한 파라밑 
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class CommentService {
	
	private final CommentRepository commentRepository;
	
	/**
	 * 댓글 리스트 - List
	 * 
	 */
	
	/**
	 * 댓글 등록 - create
	 * @param id
	 * @return
	 */
	
	public void commentCreateService(CommentCreatetDto commentCreatetDto) {
		Comment comment = new Comment();
		comment.setCommentContent(commentCreatetDto.getCommentContent());
		comment.setUserId(commentCreatetDto.getUser_Id());
		comment.setBoardId(commentCreatetDto.getBoard_Id());
		int result = commentRepository.create(comment);
	}
	

//	public List<Comment> createtByUserId(Integer commentId) {
//		List<Comment>commentList =commentRepository.();
//		return commentList;
//	}
	
	
	//댓글 삭제
	public int deleteById(Integer id){
		return commentRepository.deleteById(id);
	}
	

	
}	

