package com.i4.i4blog.service.comment;

import org.springframework.beans.factory.annotation.Autowired;



import com.i4.i4blog.repository.interfaces.comment.CommentRepository;

import lombok.Data;

@Data
public class CommentService {
	@Autowired 
	private CommentRepository commentrepository;

	// 댓글 등록 처리
	
}
