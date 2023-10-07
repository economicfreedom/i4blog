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

    /**
     *
     * @param userId
     * @return user 테이블 id
     *
     */

    public UserProfile findByUserId(String userId){
        Integer id = userRepository.getId(userId);
        log.info("userRepository.getId(userId)  : {}",id);
        log.info("userProfileRepository.findByUserId(id) : {}"
                , userProfileRepository.findByUserId(id));
        return userProfileRepository.findByUserId(id);
    }

    /**
     * @param profileRequestDTO
     * 닉네임 변경
     */

    public void changeNickname (ProfileRequestDTO profileRequestDTO){
        userProfileRepository.saveNickname(profileRequestDTO);
    }

    /**
     *
     * @param profileRequestDTO
     * @param principal
     * 프로필 이미지 저장
     *
     */
    public void saveImg(ProfileRequestDTO profileRequestDTO, Principal principal) {

        log.info("=== saveImg start ===");
        String userId = principal.getName();
        String originalImg = profileRequestDTO.getOriginalImg();

        String thumbNail = profileRequestDTO.getThumbNail();
        log.info("thumbNail path : {}",thumbNail);
        userProfileRepository.saveImg(userId,originalImg,thumbNail);
        log.info("=== saveImg done ===");

    }
}
