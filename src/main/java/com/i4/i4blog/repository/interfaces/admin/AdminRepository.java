package com.i4.i4blog.repository.interfaces.admin;

import com.i4.i4blog.repository.model.admin.DateCountDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminRepository {

    /* 
     * 최규하
     * 어제 오늘 가입한 사람수,작성된 글,댓글을 가져옴 
     *
     */
    public DateCountDTO dateCount();
}
