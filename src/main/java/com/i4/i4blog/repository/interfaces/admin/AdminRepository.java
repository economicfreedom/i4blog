package com.i4.i4blog.repository.interfaces.admin;

import com.i4.i4blog.repository.model.admin.AdminReportVO;
import com.i4.i4blog.repository.model.admin.DateCountDTO;
import com.i4.i4blog.util.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminRepository {

    /** 
     * @author 최규하
     * 어제 오늘 가입한 사람수,작성된 글,댓글을 가져옴 
     *
     */
    public DateCountDTO dateCount();

    /**
	 * @author 최규하
	 * Reprot 테이블에 행과열을 type에 따라 다르게 가져옴 
	 */
    public List<AdminReportVO> getReportList( Criteria criteria);

    /**
	 * @author 최규하
	 * Report 테이블의 결과값을 type에 따라 카운트해서 가져옴
	 */
    int count(Criteria searchDTO);
}
