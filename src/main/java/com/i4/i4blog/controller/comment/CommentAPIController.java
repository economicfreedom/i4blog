package com.i4.i4blog.controller.comment;

import com.i4.i4blog.dto.comment.CommentCreateDTO;
import com.i4.i4blog.service.board.BoardService;
import com.i4.i4blog.service.comment.CommentService;
import com.mysql.cj.xdevapi.Schema.CreateCollectionOptions;

import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
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
     * @return 
     * @Commentcreate 댓글 생성단 컨트롤러 (api)
     */
    @PostMapping("/api/comment/list")
    public String commentCreateApi(@RequestBody CommentCreateDTO commentCreateDTO )
    {    	   
    	System.out.println(commentCreateDTO);
    	int result = commentService.commentCreateService(commentCreateDTO);
    	if(result != 1) {
    		System.out.println("11");
    		return "저장 실패";
    	} else {
    		return "저장 성공";
    	}
    }
    
    
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

