package com.i4.i4blog.service.like;

import org.springframework.stereotype.Service;

import com.i4.i4blog.repository.interfaces.board.BoardRepository;
import com.i4.i4blog.repository.interfaces.like.LikeRepository;
import com.i4.i4blog.repository.model.board.Board;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LikeService {
	
	private final LikeRepository likeRepository;
	private final BoardRepository boardRepository;
	

	public boolean existsLike(Integer userId, Integer boardId) {
		return likeRepository.findByUserIdAndBoardId(userId, boardId);
	}
	
	public void addLike(Integer userId, Integer boardId) {
		if (!existsLike(userId, boardId)) {
			likeRepository.insertByUserIdAndBoardId(userId, boardId);
		}
	}
	
	public void deleteLike(Integer userId, Integer boardId) {
		if (existsLike(userId, boardId)) {
			likeRepository.deleteByUserIdAndBoardId(userId, boardId);
		}
	}
	
	
	
}
