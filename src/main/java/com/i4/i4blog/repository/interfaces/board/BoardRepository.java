package com.i4.i4blog.repository.interfaces.board;


import com.i4.i4blog.repository.model.board.Board;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardRepository {
    public int insert(Board board);

}
