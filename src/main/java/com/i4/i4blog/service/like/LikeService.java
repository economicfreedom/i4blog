package com.i4.i4blog.service.like;

import java.security.Principal;

import org.springframework.stereotype.Service;

import com.i4.i4blog.repository.interfaces.board.BoardRepository;
import com.i4.i4blog.repository.interfaces.like.LikeRepository;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.repository.model.board.Board;
import com.i4.i4blog.repository.model.like.Like;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LikeService {
	
	private final LikeRepository likeRepository;
	private final UserRepository userRepository;
	
	/**
	 * 좋아요가 있는지 없는지 검토
	 */
	public boolean existsLike(Integer boardId, Principal principal) {
		Integer userId = userRepository.getIdByUserId(principal.getName());
		
		if (likeRepository.findByUserIdAndBoardId(boardId, userId) == 1) {
			return true;
		}
		
		return false;
	}
	
	/**
	 * 좋아요 증가
	 * 좋아요 데이터가 있는지 조회하여 없다면 좋아요 insert
	 */
	public void addLike(Integer boardId, Principal principal) {
		Integer userId = userRepository.getIdByUserId(principal.getName());
		
		if (!existsLike(boardId, principal)) {
			Like like =  new Like();
			like.setBoardId(boardId);
			like.setUserId(userId);
			
			likeRepository.insertByUserIdAndBoardId(boardId, userId);
		}
	}
	
	/**
	 * 좋아요 삭제
	 * 좋아요 데이터가 있다면 delete
	 */
	public void deleteLike(Integer boardId, Principal principal) {
		Integer userId = userRepository.getIdByUserId(principal.getName());
		
		if (existsLike(boardId, principal)) {
			likeRepository.deleteByUserIdAndBoardId(boardId, userId);
		}
	}
	
	
	
}
