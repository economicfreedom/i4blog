package com.i4.i4blog.controller.like;

import java.security.Principal;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.i4.i4blog.service.like.LikeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/like")
@RequiredArgsConstructor
@Slf4j
public class LikeAPIController {
	private final LikeService likeService;
	
	@PostMapping("/add-like")
	public ResponseEntity<?> addLike(@RequestBody Map<String, Integer> boardId, Principal principal) {
		log.info("json_data boardId 값은 ==> {}", boardId);
		
		Integer bId = (Integer) boardId.get("boardId");
		log.info("boardId 값은 ==> {}", bId);
		likeService.addLike(bId, principal);
		
		return ResponseEntity.ok("좋아요 성공");
	}
	
	@DeleteMapping("/delete-like")
	public ResponseEntity<?> deleteLike(@RequestBody Integer boardId, Principal principal) {
		likeService.deleteLike(boardId, principal);
		
		return ResponseEntity.ok("좋아요 실패");
	}
}
