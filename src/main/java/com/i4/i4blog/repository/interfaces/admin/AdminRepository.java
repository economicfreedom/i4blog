package com.i4.i4blog.repository.interfaces.admin;

import com.i4.i4blog.repository.model.admin.AdminReportVO;
import com.i4.i4blog.repository.model.admin.DateCountDTO;
import com.i4.i4blog.repository.model.admin.GraphDataVO;
import com.i4.i4blog.repository.model.admin.UserManage;
import com.i4.i4blog.util.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminRepository {

    /**
     * @author 최규하
     * 어제 오늘 가입한 사람수,작성된 글,댓글을 가져옴
     */
    public DateCountDTO dateCount();

    /**
     * @author 최규하
     * Reprot 테이블에 행과열을 type에 따라 다르게 가져옴
     */
    public List<AdminReportVO> getReportList(Criteria criteria);

    /**
     * @author 최규하
     * Report 테이블의 결과값을 type에 따라 카운트해서 가져옴
     */
    int count(Criteria searchDTO);

    /**
     * @param tableName : 테이블명,columnName : 테이블명에 맞는 생성일자 컬럼이름
     * @param tableName = user , coloumName = user_regdate
     * @param tableName = board , coloumName = board_created
     * @param tableName = comment , coloumName = comment_date
     * @param tableName = report , coloumName = report_date
     * @return 지난 일주일간 가입한 유저 일별 카운트
     * <p>
     * 매개변수 유형
     * @author 최규하
     */

    List<GraphDataVO> countDataForLastSevenDays(String tableName, String columnName);
  /*

 	테이블이름 = user ,     컬럼이름 : user_regdate
	테이블이름 = board ,    컬럼이름 : board_created
	테이블이름 = comment ,  컬럼이름 : comment_date
	테이블이름 = report ,   컬럼이름 : report_date

	*/

    List<UserManage> userMangeList(Criteria cri);

    Integer userCount(Criteria cri);

    void userRoleUp(Integer id);

}
