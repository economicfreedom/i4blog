package com.i4.i4blog.controller.main;

import com.i4.i4blog.dto.main.SearchResultDTO;
import com.i4.i4blog.repository.model.main.MainDTO;
import com.i4.i4blog.service.admin.AdminService;
import com.i4.i4blog.service.board.BoardService;
import com.i4.i4blog.service.main.MainService;
import com.i4.i4blog.util.Criteria;
import com.i4.i4blog.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainPageController {
    private final MainService mainService;
    private final BoardService boardService;

    @GetMapping("/")
    public String mainPage(Model model) {
        Criteria criteria = new Criteria();
        criteria.setCountPerPage(24);
        criteria.setType("");
        List<MainDTO> mainList = mainService.defaultMainPage(criteria);
        model.addAttribute("mainList", mainList);

        return "main/main";

    }

    @GetMapping("/search")
    public String searchPage(
            @RequestParam(value = "page-num"
                    , required = false
                    , defaultValue = "1")
            Integer pageNum
            , @RequestParam(name = "is-user", defaultValue = "false") Boolean isUser
            , Criteria cri
            , Model model) {


        log.info("유저 블로그에서 검색되었나? : {}", isUser);
        cri.setPageNum(pageNum);
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        Integer searchTotal = boardService.getSearchTotal(cri);

        if (cri.getType() == null){
            cri.setType("title");
        }
        boolean typeIsTitleOrContent = typeIsTitleOrContent(cri.getType());
        model.addAttribute("typeIsTitleOrContent",typeIsTitleOrContent);

        pageDTO.setArticleTotalCount(searchTotal);
        List<SearchResultDTO> searchResultDTOS = boardService.boardPagingList(cri);
        log.info("검색 결과 {}",searchResultDTOS);

        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("results", searchResultDTOS);



        return "main/search";
    }

    private boolean typeIsTitleOrContent(String type){

        if (type.equals("user")){
            return false;
        }


        return true;
    }
}
