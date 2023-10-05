package com.i4.i4blog.controller.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.i4.i4blog.dto.comment.CommentCreatetDto;
import com.i4.i4blog.repository.model.comment.Comment;
import com.i4.i4blog.service.comment.CommentService;
import com.i4.i4blog.vo.comment.CommentVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/comment")
@RequiredArgsConstructor
@Slf4j
public class CommentController {
	private final CommentService commentService;
		
	/*
	 * 댓글 목록 조회
	 * 
	 */
	@GetMapping("/List")
	public String ComentList() {
		
		return "comment/commentList";
	}
	
	/*
	 * 댓글 생성
	 */
	
	@GetMapping("/create")
	public String Commentcreate(@ModelAttribute CommentVO vo , HttpSession session) {
		
		return "comment/commentcreate";
	}
	
	/**
	 *
	 *댓글 수정 
	 */
	@PatchMapping("/put")
	public String commentPut() {
		return "comment/commentput" ;
	}

	
	/**
	 * 
	 * 댓글 삭제
	 *
	 */
	@DeleteMapping("/delete")
	public String commentDelete() {
		return "comment/commentDelete";
	}
		

	//댓글 작성 구현
	@ResponseBody
	@RequestMapping(value = "/comment/commentcreate.jsp")
	
	public String comment_created(@RequestParam String user_id) {
		return "comment/commentcreate";
		
	}
	
}
