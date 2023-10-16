package com.i4.i4blog.controller.report;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.security.Principal;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.i4.i4blog.dto.report.ReportCreateDTO;
import com.i4.i4blog.repository.model.report.Report;
import com.i4.i4blog.service.report.ReportService;

@RestController
@RequestMapping("/report")
@RequiredArgsConstructor
@Slf4j
public class ReportAPIController {
	private final ReportService reportService;
	
	
	public ResponseEntity<?> reportProc(@RequestBody ReportCreateDTO reportCreateDTO, Principal principal) {
		reportService.reportCreate(reportCreateDTO, principal);
		
		return ResponseEntity.ok("신고 성공");
	}
}
