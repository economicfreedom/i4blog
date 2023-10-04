package com.i4.i4blog.repository.interfaces.user;

import com.i4.i4blog.repository.model.user.UserProfile;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserProfileRepository {

    public UserProfile findByUserId(Integer id);

}
