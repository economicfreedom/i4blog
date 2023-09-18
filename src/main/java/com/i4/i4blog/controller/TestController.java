package com.i4.i4blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {


    @GetMapping("/test")
    public String test(){

        int a = 0;

        TestController testController = new TestController();


        return "test";
    }

    @GetMapping("/1")
    public String index(){
        System.out.println("옴");
        return "index";
    }


}
