package com.i4.i4blog.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {
//@RequestParam(name = "type"
//                            ,defaultValue = ""
//                            ,required = false) String type
//                            ,
    @GetMapping("/main")
    public String showMain(Model model){



        return "admin/main";
    }




}
