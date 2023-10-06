package com.i4.i4blog.repository.interfaces.comment;
import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.i4.i4blog.repository.model.comment.Comment;

 
@Mapper
public interface CommentRepository  {	
	/**
	 * 
	 * @param comment create
	 * @return
	 */
	//생성
	
	public int createById(Integer id);
	//리스트
	public List<Comment> findById(Integer id);
	/**
	 * 
	 * @param comment
	 * @return
	 */
	public int insert(Comment comment);

	/**
	 * @author 최규하
	 * 이름은 delete지만 실제론 state를 바꾸기 때문에 update로 동작함
	 * state가 1이었던걸 0으로 바꿈
	 */
	public int deleteById(Integer id);
	
	
	
}
