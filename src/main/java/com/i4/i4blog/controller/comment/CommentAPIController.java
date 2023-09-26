package com.i4.i4blog.controller.comment;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.i4.i4blog.controller.Repository.CommentRepository;
import com.i4.i4blog.dto.CommentDto;
import com.i4.i4blog.service.CommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@RestController
@RequestMapping
@RequiredArgsConstructor
@Slf4j
public abstract class CommentAPIController {
	
	private final CommentService commentService;
	
	//신규 댓글 생성
	@PostMapping("/post")
	public abstract CommentRepository saveComment(@PathVariable final int user_id,@RequestBody final CommentDto params);
	
		
}
