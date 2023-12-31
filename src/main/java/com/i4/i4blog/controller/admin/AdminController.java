package com.i4.i4blog.controller.admin;

import com.i4.i4blog.repository.model.admin.AdminReportVO;
import com.i4.i4blog.repository.model.admin.DateCountDTO;
import com.i4.i4blog.repository.model.admin.UserManage;
import com.i4.i4blog.service.admin.AdminService;
import com.i4.i4blog.util.Criteria;
import com.i4.i4blog.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.nio.file.LinkOption;
import java.util.List;

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

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/main")
    public String showMain(Model model) {
        log.info("showMain Start ==>");
        DateCountDTO dateCountDTO = adminService.getDateCountDTO();
        log.info("date DTO {}", dateCountDTO);
        model.addAttribute(dateCountDTO);

        log.info("showMain End ==>");
        return "admin/main";
    }

    @GetMapping("/report")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String reportBoard(Model model

            , @RequestParam(value = "page-num"
            , required = false
            , defaultValue = "1")
                              Integer pageNum

            , @RequestParam(value = "order-by"
            , required = false
            , defaultValue = "date")
                              String orderBy

            , Criteria cri) {


        if (cri.getType() == null || cri.getType().isEmpty()) {
            cri.setType("board");
        }

        cri.setOrderBy(orderBy);

        cri.setPageNum(pageNum);


        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        log.info("cri === > {} ", cri);
        Integer reportTotalCount = adminService.getReportTotalCount(cri);
        pageDTO.setArticleTotalCount(reportTotalCount);

        List<AdminReportVO> reportList = adminService.getReportList(cri);

        model.addAttribute("reportList", reportList);
        model.addAttribute("pageDTO", pageDTO);


        return "admin/report";
    }

    @GetMapping("/user")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String userBoard(Model model
            , @RequestParam(value = "page-num"
            , required = false
            , defaultValue = "1")
                            Integer pageNum

            , @RequestParam(value = "order-by"
            , required = false
            , defaultValue = "date")
                            String orderBy

            , Criteria cri
    ) {

        log.info("orderBy {}" ,orderBy);
        PageDTO pageDTO = new PageDTO();
        cri.setPageNum(pageNum);
        cri.setOrderBy(orderBy);

        log.info("keyword {}" , cri.getKeyword());
        pageDTO.setCri(cri);
        List<UserManage> userManages = adminService.userMangeList(cri);
        Integer total = adminService.userCount(cri);
        pageDTO.setArticleTotalCount(total);

        log.info("userManages : {}",userManages);
        log.info("cri {} ",cri);
        log.info("pageDTO {}", pageDTO);
        log.info("offset {}",cri.getOffset());
        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("userManages", userManages);

        return "admin/user";

    }

}
