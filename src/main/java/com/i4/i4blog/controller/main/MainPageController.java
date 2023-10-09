package com.i4.i4blog.controller.main;

import com.i4.i4blog.repository.model.main.MainDTO;
import com.i4.i4blog.service.main.MainService;
import com.i4.i4blog.util.Criteria;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainPageController {
    private final MainService mainService;
    @GetMapping("/")
    public String mainPage(Model model){
        Criteria criteria = new Criteria();
        criteria.setCountPerPage(24);
        List<MainDTO> mainList = mainService.defaultMainPage(criteria);
        model.addAttribute("mainList",mainList);

        return "main";

    }

}
