package com.i4.i4blog.controller.comment;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.i4.i4blog.dto.comment.CommentCreateDTO;
import com.i4.i4blog.service.board.BoardService;
import com.i4.i4blog.service.comment.CommentService;
import com.i4.i4blog.service.user.UserService;
import com.i4.i4blog.vo.comment.CommentVO;
//import com.mysql.cj.Session;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/blog/{userId}/comment")
///blog/{userId}/comment
@RequiredArgsConstructor
@Slf4j
@JsonNaming(value =PropertyNamingStrategies.SnakeCaseStrategy.class )
public class CommentController {
	private final CommentService commentService;
	private final BoardService boardService;
	private final UserService userService;
	

	/**
	 * 댓글 목록 리스트(사용자)
	 * //addAttrbute("jsp에서 사용할 명칭",보낼 데이터)
	 * 조회 데이터를 jsp로 보내야 한다 -> model
	 * @author 김민환
	 **/
	@GetMapping("/list/{boardId}")
	///list/{boardId}
	public String commentList(Model model,
			
			@PathVariable String userId, 
			@PathVariable Integer boardId){			
		List<CommentVO> commentList = commentService.commentListService(boardId);
		System.out.println(commentList);
		if(commentList.isEmpty()) {
			log.info("comment is not {}",commentList);
			model.addAttribute("commentList", null);
		}else {
			log.info("commentList {}", commentList);
			model.addAttribute("commentList",commentList);
		}
		
		return "comment/commentList";
}

//	@PostMapping("/create")
//	public ResponseEntity<?> createComment(@Valid @RequestBody CommentCreateDTO commentCreateDto
//											, BindingResult bindingResult, Principal principal) {
//		
//		log.info("생성된 댓글{}",commentCreateDto);
//		commentService.commentCreateService(commentCreateDto, principal.getName());
//		return "comment/create";
//	}

}

