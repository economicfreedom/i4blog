package com.i4.i4blog.controller.admin;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.File;
import java.net.URLDecoder;
/**
 * @author 최규하
 * @deprecated 테스트후 알맞게 이동할 예정
 */
@Controller
@Slf4j
public class UploadTestController {

    @GetMapping("/uploadEx")
    public String uploadEx(){
        return "admin/uploadEx";

    }


}
