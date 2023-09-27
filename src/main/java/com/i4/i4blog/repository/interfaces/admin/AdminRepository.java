package com.i4.i4blog.repository.interfaces.admin;

import com.i4.i4blog.repository.model.admin.DateCountDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminRepository {
    public DateCountDTO dateCount();
}
