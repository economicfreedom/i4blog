package com.i4.i4blog.repository.interfaces.user;

import com.i4.i4blog.dto.ProfileRequestDTO;
import com.i4.i4blog.repository.model.user.UserProfile;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserProfileRepository {

    public UserProfile findByUserId(Integer id);

    public void saveNickname(ProfileRequestDTO profileRequestDTO);

    void saveImg(@Param("userId")
                 String userId
            , @Param("originalImg")
                 String originalImg
            , @Param("thumbNail")
                 String thumbNail);

}
