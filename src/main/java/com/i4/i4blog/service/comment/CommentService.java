package com.i4.i4blog.service.comment;

import lombok.RequiredArgsConstructor;

import java.util.List;
import com.i4.i4blog.dto.comment.CommentDto;

import com.i4.i4blog.repository.interfaces.comment.CommentRepository;


import lombok.Data;
import org.springframework.stereotype.Service;



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

	//댓글 등록 
	
	
	
	//댓글 삭제
	public Integer deleteById(Integer id){
		return commentrepository.deleteById(id);
	}


	
}	

