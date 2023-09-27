package com.i4.i4blog.controller.comment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.i4.i4blog.dto.comment.Commentwritedto;
import com.i4.i4blog.service.comment.CommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/comment")
@RequiredArgsConstructor
@Slf4j
public class CommentController {
	
	
	
	/** 
	 *
	 * 댓글 작성 페이지 요청
	 */
	@GetMapping("/create")
	public String commentWrite(@ModelAttribute Commentwritedto dto , HttpSession session) {
		return "comment/commentCreate";
	}
	
	/**
	 * 
	 * 댓글 수정 페이지 요청
	 */
	@PutMapping("/put")
	public String commentPut() {
		return "put" ;
	}
	
	
	
	/**
	 * 댓글 작성 기능 
	 */ 
//	@RequestMapping(value ="")
//	public String createComment() {
//		
//	}

	
	
}
