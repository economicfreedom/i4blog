package com.i4.i4blog.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UploadTestController {

    @GetMapping("/uploadEx")
    public String uploadEx(){
        return "admin/uploadEx";

    }

}
