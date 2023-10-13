package com.i4.i4blog.repository.interfaces.user;

import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.repository.model.user.User;
import com.i4.i4blog.vo.user.ProfileInfoVo;

@Mapper
public interface UserRepository {
	public User findByUserId(String userId);
	public ProfileInfoVo findProfileByUserId(String userId);
	public int insert(User user);
	public Integer findUserNickname(String nickname);

	public Integer getId(String userId);
	public Integer findByUserIdCheck(String userId);
	public String getNickname(String userId);
	public User findByEmail(String email);
	
}
