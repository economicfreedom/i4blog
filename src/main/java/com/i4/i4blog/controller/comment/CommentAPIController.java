package com.i4.i4blog.controller.comment;

import com.i4.i4blog.service.board.BoardService;
import com.i4.i4blog.service.comment.CommentService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@RestController
@RequestMapping("/comment")
@RequiredArgsConstructor
@Slf4j
public class CommentAPIController {
    private final CommentService commentService;
    
   
    
    /**
     * @author 최규하
     * 이름은 delete지만 실제론 state를 바꾸기 때문에 update로 동작함
     * state가 1이었던걸 0으로 바꿈
     */
    @PutMapping("/del")
    public ResponseEntity<? extends Object> deleteById(
            @RequestBody Integer id

    ) {
        log.info("comment controller deleteById Start");
        log.info("삭제 아이디 : {}", id);
        Integer res = commentService.deleteById(id);

        log.info("comment controller deleteById end");

        return ResponseEntity.ok("삭제 성공");
    }


}

