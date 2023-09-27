package com.i4.i4blog.repository.interfaces.board;


import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.repository.model.board.Board;

@Mapper
public interface BoardRepository {
    public int insert(Board board);

}
