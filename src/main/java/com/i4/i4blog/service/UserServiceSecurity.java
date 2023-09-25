package com.i4.i4blog.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.i4.i4blog.config.security.PrincipalDetails;
import com.i4.i4blog.repository.interfaces.UserRepository;
import com.i4.i4blog.repository.model.User;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceSecurity implements UserDetailsService {
	
	private final UserRepository userRepository;
	
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUserId(username);
        if(user == null) {
        	return null;
        }
        return new PrincipalDetails(user);
    }
}
