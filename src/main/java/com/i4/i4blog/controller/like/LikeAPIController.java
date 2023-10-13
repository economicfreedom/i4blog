package com.i4.i4blog.controller.like;

import java.security.Principal;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/like")
@RequiredArgsConstructor
@Slf4j
public class LikeAPIController {
	
	public ResponseEntity<?> addLike(Integer id, Principal principal) {
		return ResponseEntity.ok("좋아요 성공");
	}
}
