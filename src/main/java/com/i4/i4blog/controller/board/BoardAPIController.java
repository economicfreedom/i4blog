package com.i4.i4blog.controller.board;

import com.i4.i4blog.service.board.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardAPIController {
    private final BoardService boardService;

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
	
}
