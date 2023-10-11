package com.i4.i4blog.service.comment;

import java.util.List;

import org.springframework.stereotype.Service;

import com.i4.i4blog.dto.comment.CommentCreateDTO;
import com.i4.i4blog.dto.comment.CommentUpdateDTO;
import com.i4.i4blog.repository.interfaces.comment.CommentRepository;
import com.i4.i4blog.repository.model.comment.Comment;
import com.i4.i4blog.vo.comment.CommentVO;

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
	 * 댓글 리스트 조회
	 * @param - list
	 * @return commentList  (boardId)를 가져옴 
	 */
	public List<CommentVO> commentListService(int boardId) {
		List<CommentVO> commentList = commentRepository.findAllByBoardId(boardId);
		return commentList;
	}	
	/**
	 * 댓글 등록 - create
	 * @param id
	 **
	 */
	public int commentCreateService(CommentCreateDTO commentCreatetDto) {
		Comment comment = new Comment();
		comment.setCommentContent(commentCreatetDto.getCommentContent());
		comment.setUserId(commentCreatetDto.getUserId());
		comment.setBoardId(commentCreatetDto.getBoardId());
		comment.setCommentPublic(commentCreatetDto.getCommentPublic());
		int result = commentRepository.create(comment);
		return result;
		
	}

	/**
	 * 댓글 수정 - Update
	 * @param id
	 * @return
	 */

	
	
	//댓글 삭제
	public int deleteById(Integer id){
		return commentRepository.deleteById(id);
	}	

	
}	

