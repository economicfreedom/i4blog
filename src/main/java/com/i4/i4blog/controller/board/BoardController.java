package com.i4.i4blog.controller.board;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.i4.i4blog.dto.board.BoardUpdateFormDto;
import com.i4.i4blog.dto.board.BoardWriteFormDto;
import com.i4.i4blog.repository.model.board.Board;
import com.i4.i4blog.service.board.BoardService;
import com.i4.i4blog.vo.board.BoardVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/blog/{userId}/board")
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
	 * 사용자의 게시글 리스트 페이지
	 */
	@GetMapping("/list")
	public String boardList(Model model	, Principal principal) {
//		String name = principal.getName();
//        log.info("로그인한 아이디 {}",name);
		List<Board> boardList = boardService.findByUserId(1);
		if (boardList.isEmpty()) {
			model.addAttribute("boardList", null);
		} else {
			log.info("boardList {} ",boardList);
			model.addAttribute("boardList", boardList);
		}
		
		return "board/list";
	}
	
	/**
	 * 게시글 내용보기
	 * @param model
	 * @param id
	 * @return view.jsp
	 * 해당 id의 게시글 내용보기
	 */
	@GetMapping("/view/{id}")
	public String boardView(Model model, @PathVariable Integer id) {

		boardService.updateCount(id);
		BoardVO board = boardService.findById(id);
		model.addAttribute("board", board);
		
		return "board/view";
	}
	
	/**
	 * 게시글 수정 페이지
	 * @param model
	 * @param id
	 * @return update.jsp
	 */
	@GetMapping("/update/{id}")
	public String boardUpdate(Model model, @PathVariable Integer id) {
		log.info("받아온 id", id);
		BoardVO board = boardService.findById(id);
		model.addAttribute("board", board);
		
		return "board/update";
	}
	
	@PostMapping("/update")
	public String boardUpdateProc(BoardUpdateFormDto boardUpdateFormDto, Principal principal) {
		log.info("수정된 글 {}", boardUpdateFormDto);
		boardService.boardUpdateService(boardUpdateFormDto);
		
//		return "redirect:/blog/" + principal.getName() + "/board/list";
		// 임시
		return "redirect:/blog/" + 1 + "/board/list";
	}
}
