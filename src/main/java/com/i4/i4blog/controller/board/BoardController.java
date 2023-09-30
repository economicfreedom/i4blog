package com.i4.i4blog.controller.board;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.i4.i4blog.dto.board.BoardWriteFormDto;
import com.i4.i4blog.service.board.BoardService;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {
	// CYJ
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
	public String boardWriteProc(BoardWriteFormDto boardWriteFormDto) {
		
		boardService.boardWriteService(boardWriteFormDto);
		return "/board/list";
	}
	
	/**
	 * 사용자의 게시글 리스트 페이지
	 * @return
	 */
	@GetMapping("/list")
	public String boardList() {
		return "board/list";
	}
	
}
