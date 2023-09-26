package com.i4.i4blog.repository.interfaces.user;

import com.i4.i4blog.repository.model.user.User;
import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface UserRepository {
	public User findByUserId(String userId);

	public int insert(User user);
}
