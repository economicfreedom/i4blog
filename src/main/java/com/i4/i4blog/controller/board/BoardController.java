package com.i4.i4blog.controller.board;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.i4.i4blog.dto.board.BoardWriteFormDto;
import com.i4.i4blog.repository.model.board.Board;
import com.i4.i4blog.service.board.BoardService;
import com.i4.i4blog.vo.board.BoardVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/blog/{userId}/board") // /blog/{userId}/board
@RequiredArgsConstructor
@Slf4j
public class BoardController {
	
	private final BoardService boardService;
	

	/**
	 * 게시글 작성 페이지
	 */
	@GetMapping("/write")
	public String boardWrite() {
		return "board/write";
	}
	
	/**
	 * 게시글 작성 기능
	 * @param boardWriteFormDto
	 * @return 게시글 리스트 페이지
	 */
	@PostMapping("/write")
	public String boardWriteProc(BoardWriteFormDto boardWriteFormDto, Principal principal) {
		log.info("작성된 글 {}",boardWriteFormDto);
		boardService.boardWriteService(boardWriteFormDto);
		
		return "redirect:/board/list";
	}
	
	/**
	 * 사용자의 게시글 리스트 페이지
	 * @return 
	 */
	@GetMapping("/list")
	public String boardList(Model model
	,Principal principal) {
		String name = principal.getName();
        log.info("로그인한 아이디 {}",name);
		List<Board> boardList = boardService.findByUserId(1,principal);
		if (boardList.isEmpty()) {
			model.addAttribute("boardList", null);
		} else {
			model.addAttribute("boardList", boardList);
		}
		
		return "board/list";
	}
	
	@GetMapping("/view/{id}")
	public String boardView(Model model, @PathVariable Integer id) {

		boardService.updateCount(id);
		BoardVO board = boardService.findById(id);
		model.addAttribute("board", board);
		
		
		return "board/view";
	}
	
}
