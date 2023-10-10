package com.i4.i4blog.controller.board;

import com.i4.i4blog.dto.board.BoardWriteFormDto;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.service.board.BoardService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardAPIController {
    private final BoardService boardService;
    private final UserRepository userRepository;
    	/**
	 * @author 최규하
	 * 이름은 delete지만 실제론 state를 바꾸기 때문에 update로 동작함
	 * state가 1이었던걸 0으로 바꿈
	 */
    @PutMapping("/del")
    public ResponseEntity<? extends Object> deleteById(
         @RequestBody Integer id
        
    ){
    	
        log.info("board deleteById Start");
        log.info("삭제 아이디 : {}",id);
        Integer res = boardService.deleteById(id);


        log.info("board deleteById End");


        return ResponseEntity.ok("삭제 성공");
    }
	/**
	 * 게시글 작성 기능
	 * @param boardWriteFormDto
	 * @return list.jsp
	 * 게시글 작성 후 목록으로 redirect
	 */
	@PostMapping("/write")
	public ResponseEntity<?> boardWriteProc(
			@Valid
			@RequestBody
			BoardWriteFormDto boardWriteFormDto, Principal principal
			) {
		CustomMessage customMessage = new CustomMessage();
		

		log.info("작성된 글 {}",boardWriteFormDto);
		boardService.boardWriteService(boardWriteFormDto,principal);
		
//		return "redirect:/blog/" + principal.getName() + "/board/list";
		// 임시
		
		
		customMessage.setMessage("/blog/\" + 1 + \"/board/list");
		
		return ResponseEntity.ok(customMessage);
	}
	
    
	@Data
	private class CustomMessage{
		private String message;
	}
}
