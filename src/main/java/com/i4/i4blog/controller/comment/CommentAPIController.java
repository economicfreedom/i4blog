package com.i4.i4blog.controller.comment;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
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
     * @author 김민환
     * @return 댓글을 작성하도록 구현 
     * @Commentcreate 댓글 생성단 컨트롤러 (api)
     */
    @PostMapping("/create")
    public ResponseEntity<?> commentCreateApi(@Valid @RequestBody
    		CommentCreateDTO commentCreateDTO,
    		BindingResult bindingResult , Principal principal)
    {    	   
    	System.out.println(commentCreateDTO);

    	int res = commentService.commentCreateService(
    			commentCreateDTO,principal.getName());
    	return ResponseEntity.ok().build();
    	
    }
    
   
    /**
     * @author 김민환 
	 *PutMapping을 사용하여 댓글이 성공적으로 업데이트를 하면 200을 반환하고 실패하면 404를 반환함
	 *
	 *댓글 수정 기능 
	 */
    //주의 사항: 다른분들 햇갈리지 않게 list 가 아닌  update로 수정 
    @PutMapping("/update")
    public ResponseEntity<?> commentUpdate(@Valid @RequestBody
    		CommentUpdateDTO commentUpdateDTO
    										, Principal principal)
    {
        log.info("수정된 댓글{}", commentUpdateDTO);
        
        int result = commentService.commentUpdateService(
        		commentUpdateDTO
        		, principal.getName());
        
        if(result != 1) {
        	return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok("수정 성공");
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
        if(res != 1) {
        	return ResponseEntity.badRequest().build();
        	
        }        
        return ResponseEntity.ok("삭제 성공");
    }
    
}