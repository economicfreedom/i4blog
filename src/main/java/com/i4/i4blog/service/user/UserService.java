package com.i4.i4blog.service.user;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.i4.i4blog.dto.email.ForgotEmailAuthDto;
import com.i4.i4blog.dto.user.ForgotPwDto;
import com.i4.i4blog.dto.user.UserJoinFormDto;
import com.i4.i4blog.repository.interfaces.user.UserProfileRepository;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.repository.model.user.User;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	private final UserRepository userRepository;
	private final UserProfileRepository userProfileRepository;
	private final PasswordEncoder passwordEncoder;
	/**
	 * 회원가입 기능 서비스
	 * @param userJoinFormDto
	 * @return 
	 */
	@Transactional
	public int userJoinService(UserJoinFormDto userJoinFormDto) {
		String encodePassword = passwordEncoder.encode(userJoinFormDto.getUserPassword());
		User user = User.builder()
							.userId(userJoinFormDto.getUserId())
							.userPassword(encodePassword)
							.userName(userJoinFormDto.getUserName())
							.userNickname(userJoinFormDto.getUserNickname())
							.userPhone(userJoinFormDto.getUserPhone())
							.userEmail(userJoinFormDto.getUserEmail())
							.build();
		int result = userRepository.insert(user);
		return result;
	}

	public Integer findUserNickname(String nickname) {
		return userRepository.findUserNickname(nickname);
	}

	public String getUserNicknameByUserId(String userId){
		return userRepository.getUserNicknameByUserId(userId);
	}

	public Integer getIdByUserId(String userId) {
		return userRepository.getIdByUserId(userId);
	}

	public Integer findByUserIdCheck(String userId) {
		return userRepository.findByUserIdCheck(userId);
	}

	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	public User findByUserIdAndEmail(ForgotEmailAuthDto forgotEmailAuthDto) {
		return userRepository.findByUserIdAndEmail(forgotEmailAuthDto);
	}

	public User findByIdAndPassword(ForgotPwDto forgotPwChangeDto) {
		return userRepository.findByIdAndPassword(forgotPwChangeDto);
	}

	@Transactional
	public void updatePassword(Integer id, String newPw) {
		String encodePassword = passwordEncoder.encode(newPw);
		userProfileRepository.changePw(id, encodePassword);
	}
	
	    /**
     * @param userId
     * @return id
     * 남은 지피티 사용회수를 가져옴
     * @author 촤규하
     */

	public byte getGptCountByUserId(String userId){
		return userRepository.getGptCountByUserId(userId);
	}
	    /**
     * @param userId
     * @return id
     * 남은 지피티 사용회수를 가져옴
     * @author 촤규하
     */
	public void decrementUsageCountByUserId(String userId){
		userRepository.decrementUsageCountByUserId(userId);
	}

}
