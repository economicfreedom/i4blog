package com.i4.i4blog.repository.interfaces.admin;

import com.i4.i4blog.repository.model.admin.AdminReportVO;
import com.i4.i4blog.repository.model.admin.DateCountDTO;
import com.i4.i4blog.util.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminRepository {

    /* 
     * 최규하
     * 어제 오늘 가입한 사람수,작성된 글,댓글을 가져옴 
     *
     */
    public DateCountDTO dateCount();

    public List<AdminReportVO> getReportList( Criteria criteria);

    int count(Criteria searchDTO);
}
