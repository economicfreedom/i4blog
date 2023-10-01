package com.i4.i4blog.controller.admin;

import com.i4.i4blog.service.admin.AdminService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/admin")
@RestController
@RequiredArgsConstructor
@Slf4j
public class AdminAPIController {
    private final AdminService adminService;


    @GetMapping("/chart-data")
    public ResponseEntity<?> chartData(){
        return ResponseEntity.ok(adminService.getSevenDaysDataDTO());
    }
}
