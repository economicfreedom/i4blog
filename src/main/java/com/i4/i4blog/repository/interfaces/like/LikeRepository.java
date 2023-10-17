package com.i4.i4blog.repository.interfaces.like;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.i4.i4blog.repository.model.like.Like;

@Mapper
public interface LikeRepository {
	
	/**
	 * 좋아요가 있는지 없는지 검토
	 * @param boardId
	 * @param userId
	 * @return
	 */
	public Like findByUserIdAndBoardId(@Param("boardId") Integer boardId, @Param("userId") Integer userId);
	
	/**
	 * 좋아요 증가
	 * @param boardId
	 * @param userId
	 * @return
	 */
	public int insertByUserIdAndBoardId(@Param("boardId") Integer boardId, @Param("userId") Integer userId);
	
	/**
	 * 좋아요 삭제
	 * @param boardId
	 * @param userId
	 */
	public void deleteByUserIdAndBoardId(@Param("boardId") Integer boardId, @Param("userId") Integer userId);
}
