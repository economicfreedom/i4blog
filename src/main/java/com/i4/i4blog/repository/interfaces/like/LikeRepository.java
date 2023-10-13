package com.i4.i4blog.repository.interfaces.like;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeRepository {
	/**
	 * 좋아요가 있는지 없는지 검토
	 * @param userId
	 * @param boardId
	 * @return
	 */
	public Boolean findByUserIdAndBoardId(Integer userId, Integer boardId);
	
	/**
	 * 좋아요 증가
	 * @param userId
	 * @param boardId
	 * @return
	 */
	public int insertByUserIdAndBoardId(Integer userId, Integer boardId);
	
	/**
	 * 좋아요 삭제
	 * @param userId
	 * @param boardId
	 */
	public void deleteByUserIdAndBoardId(Integer userId, Integer boardId);
}
