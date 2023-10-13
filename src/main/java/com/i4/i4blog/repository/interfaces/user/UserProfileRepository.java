package com.i4.i4blog.repository.interfaces.user;

import com.i4.i4blog.dto.user.ProfileRequestDTO;
import com.i4.i4blog.repository.model.user.UserProfile;
import com.i4.i4blog.dto.user.ProfileIMGDTO;
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

    void changePw(@Param("id")
                  Integer id
            , @Param("newPw")
                  String newPw);

    void saveTitleInfo(
            @Param("id")
            Integer id
            , @Param("info")
            String info
            , @Param("title")
            String title);

    void resign(String userId);

    void save();

    ProfileIMGDTO imgPaths(Integer id);
}
