package com.i4.i4blog;

import com.i4.i4blog.dto.user.UserJoinFormDto;
import com.i4.i4blog.repository.model.admin.DateCountDTO;
import com.i4.i4blog.repository.model.admin.GraphDataVO;
import com.i4.i4blog.repository.model.admin.SevenDaysDataDTO;
import com.i4.i4blog.service.admin.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.tuple.Pair;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
class I4blogApplicationTests {

    private final AdminService adminService;

    @Autowired
    public I4blogApplicationTests(AdminService adminService) {
        this.adminService = adminService;
    }

    @Test
    void contextLoads() {
    }


    @Test
    void logTest() {
        UserJoinFormDto userJoinFormDto = new UserJoinFormDto();
        userJoinFormDto.setUserNickname("asdf");
        userJoinFormDto.setUserEmail("asdfsadfa");

        System.out.println("유저 폼 :" + userJoinFormDto);

        log.info("유저 폼 로그 : {}", userJoinFormDto);
    }

    // 최규하
    @Test
    void 가입한유저및작성된글과댓글() {

        DateCountDTO dateCountDTO = adminService.getDateCountDTO();
        Assertions.assertNotNull(dateCountDTO.getTJoinedUser());


    }

    private Pair<List<Integer>, List<String>> test(List<GraphDataVO> data) {
        List<Integer> counts = new ArrayList<>();
        List<String> dates = new ArrayList<>();

        for (GraphDataVO graphDataVO : data) {
            counts.add(graphDataVO.getCount());
            dates.add(graphDataVO.getRegDate());
        }
        return Pair.of(counts, dates);
    }

    @Test
    void 차트js에필요한데이터가공테스트() {
        List<GraphDataVO> user =
                adminService.countDataForLastSevenDays("user"
                        , "user_regdate");
        List<GraphDataVO> board =
                adminService.countDataForLastSevenDays("board"
                        , "board_created");
        List<GraphDataVO> comment =
                adminService.countDataForLastSevenDays("comment"
                        , "comment_date");
        List<GraphDataVO> report =
                adminService.countDataForLastSevenDays("report"
                        , "report_date");

        List<Integer> userCounts = test(user).getLeft();
        List<Integer> boardCounts = test(board).getLeft();
        List<Integer> commentCounts = test(comment).getLeft();
        List<Integer> reportCounts = test(report).getLeft();


        List<String> userCreatedDates = test(user).getRight();
        List<String> boardCreatedDates = test(board).getRight();
        List<String> commentCreatedDate = test(comment).getRight();
        List<String> reportCreatedDate =test(report).getRight();
//        for (GraphDataVO graphDataVO : user) {
//            log.info("user ===> {}", graphDataVO);
//            userCounts.add(graphDataVO.getCount());
//            userCreatedDates.add(graphDataVO.getRegDate());
//
//        }
//
//        for (GraphDataVO graphDataVO : board) {
//            log.info("board ===> {}", graphDataVO);
//            boardCounts.add(graphDataVO.getCount());
//            boardCreatedDates.add(graphDataVO.getRegDate());
//        }
//
//        for (GraphDataVO graphDataVO : comment) {
//            log.info("comment ===> {}", graphDataVO);
//            commentCounts.add(graphDataVO.getCount());
//            commentCreatedDate.add(graphDataVO.getRegDate());
//        }
//
//        for (GraphDataVO graphDataVO : report) {
//            log.info("report ===> {}", graphDataVO);
//            reportCounts.add(graphDataVO.getCount());
//            reportCreatedDate.add(graphDataVO.getRegDate());
//        }

        SevenDaysDataDTO dto = SevenDaysDataDTO.builder()
                .userCounts(userCounts)
                .boardCounts(boardCounts)
                .commentCounts(commentCounts)
                .reportCounts(reportCounts)
                .userCreatedDates(userCreatedDates)
                .boardCreatedDates(boardCreatedDates)
                .commentCreatedDates(commentCreatedDate)
                .reportCreatedDates(reportCreatedDate)
                .build();

        log.info("dto ==== > {}", dto);

    }

    private Pair<List<Integer>, List<String>> extractCountsAndDates(List<GraphDataVO> data) {
        List<Integer> counts = new ArrayList<>();
        List<String> dates = new ArrayList<>();

        for (GraphDataVO graphDataVO : data) {
            counts.add(graphDataVO.getCount());
            dates.add(graphDataVO.getRegDate());
        }
        return Pair.of(counts, dates); // Pair 클래스는 Apache Commons Lang3 라이브러리에 포함되어 있습니다.
    }
}
