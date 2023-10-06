package com.i4.i4blog.service.user;

import com.i4.i4blog.dto.user.UserJoinFormDto;
import com.i4.i4blog.repository.model.user.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


import com.i4.i4blog.repository.interfaces.user.UserRepository;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	private final UserRepository userRepository;
	private final PasswordEncoder passwordEncoder;
	

	public void userJoinService(UserJoinFormDto userJoinFormDto) {
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
		
	}
	public Integer getId(String userId){
		return userRepository.getId(userId);
	}

	public Integer findUserNickname(String nickname){
		return userRepository.findUserNickname(nickname);
	}

}
