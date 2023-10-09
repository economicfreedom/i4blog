package com.i4.i4blog.controller.main;

import com.i4.i4blog.repository.model.main.MainDTO;
import com.i4.i4blog.service.main.MainService;
import com.i4.i4blog.util.Criteria;
import com.i4.i4blog.util.PageDTO;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor
public class MainPageAPIController {
    private final MainService mainService;
    @GetMapping("/default-pagedto")
    public Object mainPage(@RequestParam Integer pageNum){
        Criteria criteria = new Criteria();
        criteria.setPageNum(pageNum);
        criteria.setCountPerPage(24);
        List<MainDTO> mainList = mainService.defaultMainPage(criteria);
        Integer count = mainService.getListCount();
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(criteria);

        pageDTO.setArticleTotalCount(count);
        List<Object> list = new ArrayList<>();
        list.add(pageDTO);
        list.add(mainList);
//        return pageDTO;
        return list;

    }
//        @GetMapping("/default")


}
