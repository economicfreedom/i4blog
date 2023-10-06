package com.i4.i4blog.repository.interfaces.board;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.repository.model.board.Board;
import com.i4.i4blog.vo.board.BoardVO;

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
    public List<Board> findAllByUserId(Integer userId);
    
    public BoardVO findById(Integer id);
    public int updateCount(Integer id);
    
//  서비스에서 처리
//  if문을 걸어서 board에 있는 user_id(프라이머리키) 얘를 가지고
//  프린시펄에 있는 getName으로 user테이블에 user_id(아이디)를 사용해서 id를 가져옴
//  이 두개를 비교해서 같으면 따로 board List 메소드를 만들어서 처리한다던지

  
//  id를 가지고 다시 user테이블에서 user_id의 값을 가져옴
//  프린시펄에 있는 if(principal.getName().equals(userId)) {
//  	 같을 시 로직 처리
//  	{
//  		다를 시 로직 처리
//  	}
  
//  }
}
