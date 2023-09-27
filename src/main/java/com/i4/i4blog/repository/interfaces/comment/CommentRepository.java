package com.i4.i4blog.repository.interfaces.comment;

import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.repository.model.comment.Comment;


 
@Mapper
public interface CommentRepository {
	public Comment commentById (String comment);
	
	public int insert(Comment comment);
	
}
