package com.i4.i4blog.controller.comment;

import org.springframework.http.ResponseEntity;
import org.springframework.security.acls.model.NotFoundException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.i4.i4blog.dto.comment.CommentCreateDTO;
import com.i4.i4blog.dto.comment.CommentUpdateDTO;
import com.i4.i4blog.service.comment.CommentService;

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
    		System.out.println("1");
    		return "저장 실패";
    	} else {
    		return "저장 성공";
    	}
    }
    
   
    /**
     * @author 김민환 
	 *PutMapping을 사용하여 댓글이 성공적으로 업데이트를 하면 200을 반환하고 실패하면 404를 반환함
	 *
	 *댓글 수정 기능 
	 */
    @PutMapping("/api/comment/list")
    public ResponseEntity<? extends Object> commentUpdate(@RequestBody CommentUpdateDTO commentUpdateDTO) {
        log.info("dto: {}", commentUpdateDTO);
        try {
            commentService.updateCommentService(commentUpdateDTO);
            return ResponseEntity.ok("댓글이 성공적으로 업데이트되었습니다.");
        } catch (Exception e) {
            // 예외 발생 시 badRequest를 발생시킨다
            return ResponseEntity.badRequest().build();
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

