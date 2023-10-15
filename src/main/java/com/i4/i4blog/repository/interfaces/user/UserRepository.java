package com.i4.i4blog.repository.interfaces.user;

import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.dto.email.ForgotEmailAuthDto;
import com.i4.i4blog.dto.user.ForgotPwChangeDto;
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
	public User findByUserIdAndEmail(ForgotEmailAuthDto forgotEmailAuthDto);
	public User findByIdAndPassword(ForgotPwChangeDto forgotPwChangeDto);
	public void updateUser(User user);
	
}
