package com.i4.i4blog.service.admin;

import com.i4.i4blog.repository.interfaces.admin.AdminRepository;
import com.i4.i4blog.repository.model.admin.AdminReportVO;
import com.i4.i4blog.repository.model.admin.DateCountDTO;
import com.i4.i4blog.repository.model.admin.GraphDataVO;
import com.i4.i4blog.repository.model.admin.SevenDaysDataDTO;
import com.i4.i4blog.util.Criteria;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Service
public class AdminService {
    private final AdminRepository adminRepository;


    public DateCountDTO getDateCountDTO() {
        return adminRepository.dateCount();
    }

    public List<AdminReportVO> getReportList(Criteria criteria) {
        return adminRepository.getReportList(criteria);
    }

    public Integer getReportTotalCount(Criteria criteria) {
        return adminRepository.count(criteria);
    }

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
     * @deprecated 테스트용
     */


    public List<GraphDataVO> countDataForLastSevenDays(String tableName, String columnName) {
        return adminRepository.countDataForLastSevenDays(tableName, columnName);
    }


    /**
     * 매개변수 유형
     * @return SevenDaysDataDTO
     * <p>
     * @author 최규하
     */
    public SevenDaysDataDTO getSevenDaysDataDTO() {
        List<GraphDataVO> user =
                adminRepository.countDataForLastSevenDays("user"
                        , "user_created_at");
        List<GraphDataVO> board =
                adminRepository.countDataForLastSevenDays("board"
                        , "board_created_at");
        List<GraphDataVO> comment =
                adminRepository.countDataForLastSevenDays("comment"
                        , "comment_created_at");
        List<GraphDataVO> report =
                adminRepository.countDataForLastSevenDays("report"
                        , "report_created_at");

        List<Integer> userCounts = extractCountsAndDates(user).getLeft();
        List<Integer> boardCounts = extractCountsAndDates(board).getLeft();
        List<Integer> commentCounts = extractCountsAndDates(comment).getLeft();
        List<Integer> reportCounts = extractCountsAndDates(report).getLeft();


        List<String> userCreatedDates = extractCountsAndDates(user).getRight();
        List<String> boardCreatedDates = extractCountsAndDates(board).getRight();
        List<String> commentCreatedDate = extractCountsAndDates(comment).getRight();
        List<String> reportCreatedDate = extractCountsAndDates(report).getRight();

        return SevenDaysDataDTO.builder()
                .userCounts(userCounts)
                .boardCounts(boardCounts)
                .commentCounts(commentCounts)
                .reportCounts(reportCounts)
                .userCreatedDates(userCreatedDates)
                .boardCreatedDates(boardCreatedDates)
                .commentCreatedDates(commentCreatedDate)
                .reportCreatedDates(reportCreatedDate)
                .build();
    }

    /**
     * @param data
     * @return List<Integer>,List<String>
     * @author 최규하
     */

    private Pair<List<Integer>, List<String>> extractCountsAndDates(List<GraphDataVO> data) {
        List<Integer> counts = new ArrayList<>();
        List<String> dates = new ArrayList<>();

        for (GraphDataVO graphDataVO : data) {
            counts.add(graphDataVO.getCount());
            dates.add(graphDataVO.getRegDate());
        }
        return Pair.of(counts, dates);
    }
}
