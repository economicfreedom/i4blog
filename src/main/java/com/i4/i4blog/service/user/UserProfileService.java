package com.i4.i4blog.service.user;

import com.i4.i4blog.repository.interfaces.user.UserProfileRepository;
import com.i4.i4blog.repository.model.user.UserProfile;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserProfileService {


    private final UserProfileRepository userProfileRepository;

    public UserProfile findByUserId(Integer userId){
        return userProfileRepository.findByUserId(userId);
    }
}
