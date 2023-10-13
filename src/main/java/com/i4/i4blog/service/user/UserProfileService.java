package com.i4.i4blog.service.user;

import com.i4.i4blog.dto.user.ProfileRequestDTO;
import com.i4.i4blog.dto.user.ProfileInfoDTO;
import com.i4.i4blog.dto.user.PwChangeRequestDTO;
import com.i4.i4blog.repository.interfaces.user.UserProfileRepository;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.repository.model.user.User;
import com.i4.i4blog.repository.model.user.UserProfile;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserProfileService {

	private final PasswordEncoder passwordEncoder;

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
    private boolean isNull(Object t ){

        if (t == null){
            return true;
        }
        return false;

    }

    public void saveImg(ProfileRequestDTO profileRequestDTO, Principal principal) {


        log.info("=== saveImg start ===");
        String userId = principal.getName();
        Integer id = userRepository.getId(userId);
        UserProfile profile = userProfileRepository.imgPaths(id);



        String originalImg = profileRequestDTO.getOriginalImg();

        String thumbNail = profileRequestDTO.getThumbNail();
        log.info("thumbNail path : {}",thumbNail);
        userProfileRepository.saveImg(userId,originalImg,thumbNail);
        log.info("=== saveImg done ===");

    }

    public boolean changePw(PwChangeRequestDTO pwChangeRequestDTO, Principal principal) {
        User user = userRepository.findByUserId(principal.getName());
        String userPassword = user.getUserPassword();
        String reqOriginalPw = pwChangeRequestDTO.getOriginalPw();


        if (pwCheck(userPassword, reqOriginalPw)) return false;


        Integer id = userRepository.getId(principal.getName());
        String newPw = passwordEncoder.encode(pwChangeRequestDTO.getNewPw());
        
        userProfileRepository.changePw(id,newPw);
        return true;
    }

    private boolean pwCheck(String userPassword, String reqOriginalPw) {
        boolean matches = passwordEncoder.matches(reqOriginalPw, userPassword);

        log.info("changePw matches : {}",matches);
        if (!matches){
            return true;
        }
        return false;
    }

    public void saveTitleInfo(String userId, ProfileInfoDTO profileInfoDTO) {
        Integer id = userRepository.getId(userId);
        String info = profileInfoDTO.getInfo();
        String title = profileInfoDTO.getTitle();

        userProfileRepository.saveTitleInfo(id,info,title);
    }

    public boolean resign(Principal principal, String pwd) {

        String userId = principal.getName();
        User user = userRepository.findByUserId(userId);
        String userPassword = user.getUserPassword();
        if (!passwordEncoder.matches(pwd,userPassword)){
            return false;
        }
        userProfileRepository.resign(userId);

        return true;

    }

    public void save() {
        userProfileRepository.save();
    }
}
