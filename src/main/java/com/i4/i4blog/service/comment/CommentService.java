package com.i4.i4blog.service.comment;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;



import com.i4.i4blog.repository.interfaces.comment.CommentRepository;

import lombok.Data;
import org.springframework.stereotype.Service;

@Data
@RequiredArgsConstructor
@Service
public class CommentService {

	private final CommentRepository commentrepository;


	// 댓글 등록 처리


	public Integer deleteById(Integer id){
		return commentrepository.deleteById(id);
	}
}
