package com.i4.i4blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {


    @GetMapping("/test")
    public String test(){
        return "test";
    }
}
