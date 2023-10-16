package com.i4.i4blog.repository.interfaces.board;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.repository.model.board.Board;
import com.i4.i4blog.vo.board.BoardListVo;
import com.i4.i4blog.vo.board.BoardVO;

@Mapper
public interface BoardRepository {
	
	/**
	 * 게시글 작성
	 * @param board
	 */
    public int insert(Board board);

    /**
	 * @author 최규하
	 * 이름은 delete지만 실제론 state를 바꾸기 때문에 update로 동작함
	 * state가 1이었던걸 0으로 바꿈
	 */
    public int deleteById(Integer id);
    
    /**
     * 사용자의 게시글 목록 (userId로 게시글 목록보기)
     * @param userId
     * @return List<Board>
     */

    public List<BoardListVo> findByUserId(Integer userId);
    
    public List<Board> findAllByUserId(Integer userId);
    
    /**
     * 게시글 id로 글 상세보기
     * @param id
     * @return 
     */
    public BoardVO findById(Integer id);
    
    /**
     * 조회수 +1
     * @param id
     */
    public int updateCount(Integer id);
    public int updateById(Board board);
    public Board getBoard(Integer id);
    public void deleteThumbnail(Integer id);
    
}
