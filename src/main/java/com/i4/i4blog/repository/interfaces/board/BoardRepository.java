package com.i4.i4blog.repository.interfaces.board;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.repository.model.board.Board;

@Mapper
public interface BoardRepository {
    public int insert(Board board);

    /**
	 * @author 최규하
	 * 이름은 delete지만 실제론 state를 바꾸기 때문에 update로 동작함
	 * state가 1이었던걸 0으로 바꿈
	 */
    public int deleteById(Integer id);
    
    public List<Board> findByUserId(Integer userId);
    
    public Board findById(Integer id);
    
    public int updateCount(Integer id);
}
