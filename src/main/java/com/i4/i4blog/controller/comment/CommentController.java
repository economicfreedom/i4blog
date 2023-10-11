package com.i4.i4blog.controller.comment;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.i4.i4blog.dto.comment.CommentCreateDTO;
import com.i4.i4blog.repository.interfaces.comment.CommentRepository;
import com.i4.i4blog.repository.model.board.Board;
import com.i4.i4blog.repository.model.comment.Comment;
import com.i4.i4blog.service.comment.CommentService;
import com.i4.i4blog.vo.comment.CommentVO;
//import com.mysql.cj.Session;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/comment")
@RequiredArgsConstructor
@Slf4j
@JsonNaming(value =PropertyNamingStrategies.SnakeCaseStrategy.class )
public class CommentController {
	private final CommentService commentService;
	@GetMapping("/j-test")
	public String jTest() {
		return "test1";
	}

	

	/**
	 * 댓글 목록 리스트(사용자)
	 * 
	 * 
	 **/
	@GetMapping("/list")
	public String comentList(Model model) {
		int boardId = 1;	//테스트로 강제 지정함 
		List<CommentVO> commentList = commentService.commentListService(boardId);
		//addAttrbute("jsp에서 사용할 명칭",보낼 데이터)
		// 조회 데이터를 jsp로 보내야 한다 -> model
		model.addAttribute("commentList", commentList);
		return "comment/commentList";
	}

	/*
	 * 댓글 생성 기능
	 * @param CommentCreateDto
	 */
	@PostMapping("/create")
	public String createComment(CommentCreateDTO commentCreatetDto) {
		log.info("생성된 댓글{}",commentCreatetDto);
		commentService.commentCreateService(commentCreatetDto);		
		return "redirect:comment/comment/commentList =";
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

}
