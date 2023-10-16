package com.i4.i4blog.service.comment;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.i4.i4blog.dto.comment.CommentCreateDTO;
import com.i4.i4blog.dto.comment.CommentDeleteDTO;
import com.i4.i4blog.dto.comment.CommentUpdateDTO;
import com.i4.i4blog.repository.interfaces.comment.CommentRepository;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.repository.model.comment.Comment;
import com.i4.i4blog.repository.model.user.User;
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
	private final UserRepository userRepository;

	
	/**
	 * 댓글 리스트 조회
	 * @param - list
	 * @return commentList  (boardId)를 가져옴 
	 */
	public List<CommentVO> commentListService(Integer id) {
		List<CommentVO> commentList = commentRepository.findAllByBoardId(id);
		return commentList;
	}	
	
	
	/**
	 * 댓글 등록 - create
	 * 새로운 커맨트 객채를 생성하고 commentCreateDto
	 * @param -create
	 * @return commentRepository에서comment 객체를 생성함
	 **
	 */
	public int commentCreateService(CommentCreateDTO commentCreateDto, String getUserId) {
		User user = userRepository.findByUserId(getUserId);
		Comment comment = Comment.builder()
	        .userId(user.getId())
	        .boardId(1)
	        .commentContent(commentCreateDto.getCommentContent())
	        .commentPublic(commentCreateDto.getCommentPublic())
	        .build();

	    int result = commentRepository.create(comment);
	    return result;
	}



	/**
	 *
	 * 댓글 수정 - Update
	 * @param id
	 * @return commentRepostiory에서 comment 객체를 업데이트 한다
	 *
	 */
	public int commentUpdateService(CommentUpdateDTO commentUpdateDTO, String userId) {

		User user = userRepository.findByUserId(userId);
		Comment comment  = Comment.builder()
				.id(commentUpdateDTO.getId())		        
		        .boardId(commentUpdateDTO.getBoardId())
		        .userId(user.getId())
		        .commentContent(commentUpdateDTO.getCommentContent())
		        .commentPublic(commentUpdateDTO.getCommentPublic())
		        .build();
								
				int result = commentRepository.updateComment(comment);
				
				return result;
				

		
	}
	
	
	
	//댓글 삭제- Delete 
	public int deleteById(Integer id){		
		
		log.info("commentService deletedById ");
		return commentRepository.deleteById(id);
	}

	
	
	
	
	
}	