package com.i4.i4blog.controller.admin;

import com.i4.i4blog.repository.model.admin.AdminReportVO;
import com.i4.i4blog.repository.model.admin.DateCountDTO;
import com.i4.i4blog.service.admin.AdminService;
import com.i4.i4blog.util.Criteria;
import com.i4.i4blog.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import static org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.*;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {
//@RequestParam(name = "type"
//                            ,defaultValue = ""
//                            ,required = false) String type
//                            ,

    private final AdminService adminService;

    @GetMapping("/main")
    public String showMain(Model model){
        log.info("showMain Start ==>");
        DateCountDTO dateCountDTO = adminService.getDateCountDTO();
        log.info("date DTO {}",dateCountDTO);
        model.addAttribute(dateCountDTO);

        log.info("showMain End ==>");
        return "admin/main";
    }

    @GetMapping("/report-board")
    public String reportBoard(Model model, Criteria cri){
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        log.info("cri === > {} ",cri);
        Integer reportTotalCount = adminService.getReportTotalCount(cri);
        pageDTO.setArticleTotalCount(reportTotalCount);

        List<AdminReportVO> reportList = adminService.getReportList(cri);

        model.addAttribute("reportList",reportList);
        model.addAttribute("pageDTO",pageDTO);


        System.out.println(reportList);


        return "admin/reportBoard";
    }


    @GetMapping("/report-comm")
    public String reportComm(Model model){


        return "";
    }





}
