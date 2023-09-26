package com.i4.i4blog.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.repository.model.Board;

@Mapper
public interface BoardRepository {
	public int insert(Board board);
	
}
