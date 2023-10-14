package com.i4.i4blog.controller.like;

import java.security.Principal;

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
	public ResponseEntity<?> addLike(@RequestBody Integer boardId, Principal principal) {
		likeService.addLike(boardId, principal);
		
		return ResponseEntity.ok("/blog/" + principal.getName() + "/board/view/" + boardId);
	}
	
	@DeleteMapping("/delete-like")
	public ResponseEntity<?> deleteLike(@RequestBody Integer boardId, Principal principal) {
		likeService.deleteLike(boardId, principal);
		
		return ResponseEntity.ok("좋아요 실패");
	}
}
