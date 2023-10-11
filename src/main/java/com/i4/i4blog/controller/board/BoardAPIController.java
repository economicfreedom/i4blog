package com.i4.i4blog.controller.board;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.i4.i4blog.dto.board.BoardUpdateFormDto;
import com.i4.i4blog.dto.board.BoardWriteFormDto;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.service.board.BoardService;
import com.i4.i4blog.service.upload.UploadService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardAPIController {
    private final BoardService boardService;
    private final UserRepository userRepository;
    private final UploadService uploadService;
    /**
     * @author 최규하
     * 이름은 delete지만 실제론 state를 바꾸기 때문에 update로 동작함
     * state가 1이었던걸 0으로 바꿈
     */
    // 추가 - 최규하
    // 내용 - 회원 가입된 사용자만 접근 가능하게 추가
    @PreAuthorize("isAuthenticated()")
    @PutMapping("/del")
    public ResponseEntity<? extends Object> deleteById(
            @RequestBody Integer id

    ) {

        log.info("board deleteById Start");
        log.info("삭제 아이디 : {}", id);
        Integer res = boardService.deleteById(id);


        log.info("board deleteById End");


        return ResponseEntity.ok("삭제 성공");
    }

    /**
     * 게시글 작성 기능
     *
     * @param boardWriteFormDto
     * @return list.jsp
     * 게시글 작성 후 목록으로 redirect
     */
    // 추가 - 최규하
    // 내용 - 회원 가입된 사용자만 접근 가능하게 추가
    @PreAuthorize("isAuthenticated()")
    @PostMapping("/write")
    public ResponseEntity<?> boardWriteProc(
            @Valid
            @RequestBody
            BoardWriteFormDto boardWriteFormDto, Principal principal
    ) {
        CustomMessage customMessage = new CustomMessage();


        log.info("작성된 글 {}", boardWriteFormDto);
        boardService.boardWriteService(boardWriteFormDto, principal);

        customMessage.setMessage("/blog/" + principal.getName() + "/board/list");

        return ResponseEntity.ok(customMessage);
    }

    // 추가 - 최규하
    // 내용 - 회원 가입된 사용자만 접근 가능하게 추가
    @PreAuthorize("isAuthenticated()")
    @PutMapping("/update")
    public ResponseEntity<?> boardUpdateProc(
    		@RequestBody
    		BoardUpdateFormDto boardUpdateFormDto, Principal principal) throws IllegalAccessException {
        log.info("수정된 글 {}", boardUpdateFormDto);
        
        boardService.boardUpdateService(boardUpdateFormDto);
        if (boardUpdateFormDto.getThumbnail() == null) {
        	log.info("테스트 이미지 삭제");
        	List<String> images = new ArrayList<>();
        	images.add(boardUpdateFormDto.getOldThumbnail());
        	images.add(boardUpdateFormDto.getOldImgOriginal());
        	uploadService.imgRemove(images);
		}
        
        
        String url = "/blog/" + principal.getName() + "/board/view/" + boardUpdateFormDto.getId() ;
        System.out.println("url 저장");
        CustomMessage customMessage = new CustomMessage();
        customMessage.setMessage(url);
        return ResponseEntity.ok(customMessage);
    }
    
    @Data
    private class CustomMessage {
        private String message;
    }
}
