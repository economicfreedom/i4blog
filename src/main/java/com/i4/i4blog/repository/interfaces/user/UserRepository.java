package com.i4.i4blog.repository.interfaces.user;

import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.repository.model.user.User;

@Mapper
public interface UserRepository {
	public User findByUserId(String userId);

	public int insert(User user);
}
