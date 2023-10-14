package com.i4.i4blog.repository.interfaces.user;

import com.i4.i4blog.repository.model.user.User;
import com.i4.i4blog.vo.user.ProfileInfoVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
    public User findByUserId(String userId);

    public ProfileInfoVo findProfileByUserId(String userId);

    public int insert(User user);

    public Integer findUserNickname(String nickname);

    /**
     * @param userId
     * @return id
     * user_id 기준으로 인덱스값 가져옴
     * @author 촤규하
     */

    public Integer getIdByUserId(String userId);

    public Integer findByUserIdCheck(String userId);

    public String getNickname(String userId);

    public User findByEmail(String email);

    /**
     * @param userId
     * @return id
     * 남은 지피티 사용회수를 가져옴
     * @author 촤규하
     */
    public byte getGptCountByUserId(String userId);

    /**
     * @param userId
     * @return id
     * gpt 사용 가능 회수를 마이너스함
     * @author 촤규하
     */
    public void decrementUsageCountByUserId(String userId);

    /**
     * @author 최규하
     * count 3으로 초기화
     */
    public void resetGptCountAllUser();
}
