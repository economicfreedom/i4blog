package com.i4.i4blog.service.comment;

import java.util.List;

import org.springframework.security.acls.model.NotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	 * 새로운 커맨트 객채를 생성하고 commentCreateDto
	 * @param -create
	 * @return commentRepository에서comment 객체를 생성함
	 **
	 */
	public int commentCreateService(CommentCreateDTO commentCreateDto) {
		Comment comment = new Comment();
		comment.setCommentContent(commentCreateDto.getCommentContent());
		comment.setUserId(commentCreateDto.getUserId());
		comment.setBoardId(commentCreateDto.getBoardId());
		comment.setCommentPublic(commentCreateDto.getCommentPublic());
		int result = commentRepository.create(comment);
		return result;
		
	}

	/**
	 *
	 * 댓글 수정 - Update
	 * @param id
	 * @return
	 *
	 */
	public void updateCommentService(CommentUpdateDTO commentUpdateDTO) {
		System.out.println("service");
		int id = commentUpdateDTO.getId();
	    Comment comment = commentRepository.commentById(id);
	    System.out.println("comment - " + comment);
	    if (comment != null) {
	        // 2. Comment 객체 업데이트
	        comment.setCommentContent(commentUpdateDTO.getCommentContent()); // 예시: 내용 업데이트
	        comment.setCommentPublic(1);
	        System.out.println("수정된 comment - " + comment);
	        // 3. Comment 객체 저장
	        commentRepository.updateComment(comment); // 저장 또는 업데이트 메서드를 사용하여 Comment를 업데이트합니다.
	        System.out.println("수정 완료");
	    } else {
	        // Comment를 찾지 못한 경우 예외 처리
	        throw new NotFoundException("댓글을 찾을 수 없습니다");
	    }
		
	}
	
	
	
	//댓글 삭제
	public int deleteById(Integer id){
		return commentRepository.deleteById(id);
	}

	
	
	
	
	
}	

