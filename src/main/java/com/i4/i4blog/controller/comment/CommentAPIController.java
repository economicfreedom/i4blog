package com.i4.i4blog.controller.comment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.i4.i4blog.Dto.CommentDto;
import com.i4.i4blog.controller.Repository.CommentRepository;
import com.i4.i4blog.service.CommentService;


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
