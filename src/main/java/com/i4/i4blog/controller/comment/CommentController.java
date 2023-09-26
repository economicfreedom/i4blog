package com.i4.i4blog.controller.comment;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/comment")
@RequiredArgsConstructor
@Slf4j
public class CommentController {
//	//댓글 작성 페이지 이동
//	@GetMapping("/create")
//	public String commentCreate(@ModelAttribute CommentDto dto , HttpSession session) {
//		return "comment/CommentCreate";
//	}
//	//댓글 수정 페이지 이동
//	@PutMapping("/put")
//	public String commentPut() {
//		return "put" ;
//	}
//	
//	//댓글 삭제 페이지 이동
	
}
