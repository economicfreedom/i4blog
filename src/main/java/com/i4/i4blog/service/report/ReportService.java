package com.i4.i4blog.service.report;

import java.security.Principal;

import org.springframework.stereotype.Service;

import com.i4.i4blog.dto.report.ReportCreateDTO;
import com.i4.i4blog.repository.interfaces.report.ReportRepository;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.repository.model.report.Report;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReportService {
	private final ReportRepository reportRepository;
	private final UserRepository userRepository;
	
	public int reportCreate(ReportCreateDTO reportCreateDTO, Principal principal) {
		Integer uId = userRepository.getIdByUserId(principal.getName());
		
		Report report = Report.builder()
				.userId(uId)
				.boardId(reportCreateDTO.getBoardId())
				.commentId(reportCreateDTO.getCommentId())
				.reportContent(reportCreateDTO.getReportContent())
				.reportType(reportCreateDTO.getReportType())
				.build();
		
		int result = reportRepository.insert(report);
		return result;
	}
}
