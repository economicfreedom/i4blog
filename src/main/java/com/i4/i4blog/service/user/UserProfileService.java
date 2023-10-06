package com.i4.i4blog.service.user;

import com.i4.i4blog.dto.ProfileRequestDTO;
import com.i4.i4blog.repository.interfaces.user.UserProfileRepository;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.repository.model.user.UserProfile;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserProfileService {


    private final UserProfileRepository userProfileRepository;
    private final UserRepository userRepository;
    public UserProfile findByUserId(String userId){
        Integer id = userRepository.getId(userId);

        return userProfileRepository.findByUserId(id);
    }

    public void changeNickname (ProfileRequestDTO profileRequestDTO){
        userProfileRepository.saveNickname(profileRequestDTO);
    }

    public void saveImg(ProfileRequestDTO profileRequestDTO, Principal principal) {
        String userId = principal.getName();
        String originalImg = profileRequestDTO.getOriginalImg();
        String thumbNail = profileRequestDTO.getThumbNail();

        userProfileRepository.saveImg(userId,originalImg,thumbNail);

    }
}
