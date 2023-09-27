package com.i4.i4blog.repository.interfaces.comment;
import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.repository.model.comment.Comment;
 
@Mapper
public interface CommentRepository {
	
	/**
	 * 
	 * @param comment
	 * @return
	 */
	public int insert(Comment comment);

	
	
	
}
