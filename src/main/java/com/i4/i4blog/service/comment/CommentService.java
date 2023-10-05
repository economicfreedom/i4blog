package com.i4.i4blog.service.comment;

import lombok.RequiredArgsConstructor;

import java.sql.Timestamp;
import java.util.List;
import com.i4.i4blog.dto.comment.CommentCreatetDto;

import com.i4.i4blog.repository.interfaces.comment.CommentRepository;
import com.i4.i4blog.repository.model.comment.Comment;

import lombok.Data;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



/*
 * 로그인 여부 확인 을위한 세션 추가예졍 ,페이징 처리를 위한 파라밑 
 */
@Data
@RequiredArgsConstructor
@Service
public class CommentService {
	
	private final CommentRepository commentrepository;
//	private final BoardRepository boardRepository;
//	private final UserRepository userRepository;

	
	
	
	public int insertById(Integer id) {
		return commentrepository.createById(id);
	}
	
	
	//댓글 삭제
	public int deleteById(Integer id){
		return commentrepository.deleteById(id);
	}

	


	
}	

