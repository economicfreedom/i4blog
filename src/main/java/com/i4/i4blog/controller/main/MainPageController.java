package com.i4.i4blog.controller.main;

import com.i4.i4blog.dto.search.SearchResultDTO;
import com.i4.i4blog.repository.model.main.MainDTO;
import com.i4.i4blog.service.board.BoardService;
import com.i4.i4blog.service.main.MainService;
import com.i4.i4blog.service.search.SearchService;
import com.i4.i4blog.util.Criteria;
import com.i4.i4blog.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainPageController {
    private final MainService mainService;
    private final BoardService boardService;
    private final SearchService searchService;

    /**
     * @author 최규하
     * 메인 페이지 컨트롤러
     */


    @GetMapping("/")
    public String mainPage(Model model) {
        Criteria criteria = new Criteria();
        criteria.setCountPerPage(24);
        criteria.setType("");
        List<MainDTO> mainList = mainService.defaultMainPage(criteria);
        model.addAttribute("mainList", mainList);

        return "main/main";

    }

    // ser
    @GetMapping("/search")
    public String searchPage(
            @RequestParam(value = "page-num"
                    , required = false
                    , defaultValue = "1")
            Integer pageNum

            , @RequestParam(name = "is-user", defaultValue = "false") Boolean isUser
            , Criteria cri
            , Model model
            , @RequestParam(name = "user-id", defaultValue = "null") String userId
            , HttpSession session) {

        if (cri.getType() == null) {
            cri.setType("title");
        }
        session.setAttribute("keyword", cri.getKeyword());
        session.setAttribute("type", cri.getType());
        log.info("유저 블로그에서 검색되었나? : {}", isUser);
        cri.setPageNum(pageNum);
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        Integer searchTotal;

        List<SearchResultDTO> searchResultDTOS;
        cri.setCountPerPage(10);
        if (cri.getType().equals("user")) {
            searchTotal = searchService.getUserSearchTotal(cri, userId);
            searchResultDTOS = searchService.userSearchPageList(cri, userId);


        } else {
            log.info("type {} ", cri.getType());
            searchTotal = searchService.getSearchTotal(cri, userId);
            searchResultDTOS = searchService.boardSearchList(cri, userId);
        }


        boolean typeIsTitleOrContent = typeIsTitleOrContent(cri.getType());
        model.addAttribute("typeIsTitleOrContent", typeIsTitleOrContent);

        pageDTO.setArticleTotalCount(searchTotal);
        log.info("검색 결과 {}", searchResultDTOS);

        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("results", searchResultDTOS);


        return "main/search";
    }

    private boolean typeIsTitleOrContent(String type) {

        if (type.equals("user")) {
            return false;
        }


        return true;
    }
}
